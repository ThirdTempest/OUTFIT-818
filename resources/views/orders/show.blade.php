<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Order #{{ $order->order_id }} - Outfit 818</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
</head>

<body>

    @include('partials.navbar')

    <div class="max-w-5xl mx-auto px-4 py-12">
        <h1 class="text-3xl font-bold mb-4">🧾 Order Details</h1>
        <p class="mb-6 text-gray-600">Here’s everything about your order.</p>

        <div class="bg-white p-6 rounded shadow mb-8">
            <h2 class="text-xl font-semibold mb-4">Order Summary</h2>
            <p><strong>Order ID:</strong> {{ $order->order_id }}</p>
            <p><strong>Date:</strong> {{ $order->created_at->format('d M Y, h:i A') }}</p>
            <p><strong>Total:</strong> ₹{{ number_format($order->total_amount, 2) }}</p>
            <p><strong>Status:</strong>
                <span class="px-2 py-1 text-sm rounded {{ $order->status == 'paid' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700' }}">
                    {{ ucfirst($order->status) }}
                </span>
            </p>
        </div>

        <div class="bg-white p-6 rounded shadow">
            <h2 class="text-xl font-semibold mb-4">Items in this Order</h2>
            <table class="min-w-full">
                <thead class="bg-green">
                    <tr>
                        <th class="py-3 px-4 text-left">Product</th>
                        <th class="py-3 px-4 text-left">Size</th>
                        <th class="py-3 px-4 text-left">Quantity</th>
                        <th class="py-3 px-4 text-left">Price</th>
                        <th class="py-3 px-4 text-left">Total</th>
                    </tr>
                </thead>
                <tbody>
                    @foreach ($order->items as $item)
                    @php $product = $item->product; @endphp
                    <tr class="border-b">
                        <td class="py-4 px-4">
                            <div class="flex items-center gap-4">
                                <img src="{{ asset('storage/' . $product->image) }}" class="w-16 h-16 object-cover rounded" alt="">
                                <div>
                                    <p class="font-semibold">{{ $item->product_name }}</p>
                                    <p class="text-sm text-gray-500">#{{ $item->product_id }}</p>
                                </div>
                            </div>
                        </td>
                        <td class="py-4 px-4">{{ $item->size }}</td>
                        <td class="py-4 px-4">{{ $item->quantity }}</td>
                        <td class="py-4 px-4">₹{{ number_format($item->price, 2) }}</td>
                        <td class="py-4 px-4">₹{{ number_format($item->price * $item->quantity, 2) }}</td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>

        <div class="mt-6">
        <a href="{{ route('orders.invoice', $order->order_id) }}"
                class="inline-block text-white px-4 py-2 rounded bg-[#536451] hover:scale-105  transition">
                📄 Download Invoice
            </a>
        </div>

        <div class="text-center mt-10">
            <a href="{{ route('orders.index') }}" class="text-[#536451] hover:underline">← Back to Order History</a>
        </div>
    </div>

    @include('partials.footer')
</body>

</html>