<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CartItem;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;
use App\Models\Order;
use App\Models\OrderItem;
use Barryvdh\DomPDF\Facade\Pdf;

class CheckoutController extends Controller
{
    public function index()
    {
        $items = CartItem::with(['product.sizes'])->where('user_id', Auth::id())->get();

        // Attach correct price to each item
        foreach ($items as $item) {
            $sizeObj = $item->product->sizes->firstWhere('size', $item->size);
            $item->unit_price = $sizeObj ? $sizeObj->price : 0;
        }

        $grandTotal = $items->sum(function ($item) {
            return $item->unit_price * $item->quantity;
        });

        return view('frontend.checkout', compact('items', 'grandTotal'));
    }

    public function process(Request $request)
    {

        $validated = $request->validate([
            'name'           => ['required', 'string', 'min:2', 'max:100'],
            'email'          => ['required', 'email', 'max:255'],
            'phone'          => ['required', 'string', 'min:6', 'max:20'],
            'city'           => ['required', 'string', 'max:50'],
            'state'          => ['required', 'string', 'max:50'],
            'zip'            => ['required', 'string', 'min:3', 'max:12'],
            'address'        => ['required', 'string', 'min:10', 'max:255'],
            'payment_method' => ['required', 'in:online'],
        ], [
            'name.required' => 'Full name is required.',
            'email.required' => 'Email is required.',
            'email.email' => 'Enter a valid email address.',
            'phone.required' => 'Enter a valid phone number.',
            'zip.required' => 'Enter a valid postal/ZIP code.',
            'address.min' => 'Address should be at least 10 characters.',
            'payment_method.in' => 'Only online payment is accepted at this time.',
        ]);

        $userId = Auth::id();
        $items = CartItem::with('product')->where('user_id', $userId)->get();

        if ($items->isEmpty()) {
            return redirect()->route('products.all')->withErrors(['msg' => 'Your cart is empty.']);
        }

        $grandTotal = $items->sum(function ($item) {
            $sizePrice = $item->product->sizes->firstWhere('size', $item->size)?->price ?? 0;
            return $sizePrice * $item->quantity;
        });

        $orderId = 'ORDER_' . uniqid();

        $data = [
            "order_id" => $orderId,
            "order_amount" => $grandTotal,
            "order_currency" => "INR",
            "customer_details" => [
                "customer_id" => (string) $userId,
                "customer_name" => $validated['name'],
                "customer_email" => $validated['email'],
                "customer_phone" => $validated['phone'],
            ],
            "order_meta" => [
                "return_url" => route('checkout.thankyou', ['orderId' => $orderId]), // ✅ Correctly embedded
            ]
        ];

        // Save order
        $order = Order::create([
            'user_id' => $userId,
            'order_id' => $orderId,
            'total_amount' => $grandTotal,
            'status' => 'pending', // will be updated after payment
            'name' => $validated['name'],
            'email' => $validated['email'],
            'phone' => $validated['phone'],
            'city' => $validated['city'],
            'state' => $validated['state'],
            'zip' => $validated['zip'],
            'address' => $validated['address'],
        ]);

        // Save order items
        foreach ($items as $item) {
            $sizePrice = $item->product->sizes->firstWhere('size', $item->size)?->price ?? 0;

            OrderItem::create([
                'order_id'     => $order->id,
                'product_id'   => $item->product_id,
                'product_name' => $item->product->name,
                'size'         => $item->size,
                'quantity'     => $item->quantity,
                'price'        => $sizePrice, // ✅ CORRECT PRICE BY SIZE
            ]);
        }

        // Create PayMongo Checkout Session
        $secretKey = env('PAYMONGO_SECRET_KEY');
        $currency = env('CURRENCY', 'PHP');
        $successUrl = route('checkout.thankyou', ['orderId' => $orderId]);
        $cancelUrl = url()->previous();

        $amountInMinor = (int) round($grandTotal * 100);

        $pmTypes = env('PAYMONGO_PAYMENT_METHOD_TYPES');
        $paymentMethodTypes = $pmTypes ? array_filter(array_map('trim', explode(',', $pmTypes))) : ['gcash','paymaya','card'];

        $payload = [
            'data' => [
                'attributes' => [
                    'line_items' => [
                        [
                            'amount' => $amountInMinor,
                            'currency' => $currency,
                            'name' => 'Order ' . $orderId,
                            'quantity' => 1,
                        ]
                    ],
                    'payment_method_types' => $paymentMethodTypes,
                    'success_url' => $successUrl,
                    'cancel_url' => $cancelUrl,
                    'description' => 'Checkout for ' . $validated['email'],
                    'reference_number' => $orderId,
                ]
            ]
        ];

        if (!$secretKey) {
            return back()->withErrors(['payment' => 'Payment configuration missing. Set PAYMONGO_SECRET_KEY in .env.']);
        }

        $response = Http::withHeaders([
                'Accept' => 'application/json',
                'Content-Type' => 'application/json',
            ])
            ->withBasicAuth($secretKey, '')
            ->post('https://api.paymongo.com/v1/checkout_sessions', $payload);

        $json = $response->json();

        if (!$response->successful()) {
            Log::error('PayMongo error', ['status' => $response->status(), 'body' => $json]);
            return back()->withErrors(['payment' => 'Payment Error: ' . json_encode($json)]);
        }

        $checkoutUrl = $json['data']['attributes']['checkout_url'] ?? null;
        if (!$checkoutUrl) {
            Log::error('PayMongo: checkout_url missing', ['body' => $json]);
            return back()->withErrors(['payment' => 'Unable to start payment.']);
        }

        return redirect()->away($checkoutUrl);
    }

    public function thankYou($orderId)
    {
        $order = Order::with(['items.product'])->where('order_id', $orderId)->firstOrFail();

        // ✅ Ensure the logged-in user owns the order
        if ($order->user_id !== Auth::id()) {
            abort(403, 'Unauthorized access to this order.');
        }

        if ($order->status !== 'paid') {
            $order->status = 'paid';
            $order->save();

            // 🔻 Deduct stock for each item
            foreach ($order->items as $item) {
                $productSize = $item->product->sizes()->where('size', $item->size)->first();

                if ($productSize) {
                    $productSize->stock = max(0, $productSize->stock - $item->quantity); // avoid negative
                    $productSize->save();
                }
            }

            // 🧹 Clear user's cart
            CartItem::where('user_id', Auth::id())->delete();
        }


        return view('frontend.thankyou', compact('order'));
    }

    public function downloadInvoice($orderId)
    {
        $order = Order::with(['items.product'])->where('order_id', $orderId)->firstOrFail();

        $pdf = Pdf::loadView('frontend.invoice', compact('order'));

        return $pdf->download('invoice_' . $orderId . '.pdf');
    }

    public function webhook(Request $request)
    {
        $signature = $request->header('PayMongo-Signature');
        $webhookSecret = env('PAYMONGO_WEBHOOK_SECRET');

        // Optional: verify signature if secret is set
        if ($webhookSecret && $signature) {
            // PayMongo provides HMAC verification via header. Implement if required.
            // For now, proceed cautiously; ensure route is protected from public enumeration.
        }

        $payload = $request->json()->all();
        Log::info('PayMongo webhook received', $payload);

        try {
            $eventType = $payload['data']['attributes']['type'] ?? null;
            $ref = $payload['data']['attributes']['data']['attributes']['reference_number'] ?? null;

            if ($eventType === 'checkout_session.payment.paid' && $ref) {
                $order = Order::where('order_id', $ref)->first();
                if ($order && $order->status !== 'paid') {
                    $order->status = 'paid';
                    $order->save();

                    foreach ($order->items as $item) {
                        $productSize = $item->product->sizes()->where('size', $item->size)->first();
                        if ($productSize) {
                            $productSize->stock = max(0, $productSize->stock - $item->quantity);
                            $productSize->save();
                        }
                    }
                }
            }
        } catch (\Throwable $e) {
            Log::error('PayMongo webhook handling error', ['error' => $e->getMessage()]);
        }

        return response()->json(['status' => 'ok']);
    }
}
