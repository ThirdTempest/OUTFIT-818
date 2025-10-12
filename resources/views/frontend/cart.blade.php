<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- AOS and Other Styles -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
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

    @if(session('success'))
    <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
        {{ session('success') }}
    </div>
    @endif

    <div class="max-w-7xl mx-auto px-4 py-8">
        <h1 class="text-3xl font-bold mb-6">Your Shopping Cart</h1>

        {{-- Check if cart is empty --}}
        @if($items->count() > 0)
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white shadow-md rounded-lg overflow-hidden">
                <thead class="bg-green">
                    <tr>
                        <th class="py-3 px-6 text-left">Product</th>
                        <th class="py-3 px-6 text-left">Quantity</th>
                        <th class="py-3 px-6 text-left">Price</th>
                        <th class="py-3 px-6 text-left">Total</th>
                        <th class="py-3 px-6 text-center">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    @php $grandTotal = 0; @endphp
                    @foreach($items as $item)
                    @php
                    $product = $item->product;
                    $price = $item->unit_price ?? 0;
                    $total = $price * $item->quantity;
                    $grandTotal += $total;
                    @endphp
                    <tr class="border-b">
                        <td class="py-4 px-6">
                            <div class="flex items-center gap-4">
                                <img src="{{ asset('storage/' . $product->image) }}" alt="{{ $product->name }}" class="w-16 h-16 object-cover rounded">
                                <div>
                                    <p class="font-semibold">{{ $product->name }}</p>
                                    <p class="text-sm text-gray-500">#{{ $product->id }}</p>
                                    <p class="text-sm text-gray-500">Size: {{ $item->size }}</p>
                                </div>
                            </div>
                        </td>
                        <td class="py-4 px-6">{{ $item->quantity }}</td>
                        <td class="py-4 px-6">₹{{ number_format($price, 2) }}</td>
                        <td class="py-4 px-6">₹{{ number_format($total, 2) }}</td>
                        <td class="py-4 px-6 text-center">
                            <form action="{{ route('cart.remove', $item->id) }}" method="POST" onsubmit="return confirm('Remove this item?');">
                                @csrf
                                @method('DELETE')
                                <button class="text-red-600 hover:text-red-800 font-medium">Remove</button>
                            </form>
                        </td>
                    </tr>
                    @endforeach

                </tbody>
            </table>
        </div>

        <div class="mt-6 flex justify-between items-center btn-green">
            <p class="text-xl font-semibold">Grand Total: ₹{{ number_format($grandTotal, 2) }}</p>
            <a href="{{ route('checkout') }}" class="bg-green font-semibold py-2 px-6 rounded-lg shadow">
                Proceed to Checkout
            </a>

        </div>
        @else
        <div class="text-center py-20">
            <p class="text-xl text-gray-600">Your cart is empty.</p>
            <a href="{{ route('products.all') }}" class="mt-4 inline-block text-[#536451] hover:underline">Browse Products</a>
        </div>
        @endif
    </div>

    @include('partials.footer')

</body>

</html>