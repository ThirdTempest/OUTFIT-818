<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Category;
use Illuminate\Support\Str;

class CategoryController extends Controller
{

    public function index()
    {
        $categories = Category::latest()->get(); // Or use pagination if preferred
        return view('admin.categories', compact('categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name'   => 'required|string|max:255',
            'image'  => 'required|image|max:2048',
            'status' => 'required|in:active,inactive',
        ]);

        $slug = Str::slug($request->name); // Converts "Men Shoes" → "men-shoes"

        $path = $request->file('image')->store('categories', 'public');

        Category::create([
            'name'   => $request->name,
            'slug'   => $slug,
            'image'  => $path,
            'status' => $request->status,
        ]);

        return redirect()->route('admin.categories.index')->with('success', 'Category created.');
    }

    public function update(Request $request, $id)
    {
        $category = Category::findOrFail($id);

        $validated = $request->validate([
            'name' => 'required|string|max:255',
            'image' => 'nullable|image|max:2048',
            'status' => 'required|in:active,inactive',
        ]);

        if ($request->hasFile('image')) {
            $category->image = $request->file('image')->store('categories', 'public');
        }

        $category->name = $request->name;
        $category->slug = Str::slug($request->name); // 💥 Add this line
        $category->status = $request->status;
        $category->save();

        return redirect()->route('admin.categories.index')->with('success', 'Category updated.');
    }

    public function destroy($id)
    {
        $category = \App\Models\Category::findOrFail($id);

        // Optionally delete image file if needed:
        // if ($category->image && \Storage::disk('public')->exists($category->image)) {
        //     \Storage::disk('public')->delete($category->image);
        // }

        $category->delete();

        return redirect()->route('admin.categories.index')->with('success', 'Category deleted successfully.');
    }
}
