<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Register - Outfit 818</title>
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

    <style>
        .fade-smooth {
            transition: opacity 1.5s cubic-bezier(0.7, 0, 0.3, 1);
        }

        @keyframes fadeEffect {
            from {
                opacity: 0;
            }

            to {
                opacity: 1;
            }
        }
    </style>
</head>

<body class="h-screen w-screen">

    @include('partials.navbar')

    <div class="flex h-full">

        <!-- LEFT SIDE: Image Slider -->
        <div class="w-1/2 relative hidden md:block">
            <img id="sliderImage" src="{{ asset('assets/images/carousel_1.jpg') }}" alt="Fashion Slide"
                class="w-full h-full object-cover opacity-100 transition-all duration-[1500ms] ease-[cubic-bezier(0.7, 0, 0.3, 1)] rounded">
        </div>

        <!-- RIGHT SIDE: Register Form -->
        <div class="w-full md:w-1/2 h-screen overflow-y-auto flex justify-center">
            <div class="w-full max-w-md my-auto px-6 py-10 md:px-10">
                <!-- Heading -->
                <h2 class="text-3xl font-bold text-gray-900 text-center mb-6">Create Your Account</h2>

                <!-- Registration Form -->
                <form method="POST" action="{{ route('register') }}" enctype="multipart/form-data" class="space-y-5">
    @csrf

    @php
        $inputClasses = "mt-1 w-full px-4 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-black";
    @endphp

    <!-- Name -->
    <div>
        <label class="block text-sm font-medium text-gray-700">Name</label>
        <input type="text" name="name" value="{{ old('name') }}" class="{{ $inputClasses }}" required>
        @error('name') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
    </div>

    <!-- Email -->
    <div>
        <label class="block text-sm font-medium text-gray-700">Email</label>
        <input type="email" name="email" value="{{ old('email') }}" class="{{ $inputClasses }}" required>
        @error('email') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
    </div>

    <!-- Phone -->
    <div>
        <label class="block text-sm font-medium text-gray-700">Phone</label>
        <input type="text" name="phone" value="{{ old('phone') }}" class="{{ $inputClasses }}" required>
        @error('phone') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
    </div>

    <!-- Profile Picture -->
    <div>
        <label class="block text-sm font-medium text-gray-700">Profile Picture</label>
        <input type="file" name="profile_picture" accept="image/*"
            class="block w-full text-sm text-gray-700 file:mr-4 file:py-2 file:px-4 file:rounded file:border-0 file:bg-gray-100 file:text-sm file:font-semibold hover:file:bg-gray-200" />
        @error('profile_picture') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
    </div>

    <!-- Address -->
    <div>
        <label class="block text-sm font-medium text-gray-700">Address</label>
        <textarea name="address" rows="2" class="{{ $inputClasses }}">{{ old('address') }}</textarea>
        @error('address') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
    </div>

    <!-- DOB -->
    <div>
        <label class="block text-sm font-medium text-gray-700">Date of Birth</label>
        <input type="date" name="dob" value="{{ old('dob') }}" class="{{ $inputClasses }}">
        @error('dob') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
    </div>

    <!-- Gender -->
    <div>
        <label class="block text-sm font-medium text-gray-700">Gender</label>
        <select name="gender" class="{{ $inputClasses }}">
            <option value="">Select</option>
            <option value="male" {{ old('gender') == 'male' ? 'selected' : '' }}>Male</option>
            <option value="female" {{ old('gender') == 'female' ? 'selected' : '' }}>Female</option>
            <option value="other" {{ old('gender') == 'other' ? 'selected' : '' }}>Other</option>
        </select>
        @error('gender') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
    </div>

    <!-- Password -->
    <div>
        <label class="block text-sm font-medium text-gray-700">Password</label>
        <input type="password" name="password" class="{{ $inputClasses }}" required>
        <p class="text-xs text-gray-500 mt-1">Min 8 chars with at least 1 uppercase, 1 lowercase, 1 number.</p>
        @error('password') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
    </div>

    <!-- Confirm Password -->
    <div>
        <label class="block text-sm font-medium text-gray-700">Confirm Password</label>
        <input type="password" name="password_confirmation" class="{{ $inputClasses }}" required>
        @error('password_confirmation') <p class="text-red-500 text-sm mt-1">{{ $message }}</p> @enderror
    </div>

    <!-- Submit -->
    <button type="submit"
        class="w-full bg-black text-white py-2 px-4 rounded-md hover:bg-gray-800 transition">
        Register
    </button>
</form>


                <!-- Login Redirect -->
                <p class="text-center mt-4 text-sm text-gray-700">
                    Already have an account?
                    <a href="{{ route('login') }}" class="text-black hover:underline">Log In</a>
                </p>
            </div>
        </div>

    </div>

    @include('partials.footer')

    <!-- JS for Image Slider -->
    <script>
        const images = [
            "{{ asset('assets/images/carousel_2.jpeg') }}",
            "{{ asset('assets/images/carousel_3.jpg') }}",
            "{{ asset('assets/images/image_1.jpg') }}",
            "{{ asset('assets/images/carousel_1.jpg') }}"
        ];

        const sliderImage = document.getElementById('sliderImage');
        let current = 0;

        setInterval(() => {
            sliderImage.style.opacity = 0;

            setTimeout(() => {
                current = (current + 1) % images.length;
                sliderImage.src = images[current];
                sliderImage.style.opacity = 1;
            }, 600);
        }, 4000);
    </script>

</body>

</html>