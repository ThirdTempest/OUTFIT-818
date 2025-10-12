<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Checkout - Outfit 818</title>
    <script src="https://cdn.tailwindcss.com"></script>

    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js" defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
</head>

<body>
    @include('partials.navbar')

    <div class="max-w-5xl mx-auto py-12 px-4">
        <h1 class="text-3xl font-bold mb-6">Checkout</h1>

        @if($items->count() > 0)
        <form action="{{ route('checkout.process') }}" method="POST" class="space-y-6 bg-white p-6 rounded shadow">
    @csrf

    <!-- 🛍️ Order Summary -->
    <div>
        <h2 class="text-xl font-semibold mb-4">Your Items</h2>
        <div class="overflow-x-auto">
            <table class="min-w-full bg-white border rounded-lg">
                <thead class="bg-green">
                    <tr>
                        <th class="py-3 px-4 text-left">Product</th>
                        <th class="py-3 px-4 text-left">Quantity</th>
                        <th class="py-3 px-4 text-left">Price</th>
                        <th class="py-3 px-4 text-left">Total</th>
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
                            <td class="py-4 px-4">
                                <div class="flex items-center gap-4">
                                    <img src="{{ asset('storage/' . $product->image) }}" alt="{{ $product->name }}" class="w-16 h-16 object-cover rounded">
                                    <div>
                                        <p class="font-semibold">{{ $product->name }}</p>
                                        <p class="text-sm text-gray-500">Size: {{ $item->size }}</p>
                                    </div>
                                </div>
                            </td>
                            <td class="py-4 px-4">{{ $item->quantity }}</td>
                            <td class="py-4 px-4">₹{{ number_format($price, 2) }}</td>
                            <td class="py-4 px-4">₹{{ number_format($total, 2) }}</td>
                        </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <!-- 🧾 Customer Information -->
    <div>
        <h2 class="text-xl font-semibold mb-4">Shipping & Payment Details</h2>
        <div class="grid grid-cols-1 md:grid-cols-2 gap-4">

            <div>
                <label for="name" class="block mb-1 font-medium">Full Name</label>
                <input type="text" id="name" name="name" required
                    class="w-full border px-4 py-2 rounded @error('name') border-red-500 @enderror"
                    value="{{ old('name', auth()->user()->name ?? '') }}">
                @error('name')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <div>
                <label for="email" class="block mb-1 font-medium">Email</label>
                <input type="email" id="email" name="email" required
                    class="w-full border px-4 py-2 rounded @error('email') border-red-500 @enderror"
                    value="{{ old('email', auth()->user()->email ?? '') }}">
                @error('email')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <div>
                <label for="phone" class="block mb-1 font-medium">Phone Number</label>
                <input type="tel" id="phone" name="phone" required
                    class="w-full border px-4 py-2 rounded @error('phone') border-red-500 @enderror"
                    value="{{ old('phone') }}">
                @error('phone')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <div>
                <label for="city" class="block mb-1 font-medium">City</label>
                <input type="text" id="city" name="city" required
                    class="w-full border px-4 py-2 rounded @error('city') border-red-500 @enderror"
                    value="{{ old('city') }}">
                @error('city')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <div>
                <label for="state" class="block mb-1 font-medium">State</label>
                <input type="text" id="state" name="state" required
                    class="w-full border px-4 py-2 rounded @error('state') border-red-500 @enderror"
                    value="{{ old('state') }}">
                @error('state')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <div>
                <label for="zip" class="block mb-1 font-medium">ZIP Code</label>
                <input type="text" id="zip" name="zip" required
                    class="w-full border px-4 py-2 rounded @error('zip') border-red-500 @enderror"
                    value="{{ old('zip') }}">
                @error('zip')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

            <div class="md:col-span-2">
                <label for="address" class="block mb-1 font-medium">Full Address</label>
                <textarea id="address" name="address" rows="3" required
                    class="w-full border px-4 py-2 rounded @error('address') border-red-500 @enderror">{{ old('address') }}</textarea>
                @error('address')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                @enderror
            </div>

        </div>
    </div>

    <!-- 💳 Payment Method -->
    <div>
        <h2 class="text-xl font-semibold mb-2">Payment Method</h2>
        <label class="flex items-center gap-2">
            <input type="radio" name="payment_method" value="online" checked>
            Online Payment
        </label>
        @error('payment_method')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <!-- ✅ Submit -->
    <div class="text-right text-xl font-semibold">
        Total: ₹{{ number_format($grandTotal, 2) }}
    </div>

    <div class="text-right">
        <button type="submit"
            class="bg-black text-white px-6 py-2 rounded hover:bg-gray-800 transition">
            Pay & Place Order
        </button>
    </div>
</form>


        @else
        <div class="text-center py-16">
            <p class="text-xl text-gray-600">Your cart is empty.</p>
            <a href="{{ route('products.all') }}" class="mt-4 inline-block text-white hover:underline">Browse products</a>
        </div>
        @endif
    </div>

    @include('partials.footer')
</body>

</html>