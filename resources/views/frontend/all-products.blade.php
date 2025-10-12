<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>All Products - Outfit 818</title>

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

    <main class="py-12">
        <div class="container mx-auto px-4">
            <h1 class="text-4xl font-bold text-center mb-10">🛍️ All Products</h1>

            <div class="grid grid-cols-1 lg:grid-cols-5 gap-8">

                <!-- 🔍 FILTER SIDEBAR -->
                <aside class="lg:col-span-1">
                    <form action="{{ route('products.all') }}" method="GET" class="bg-green p-6 rounded-lg shadow space-y-6">
                        <h2 class="text-xl font-semibold border-b pb-2">Filter Products</h2>

                        <!-- Search -->
                        <div>
                            <label class="block text-sm font-medium mb-1">Search</label>
                            <input type="text" name="search" value="{{ request('search') }}"
                                placeholder="Product name..." class="w-full px-3 py-2 border rounded-md focus:ring focus:ring-green-950  text-gray-700">
                        </div>

                        <!-- Category -->
                        <div>
                            <label class="block text-sm font-medium mb-1">Category</label>
                            <select name="category" class="w-full px-3 py-2 border rounded-md text-gray-700">
                                <option value="">All Categories</option>
                                @foreach($categories as $cat)
                                <option value="{{ $cat->id }}" {{ request('category') == $cat->id ? 'selected' : '' }}>
                                    {{ $cat->name }}
                                </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Status -->
                        <div>
                            <label class="block text-sm font-medium mb-1">Status</label>
                            <select name="status" class="w-full px-3 py-2 border rounded-md text-gray-700">
                                <option value="">All</option>
                                <option value="active" {{ request('status') == 'active' ? 'selected' : '' }}>Active</option>
                                <option value="inactive" {{ request('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
                            </select>
                        </div>

                        <!-- Sort -->
                        <div>
                            <label class="block text-sm font-medium mb-1">Sort By</label>
                            <select name="sort" class="w-full px-3 py-2 border rounded-md  text-gray-700">
                                <option value="">Default</option>
                                <option value="low" {{ request('sort') == 'low' ? 'selected' : '' }}>Price: Low to High</option>
                                <option value="high" {{ request('sort') == 'high' ? 'selected' : '' }}>Price: High to Low</option>
                            </select>
                        </div>

                        <!-- Filter Button -->
                        <div class="pt-2">
                            <button type="submit"
                                class="w-full btn-green transition">
                                Apply Filters
                            </button>
                        </div>
                    </form>
                </aside>

                <!-- 🛍️ PRODUCT GRID -->
                <div class="lg:col-span-4 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
                    @forelse($products as $product)
                    <div class="bg-white rounded-xl shadow hover:shadow-lg transition duration-300 overflow-hidden flex flex-col">
                        <img src="{{ asset('storage/' . $product->image) }}" alt="{{ $product->name }}" class="w-full h-60 object-cover">
                        <div class="p-4 flex-1 flex flex-col justify-between">
                            <div>
                                <h2 class="text-xl font-semibold mb-1">{{ $product->name }}</h2>
                                <p class="text-gray-500 text-sm mb-1">Category: {{ $product->category->name ?? 'N/A' }}</p>
                                @php
                                $minPrice = $product->sizes->min('price');
                                @endphp

                                <p class="text-lg font-bold mb-4" style="color: #536451;">
                                <span class="text-sm text-gray-500">Starting from</span> ₹{{ number_format($product->sizes->min('price'), 2) }}
                                </p>

                            </div>
                            <a href="{{ route('product.view', $product->id) }}"
                                class="mt-auto inline-block text-center bg-green hover:scale-105 py-2 px-4 rounded transition">
                                🛒 Shop Now
                            </a>
                        </div>
                    </div>
                    @empty
                    <p class="text-center text-gray-500 col-span-full">No products found.</p>
                    @endforelse
                </div>
            </div>

            <!-- Pagination -->
            <div class="mt-10 flex justify-center">
                {{ $products->appends(request()->query())->links('vendor.pagination.tailwind') }}
            </div>


    </main>

    @include('partials.footer')

</body>

</html>