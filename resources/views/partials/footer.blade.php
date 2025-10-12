<footer class="site-footer" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
    <div class="footer-container">
        <div class="footer-row">
            <!-- Column 1: Logo -->
            <div class="footer-col">
                <a href="{{ url('/') }}" class="footer-logo">Outfit 818</a>
                <p class="tagline">Your everyday fashion destination.</p>
            </div>

            <!-- Column 2: Navigation -->
            <div class="footer-col">
                <h4>Quick Links</h4>
                <ul class="footer-links">
                    <li><a href="/men">Men</a></li>
                    <li><a href="/women">Women</a></li>
                    <li><a href="{{ route('products.all') }}">Products</a></li>
                    <li><a href="{{route('contact')}}">Contact</a></li>
                </ul>
            </div>

            <!-- Column 3: Social Icons -->
            <div class="footer-col">
                <h4>Follow Us</h4>
                <div class="footer-social">
                    <a href="https://github.com/Nisarg-Vekariya"target="_blank"><i class="fa-brands fa-github"></i></i></a>
                    <a href="https://www.instagram.com/not_real_gladiator" target="_blank"><i class="fab fa-instagram"></i></a>
                    <a href="https://x.com/NiradPatel0303"target="_blank"><i class="fab fa-twitter"></i></a>
                </div>
            </div>
        </div>

        <div class="footer-copy">
            <p style="color:black">{{ date('Y') }} | Built by Team 818 </p>
        </div>
    </div>
</footer>