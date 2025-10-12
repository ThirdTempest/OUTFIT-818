<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us - Outfit Store</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- AOS and Other Styles -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js" defer></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
</head>
<body>

@include('partials.navbar')
    <!-- Contact Section -->
    <section class="py-12">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center">
                <h2 class="text-3xl font-extrabold sm:text-4xl">Get in Touch</h2>
                <p class="mt-4 text-lg text-gray-600">We’re here to help you find the perfect outfit. Reach out to us anytime!</p>
            </div>

            <div class="mt-12 grid grid-cols-1 gap-8 lg:grid-cols-2">
                <!-- Contact Info -->
                <div class="bg-white p-8 rounded-lg shadow-md">
                    <h3 class="text-lg font-semibold text-gray-900">Contact Information</h3>
                    <div class="mt-6 space-y-4">
                        <div class="flex items-center">
                            <svg class="h-6 w-6 text-[#536451]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z" />
                            </svg>
                            <span class="ml-3 text-gray-600">support@outfitstore.com</span>
                        </div>
                        <div class="flex items-center">
                            <svg class="h-6 w-6 text-[#536451]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z" />
                            </svg>
                            <span class="ml-3 text-gray-600">+1 (555) 123-4567</span>
                        </div>
                        <div class="flex items-center">
                            <svg class="h-6 w-6 text-[#536451]" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z" />
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z" />
                            </svg>
                            <span class="ml-3 text-gray-600">123 Fashion St, Style City, SC 12345</span>
                        </div>
                    </div>
                </div>

                <!-- Store Hours -->
                <div class="bg-white p-8 rounded-lg shadow-md">
                    <h3 class="text-lg font-semibold text-gray-900">Store Hours</h3>
                    <div class="mt-6 space-y-2">
                        <p class="text-gray-600">Monday - Friday: <span class="font-medium">9:00 AM - 6:00 PM</span></p>
                        <p class="text-gray-600">Saturday: <span class="font-medium">10:00 AM - 4:00 PM</span></p>
                        <p class="text-gray-600">Sunday: <span class="font-medium">Closed</span></p>
                    </div>
                </div>
            </div>

            <!-- Social Media and Newsletter -->
            <div class="mt-8 text-center">
                <h3 class="text-lg font-semibold text-gray-900">Connect With Us</h3>
                <div class="mt-4 flex justify-center space-x-6">
                    <a href="https://instagram.com/outfitstore" target="_blank" class="text-[#536451] ">
                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M12 2.163c3.204 0 3.584.012 4.85.07 1.366.062 2.633.326 3.608 1.301.975.975 1.24 2.242 1.301 3.608.058 1.266.07 1.646.07 4.85s-.012 3.584-.07 4.85c-.062 1.366-.326 2.633-1.301 3.608-.975.975-2.242 1.24-3.608 1.301-1.266.058-1.646.07-4.85.07s-3.584-.012-4.85-.07c-1.366-.062-2.633-.326-3.608-1.301-.975-.975-1.24-2.242-1.301-3.608-.058-1.266-.07-1.646-.07-4.85s.012-3.584.07-4.85c.062-1.366.326-2.633 1.301-3.608.975-.975 2.242-1.24 3.608-1.301 1.266-.058 1.646-.07 4.85-.07zm0-2.163c-3.259 0-3.667.014-4.947.072-1.632.074-3.082.414-4.242 1.574-1.16 1.16-1.5 2.61-1.574 4.242-.058 1.28-.072 1.688-.072 4.947s.014 3.667.072 4.947c.074 1.632.414 3.082 1.574 4.242 1.16 1.16 2.61 1.5 4.242 1.574 1.28.058 1.688.072 4.947.072s3.667-.014 4.947-.072c1.632-.074 3.082-.414 4.242-1.574 1.16-1.16 1.5-2.61 1.574-4.242.058-1.28.072-1.688.072-4.947s-.014-3.667-.072-4.947c-.074-1.632-.414-3.082-1.574-4.242-1.16-1.16-2.61-1.5-4.242-1.574-1.28-.058-1.688-.072-4.947-.072zm0 5.838a6.162 6.162 0 100 12.324 6.162 6.162 0 000-12.324zm0 10.162a4 4 0 110-8 4 4 0 010 8zm6.406-11.845a1.44 1.44 0 11-2.88 0 1.44 1.44 0 012.88 0z" />
                        </svg>
                    </a>
                    <a href="https://x.com/outfitstore" target="_blank" class="text-[#536451] ">
                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M18.244 2.25h3.308l-7.227 8.26 8.502 11.24H16.17l-5.214-6.817L4.99 21.75H1.68l7.73-8.835L1.254 2.25H8.08l4.713 6.231zm-1.161 17.52h1.833L7.084 4.126H5.117z" />
                        </svg>
                    </a>
                    <a href="https://pinterest.com/outfitstore" target="_blank" class="text-[#536451] ">
                        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 24 24">
                            <path d="M12 0C5.373 0 0 5.373 0 12c0 5.085 3.333 9.406 8 10.922.37.066.495-.16.495-.356 0-.176-.006-.72-.01-1.414-3.243.706-3.928-1.563-3.928-1.563-.53-1.346-1.296-1.704-1.296-1.704-1.058-.723.08-.708.08-.708 1.17.082 1.784 1.2 1.784 1.2 1.038 1.778 2.724 1.264 3.39.968.105-.753.406-1.264.742-1.553-2.595-.295-5.322-1.297-5.322-5.774 0-1.276.456-2.32 1.203-3.137-.12-.296-.523-1.486.115-3.098 0 0 .982-.313 3.22 1.203.934-.26 1.934-.39 2.93-.395 1 .005 2.003.135 2.938.395 2.235-1.516 3.215-1.203 3.215-1.203.64 1.612.237 2.802.117 3.098.75.817 1.2 1.861 1.2 3.137 0 4.488-2.73 5.474-5.33 5.764.42.362.795 1.078.795 2.173 0 1.568-.015 2.834-.015 3.22 0 .197.123.426.498.355C20.667 21.406 24 17.085 24 12c0-6.627-5.373-12-12-12z" />
                        </svg>
                    </a>
                </div>
                <p class="mt-4 text-gray-600">Follow us for the latest fashion trends and exclusive offers!</p>
            </div>

            <!-- Newsletter Call-to-Action -->
            <div class="mt-8 text-center">
                <h3 class="text-lg font-semibold text-gray-900">Stay Updated</h3>
                <p class="mt-2 text-gray-600">Join our newsletter for the latest collections and promotions.</p>
                <a href="{{ url('/') }}#emails" class="mt-4 inline-block py-2 px-4 border border-transparent rounded-md shadow-sm text-sm font-medium bg-[#536451] text-[#f3e9d5] hover:bg-[#f3e9d5] hover:text-[#536451] hover:scale-105 transition-transform duration-200 px-4 py-2 rounded ">Sign Up Now</a>
            </div>

            <!-- Brand Mission -->
            <div class="mt-8 text-center">
                <h3 class="text-lg font-semibold text-gray-900">Our Mission</h3>
                <p class="mt-2 text-gray-600 max-w-2xl mx-auto">At Outfit Store, we believe in empowering everyone to express their unique style through sustainable, high-quality fashion. Join us in redefining what it means to look and feel your best!</p>
            </div>
        </div>
    </section>

    <!-- Footer -->
    @include('partials.footer')
</body>
</html>