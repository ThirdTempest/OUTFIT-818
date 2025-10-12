<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use Barryvdh\DomPDF\Facade\Pdf;

class AdminOrderController extends Controller
{
    public function index()
    {
        $orders = Order::with('user')->latest()->get();
        return view('admin.orders', compact('orders'));
    }

    public function show($orderId)
    {
        $order = Order::with('items', 'user')->where('order_id', $orderId)->firstOrFail();
        return view('admin.orders.show', compact('order'));
    }
    public function downloadInvoice(Order $order)
    {
        $pdf = Pdf::loadView('orders.invoice', compact('order'));
        return $pdf->download('Invoice_' . $order->order_id . '.pdf');
    }
}
