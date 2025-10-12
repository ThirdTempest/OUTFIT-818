<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>{{ $product->name }} - Outfit 818</title>
    
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>

<body>

    @include('partials.navbar')

    <main class="py-12">
        @if(session('success'))
        <div class="max-w-2xl mx-auto mb-6 bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded">
            {{ session('success') }}
        </div>
        @endif

        @if (session('error'))
        <div class="max-w-2xl mx-auto mb-6 bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded">
            {{ session('error') }}
        </div>
        @endif

        <div class="container mx-auto px-4">
            <div class="grid grid-cols-1 md:grid-cols-2 gap-10 p-6 rounded-xl shadow-md">

                <!-- Product Image Carousel -->
                <!-- Product Image Carousel -->
                <div class="relative" id="carousel-container">
                    <div id="carousel-images" class="relative overflow-hidden rounded-lg shadow h-[400px]">
                        @php
                        $images = array_filter([
                        $product->image,
                        $product->image_2 ?? null,
                        $product->image_3 ?? null,
                        $product->image_4 ?? null,
                        ]);
                        @endphp

                        @foreach($images as $key => $img)
                        <img src="{{ asset('storage/' . $img) }}" class="carousel-img absolute top-0 left-0 w-full h-full object-cover transition-opacity duration-700 {{ $key === 0 ? 'opacity-100 z-10' : 'opacity-0 z-0' }}">
                        @endforeach
                    </div>

                    <!-- Navigation Buttons -->
                    <button onclick="prevSlide()" class="absolute left-2 top-1/2 transform -translate-y-1/2 bg-green bg-opacity-70 p-2 rounded-full shadow hover:bg-opacity-100 z-20">
                        ‹
                    </button>
                    <button onclick="nextSlide()" class="absolute right-2 top-1/2 transform -translate-y-1/2 bg-green bg-opacity-70 p-2 rounded-full shadow hover:bg-opacity-100 z-20">
                        ›
                    </button>

                    <!-- Dot Navigation -->
                    <div id="carousel-dots" class="flex justify-center mt-3 space-x-2">
                        @foreach($images as $key => $img)
                        <button onclick="goToSlide({{ $key }})" class="w-3 h-3 rounded-full bg-gray-300"></button>
                        @endforeach
                    </div>
                </div>



                <!-- Product Info & Form -->
                <div>
                    <h1 class="text-3xl font-bold mb-2">{{ $product->name }}</h1>
                    <p class="text-gray-500 mb-1">Category: {{ $product->category->name ?? 'N/A' }}</p>
                    <p id="product-price" class="text-2xl font-bold mb-6 text-[#536451]">
                        Select Size
                    </p>
                    <p id="stock-available" class="text-sm font-semibold text-[#2D2D2D] bg-[#F4F8FB] px-3 py-2 rounded-md shadow-sm border border-gray-200 mb-4">
                        Please select a size to see stock.
                    </p>

                    @auth
                    <form action="{{ route('cart.add') }}" method="POST" class="space-y-4">
                        @csrf
                        <input type="hidden" name="product_id" value="{{ $product->id }}">

                        <!-- Size Selection -->
                        <div>
                            <label for="size" class="block text-sm font-medium mb-1">Size</label>
                            <select name="size" id="size" required class="w-full border px-4 py-2 rounded">
                                <option value="">Select Size</option>
                                @foreach($product->sizes as $size)
                                <option value="{{ $size->size }}" data-price="{{ $size->price }}" data-stock="{{ $size->stock }}">
                                    {{ $size->size }}
                                </option>
                                @endforeach
                            </select>

                        </div>

                        <!-- Quantity -->
                        <div>
                            <label for="quantity" class="block text-sm font-medium mb-1">Quantity</label>
                            <input type="number" name="quantity" id="quantity" value="1" min="1" class="w-full border px-4 py-2 rounded" required>
                        </div>

                        <!-- Buttons -->
                        <div class="flex gap-4 pt-4">
                            <button type="submit" name="action" value="add" class=" btn-green px-6 py-2 rounded transition bg-gray-800 hover:scale-105 text-white">
                                🛒 Add to Cart
                            </button>

                            <button type="submit" name="action" value="buy_now" class="text-white px-6 py-2 rounded bg-[#536451] hover:scale-105 transition">
                                ⚡ Buy Now
                            </button>
                        </div>

                    </form>

                    <!-- Description -->
                    @if($product->description)
                    <div class="mt-8">
                        <h2 class="text-xl font-semibold mb-0">Product Description</h2>
                        <p class="text-gray-600 leading-relaxed whitespace-pre-line">
                            {{ $product->description }}
                        </p>
                    </div>
                    @endif

                    @else
                    <div class="mt-6">
                        <p class="text-red-600">Please <a href="{{ route('login') }}" class="underline text-green-950">log in</a> to add items to your cart.</p>
                    </div>
                    @endauth

                </div>
            </div>
        </div>
    </main>

    <script>
        const sizeSelect = document.getElementById('size');
        const priceLabel = document.getElementById('product-price');
        const stockLabel = document.getElementById('stock-available');

        sizeSelect.addEventListener('change', function() {
            const selectedOption = sizeSelect.options[sizeSelect.selectedIndex];
            const price = selectedOption.getAttribute('data-price');
            const stock = selectedOption.getAttribute('data-stock');

            if (price) {
                priceLabel.innerText = '₹' + parseFloat(price).toFixed(2);
            } else {
                priceLabel.innerText = 'Select Size';
            }

            if (stock) {
                stockLabel.innerText = `Stock Available: ${stock}`;
            } else {
                stockLabel.innerText = 'Please select a size to see stock.';
            }
        });
    </script>

    <script>
        let currentSlide = 0;
        const slides = document.querySelectorAll('.carousel-img');
        const dots = document.querySelectorAll('#carousel-dots button');
        let slideInterval = null;

        function showSlide(index) {
            slides.forEach((slide, i) => {
                slide.classList.toggle('opacity-100', i === index);
                slide.classList.toggle('opacity-0', i !== index);
                slide.classList.toggle('z-10', i === index);
                slide.classList.toggle('z-0', i !== index);
            });

            dots.forEach((dot, i) => {
                dot.classList.toggle('bg-indigo-600', i === index);
                dot.classList.toggle('bg-gray-300', i !== index);
            });

            currentSlide = index;
        }

        function nextSlide() {
            showSlide((currentSlide + 1) % slides.length);
            resetAutoSlide();
        }

        function prevSlide() {
            showSlide((currentSlide - 1 + slides.length) % slides.length);
            resetAutoSlide();
        }

        function goToSlide(index) {
            showSlide(index);
            resetAutoSlide();
        }

        function startAutoSlide() {
            slideInterval = setInterval(nextSlide, 5000);
        }

        function stopAutoSlide() {
            clearInterval(slideInterval);
        }

        function resetAutoSlide() {
            stopAutoSlide();
            startAutoSlide();
        }

        // Initialize
        document.addEventListener('DOMContentLoaded', () => {
            showSlide(0);
            startAutoSlide();

            // Optional: Pause on hover
            const container = document.getElementById('carousel-container');
            container.addEventListener('mouseenter', stopAutoSlide);
            container.addEventListener('mouseleave', startAutoSlide);
        });


        const images = document.querySelectorAll('.carousel-image');

        dots.forEach((dot, index) => {
            dot.addEventListener('click', () => {
                goToSlide(index);
            });
        });

        document.addEventListener('DOMContentLoaded', function() {
            const sizeSelect = document.getElementById('size');
            const priceDisplay = document.getElementById('product-price');

            sizeSelect.addEventListener('change', function() {
                const selectedOption = this.options[this.selectedIndex];
                const price = selectedOption.getAttribute('data-price');

                if (price) {
                    priceDisplay.textContent = '₹' + parseFloat(price).toFixed(2);
                } else {
                    priceDisplay.textContent = 'Select Size';
                }
            });
        });
    </script>


    @include('partials.footer')

</body>

</html>