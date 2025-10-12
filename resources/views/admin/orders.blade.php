@extends('admin.layout')

@section('content')
<section class="mt-8" data-aos="fade-down">
    <h2 class="text-2xl font-bold mb-6 text-gray-800">📦 All Orders</h2>

    <div class="bg-white p-4 rounded-xl shadow overflow-x-auto" data-aos="fade-up" data-aos-delay="100">
        <table class="w-full table-auto text-sm">
            <thead>
                <tr class="bg-[#536451] text-[#f3e9d5] uppercase text-xs">
                    <th class="px-4 py-3 text-left">#</th>
                    <th class="px-4 py-3 text-left">Order ID</th>
                    <th class="px-4 py-3 text-left">User</th>
                    <th class="px-4 py-3 text-left">Total (₹)</th>
                    <th class="px-4 py-3 text-left">Status</th>
                    <th class="px-4 py-3 text-left">Date</th>
                    <th class="px-4 py-3 text-center">Actions</th>
                </tr>
            </thead>
            <tbody class="text-gray-800">
                @forelse ($orders as $order)
                <tr class="border-t hover:bg-gray-50 transition" data-aos="fade-up" data-aos-delay="{{ ($loop->index + 1) * 50 }}">
                    <td class="px-4 py-3">{{ $loop->iteration }}</td>
                    <td class="px-4 py-3 font-mono">{{ $order->order_id }}</td>
                    <td class="px-4 py-3">{{ $order->user->name ?? 'Guest' }}</td>
                    <td class="px-4 py-3">₹{{ number_format($order->total_amount, 2) }}</td>
                    <td class="px-4 py-3 capitalize">
                        <span class="inline-block px-2 py-1 rounded-full text-xs font-medium
                            {{ $order->status === 'pending' ? 'bg-yellow-100 text-yellow-800' :
                               ($order->status === 'completed' ? 'bg-green-100 text-green-700' :
                               ($order->status === 'cancelled' ? 'bg-red-100 text-red-600' : 'bg-gray-100 text-gray-600')) }}">
                            {{ $order->status }}
                        </span>
                    </td>
                    <td class="px-4 py-3">{{ $order->created_at->format('d M Y, h:i A') }}</td>
                    <td class="px-4 py-3 text-center">
                        <a href="{{ route('admin.orders.invoice', ['order' => $order->id]) }}"
                           class="text-[#536451] hover:underline font-medium">
                            📄 Invoice
                        </a>
                    </td>
                </tr>
                @empty
                <tr>
                    <td colspan="7" class="text-center text-gray-500 py-6">No orders found.</td>
                </tr>
                @endforelse
            </tbody>
        </table>

    </div>
</section>
@endsection
