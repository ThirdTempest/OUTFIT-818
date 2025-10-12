<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Admin Panel - Outfit 818</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js" defer></script>
    <style>
        .logo {
            font-size: 1.8rem;
            font-weight: 700;
            color: #bebc65;
            text-decoration: none;
            letter-spacing: 1px;
            transition: color 0.3s;
        }
    </style>
</head>

<body class="bg-[#f3e9d5] font-sans flex">
    <!-- Sidebar -->
    <aside id="sidebar" class="w-64 bg-[#536451] shadow-md h-screen fixed flex flex-col justify-between transition-all duration-300 ease-in-out ">
        <div>
            <!-- Logo or Hamburger -->
            <div id="sidebar-header" class="flex items-center justify-between px-4 py-6 text-2xl font-bold text-primary transition-all duration-300">
                <a href="{{ url('/') }}" id="sidebar-title" class="text-primary hover:underline logo" style="text-decoration: none;">
                    Outfit 818
                </a>

                <button onclick="toggleSidebar()" class="text-2xl focus:outline-none logo" id="toggle-btn-sidebar">
                    ☰
                </button>
            </div>


            <!-- Navigation -->
            <nav id="sidebar-nav" class="flex flex-col text-[#f3e9d5]   ">
                <a href="#" data-url="{{ url('admin/dashboard') }}" onclick="loadAdminPage(event, this)" class="flex items-center gap-3 py-3 px-4 hover:bg-[#f3e9d5] hover:text-[#536451] {{ request()->is('admin/dashboard') ? 'bg-[#536451] font-semibold' : '' }}">
                    <span class="text-2xl">📊</span>
                    <span class="nav-text">Dashboard</span>
                </a>
                <a href="#" data-url="{{ url('admin/carousels') }}" onclick="loadAdminPage(event, this)" class="flex items-center gap-3 py-3 px-4 hover:bg-[#f3e9d5] hover:text-[#536451] {{ request()->is('admin/carousels') ? 'bg-[#536451] font-semibold' : '' }}">
                    <span class="text-2xl">🖼️</span>
                    <span class="nav-text">Carousels</span>
                </a>
                <a href="#" data-url="{{ url('admin/featured-product') }}" onclick="loadAdminPage(event, this)" class="flex items-center gap-3 py-3 px-4 hover:bg-[#f3e9d5] hover:text-[#536451] {{ request()->is('admin/featured-products') ? 'bg-[#536451] font-semibold' : '' }}">
                    <span class="text-2xl">🌟</span>
                    <span class="nav-text">Featured</span>
                </a>
                <a href="#" data-url="{{ url('admin/new-arrivals') }}" onclick="loadAdminPage(event, this)" class="flex items-center gap-3 py-3 px-4 hover:bg-[#f3e9d5] hover:text-[#536451] {{ request()->is('admin/new-arrivals') ? 'bg-[#536451] font-semibold' : '' }}">
                    <span class="text-2xl">🆕</span>
                    <span class="nav-text">New Arrivals</span>
                </a>
                <a href="#" data-url="{{ url('admin/categories') }}" onclick="loadAdminPage(event, this)" class="flex items-center gap-3 py-3 px-4 hover:bg-[#f3e9d5] hover:text-[#536451] {{ request()->is('admin/categories') ? 'bg-[#536451] font-semibold' : '' }}">
                    <span class="text-2xl">🗂️</span>
                    <span class="nav-text">Categories</span>
                </a>
                <a href="#" data-url="{{ url('admin/emails') }}" onclick="loadAdminPage(event, this)" class="flex items-center gap-3 py-3 px-4 hover:bg-[#f3e9d5] hover:text-[#536451] {{ request()->is('admin/emails') ? 'bg-[#536451] font-semibold' : '' }}">
                    <span class="text-2xl">📧</span>
                    <span class="nav-text">Emails</span>
                </a>
                <a href="#" data-url="{{ url('admin/orders') }}" onclick="loadAdminPage(event, this)"
                    class="flex items-center gap-3 py-3 px-4 hover:bg-[#f3e9d5] hover:text-[#536451] {{ request()->is('admin/orders') ? 'bg-[#536451] font-semibold' : '' }}">
                    <span class="text-2xl">📦</span>
                    <span class="nav-text">Orders</span>
                </a>
                <a href="#" data-url="{{ url('admin/products') }}" onclick="loadAdminPage(event, this)" class="flex items-center gap-3 py-3 px-4 hover:bg-[#f3e9d5] hover:text-[#536451] {{ request()->is('admin/products') ? 'bg-[#536451] font-semibold' : '' }}">
                    <span class="text-2xl">🛍️</span>
                    <span class="nav-text">Add Products</span>
                </a>
                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <button type="submit" class="flex items-center gap-3 py-3 px-4 text-left w-full hover:bg-gray-100 text-red-500">
                        <span class="text-2xl">🚪</span>
                        <span class="nav-text">Logout</span>
                    </button>
                </form>

            </nav>
        </div>
        <div id="sidebar-footer" class="p-4 text-sm text-center text-gray-400 transition-all">
            {{ date('Y') }} | Built by Team 818
        </div>

    </aside>

    <!-- Main Content -->
    <div id="main" class="ml-64 flex-1 transition-all duration-300 ease-in-out">

        <!-- Page Content -->
        <main class="p-8">
            <div id="admin-content">
                @yield('content')
            </div>
        </main>

    </div>
    <script>
        const baseUpdateUrl = {
            carousels: "{{ url('admin/carousels') }}",
            categories: "{{ url('admin/categories') }}",
            products: "{{ url('admin/products') }}",
            arrivals: "{{ url('admin/new-arrivals') }}"
        };
    </script>

    <script src="{{ asset('assets/js/modals.js')}}"></script>

    <!-- Toggle Script -->
    <script>
        function loadAdminPage(event, el) {
            event.preventDefault(); // 👈 prevents the "#" behavior

            const url = el.getAttribute('data-url');
            const contentDiv = document.getElementById('admin-content');

            // Clear active classes
            document.querySelectorAll('#sidebar-nav a').forEach(link => {
                link.classList.remove('bg-[#536451]', 'font-semibold');
            });

            // Highlight clicked
            el.classList.add('bg-[#536451]', 'font-semibold');

            // Update URL
            history.pushState({}, '', url);

            // Fetch content
            fetch(url)
                .then(response => response.text())
                .then(html => {
                    const parser = new DOMParser();
                    const doc = parser.parseFromString(html, 'text/html');
                    const newContent = doc.querySelector('#admin-content');
                    contentDiv.innerHTML = newContent ? newContent.innerHTML : 'Page not found.';

                    // ✅ Re-init AOS after content loads
                    AOS.init({
                        duration: 800,
                        once: true,
                    });

                    rebindModalEvents();
                });

        }

        function toggleSidebar() {
            const sidebar = document.getElementById('sidebar');
            const main = document.getElementById('main');
            const navTexts = document.querySelectorAll('.nav-text');
            const title = document.getElementById('sidebar-title');
            const footer = document.getElementById('sidebar-footer');

            const isCollapsed = sidebar.classList.contains('w-16');

            if (!isCollapsed) {
                // Collapse
                sidebar.classList.remove('w-64');
                sidebar.classList.add('w-16');
                main.classList.remove('ml-64');
                main.classList.add('ml-16');
                navTexts.forEach(t => t.classList.add('hidden'));
                title.classList.add('hidden');
                footer.classList.add('hidden');
            } else {
                // Expand
                sidebar.classList.remove('w-16');
                sidebar.classList.add('w-64');
                main.classList.remove('ml-16');
                main.classList.add('ml-64');
                navTexts.forEach(t => t.classList.remove('hidden'));
                title.classList.remove('hidden');
                footer.classList.remove('hidden');
            }
        }

        window.addEventListener('popstate', function() {
            // When the user clicks back/forward, load that content
            const url = location.href;

            // Optional: highlight correct link again
            document.querySelectorAll('#sidebar-nav a').forEach(link => {
                link.classList.remove('bg-[#536451]', 'font-semibold');
                if (link.getAttribute('data-url') === url) {
                    link.classList.add('bg-[#536451]', 'font-semibold');
                }
            });

            // Load content again
            fetch(url)
                .then(response => response.text())
                .then(html => {
                    const parser = new DOMParser();
                    const doc = parser.parseFromString(html, 'text/html');
                    const newContent = doc.querySelector('#admin-content');

                    const contentDiv = document.getElementById('admin-content');
                    contentDiv.innerHTML = newContent ? newContent.innerHTML : 'Page not found.';
                });
        });

        document.addEventListener('DOMContentLoaded', () => {
            AOS.init({
                once: true,
                duration: 600, // 👈 Slower animation (default is 400ms)
                easing: 'ease-in-out', // 👈 Smooth curve
                delay: 100 // 👈 Delay before animation starts (optional)
            });

            setTimeout(() => {
                AOS.refresh();
            }, 100);
        });
    </script>

</body>

</html>