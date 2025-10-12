@extends('admin.layout')

@section('content')

<div class="flex justify-between items-center mb-6" data-aos="fade-down">
    <div>
        <h1 class="text-3xl font-bold text-gray-800">🗂️ Categories</h1>
        <p class="text-gray-500 mt-1">Manage product categories for your store.</p>
    </div>
    <a href="javascript:void(0)" onclick="CategoryModal.openAdd()" class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">
        ➕ Add New Category
    </a>
</div>

<div class="overflow-x-auto" data-aos="fade-up" data-aos-delay="100">
    <table class="min-w-full bg-white rounded-xl shadow">
        <thead class="bg-[#536451] text-[#f3e9d5] uppercase text-sm">
            <tr>
                <th class="py-3 px-6 text-left">#</th>
                <th class="py-3 px-6 text-left">Category Name</th>
                <th class="py-3 px-6 text-left">Slug</th>
                <th class="py-3 px-6 text-center">Status</th>
                <th class="py-3 px-6 text-right">Actions</th>
            </tr>
        </thead>
        <tbody class="text-gray-700 text-sm">
            @forelse ($categories as $index => $category)
                <tr class="border-b hover:bg-gray-50" data-aos="fade-up" data-aos-delay="{{ $index * 100 }}">
                    <td class="py-3 px-6">{{ $index + 1 }}</td>
                    <td class="py-3 px-6">{{ $category->name }}</td>
                    <td class="py-3 px-6">{{ $category->slug }}</td>
                    <td class="py-3 px-6 text-center">
                        <span class="{{ $category->status === 'active' ? 'bg-green-100 text-green-700' : 'bg-gray-200 text-gray-600' }} text-xs px-2 py-1 rounded-full">
                            {{ ucfirst($category->status) }}
                        </span>
                    </td>
                    <td class="py-3 px-6 text-right space-x-2">
                        <button
                            onclick="CategoryModal.openEdit('{{ $category->id }}', '{{ $category->name }}', '{{ $category->slug }}', '{{ $category->status }}')"
                            class="text-[#536451] hover:underline text-sm">
                            Edit
                        </button>
                        <form action="{{ route('admin.categories.destroy', $category->id) }}" method="POST" class="inline-block">
                            @csrf
                            @method('DELETE')
                            <button class="text-red-500 hover:underline text-sm" onclick="return confirm('Are you sure?')">Delete</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr data-aos="fade-up">
                    <td colspan="5" class="py-4 px-6 text-center text-gray-500">No categories found.</td>
                </tr>
            @endforelse
        </tbody>
    </table>
</div>

<!-- Add Category Modal -->
<div id="addCategoryModal" class="fixed inset-0 bg-black bg-opacity-30 flex items-center justify-center hidden z-50">
    <div class="bg-white rounded-lg shadow-lg p-6 w-full max-w-md relative">
        <form action="{{ route('admin.categories.store') }}" method="POST" enctype="multipart/form-data">
    @csrf

    <div class="mb-4">
        <label class="block text-sm font-medium mb-1">Name</label>
        <input type="text" name="name" value="{{ old('name') }}" class="w-full border px-3 py-2 rounded">
        @error('name')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <div class="mb-4">
        <label class="block text-sm font-medium mb-1">Image</label>
        <input type="file" name="image" accept="image/*" class="w-full">
        @error('image')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <div class="mb-4">
        <label class="block text-sm font-medium mb-1">Status</label>
        <select name="status" class="w-full border px-3 py-2 rounded">
            <option value="active" {{ old('status') === 'active' ? 'selected' : '' }}>Active</option>
            <option value="inactive" {{ old('status') === 'inactive' ? 'selected' : '' }}>Inactive</option>
        </select>
        @error('status')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    <div class="flex justify-end gap-2 mt-4">
        <button type="button" onclick="CategoryModal.closeAdd()" class="px-4 py-2 bg-gray-200 rounded">Cancel</button>
        <button type="submit"
            class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">
            Save
        </button>
    </div>
</form>

    </div>
</div>

<!-- Edit Category Modal -->
<div id="editCategoryModal" class="fixed inset-0 bg-black bg-opacity-30 flex items-center justify-center hidden z-50">
    <div class="bg-white rounded-lg shadow-lg p-6 w-full max-w-md relative">
        <h2 class="text-xl font-bold mb-4">✏️ Edit Category</h2>
        <form id="editCategoryForm" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="mb-4">
                <label class="block text-sm font-medium mb-1">Name</label>
                <input type="text" name="name" id="editName" required class="w-full border px-3 py-2 rounded">
            </div>
            <div class="mb-4">
                <label class="block text-sm font-medium mb-1">Image</label>
                <input type="file" name="image" class="w-full">
            </div>
            <div class="mb-4">
                <label class="block text-sm font-medium mb-1">Status</label>
                <select name="status" id="editStatus" required class="w-full border px-3 py-2 rounded">
                    <option value="active">Active</option>
                    <option value="inactive">Inactive</option>
                </select>
            </div>
            <div class="flex justify-end gap-2 mt-4">
                <button type="button" onclick="CategoryModal.closeEdit()" class="px-4 py-2 bg-gray-200 rounded">Cancel</button>
                <button type="submit" class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">Update</button>
            </div>
        </form>
    </div>
</div>

@endsection