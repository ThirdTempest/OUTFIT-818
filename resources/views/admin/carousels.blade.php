@extends('admin.layout')

@section('content')
<div class="flex justify-between items-center mb-6" data-aos="fade-down">
    <h1 class="text-3xl font-bold text-gray-800">🎠 Carousel Management</h1>
    <a href="#" onclick="event.preventDefault(); CarouselModal.toggle();" class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">
        ➕ Add New Carousel
    </a>
</div>

<div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">

    @foreach ($carousels as $carousel)
    <div class="bg-white rounded-xl shadow hover:shadow-lg transition" data-aos="fade-up" data-aos-delay="{{ $loop->index * 100 }}">
        <img src="{{ asset('storage/' . $carousel->image_path) }}" alt="Carousel Image" class="w-full h-48 object-cover rounded-t-xl">
        <div class="p-4">
            <h2 class="text-xl font-semibold text-gray-800">{{ $carousel->title }}</h2>
            <p class="text-gray-600 text-sm mt-1">{{ $carousel->description }}</p>
            <div class="mt-4 flex justify-between items-center">
                <span class="text-sm font-medium {{ $carousel->is_active ? 'text-green-600' : 'text-gray-500' }}">
                    {{ $carousel->is_active ? 'Active' : 'Inactive' }}
                </span>
                <div class="space-x-2">
                    <button
                        class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded hover:underline text-sm"
                        onclick="CarouselModal.openEdit(this)"
                        data-carousel='@json($carousel)'>
                        Edit
                    </button>

                    <form method="POST" action="{{ route('admin.carousels.destroy', $carousel->id) }}" class="inline">
                        @csrf
                        @method('DELETE')
                        <button type="submit" class="text-red-500 hover:underline text-sm" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    @endforeach

</div>

<!-- Create/Edit Carousel Modal -->
<div id="carouselModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
    <div class="bg-white rounded-xl w-full max-w-xl p-6 relative" data-aos="zoom-in">
        <button onclick="CarouselModal.toggle()" class="absolute top-2 right-3 text-gray-500 hover:text-gray-800 text-xl">×</button>

        <h2 class="text-2xl font-bold mb-4">Add New Carousel</h2>

        <form action="{{ route('admin.carousels.store') }}" method="POST" enctype="multipart/form-data">
            @csrf

            {{-- Title --}}
            <div class="mb-4">
                <label class="block text-sm font-medium">Title <span class="text-red-500">*</span></label>
                <input type="text" name="title" value="{{ old('title') }}" required
                    class="w-full border-gray-300 rounded p-2 mt-1 @error('title') border-red-500 @enderror">
                @error('title') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
            </div>

            {{-- Description --}}
            <div class="mb-4">
                <label class="block text-sm font-medium">Description <span class="text-red-500">*</span></label>
                <textarea name="description" rows="3" required
                    class="w-full border-gray-300 rounded p-2 mt-1 @error('description') border-red-500 @enderror">{{ old('description') }}</textarea>
                @error('description') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
            </div>

            {{-- Button Text --}}
            <div class="mb-4">
                <label class="block text-sm font-medium">Button Text <span class="text-red-500">*</span></label>
                <input type="text" name="button_text" value="{{ old('button_text') }}" required
                    placeholder="e.g. Shop Now"
                    class="w-full border-gray-300 rounded p-2 mt-1 @error('button_text') border-red-500 @enderror">
                @error('button_text') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
            </div>

            {{-- Button Link --}}
            <div class="mb-4">
                <label class="block text-sm font-medium">Button Link <span class="text-red-500">*</span></label>
                <input type="url" name="button_link" value="{{ old('button_link') }}" required
                    placeholder="e.g. /shop or https://example.com"
                    class="w-full border-gray-300 rounded p-2 mt-1 @error('button_link') border-red-500 @enderror">
                @error('button_link') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
            </div>

            {{-- Image --}}
            <div class="mb-4">
                <label class="block text-sm font-medium">Image <span class="text-red-500">*</span></label>
                <input type="file" name="image" accept="image/*" required
                    class="w-full mt-1 @error('image') border-red-500 @enderror">
                @error('image') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
            </div>

            {{-- Submit --}}
            <div class="text-right">
                <button type="submit"
                    class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">
                    Save
                </button>
            </div>
        </form>

    </div>
</div>

<!-- Edit Carousel Modal -->
<div id="editCarouselModal" class="fixed inset-0 bg-black bg-opacity-50 hidden items-center justify-center z-50">
    <div class="bg-white rounded-xl w-full max-w-xl p-6 relative" data-aos="zoom-in">
        <button onclick="CarouselModal.toggleEdit()" class="absolute top-2 right-3 text-gray-500 hover:text-gray-800 text-xl">×</button>

        <h2 class="text-2xl font-bold mb-4">Edit Carousel</h2>

        <form id="editCarouselForm" method="POST" enctype="multipart/form-data">
    @csrf
    @method('PUT')

    {{-- Title --}}
    <div class="mb-4">
        <label class="block text-sm font-medium">Title</label>
        <input type="text" name="title" id="editTitle" value="{{ old('title', $carousel->title) }}"
            class="w-full border-gray-300 rounded p-2 mt-1 @error('title') border-red-500 @enderror">
        @error('title')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    {{-- Description --}}
    <div class="mb-4">
        <label class="block text-sm font-medium">Description</label>
        <textarea name="description" id="editDescription" rows="3"
            class="w-full border-gray-300 rounded p-2 mt-1 @error('description') border-red-500 @enderror">{{ old('description', $carousel->description) }}</textarea>
        @error('description')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    {{-- Button Text --}}
    <div class="mb-4">
        <label class="block text-sm font-medium">Button Text</label>
        <input type="text" name="button_text" id="edit_button_text"
            value="{{ old('button_text', $carousel->button_text) }}"
            class="w-full border-gray-300 rounded p-2 mt-1 @error('button_text') border-red-500 @enderror">
        @error('button_text')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    {{-- Button Link --}}
    <div class="mb-4">
        <label class="block text-sm font-medium">Button Link</label>
        <input type="url" name="button_link" id="edit_button_link"
            value="{{ old('button_link', $carousel->button_link) }}"
            class="w-full border-gray-300 rounded p-2 mt-1 @error('button_link') border-red-500 @enderror">
        @error('button_link')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    {{-- Image --}}
    <div class="mb-4">
        <label class="block text-sm font-medium">Change Image (optional)</label>
        <input type="file" name="image" accept="image/*"
            class="w-full mt-1 @error('image') border-red-500 @enderror">
        @error('image')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    {{-- Active Checkbox --}}
    <div class="mb-4">
        <label class="inline-flex items-center">
            <input type="checkbox" name="is_active" id="editIsActive" value="1"
                {{ old('is_active', $carousel->is_active) ? 'checked' : '' }}
                class="mr-2">
            Active
        </label>
        @error('is_active')
            <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
        @enderror
    </div>

    {{-- Submit --}}
    <div class="text-right">
        <button type="submit"
            class="bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded">
            Update
        </button>
    </div>
</form>

    </div>
</div>

@endsection