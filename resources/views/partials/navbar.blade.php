<nav class="minimal-navbar">
    <div class="nav-container">
        <a href="{{ url('/') }}" class="logo">Outfit 818</a>

        <ul class="nav-links">
            <li><a href="{{url('men')}}">Men</a></li>
            <li><a href="{{url('women')}}">Women</a></li>
            <li><a href="{{url('kids')}}">Kids</a></li>
            <li><a href="index.php#NewArrivals">New Arrivals</a></li>
            <li><a href="{{route('contact')}}">Contact</a></li>
            <li><a href="{{ route('products.all') }}">Products</a></li>

            @guest
            <li><a href="{{ route('register') }}">Sign Up</a></li>
            <li><a href="{{ route('login') }}">Log In</a></li>
            @endguest

            @auth
            <li><a href="{{ route('orders.index') }}">Orders</a></li>

            @if(auth()->user()->user_type === 'admin')
            <li><a href="{{ route('admin.dashboard') }}">Admin</a></li>
            @endif
            @endauth
        </ul>


        <div class="nav-icons relative">
            @auth
            <!-- Only visible to logged-in users -->
            <a href="javascript:void(0);" id="userIcon">
                <i class="fas fa-user"></i>
            </a>

            <!-- Dropdown -->
            <div id="userDropdown"
                class="hidden absolute right-0 mt-2 w-48 bg-white border border-gray-200 rounded-lg shadow-lg z-50 overflow-hidden text-sm">
                <a href="{{ route('profile.show') }}" class="no-style-nav dropdown-item flex items-center gap-2 px-4 py-2 hover:bg-gray-100">
                    <i class="fas fa-user"></i>
                    <span>Profile</span>
                </a>
                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <button type="submit" class="dropdown-item flex items-center gap-2 px-4 py-2 hover:bg-gray-100">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </button>
                </form>
            </div>
            @endauth

            @guest
            <!-- Show icon for guests -->
            <a href="{{ route('login') }}">
                <i class="fas fa-user"></i>
            </a>
            @endguest

            <!-- Always show cart -->
            <a href="{{ route('cart') }}">
                <i class="fas fa-shopping-cart"></i>
            </a>

        </div>


    </div>
</nav>

<script>
    function toggleDropdown() {
        const dropdown = document.getElementById('userDropdown');
        dropdown.classList.toggle('hidden');
    }
    document.addEventListener('DOMContentLoaded', function() {
        const userIcon = document.getElementById('userIcon');
        const userDropdown = document.getElementById('userDropdown');

        userIcon.addEventListener('click', function(e) {
            e.stopPropagation(); // Prevents event bubbling
            userDropdown.classList.toggle('hidden');
        });

        // Hide dropdown if clicking outside
        document.addEventListener('click', function(e) {
            if (!userDropdown.contains(e.target) && !userIcon.contains(e.target)) {
                userDropdown.classList.add('hidden');
            }
        });
    });

    // Optional: Hide dropdown if clicked outside
    document.addEventListener('click', function(event) {
        const dropdown = document.getElementById('userDropdown');
        const userIcon = event.target.closest('.nav-icons');

        if (!userIcon) {
            dropdown?.classList.add('hidden');
        }
    });
</script>