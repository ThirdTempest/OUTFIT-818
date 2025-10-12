<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;

class CategoryPageController extends Controller
{
    public function show(Request $request, $slug)
    {
        $category = Category::where('slug', $slug)->where('status', 'active')->firstOrFail();
        $categories = Category::where('status', 'active')->get();

        $query = Product::with(['sizes'])->where('category_id', $category->id);

        if ($request->filled('search')) {
            $query->where('name', 'like', '%' . $request->search . '%');
        }

        if ($request->filled('status')) {
            $query->where('status', $request->status);
        }

        $products = $query->get(); // Get products before manual sorting

        // Sort manually based on min size price
        if ($request->filled('sort')) {
            if ($request->sort === 'low') {
                $products = $products->sortBy(fn($product) => $product->sizes->min('price') ?? PHP_INT_MAX);
            } elseif ($request->sort === 'high') {
                $products = $products->sortByDesc(fn($product) => $product->sizes->min('price') ?? 0);
            } else {
                $products = $products->sortByDesc('created_at');
            }
        } else {
            $products = $products->sortByDesc('created_at');
        }

        // Manual pagination
        $perPage = 12;
        $page = $request->get('page', 1);
        $paginated = new \Illuminate\Pagination\LengthAwarePaginator(
            $products->forPage($page, $perPage)->values(),
            $products->count(),
            $perPage,
            $page,
            ['path' => request()->url(), 'query' => request()->query()]
        );

        return view('frontend.category-page', [
            'category' => $category,
            'categories' => $categories,
            'products' => $paginated
        ]);
    }
}
