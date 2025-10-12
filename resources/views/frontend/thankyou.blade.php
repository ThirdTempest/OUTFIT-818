<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Thank You - Outfit 818</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- AOS JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js" defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            AOS.init({
                duration: 1000,
                once: true
            });
        });
    </script>
</head>

<body>
    @include('partials.navbar')

    <div class="max-w-5xl mx-auto px-4 py-12">
        <h1 class="text-3xl font-bold text-[#536451] mb-4">🎉 Thank you for your order!</h1>
        <p class="mb-6 text-gray-600">We’ve received your order and are now processing it.</p>

        <div class="bg-white p-6 rounded shadow mb-8">
            <h2 class="text-xl font-semibold mb-4">Order Summary</h2>

            <p><strong>Order ID:</strong> {{ $order->order_id }}</p>
            <p><strong>Date:</strong> {{ $order->created_at->format('d M Y, h:i A') }}</p>
            <p><strong>Total:</strong> ₹{{ number_format($order->total_amount, 2) }}</p>
        </div>

        <div class="bg-white p-6 rounded shadow">
            <h2 class="text-xl font-semibold mb-4">Items in Your Order</h2>
            <table class="min-w-full">
                <thead class="bg-[#536451] text-[#f3e9d5]">
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
        </div><br>

        <div class="text-center mt-6">
            <a href="{{ route('order.invoice.download', ['orderId' => $order->order_id]) }}"
                class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">
                Download Invoice
            </a>
        </div>


        <div class="text-center mt-10">
            <a href="{{ route('products.all') }}" class="text-[#536451] hover:underline">Continue Shopping</a>
        </div>
    </div>

    @include('partials.footer')
</body>

</html>