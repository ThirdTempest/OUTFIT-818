<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Order;
use Illuminate\Support\Facades\Auth;
use Barryvdh\DomPDF\Facade\Pdf;

class OrderController extends Controller
{
    public function index()
    {
        $user = Auth::user();

        // Only fetch orders for the authenticated user with their items
        $orders = Order::with('items')->where('user_id', $user->id)->latest()->get();

        return view('orders.index', compact('orders'));
    }

    public function show($orderId)
    {
        // Only fetch the order if it belongs to the logged-in user
        $order = Order::with('items')
            ->where('user_id', Auth::id())
            ->where('order_id', $orderId)
            ->firstOrFail();

        return view('orders.show', compact('order'));
    }

    public function downloadInvoice($orderId)
    {
        $order = Order::where('order_id', $orderId)
            ->where('user_id', auth()->id())
            ->with('items')
            ->firstOrFail();

        $pdf = Pdf::loadView('orders.invoice', compact('order'));
        return $pdf->download('Invoice_' . $order->order_id . '.pdf');
    }
}
