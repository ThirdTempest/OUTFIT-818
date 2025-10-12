@extends('admin.layout')

@section('content')
<!-- Page Header -->
<div data-aos="fade-down" class="flex flex-col md:flex-row md:items-center md:justify-between mb-6">
    <div>
        <h1 class="text-3xl font-bold text-gray-800">🛍️ Products</h1>
        <p class="text-gray-500 mt-1">Manage your store’s products.</p>
    </div>
    <div class="mt-4 md:mt-0">
        <button onclick="ProductModal.openAdd()" class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">
            ➕ Add New Product
        </button>
    </div>
</div>

<!-- Import CSV Form -->
<div data-aos="fade-up" class="bg-white p-6 rounded-lg shadow-md w-full">
    <form action="{{ route('admin.products.import') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <h2 class="text-xl font-semibold mb-4 text-gray-800 flex items-center gap-2">
            📥 Import Products (CSV)
        </h2>

        <div class="mb-4">
            <label class="block text-sm font-medium text-gray-700 mb-1">Upload CSV File</label>
            <input type="file" name="csv_file" accept=".csv" required
                class="w-full border border-gray-300 px-4 py-2 rounded focus:outline-none focus:ring-2 focus:ring-indigo-500">
        </div>

        <div class="flex justify-end">
            <button type="submit"
                class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">
                Import
            </button>
        </div>
    </form>
</div>

<!-- Product Table -->
<div data-aos="fade-up" class="overflow-x-auto mt-6">
    <table class="min-w-full bg-white rounded-xl shadow">
        <thead class="bg-[#536451] text-[#f3e9d5] uppercase text-sm">
            <tr>
                <th class="py-3 px-6 text-left">#</th>
                <th class="py-3 px-6 text-left">Image</th>
                <th class="py-3 px-6 text-left">Name</th>
                <th class="py-3 px-6 text-left">Category</th>
                <th class="py-3 px-6 text-left">Price</th>
                <th class="py-3 px-6 text-left">Stock</th> <!-- New column -->
                <th class="py-3 px-6 text-center">Status</th>
                <th class="py-3 px-6 text-right">Actions</th>
            </tr>
        </thead>
        <tbody class="text-gray-700 text-sm">
            @forelse($products as $index => $product)
            <tr class="border-b hover:bg-gray-50 transition duration-200" data-aos="zoom-in">
                <td class="py-3 px-6">{{ $index + 1 }}</td>
                <td class="py-3 px-6">
                    <img src="{{ asset('storage/' . $product->image) }}" class="w-10 h-10 object-cover rounded" />
                </td>
                <td class="py-3 px-6">{{ $product->name }}</td>
                <td class="py-3 px-6">{{ $product->category->name ?? 'N/A' }}</td>
                <td class="py-3">
                    @forelse ($product->sizes as $size)
                    <div class="text-xs">
                        <strong>{{ $size->size }}:</strong> ₹{{ number_format($size->price, 2) }}
                    </div>
                    @empty
                    <span class="text-gray-400 text-xs">No sizes</span>
                    @endforelse
                </td>

                <td class="py-3 px-6">
                    @forelse ($product->sizes as $size)
                    <div class="text-xs">
                        <strong>{{ $size->size }}:</strong> {{ $size->stock }}
                    </div>
                    @empty
                    <span class="text-gray-400 text-xs">No sizes</span>
                    @endforelse
                </td>

                <td class="py-3 px-6 text-center">
                    <span class="{{ $product->status === 'active' ? 'bg-green-100 text-green-700' : 'bg-gray-200 text-gray-600' }} text-xs px-2 py-1 rounded-full">
                        {{ ucfirst($product->status) }}
                    </span>
                </td>

                <td class="py-3 px-6 text-right space-x-2">
                    <button
                        onclick="ProductModal.openEdit(this)"
                        data-product='@json($product)'
                        class="text-[#536451] hover:underline text-sm">
                        Edit
                    </button>

                    <form method="POST" action="{{ route('admin.products.destroy', $product->id) }}" class="inline-block">
                        @csrf @method('DELETE')
                        <button onclick="return confirm('Delete this product?')" class="text-red-500 hover:underline text-sm">Delete</button>
                    </form>
                </td>
            </tr>
            @empty
            <tr data-aos="fade-in">
                <td colspan="8" class="py-4 px-6 text-center text-gray-500">No products found.</td>
            </tr>
            @endforelse
        </tbody>
    </table>
</div>

<!-- Add Product Modal -->
<div id="addProductModal" class="fixed inset-0 bg-black bg-opacity-30 flex items-center justify-center hidden z-50">
    <div class="bg-white rounded-lg shadow-lg w-full max-w-md max-h-[90vh] overflow-y-auto p-6 relative">
        <form action="{{ route('admin.products.store') }}" method="POST" enctype="multipart/form-data">
    @csrf
    <h2 class="text-xl font-bold mb-4">➕ Add Product</h2>

    <div class="mb-4">
        <label class="block text-sm font-medium mb-1">Product Name</label>
        <input type="text" name="name" value="{{ old('name') }}" class="w-full border px-3 py-2 rounded">
        @error('name') <p class="text-red-600 text-sm">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label class="block text-sm font-medium mb-1">Category</label>
        <select name="category_id" class="w-full border px-3 py-2 rounded">
            <option value="">Select category</option>
            @foreach($categories as $cat)
                <option value="{{ $cat->id }}" {{ old('category_id') == $cat->id ? 'selected' : '' }}>
                    {{ $cat->name }}
                </option>
            @endforeach
        </select>
        @error('category_id') <p class="text-red-600 text-sm">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label class="block text-sm font-medium mb-1">Sizes, Prices (₹), & Stock</label>
        @foreach(['S' => 'Small (S)', 'M' => 'Medium (M)', 'L' => 'Large (L)', 'XL' => 'Extra Large (XL)'] as $code => $label)
        <div class="flex items-center gap-2 mb-2">
            <input type="hidden" name="sizes[{{ $loop->index }}][size]" value="{{ $code }}">
            <label class="w-1/4 text-sm font-medium">{{ $label }}</label>
            <input type="number" step="0.01" name="sizes[{{ $loop->index }}][price]"
                class="w-1/4 border px-3 py-2 rounded" placeholder="Price" value="{{ old("sizes.$loop->index.price") }}">
            <input type="number" name="sizes[{{ $loop->index }}][stock]" min="0"
                class="w-1/4 border px-3 py-2 rounded" placeholder="Stock" value="{{ old("sizes.$loop->index.stock") }}">
        </div>
        @endforeach
        @error('sizes') <p class="text-red-600 text-sm">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label class="block text-sm font-medium mb-1">Description</label>
        <textarea name="description" rows="4" class="w-full border px-3 py-2 rounded">{{ old('description') }}</textarea>
        @error('description') <p class="text-red-600 text-sm">{{ $message }}</p> @enderror
    </div>

    <div class="mb-4">
        <label class="block text-sm font-medium mb-1">Image</label>
        <input type="file" name="image" accept="image/*" class="w-full">
        @error('image') <p class="text-red-600 text-sm">{{ $message }}</p> @enderror
    </div>

    @foreach ([2,3,4] as $n)
    <div class="mb-4">
        <label class="block text-sm font-medium mb-1">Additional Image {{ $n - 1 }}</label>
        <input type="file" name="image_{{ $n }}" accept="image/*" class="w-full">
        @error("image_$n") <p class="text-red-600 text-sm">{{ $message }}</p> @enderror
    </div>
    @endforeach

    <div class="mb-4">
        <label class="block text-sm font-medium mb-1">Status</label>
        <select name="status" class="w-full border px-3 py-2 rounded">
            <option value="active" {{ old('status') == 'active' ? 'selected' : '' }}>Active</option>
            <option value="inactive" {{ old('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
        </select>
        @error('status') <p class="text-red-600 text-sm">{{ $message }}</p> @enderror
    </div>

    <div class="flex justify-end gap-2 mt-4">
        <button type="button" onclick="ProductModal.closeAdd()" class="px-4 py-2 bg-gray-200 rounded">Cancel</button>
        <button type="submit" class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">Save</button>
    </div>
</form>

    </div>
</div>

<!-- Edit Product Modal -->
<div id="editProductModal" class="fixed inset-0 bg-black bg-opacity-30 flex items-center justify-center hidden z-50">
    <div class="bg-white rounded-lg shadow-lg w-full max-w-md max-h-[90vh] overflow-y-auto p-6 relative">
        <h2 class="text-xl font-bold mb-4">✏️ Edit Product</h2>
        <form id="editProductForm" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')

            <input type="hidden" name="product_id" id="editProductId">

            <div class="mb-4">
                <label class="block text-sm font-medium mb-1">Name</label>
                <input type="text" name="name" id="editName" required class="w-full border px-3 py-2 rounded">
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium mb-1">Category</label>
                <select name="category_id" id="editCategoryId" required class="w-full border px-3 py-2 rounded">
                    @foreach ($categories as $category)
                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                    @endforeach
                </select>
            </div>

            <!-- Size-based Pricing -->
            <div class="mb-4" id="editSizePrices">
                <label class="block text-sm font-medium mb-1">Sizes, Prices (₹), & Stock</label>
                @foreach(['S' => 'Small (S)', 'M' => 'Medium (M)', 'L' => 'Large (L)', 'XL' => 'Extra Large (XL)'] as $code => $label)
                <div class="flex items-center gap-2 mb-2">
                    <input type="hidden" name="sizes[{{ $loop->index }}][size]" value="{{ $code }}">
                    <label class="w-1/4 text-sm font-medium">{{ $label }}</label>
                    <input type="number" step="0.01" class="w-1/4 border px-3 py-2 rounded"
                        name="sizes[{{ $loop->index }}][price]" id="editSize_{{ $code }}_price" required>
                    <input type="number" min="0" class="w-1/4 border px-3 py-2 rounded"
                        name="sizes[{{ $loop->index }}][stock]" id="editSize_{{ $code }}_stock" required>
                </div>
                @endforeach
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium mb-1">Description</label>
                <textarea id="description" name="description" rows="4" required class="w-full border px-3 py-2 rounded"></textarea>
            </div>


            <div class="mb-4">
                <label class="block text-sm font-medium mb-1">Image</label>
                <input type="file" name="image" class="w-full">
            </div>

            <!-- Optional: let admin re-upload or skip -->
            <div class="mb-4">
                <label class="block text-sm font-medium mb-1">Additional Image 1</label>
                <input type="file" name="image_2" accept="image/*" class="w-full" />
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium mb-1">Additional Image 1</label>
                <input type="file" name="image_3" accept="image/*" class="w-full" />
            </div>

            <!-- Optional: let admin re-upload or skip -->
            <div class="mb-4">
                <label class="block text-sm font-medium mb-1">Additional Image 1</label>
                <input type="file" name="image_4" accept="image/*" class="w-full" />
            </div>


            <div class="mb-4">
                <label class="block text-sm font-medium mb-1">Status</label>
                <select name="status" id="editStatus" required class="w-full border px-3 py-2 rounded">
                    <option value="active">Active</option>
                    <option value="inactive">Inactive</option>
                </select>
            </div>

            <div class="flex justify-end gap-2 mt-4">
                <button type="button" onclick="ProductModal.closeEdit()" class="px-4 py-2 bg-gray-200 rounded">Cancel</button>
                <button type="submit" class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">Update</button>
            </div>
        </form>
    </div>
</div>

@endsection