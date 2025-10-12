@extends('admin.layout')

@section('content')

<!-- New Arrivals Section -->
<section class="mt-8" data-aos="fade-down">
    <div class="flex justify-between items-center mb-6">
        <div>
            <h1 class="text-3xl font-bold text-gray-800">🆕 New Arrivals</h1>
            <p class="text-gray-500 mt-1">Manage the newest products displayed in the store's new arrivals section.</p>
        </div>
        <div>
            <a href="#" onclick="event.preventDefault(); NewArrivalModal.openAdd();"
                class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded"
                data-aos="zoom-in" data-aos-delay="100">
                ➕ Add New Arrival
            </a>
        </div>
    </div>

    @if(session('success'))
    <div class="mb-4 bg-green-100 text-green-800 px-4 py-2 rounded" data-aos="fade-up" data-aos-delay="100">
        {{ session('success') }}
    </div>
    @endif

    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6" data-aos="fade-up" data-aos-delay="150">
        @forelse ($arrivals as $arrival)
        <div class="bg-white rounded-xl shadow hover:shadow-lg transition overflow-hidden" data-aos="zoom-in-up" data-aos-delay="{{ ($loop->index + 1) * 100 }}">
            <img src="{{ asset('storage/' . $arrival->image) }}"
                alt="{{ $arrival->name }}"
                class="w-full h-48 object-cover rounded-t-xl">

            <div class="p-4">
                <h2 class="text-lg font-semibold text-gray-800">{{ $arrival->name }}</h2>
                <p class="text-gray-600 text-sm mt-1">{{ $arrival->description }}</p>

                <div class="mt-4 flex justify-between items-center">
                    <span class="text-sm font-medium {{ $arrival->status === 'active' ? 'text-green-600' : 'text-gray-500' }}">
                        {{ ucfirst($arrival->status) }}
                    </span>
                    <div class="space-x-2">
                        <button
                            onclick="NewArrivalModal.openEdit('{{ $arrival->id }}', '{{ $arrival->name }}', `{{ $arrival->description }}`, '{{ asset('storage/' . $arrival->image) }}', '{{ $arrival->status }}', '{{ $arrival->price }}')"
                            class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded hover:underline text-sm">
                            Edit
                        </button>

                        <form action="{{ route('admin.new-arrivals.destroy', $arrival->id) }}" method="POST" class="inline-block">
                            @csrf
                            @method('DELETE')
                            <button class="text-red-500 hover:underline text-sm" onclick="return confirm('Are you sure?')">
                                Delete
                            </button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        @empty
        <div class="col-span-full text-center text-gray-500" data-aos="fade-in" data-aos-delay="200">No new arrivals found.</div>
        @endforelse
    </div>
</section>

<!-- Add New Arrival Modal -->
<div id="addNewArrivalModal" class="fixed inset-0 bg-black bg-opacity-40 flex items-center justify-center z-50 hidden">
    <div class="bg-white w-full max-w-lg p-6 rounded-lg shadow-lg relative">
        <button onclick="NewArrivalModal.closeAdd()"
            class="absolute top-2 right-3 text-gray-500 hover:text-red-600 text-xl font-bold">
            &times;
        </button>

        <h2 class="text-xl font-semibold text-gray-800 mb-4">➕ Add New Arrival</h2>

        <form action="{{ route('admin.new-arrivals.store') }}" method="POST" enctype="multipart/form-data">
    @csrf

    {{-- Product Name --}}
    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Product Name</label>
        <input type="text" name="name" value="{{ old('name') }}"
            class="mt-1 w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">
        @error('name')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    {{-- Description --}}
    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Description</label>
        <textarea name="description" rows="3"
            class="mt-1 w-full border border-gray-300 rounded px-3 py-2 focus:outline-none focus:ring-2 focus:ring-green-500">{{ old('description') }}</textarea>
        @error('description')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    {{-- Price --}}
    <div class="mb-4">
        <label for="price" class="block text-sm font-medium text-gray-700">Price (₹)</label>
        <input type="number" step="0.01" name="price" id="price" value="{{ old('price') }}"
            class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-green-500 focus:border-green-500 sm:text-sm">
        @error('price')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    {{-- Image --}}
    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Image</label>
        <input type="file" name="image" accept="image/*" class="mt-1 w-full">
        @error('image')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    {{-- Status --}}
    <div class="mb-4">
        <label class="block text-sm font-medium text-gray-700">Status</label>
        <select name="status" class="mt-1 w-full border border-gray-300 rounded px-3 py-2">
            <option value="active" {{ old('status') == 'active' ? 'selected' : '' }}>Active</option>
            <option value="inactive" {{ old('status') == 'inactive' ? 'selected' : '' }}>Inactive</option>
        </select>
        @error('status')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    {{-- Submit --}}
    <div class="flex justify-end">
        <button type="submit"
            class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">
            Save
        </button>
    </div>
</form>

    </div>
</div>

<!-- Edit New Arrival Modal -->
<div id="editNewArrivalModal" class="fixed inset-0 bg-black bg-opacity-40 flex items-center justify-center z-50 hidden">
    <div class="bg-white w-full max-w-lg p-6 rounded-lg shadow-lg relative">
        <button onclick="NewArrivalModal.closeEdit()" class="absolute top-2 right-3 text-gray-500 hover:text-red-600 text-xl font-bold">
            &times;
        </button>

        <h2 class="text-xl font-semibold text-gray-800 mb-4">✏️ Edit New Arrival</h2>

        <form id="editArrivalForm" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')

            <input type="hidden" id="edit_id">

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Product Name</label>
                <input type="text" name="name" id="edit_name" required class="mt-1 w-full border border-gray-300 rounded px-3 py-2">
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Description</label>
                <textarea name="description" id="edit_description" rows="3" required class="mt-1 w-full border border-gray-300 rounded px-3 py-2"></textarea>
            </div>

            <div class="mb-4">
                <label for="editPrice" class="block text-sm font-medium text-gray-700">Price (₹)</label>
                <input type="number" step="0.01" name="price" id="editPrice"
                    class="mt-1 block w-full rounded-md border-gray-300 shadow-sm focus:ring-blue-500 focus:border-blue-500 sm:text-sm"
                    required>
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Current Image</label>
                <img id="edit_image_preview" src="" class="w-full h-32 object-cover rounded mt-1" alt="Preview">
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Replace Image (optional)</label>
                <input type="file" name="image" accept="image/*" class="mt-1 w-full">
            </div>

            <div class="mb-4">
                <label class="block text-sm font-medium text-gray-700">Status</label>
                <select name="status" id="edit_status" required class="mt-1 w-full border border-gray-300 rounded px-3 py-2">
                    <option value="active">Active</option>
                    <option value="inactive">Inactive</option>
                </select>
            </div>

            <div class="flex justify-end">
                <button type="submit" class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">
                    Update
                </button>
            </div>
        </form>
    </div>
</div>

@endsection