<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Forgot Password - Outfit 818</title>

    <script src="https://cdn.tailwindcss.com"></script>

    <!-- AOS and Custom Styles -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js" defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
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

<body class=>

    @include('partials.navbar')

    <section class="py-16 px-4" data-aos="fade-up">
        <div class="max-w-md mx-auto shadow-lg rounded-lg p-8 bg-green">
            <h2 class="text-3xl font-bold mb-6 text-cente">🔒 Forgot Your Password?</h2>

            @if (session('status'))
            <div class="mb-4 bg-green-100 text-green-700 px-4 py-2 rounded">
                {{ session('status') }}
            </div>
            @endif

            @if ($errors->any())
            <div class="mb-4 text-red-600 bg-red-100 border border-red-300 p-3 rounded">
                <ul class="list-disc list-inside">
                    @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                    @endforeach
                </ul>
            </div>
            @endif

            <form method="POST" action="{{ route('password.email') }}" class="space-y-5">
                @csrf

                <div>
                    <label for="email" class="block text-sm font-medium mb-1">Email Address</label>
                    <input
                        type="email"
                        name="email"
                        id="email"
                        value="{{ old('email') }}"
                        required
                        placeholder="you@example.com"
                        class="w-full px-4 py-2 border @error('email') border-red-500 @else border-gray-300 @enderror rounded-md shadow-sm text-black" />
                    @error('email')
                    <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                    @enderror
                </div>

                @if (session('status'))
                <div class="text-green-600 text-sm">
                    {{ session('status') }}
                </div>
                @endif

                <button
                    type="submit"
                    class="w-full text-black py-2 rounded-md transition duration-300 bg-beige hover:bg-yellow-200">
                    Send Password Reset Link
                </button>
            </form>


            <div class="mt-6 text-center">
                <a href="{{ route('login') }}" class="text-sm hover:underline">
                    ← Back to Login
                </a>
            </div>
        </div>
    </section>

    @include('partials.footer')

</body>

</html>