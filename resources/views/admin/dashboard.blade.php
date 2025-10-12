@extends('admin.layout')

@section('content')
    <h1 class="text-3xl font-bold mb-8">Welcome Admin 👋</h1>

    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
        <div class="bg-white p-6 rounded shadow hover:shadow-lg transition">
            <h2 class="text-lg font-semibold">Carousel Slides</h2>
            <p class="text-gray-600 mt-2">Manage homepage hero images.</p>
        </div>
        <div class="bg-white p-6 rounded shadow hover:shadow-lg transition">
            <h2 class="text-lg font-semibold">Featured Product</h2>
            <p class="text-gray-600 mt-2">Highlight today’s top item.</p>
        </div>
        <div class="bg-white p-6 rounded shadow hover:shadow-lg transition">
            <h2 class="text-lg font-semibold">Emails Collected</h2>
            <p class="text-gray-600 mt-2">View newsletter opt-ins.</p>
        </div>
    </div>
@endsection
