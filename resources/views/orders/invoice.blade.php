<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Invoice - {{ $order->order_id }}</title>
    <style>
        body {
            font-family: sans-serif;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>
    <h2>Invoice</h2>
    <p><strong>Order ID:</strong> {{ $order->order_id }}</p>
    <p><strong>Date:</strong> {{ $order->created_at->setTimezone('Asia/Kolkata')->format('d M Y, h:i A') }}</p>
    <p><strong>Total:</strong> INR {{ number_format($order->total_amount, 2) }}</p>

    <table>
        <thead>
            <tr>
                <th>Product</th>
                <th>Size</th>
                <th>Qty</th>
                <th>Price</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody>
            @foreach ($order->items as $item)
            <tr>
    <td>{{ $item->product_name }}</td>
    <td>{{ $item->size }}</td>
    <td>{{ $item->quantity }}</td>
    <td>INR {{ number_format($item->price, 2) }}</td>
    <td>INR {{ number_format($item->price * $item->quantity, 2) }}</td>
</tr>

            @endforeach
        </tbody>
    </table>

    <p style="margin-top: 20px;"><strong>Thank you for shopping with us!</strong></p>
</body>

</html>