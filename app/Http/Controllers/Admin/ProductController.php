<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Category;
use App\Models\ProductSize;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\DB;

class ProductController extends Controller
{
    public function index()
    {
        $products = Product::with(['category', 'sizes'])->orderBy('created_at', 'desc')->get();
        $categories = Category::orderBy('name')->get();

        return view('admin.products', compact('products', 'categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name'        => 'required|string|max:255',
            'category_id' => 'nullable|exists:categories,id',
            'description' => 'nullable|string',
            'status'      => 'required|in:active,inactive',
            'image'       => 'required|image|mimes:jpg,jpeg,png|max:2048',
            'image_2'     => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            'image_3'     => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            'image_4'     => 'nullable|image|mimes:jpg,jpeg,png|max:2048',

            // Sizes validation including stock
            'sizes'         => 'required|array',
            'sizes.*.size'  => 'required|in:S,M,L,XL',
            'sizes.*.price' => 'required|numeric|min:0',
            'sizes.*.stock' => 'required|integer|min:0',
        ]);

        $mainImage = $request->file('image')->store('products', 'public');
        $image2 = $request->file('image_2')?->store('products', 'public');
        $image3 = $request->file('image_3')?->store('products', 'public');
        $image4 = $request->file('image_4')?->store('products', 'public');

        $product = Product::create([
            'name'        => $request->name,
            'category_id' => $request->category_id,
            'description' => $request->description,
            'status'      => $request->status,
            'image'       => $mainImage,
            'image_2'     => $image2,
            'image_3'     => $image3,
            'image_4'     => $image4,
        ]);

        foreach ($request->sizes as $sizeData) {
            ProductSize::create([
                'product_id' => $product->id,
                'size'       => $sizeData['size'],
                'price'      => $sizeData['price'],
                'stock'      => $sizeData['stock'],  // ✅ store stock
            ]);
        }

        return redirect()->back()->with('success', 'Product added with sizes and stock successfully!');
    }

    public function update(Request $request, $id)
    {
        $product = Product::with('sizes')->findOrFail($id);

        $request->validate([
            'name'        => 'required|string|max:255',
            'category_id' => 'nullable|exists:categories,id',
            'description' => 'nullable|string',
            'status'      => 'required|in:active,inactive',
            'image'       => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            'image_2'     => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            'image_3'     => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            'image_4'     => 'nullable|image|mimes:jpg,jpeg,png|max:2048',

            'sizes'         => 'required|array',
            'sizes.*.size'  => 'required|in:S,M,L,XL',
            'sizes.*.price' => 'required|numeric|min:0',
            'sizes.*.stock' => 'required|integer|min:0',
        ]);

        $data = $request->only(['name', 'category_id', 'description', 'status']);

        if ($request->hasFile('image')) {
            Storage::disk('public')->delete($product->image);
            $data['image'] = $request->file('image')->store('products', 'public');
        }

        foreach (['image_2', 'image_3', 'image_4'] as $img) {
            if ($request->hasFile($img)) {
                Storage::disk('public')->delete($product->$img);
                $data[$img] = $request->file($img)->store('products', 'public');
            }
        }

        $product->update($data);

        // Delete old sizes and re-add with stock
        $product->sizes()->delete();
        foreach ($request->sizes as $sizeData) {
            ProductSize::create([
                'product_id' => $product->id,
                'size'       => $sizeData['size'],
                'price'      => $sizeData['price'],
                'stock'      => $sizeData['stock'],  // ✅ store updated stock
            ]);
        }

        return redirect()->back()->with('success', 'Product updated with sizes and stock successfully!');
    }

    public function destroy($id)
    {
        $product = Product::with('sizes')->findOrFail($id);

        foreach (['image', 'image_2', 'image_3', 'image_4'] as $img) {
            if ($product->$img && Storage::disk('public')->exists($product->$img)) {
                Storage::disk('public')->delete($product->$img);
            }
        }

        $product->sizes()->delete();
        $product->delete();

        return redirect()->back()->with('success', 'Product and sizes deleted successfully!');
    }

    public function import(Request $request)
    {
        $request->validate([
            'csv_file' => 'required|file|mimes:csv,txt',
        ]);

        $path = $request->file('csv_file')->getRealPath();
        if (!file_exists($path)) return back()->with('error', 'File not found.');

        $data = array_map('str_getcsv', file($path));
        if (count($data) <= 1) return back()->with('error', 'CSV appears to be empty.');

        $header = array_map('trim', $data[0]);

        foreach (array_slice($data, 1) as $row) {
            $row = array_combine($header, $row);

            $product = Product::create([
                'name'        => $row['name'],
                'category_id' => $row['category_id'],
                'description' => $row['description'],
                'status'      => $row['status'],
                'price'       => 0,
                'image'       => 'products/' . ($row['image'] ?? 'dummy.jpg'),
                'image_2'     => isset($row['image_2']) ? 'products/' . $row['image_2'] : null,
                'image_3'     => isset($row['image_3']) ? 'products/' . $row['image_3'] : null,
                'image_4'     => isset($row['image_4']) ? 'products/' . $row['image_4'] : null,
            ]);

            foreach (['S', 'M', 'L', 'XL'] as $size) {
                if (!empty($row["price_$size"])) {
                    ProductSize::create([
                        'product_id' => $product->id,
                        'size'       => $size,
                        'price'      => $row["price_$size"],
                        'stock'      => $row["stock_$size"] ?? 0, // stock per size
                    ]);
                }
            }
        }

        return back()->with('success', 'Products imported with sizes and stock!');
    }
}
