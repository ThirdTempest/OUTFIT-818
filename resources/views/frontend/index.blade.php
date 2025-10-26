@extends('layouts.front')

@section('content')

<!-- Hero Section -->

<section class="hero-carousel" data-aos="fade-in">
    @foreach ($carousels as $index => $carousel)
    <div class="hero-slide {{ $loop->first ? 'active' : '' }}"
        style="background-image: url({{ asset('storage/' . $carousel->image_path) }});">
        <div class="slide-content">
            <h1 style="font-weight: 900;">{{ $carousel->title }}</h1>
            <p>{{ $carousel->description }}</p>

            @if($carousel->button_text && $carousel->button_link)
            <a href="{{ $carousel->button_link }}"
                class="hero-btn"
                {{ Str::startsWith($carousel->button_link, ['http://', 'https://']) ? 'target=_blank rel=noopener' : '' }}>
                {{ $carousel->button_text }}
            </a>
            @endif
        </div>
    </div>
    @endforeach


    <!-- Arrows -->
    <div class="carousel-nav">
        <button id="carousel-prev">&#10094;</button>
        <button id="carousel-next">&#10095;</button>
    </div>
</section><br>

<section class="featured-categories" data-aos="fade-up">
    <h2 style="text-align: center; font-weight: 900;">Shop by Category</h2>
    <div class="category-grid">
        @forelse ($categories as $category)
        <a href="{{ url($category->slug) }}" class="block">
            <div class="category-card" style="background-image: url('{{ asset('storage/' . $category->image) }}');">
                <div class="category-overlay">
                    <h3 style="font-weight: 900;">{{ $category->name }}</h3>
                </div>
            </div>
        </a>
        @empty
        <p class="text-center text-gray-500 mt-4">No categories available.</p>
        @endforelse
    </div>
</section><br>

<!-- New Arrivals -->
<section class="new-arrivals" data-aos="fade-left" id="NewArrivals">
    <h2 style="font-weight: 900;">New Arrivals</h2>

    <div class="carousel-wrapper">
        <button class="carousel-btn prev" id="new-arrivals-prev">&#10094;</button>

        <div class="carousel-track" id="new-arrivals-carousel">
            @forelse ($arrivals as $arrival)
            <div class="product-card">
                <div class="product-image" style="background-image: url('{{ asset('storage/' . $arrival->image) }}');"></div>
                <div class="product-info">
                    <h3>{{ $arrival->name }}</h3>
                    <p class="price">₱{{ number_format($arrival->price) }}</p>
                    <a href="#" class="buy-btn">Shop Now</a>
                </div>
            </div>
            @empty
            <p class="text-gray-500 px-4 py-2">No new arrivals yet.</p>
            @endforelse
        </div>

        <button class="carousel-btn next" id="new-arrivals-next">&#10095;</button>
    </div>
</section>



<!-- About Brand -->
<section class="about-brand" data-aos="fade-right">
    <div class="about-container">
        <div class="about-image">
            <img src="{{ asset('assets/images/logo.png') }}" alt="Logo" width="200px" height="200px">
        </div>
        <div class="about-content">
            <h2 style="font-weight: 900;">About <span>Outfit 818</span></h2>
            <p>At Outfit 818, we believe fashion is more than just clothing — it’s confidence, creativity, and comfort. Our mission is to blend timeless designs with modern trends to create something truly unique for every individual.</p>
            <blockquote>“Dress well. Feel unstoppable.”</blockquote>
        </div>
    </div>
</section>

<!-- PRODUCT OF THE DAY -->
@php
$featured = \App\Models\FeaturedProduct::where('is_active', true)->latest()->first();
@endphp

@if($featured)
<section class="product-of-the-day-grand" data-aos="zoom-in-up">
    <div class="product-bg-overlay">
        <div class="product-content-wrapper">
            <div class="product-text">
                <div class="badge">Product of the Day</div>
                <h1 class="product-title">{{ $featured->title }}</h1>
                <p class="product-tagline">"{{ $featured->tagline }}"</p>
                <p class="product-description">{{ $featured->description }}</p>
                <div class="price-box">
                    <span class="original-price">₱{{ number_format($featured->original_price) }}</span>
                    <span class="discounted-price">₱{{ number_format($featured->discounted_price) }}</span>
                    <span class="discount-badge">-{{ round(100 - ($featured->discounted_price / $featured->original_price) * 100) }}%</span>
                </div>
                @if($featured->button_text && $featured->button_link)
                <a href="{{ $featured->button_link }}" class="shop-button">
                    {{ $featured->button_text }}
                </a>
                @endif
            </div>
            <div class="product-image">
                <img src="{{ asset('storage/' . $featured->image_path) }}" alt="{{ $featured->title }}">
            </div>
        </div>
    </div>
</section>
@endif


<!-- EMAIL OPT-IN SECTION -->
<section class="email-optin-full" data-aos="fade-up" id="emails">
    <div class="optin-text">
        <h2>Get Styled, Stay Updated.</h2>
        <p>Be the first to know about exclusive drops, latest arrivals, and limited-time offers from Outfit 818.</p>
    </div>
    @auth
    @php
    $isSubscribed = \App\Models\Email::where('email', auth()->user()->email)->exists();
    @endphp

    @if ($isSubscribed)
    <div class="bg-green-100 text-green-800 p-4 rounded mt-3 flex items-center justify-between">
        <span>You are subscribed and will receive notifications via email.</span>

        <form action="{{ route('emails.unsubscribe') }}" method="POST" onsubmit="return confirm('Are you sure you want to unsubscribe?');">
            @csrf
            @method('DELETE')
            <button type="submit" class="ml-4 text-red-600 hover:underline">Unsubscribe</button>
        </form>
    </div>

    @else
    <form action="{{ route('emails.subscribe') }}" method="POST" class="optin-form-bottom">
        @csrf
        <input type="email" name="email" value="{{ auth()->user()->email }}" readonly class="bg-gray-100 cursor-not-allowed" required>
        <button type="submit">Subscribe</button>
    </form>
    @endif
    @else
    <form class="optin-form-bottom">
        <input type="email" placeholder="Enter your email" required disabled class="cursor-not-allowed">
        <button type="submit" disabled>Login to Subscribe</button>
    </form>
    @endauth

    <div id="subscribe-message" class="text-sm mt-2"></div>

</section>

@endsection