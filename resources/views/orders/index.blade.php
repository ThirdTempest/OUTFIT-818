<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Your Orders - Outfit 818</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="{{ asset('assets/css/style.css') }}">
</head>

<body>
    @include('partials.navbar')

    <div class="max-w-6xl mx-auto px-4 py-10">
        <h1 class="text-3xl font-bold mb-8">🛒 Your Order History</h1>

        @if ($orders->isEmpty())
        <div class="text-center py-20">
            <p class="text-xl text-gray-600">You haven't placed any orders yet.</p>
            <a href="{{ route('products.all') }}" class="mt-4 inline-block text-green-900 hover:underline">Start Shopping</a>
        </div>
        @else
        <div class="overflow-x-auto bg-white shadow rounded-lg">
            <table class="min-w-full divide-y divide-gray-200">
                <thead class="bg-green">
                    <tr>
                        <th class="px-6 py-3 text-left">Order ID</th>
                        <th class="px-6 py-3 text-left">Date</th>
                        <th class="px-6 py-3 text-left">Total</th>
                        <th class="px-6 py-3 text-left">Status</th>
                        <th class="px-6 py-3 text-center">Actions</th>
                        <th class="px-6 py-3 text-center">Invoice</th>
                    </tr>
                </thead>

                <tbody class="divide-y divide-gray-200">
                    @foreach ($orders as $order)
                    <tr>
                        <td class="px-6 py-4">{{ $order->order_id }}</td>
                        <td class="px-6 py-4">{{ $order->created_at->setTimezone('Asia/Kolkata')->format('d M Y, h:i A') }}</td>
                        <td class="px-6 py-4">₹{{ number_format($order->total_amount, 2) }}</td>
                        <td class="px-6 py-4 capitalize">
                            @if($order->status === 'paid')
                            <span class="text-green-600 font-semibold">Paid</span>
                            @else
                            <span class="text-yellow-600 font-semibold">{{ $order->status }}</span>
                            @endif
                        </td>
                        <td class="px-6 py-4 text-center">
                            <a href="{{ route('orders.show', $order->order_id) }}" class="text-blue-600 hover:underline">
                                View Details
                            </a>
                        </td>
                        <td class="px-6 py-4 text-center">
                            <a href="{{ route('orders.invoice', $order->order_id) }}" class="text-indigo-600 hover:underline">
                                Download Invoice
                            </a>
                        </td>
                    </tr>


                    @endforeach
                </tbody>
            </table>
        </div>
        @endif
    </div>

    @include('partials.footer')
</body>

</html>