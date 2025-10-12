<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Login - Outfit 818</title>
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

        <!-- asset('assets/images/carousel_1.jpg') -->

        <!-- LEFT SIDE: Image Slider -->
        <div class="w-1/2 relative hidden md:block">
            <img id="sliderImage" src="{{ asset('assets/images/carousel_1.jpg') }}" alt="Fashion Slide" class="w-full h-full object-cover opacity-100 transition-all duration-[1500ms] ease-[cubic-bezier(0.7, 0, 0.3, 1)] rounded">
        </div>

        <!-- RIGHT SIDE: Login Form -->
        <div class="w-full md:w-1/2 flex items-center justify-center p-8 ">
            <div class="w-full max-w-md">
                <h2 class="text-3xl font-bold mb-6 text-gray-800 text-center">Log in to Outfit 818</h2>
                <form method="POST" action="{{ route('login') }}" class="space-y-5">
                    @csrf

                    <div>
                        <label class="block text-sm font-medium text-gray-700">Email</label>
                        <input name="email" type="email" value="{{ old('email') }}" placeholder="you@example.com"
                            class="mt-1 w-full px-4 py-2 border @error('email') border-red-500 @else border-gray-300 @enderror rounded-md focus:outline-none focus:ring-2 focus:ring-black">
                        @error('email')
                        <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                        @enderror
                    </div>

                    <div>
                        <label class="block text-sm font-medium text-gray-700">Password</label>
                        <input name="password" type="password" placeholder="••••••••"
                            class="mt-1 w-full px-4 py-2 border @error('password') border-red-500 @else border-gray-300 @enderror rounded-md focus:outline-none focus:ring-2 focus:ring-black">
                        @error('password')
                        <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                        @enderror
                    </div>

                    <div class="flex items-center justify-between">
                        <label class="flex items-center text-sm">
                            <input type="checkbox" name="remember" class="mr-2"> Remember me
                        </label>
                        <a href="{{ route('password.request') }}" class="text-sm text-black hover:underline">Forgot password?</a>
                    </div>

                    <button type="submit"
                        class="w-full bg-black text-white py-2 px-4 rounded-md hover:bg-gray-800 transition">Log In</button>
                </form>

            </div>
        </div>

    </div>

    @include('partials.footer')

    <!-- JS for Image Slider -->
    <script>
        const images = [
            "{{ asset('assets/images/carousel_2.jpeg')}}",
            "{{ asset('assets/images/carousel_3.jpg')}}",
            "{{ asset('assets/images/image_1.jpg') }}",
            "{{asset('assets/images/carousel_1.jpg')}}"
        ];

        const sliderImage = document.getElementById('sliderImage');
        let current = 0;

        setInterval(() => {
            // Fade out
            sliderImage.style.opacity = 0;

            setTimeout(() => {
                // Change image after fade out
                current = (current + 1) % images.length;
                sliderImage.src = images[current];

                // Fade in
                sliderImage.style.opacity = 1;
            }, 600); // fade out duration
        }, 4000); // change image every 4 seconds
    </script>


</body>

</html>