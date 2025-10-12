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
            'phone'          => ['required', 'regex:/^[6-9]\d{9}$/'],
            'city'           => ['required', 'string', 'max:50'],
            'state'          => ['required', 'string', 'max:50'],
            'zip'            => ['required', 'regex:/^\d{5,6}$/'],
            'address'        => ['required', 'string', 'min:10', 'max:255'],
            'payment_method' => ['required', 'in:online'],
        ], [
            'name.required' => 'Full name is required.',
            'email.required' => 'Email is required.',
            'email.email' => 'Enter a valid email address.',
            'phone.regex' => 'Enter a valid Indian mobile number.',
            'zip.regex' => 'ZIP code should be 5 or 6 digits.',
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

        $appId = 'TEST10714352982ad19c0ced7ada443025341701';
        $secretKey = 'cfsk_ma_test_d4d6c036cd7ba36e21538af94905e6cd_83a204bc';
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

        $response = Http::withHeaders([
            'x-api-version' => '2022-09-01',
            'x-client-id' => $appId,
            'x-client-secret' => $secretKey,
        ])->post('https://sandbox.cashfree.com/pg/orders', $data);

        $json = $response->json();

        if (!isset($json['payment_session_id'])) {
            return back()->withErrors(['cashfree' => 'Cashfree Error: ' . json_encode($json)]);
        }

        $sessionId = $json['payment_session_id'];
        return view('frontend.cashfree', compact('sessionId'));
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
}
