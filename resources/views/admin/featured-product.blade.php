@extends('admin.layout')

@section('content')
<div class="mb-8" data-aos="fade-down">
    <h1 class="text-3xl font-bold text-gray-800">🌟 Product of the Day</h1>
    <p class="text-gray-500 mt-2">Highlight a single product prominently across your store.</p>
</div>

@if($product)
<div class="bg-white rounded-xl shadow-lg overflow-hidden flex flex-col md:flex-row" data-aos="zoom-in-up">
    <!-- Product Image -->
    <div class="md:w-1/2 h-64 md:h-auto" data-aos="fade-right" data-aos-delay="100">
        <img src="{{ asset('storage/' . $product->image_path) }}" alt="{{ $product->title }}" class="w-full h-full object-cover">
    </div>

    <!-- Product Details -->
    <div class="md:w-1/2 p-6 flex flex-col justify-between" data-aos="fade-left" data-aos-delay="200">
        <div>
            <h2 class="text-2xl font-semibold text-gray-800">{{ $product->title }}</h2>
            <p class="text-gray-600 mt-2 text-sm">{{ $product->tagline }}</p>
            <p class="text-gray-600 mt-1 text-sm">{{ $product->description }}</p>
            <div class="mt-4 price-box flex gap-3 items-center">
                <span class="original-price line-through text-gray-500">₹{{ number_format($product->original_price) }}</span>
                <span class="discounted-price text-lg text-[#536451] font-bold">₹{{ number_format($product->discounted_price) }}</span>
                <span class="discount-badge bg-red-100 text-red-600 text-xs px-2 py-1 rounded">
                    -{{ round(100 - ($product->discounted_price / $product->original_price) * 100) }}%
                </span>
            </div>
            <div class="mt-4">
                <span class="inline-block bg-green-100 text-green-700 text-xs px-3 py-1 rounded-full uppercase tracking-wide font-semibold">
                    {{ $product->is_active ? 'Active' : 'Inactive' }}
                </span>
            </div>
        </div>

        <div class="mt-6 flex space-x-3">
            <!-- Trigger Edit Modal -->
            <button onclick="FeaturedModal.openEdit()" class=" bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded text-sm">
                ✏️ Edit Product
            </button>

            <!-- Delete Button -->
            <form method="POST" action="{{ route('admin.featured.destroy', $product->id) }}" onsubmit="return confirm('Are you sure you want to delete this featured product?');">
                @csrf
                @method('DELETE')
                <button type="submit" class="bg-red-500 hover:bg-red-600 text-white px-5 py-2 rounded shadow text-sm">
                    🗑️ Delete
                </button>
            </form>
        </div>
    </div>
</div>

<!-- Edit Featured Product Modal -->
<div id="editFeaturedModal" class="fixed inset-0 bg-black bg-opacity-50 z-50 hidden flex items-center justify-center">
    <div class="bg-white w-full max-w-xl rounded-lg shadow-lg p-6 relative">
        <h2 class="text-xl font-semibold mb-4">✏️ Edit Featured Product</h2>

        <form method="POST" action="{{ route('admin.featured.update', $product->id) }}" enctype="multipart/form-data">
            @csrf
            @method('PUT')

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Title</label>
                <input type="text" name="title" value="{{ $product->title }}" required class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Tagline</label>
                <input type="text" name="tagline" value="{{ $product->tagline }}" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Description</label>
                <textarea name="description" rows="3" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">{{ $product->description }}</textarea>
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Button Text</label>
                <input type="text" name="button_text" value="{{ $product->button_text }}" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Button Link</label>
                <input type="url" name="button_link" value="{{ $product->button_link }}" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
            </div>

            <div class="mb-4 grid grid-cols-1 sm:grid-cols-2 gap-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700">Original Price (₹)</label>
                    <input type="number" name="original_price" value="{{ $product->original_price }}" step="0.01" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
                </div>
                <div>
                    <label class="block text-sm font-medium text-gray-700">Discounted Price (₹)</label>
                    <input type="number" name="discounted_price" value="{{ $product->discounted_price }}" step="0.01" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
                </div>
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Image</label>
                <input type="file" name="image" class="mt-1 block w-full">
            </div>

            <div class="flex justify-end gap-3 mt-6">
                <button type="button" onclick="FeaturedModal.closeEdit()" class="px-4 py-2 bg-gray-300 hover:bg-gray-400 rounded shadow text-sm">Cancel</button>
                <button type="submit" class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded text-sm">Update</button>
            </div>
        </form>

        <button onclick="FeaturedModal.closeEdit()" class="absolute top-2 right-3 text-gray-500 hover:text-gray-700 text-xl">&times;</button>
    </div>
</div>

@else
<!-- Add Featured Button -->
<button onclick="FeaturedModal.open()" class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded text-sm" data-aos="fade-up">
    ➕ Add Featured Product
</button>

<!-- Add Featured Modal -->
<div id="featuredModal" class="fixed inset-0 bg-black bg-opacity-50 z-50 hidden flex items-center justify-center">
    <div class="bg-white w-full max-w-xl rounded-lg shadow-lg p-6 relative">
        <h2 class="text-xl font-semibold mb-4">➕ Add Featured Product</h2>

        <form id="featuredProductForm" method="POST" enctype="multipart/form-data" action="{{ route('admin.featured.store') }}">
    @csrf

    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Title</label>
        <input type="text" name="title" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
        @error('title')
            <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Tagline</label>
        <input type="text" name="tagline" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
        @error('tagline')
            <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Description</label>
        <textarea name="description" rows="3" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm"></textarea>
        @error('description')
            <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Button Text</label>
        <input type="text" name="button_text" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
        @error('button_text')
            <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Button Link</label>
        <input type="text" name="button_link" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
        @error('button_link')
            <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <div class="mb-4 grid grid-cols-1 sm:grid-cols-2 gap-4">
        <div>
            <label class="block text-sm font-medium text-gray-700">Original Price (₹)</label>
            <input type="number" name="original_price" step="0.01" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
            @error('original_price')
                <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>

        <div>
            <label class="block text-sm font-medium text-gray-700">Discounted Price (₹)</label>
            <input type="number" name="discounted_price" step="0.01" class="mt-1 block w-full border-gray-300 rounded-md shadow-sm">
            @error('discounted_price')
                <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>
    </div>

    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Image</label>
        <input type="file" name="image" class="mt-1 block w-full">
        @error('image')
            <p class="text-red-600 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <div class="flex justify-end gap-3 mt-6">
        <button type="button" onclick="FeaturedModal.close()" class="px-4 py-2 bg-gray-300 hover:bg-gray-400 rounded shadow text-sm">Cancel</button>
        <button type="submit" class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white rounded shadow text-sm">Add Product</button>
    </div>
</form>


        <button onclick="FeaturedModal.close()" class="absolute top-2 right-3 text-gray-500 hover:text-gray-700 text-xl">&times;</button>
    </div>
</div>
@endif

@endsection