<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Carousel;

class CarouselController extends Controller
{
    public function index()
    {
        $carousels = Carousel::latest()->get();
        return view('admin.carousels', compact('carousels'));
    }

    public function create()
    {
        return view('admin.carousel-create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'description' => 'required|string',
            'image' => $request->isMethod('post')
                ? 'required|image|mimes:jpg,jpeg,png|max:2048'
                : 'sometimes|image|mimes:jpg,jpeg,png|max:2048', // for update
            'button_text' => 'required|string|max:255',
            'button_link' => 'required|url|max:2048',
        ]);


        // Store image
        $path = $request->file('image')->store('carousels', 'public');

        Carousel::create([
            'title' => $request->title,
            'description' => $request->description,
            'image_path' => $path,
            'button_text' => $request->button_text,
            'button_link' => $request->button_link,
            'is_active' => true,
        ]);

        return redirect()->route('admin.carousels.index')->with('success', 'Carousel added successfully.');
    }

    public function edit(Carousel $carousel)
    {
        return view('admin.carousel-edit', compact('carousel'));
    }

    public function update(Request $request, Carousel $carousel)
    {
        $request->validate([
            'title' => 'required|string|max:255',
            'tagline' => 'required|string|max:255',
            'description' => 'required|string',
            'button_text' => 'required|string|max:255',
            'button_link' => 'required|url|max:2048',
            'original_price' => 'required|numeric|min:0',
            'discounted_price' => 'required|numeric|min:0|lte:original_price',
            'image' => 'required|image|mimes:jpg,jpeg,png,webp|max:2048',
        ]);

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('carousels', 'public');
            $carousel->image_path = $path;
        }

        $carousel->update([
            'title' => $request->title,
            'description' => $request->description,
            'button_text' => $request->button_text,
            'button_link' => $request->button_link,
            'is_active' => $request->has('is_active'),
        ]);

        return redirect()->route('admin.carousels.index')->with('success', 'Carousel updated successfully.');
    }

    public function destroy(Carousel $carousel)
    {
        $carousel->delete();
        return redirect()->route('admin.carousels.index')->with('success', 'Carousel deleted successfully.');
    }
}
