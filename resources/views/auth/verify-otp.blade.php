<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Verify OTP - Outfit 818</title>
    <script src="https://cdn.tailwindcss.com"></script>

    <!-- AOS and Fonts -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js" defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            AOS.init({
                duration: 1000,
                once: true
            });
        });
    </script>
</head>

<body class="min-h-screen flex flex-col">

    @include('partials.navbar')

    <main class="flex-grow flex items-center justify-center py-16 px-4">
        <div class="bg-white p-8 rounded-2xl shadow-lg w-full max-w-md" data-aos="zoom-in">
            <div class="text-center mb-6">
                <div class="text-4xl mb-2">
                    <i class="fas fa-shield-alt"></i>
                </div>
                <h2 class="text-2xl font-bold text-gray-800">Verify Your Email</h2>
                <p class="text-sm text-gray-500 mt-1">Enter the 6-digit OTP sent to your email</p>
            </div>

            @if(session('success'))
                <div class="bg-green-100 text-green-700 p-2 rounded mb-4 text-sm text-center">
                    {{ session('success') }}
                </div>
            @endif

            @if($errors->any())
                <div class="bg-red-100 text-red-700 p-2 rounded mb-4 text-sm">
                    @foreach ($errors->all() as $error)
                        <div>{{ $error }}</div>
                    @endforeach
                </div>
            @endif

            <form method="POST" action="{{ route('otp.verify') }}">
                @csrf
                <input type="hidden" name="email" value="{{ $email }}">

                <div class="mb-4">
                    <label for="otp" class="block text-sm font-medium text-gray-700 mb-1">OTP</label>
                    <input type="text" name="otp" id="otp" maxlength="6" required
                        class="w-full border border-gray-300 px-4 py-2 rounded-lg shadow-sm transition">
                </div>

                <button type="submit"
                    class="w-full bg-green text-white py-2 rounded-lg transition font-semibold">
                    Verify OTP
                </button>
            </form>

            <div class="mt-4 text-center text-sm text-gray-600">
                Didn't receive the OTP? <a href="{{ route('otp.resend', ['email' => $email]) }}" class="hover:underline font-semibold">Resend</a>
            </div>
        </div>
    </main>

    @include('partials.footer')

</body>

</html>
