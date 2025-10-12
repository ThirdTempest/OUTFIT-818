<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Profile - Outfit 818</title>
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
</head>

<body class="min-h-screen">

@include('partials.navbar')

    <div class="max-w-4xl mx-auto py-12 px-6">
        <h1 class="text-3xl font-bold text-center mb-10">Your Profile</h1>

        <div class="bg-white shadow rounded-lg p-6 md:flex gap-10">
            <!-- Profile Picture -->
            <div class="flex justify-center md:block mb-6 md:mb-0">
                @if ($user->profile_picture)
                <img src="{{ asset('storage/' . $user->profile_picture) }}" alt="Profile Picture"
                    class="w-40 h-40 rounded-full object-cover shadow">
                @else
                <div class="w-40 h-40 rounded-full bg-gray-200 flex items-center justify-center text-gray-500 text-2xl font-semibold">
                    {{ strtoupper(substr($user->name, 0, 1)) }}
                </div>
                @endif
            </div>

            <!-- Info -->
            <div class="flex-1 space-y-4">
                <div>
                    <h2 class="text-lg font-semibold text-gray-700">Name</h2>
                    <p class="text-gray-800">{{ $user->name }}</p>
                </div>
                <div>
                    <h2 class="text-lg font-semibold text-gray-700">Email</h2>
                    <p class="text-gray-800">{{ $user->email }}</p>
                </div>
                <div>
                    <h2 class="text-lg font-semibold text-gray-700">Phone</h2>
                    <p class="text-gray-800">{{ $user->phone ?? 'N/A' }}</p>
                </div>
                <div>
                    <h2 class="text-lg font-semibold text-gray-700">Address</h2>
                    <p class="text-gray-800">{{ $user->address ?? 'N/A' }}</p>
                </div>
                <div>
                    <h2 class="text-lg font-semibold text-gray-700">Date of Birth</h2>
                    <p class="text-gray-800">{{ $user->dob ? \Carbon\Carbon::parse($user->dob)->format('d M Y') : 'N/A' }}</p>
                </div>
                <div>
                    <h2 class="text-lg font-semibold text-gray-700">Gender</h2>
                    <p class="text-gray-800 capitalize">{{ $user->gender ?? 'N/A' }}</p>
                </div>
            </div>
        </div>

        <div class="mt-8 text-center ">
            <a href="{{ route('profile.edit') }}" class="inline-block bg-green text-white px-6 py-2 rounded hover:bg-gray-800 transition">
                Edit Profile
            </a>
        </div>
    </div>

    @include('partials.footer')

</body>

</html>