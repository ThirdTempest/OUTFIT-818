<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\CartItem;
use App\Models\ProductSize;
use Illuminate\Support\Facades\Auth;
use App\Models\Product;

class CartController extends Controller
{
    public function add(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'size' => 'required|string',
            'quantity' => 'required|integer|min:1',
        ]);

        $user = Auth::user();

        // 👉 Check if stock is available
        $sizeData = ProductSize::where('product_id', $request->product_id)
            ->where('size', $request->size)
            ->first();

        if (!$sizeData || $sizeData->stock < $request->quantity) {
            return redirect()->back()->with('error', 'Stock not available for the selected size.');
        }

        // Check if item already exists
        $existing = CartItem::where('user_id', $user->id)
            ->where('product_id', $request->product_id)
            ->where('size', $request->size)
            ->first();

        if ($existing) {
            $existing->increment('quantity', $request->quantity);
        } else {
            CartItem::create([
                'user_id' => $user->id,
                'product_id' => $request->product_id,
                'size' => $request->size,
                'quantity' => $request->quantity,
            ]);
        }

        if ($request->input('action') === 'buy_now') {
            return redirect()->route('cart');
        }

        return redirect()->back()->with('success', 'Product added to your cart!');
    }

    public function remove($id)
    {
        $item = CartItem::where('id', $id)
            ->where('user_id', auth()->id())
            ->first();

        if ($item) {
            $item->delete();
            return redirect()->route('cart')->with('success', 'Item removed from cart.');
        }

        return redirect()->route('cart')->with('error', 'Item not found or unauthorized.');
    }

    public function view()
    {
        $items = CartItem::with(['product.sizes'])->where('user_id', Auth::id())->get();

        // Inject correct price for each item based on size
        foreach ($items as $item) {
            $sizeObj = $item->product->sizes->firstWhere('size', $item->size);
            $item->unit_price = $sizeObj ? $sizeObj->price : 0;
        }

        return view('frontend.cart', compact('items'));
    }
}
