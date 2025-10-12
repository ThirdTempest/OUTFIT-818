<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Edit Profile - Outfit 818</title>
    <script src="https://cdn.tailwindcss.com"></script>
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

<body class="min-h-screen">

    @include('partials.navbar')

    <div class="max-w-3xl mx-auto py-12 px-6">
        <h1 class="text-3xl font-bold  mb-8 text-center">Edit Your Profile</h1>

        @if(session('success'))
        <div class="bg-green-100 text-green-800 px-4 py-2 rounded mb-4">
            {{ session('success') }}
        </div>
        @endif

        <form action="{{ route('profile.update') }}" method="POST" enctype="multipart/form-data" class="bg-white p-6 rounded shadow space-y-6">
            @csrf

            <div>
                <label class="block font-medium text-gray-700">Name</label>
                <input type="text" name="name" value="{{ old('name', $user->name) }}"
                    class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-black focus:outline-none">
                @error('name') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
            </div>

            <div>
                <label class="block font-medium text-gray-700">Phone</label>
                <input type="text" name="phone" value="{{ old('phone', $user->phone) }}"
                    class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-black focus:outline-none">
                @error('phone') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
            </div>

            <div>
                <label class="block font-medium text-gray-700">Address</label>
                <textarea name="address" rows="2"
                    class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-black focus:outline-none">{{ old('address', $user->address) }}</textarea>
                @error('address') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
            </div>

            <div>
                <label class="block font-medium text-gray-700">Date of Birth</label>
                <input type="date" name="dob" value="{{ old('dob', $user->dob) }}"
                    class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-black focus:outline-none">
                @error('dob') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
            </div>

            <div>
                <label class="block font-medium text-gray-700">Gender</label>
                <select name="gender"
                    class="mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:ring-black focus:outline-none">
                    <option value="">Select</option>
                    <option value="male" {{ old('gender', $user->gender) == 'male' ? 'selected' : '' }}>Male</option>
                    <option value="female" {{ old('gender', $user->gender) == 'female' ? 'selected' : '' }}>Female</option>
                    <option value="other" {{ old('gender', $user->gender) == 'other' ? 'selected' : '' }}>Other</option>
                </select>
                @error('gender') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
            </div>

            <div>
                <label class="block font-medium text-gray-700">Profile Picture</label>
                <input type="file" name="profile_picture" accept="image/*"
                    class="mt-1 block w-full text-sm text-gray-700 file:mr-4 file:py-2 file:px-4 file:rounded file:border-0 file:bg-gray-100 file:text-sm file:font-semibold hover:file:bg-gray-200">
                @error('profile_picture') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror

                @if ($user->profile_picture)
                <div class="mt-4">
                    <p class="text-sm text-gray-600">Current Image:</p>
                    <img src="{{ asset('storage/' . $user->profile_picture) }}" alt="Profile Picture" class="w-24 h-24 rounded-full object-cover mt-1 shadow">
                </div>
                @endif
            </div>

            <div class="flex justify-between btn-green">
                <a href="{{ route('profile.show') }}" class="text-gray-600 hover:underline">Cancel</a>
                <button type="submit" class="bg px-6 py-2 rounded  transition">
                    Update Profile
                </button>
            </div>
        </form>
    </div>
    @include('partials.footer')
</body>

</html>