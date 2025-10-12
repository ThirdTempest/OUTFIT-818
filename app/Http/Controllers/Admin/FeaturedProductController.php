<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\FeaturedProduct;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;


class FeaturedProductController extends Controller
{
    public function index()
    {
        $product = FeaturedProduct::latest()->first(); // one active product
        return view('admin.featured-product', compact('product'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'tagline' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'original_price' => 'required|numeric|min:0',
            'discounted_price' => 'required|numeric|min:0',
            'image' => 'required|image|max:2048',
            'button_text' => 'nullable|string|max:255',
            'button_link' => 'nullable|url|max:255',
        ]);

        $path = $request->file('image')->store('featured', 'public');

        FeaturedProduct::create([
            'title' => $request->title,
            'tagline' => $request->tagline,
            'description' => $request->description,
            'original_price' => $request->original_price,
            'discounted_price' => $request->discounted_price,
            'image_path' => $path, // Ensure this is correct
            'is_active' => true,
            'button_text' => $request->button_text,
            'button_link' => $request->button_link,
        ]);

        return redirect()->route('admin.featured.index')->with('success', 'Featured product added successfully.');
    }


    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'tagline' => 'nullable|string|max:255',
            'description' => 'nullable|string',
            'original_price' => 'required|numeric',
            'discounted_price' => 'required|numeric|lt:original_price',
            'button_text' => 'nullable|string|max:255',
            'button_link' => 'nullable|url|max:255',
            'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        $product = FeaturedProduct::findOrFail($id);

        if ($request->hasFile('image')) {
            $imagePath = $request->file('image')->store('featured', 'public');
            $product->image_path = $imagePath;
        }

        $product->title = $request->title;
        $product->tagline = $request->tagline;
        $product->description = $request->description;
        $product->original_price = $request->original_price;
        $product->discounted_price = $request->discounted_price;
        $product->button_text = $request->button_text;
        $product->button_link = $request->button_link;
        $product->is_active = true;

        $product->save();

        return redirect()->route('admin.featured.index')->with('success', 'Featured product updated successfully.');
    }


    public function show($id)
    {
        $product = FeaturedProduct::findOrFail($id);
        return response()->json($product);
    }

    public function destroy($id)
    {
        $product = FeaturedProduct::findOrFail($id);

        // Optionally delete the image from storage
        // if ($product->image_path && \Storage::disk('public')->exists($product->image_path)) {
        //     \Storage::disk('public')->delete($product->image_path);
        // }

        $product->delete();

        return redirect()->route('admin.featured.index')->with('success', 'Featured product deleted successfully.');
    }
}
