@extends('layouts.front')

<style>
    .category-banner {
        position: relative;
        width: 100%;
        height: 400px;
        background-size: cover;
        background-position: center;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .category-banner .overlay {
        background-color: rgba(0, 0, 0, 0.15);
        /* dark overlay */
        width: 100%;
        height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
    }

    .category-banner h1 {
        color: white;
        font-size: 3rem;
        font-weight: bold;
        text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.4);
        text-align: center;
    }

    .products-list {
        padding: 60px 20px;
    }

    .products-list h2 {
        font-size: 2rem;
        font-weight: 600;
        text-align: center;
        margin-bottom: 40px;
    }
</style>

@section('content')
<section class="category-banner" style="background-image: url('{{ asset('storage/' . $category->image) }}');">
    <div class="overlay">
        <h1>{{ $category->name }}</h1>
    </div>
</section>

<section class="products-list py-12">
    <div class="max-w-7xl mx-auto px-4 grid grid-cols-1 lg:grid-cols-4 gap-8">

        {{-- Filter Sidebar --}}
        <aside class="lg:col-span-1">
            <form action="{{ route('category.show', $category->slug) }}" method="GET" class="bg-green p-6 rounded-lg shadow space-y-6">
                <h2 class="text-xl font-semibold border-b pb-2 text-[##f3e9d5]">Filter Products</h2>

                <!-- Search -->
                <div>
                    <label class="block text-sm font-medium mb-1">Search</label>
                    <input type="text" name="search" value="{{ request('search') }}"
                        placeholder="Product name..." class="w-full px-3 py-2 border rounded-md text-gray-700 ">
                </div>

                <!-- Category (optional in case of browsing) -->
                <div>
                    <label class="block text-sm font-medium mb-1">Category</label>
                    <select name="category" class="w-full px-3 py-2 border rounded-md text-gray-700 " disabled>
                        <option value="{{ $category->id }}" selected>{{ $category->name }}</option>
                    </select>
                </div>

                <!-- Status -->
                <div>
                    <label class="block text-sm font-medium mb-1">Status</label>
                    <select name="status" class="w-full px-3 py-2 border rounded-md text-gray-700 ">
                        <option value="">All</option>
                        <option value="active" {{ request('status') == 'active' ? 'selected' : '' }}>Active</option>
                        <option value="inactive" {{ request('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
                    </select>
                </div>

                <!-- Sort -->
                <div>
                    <label class="block text-sm font-medium mb-1">Sort By</label>
                    <select name="sort" class="w-full px-3 py-2 border rounded-md text-gray-700 ">
                        <option value="">Default</option>
                        <option value="low" {{ request('sort') == 'low' ? 'selected' : '' }}>Price: Low to High</option>
                        <option value="high" {{ request('sort') == 'high' ? 'selected' : '' }}>Price: High to Low</option>
                    </select>
                </div>

                <!-- Filter Button -->
                <div class="pt-2">
                    <button type="submit"
                        class="w-full text-white py-2 rounded-md transition">
                        Apply Filters
                    </button>
                </div>
            </form>
        </aside>

        {{-- Products Grid --}}
        <div class="lg:col-span-3 grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 gap-6">
            @forelse ($products as $product)
            <div class="bg-white rounded-lg shadow hover:shadow-lg transition p-4">
                <img src="{{ asset('storage/' . $product->image) }}" class="h-48 w-full object-cover rounded mb-3" alt="{{ $product->name }}">
                <h3 class="text-lg font-semibold text-gray-800">{{ $product->name }}</h3>
                <p class="text-[#536451] font-bold">
                    <span class="text-sm text-gray-500">Starting from</span> ₹{{ number_format($product->sizes->min('price'), 2) }}
                </p>
                <span class="text-xs mt-2 inline-block {{ $product->status == 'active' ? 'text-green-600' : 'text-gray-500' }}">
                    {{ ucfirst($product->status) }}
                </span><br><br>
                <a href="{{ route('product.view', $product->id) }}"
                    class="mt-auto inline-block text-center bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">
                    🛒 Shop Now
                </a>
            </div>
            @empty
            <p class="text-gray-500 col-span-full">No products found for this filter.</p>
            @endforelse
        </div>
    </div>

    {{-- Pagination --}}
    <div class="lg:col-span-3 flex justify-center mt-8">
        {{ $products->withQueryString()->links() }}
    </div>

</section>

@endsection