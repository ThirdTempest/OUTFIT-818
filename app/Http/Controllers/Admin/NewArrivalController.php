<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\NewArrival;
use Illuminate\Support\Facades\Storage;


class NewArrivalController extends Controller
{
    public function index()
    {
        $arrivals = \App\Models\NewArrival::latest()->get();
        return view('admin.new-arrivals', compact('arrivals'));
    }

    // Store a new arrival
    public function store(Request $request)
    {
        $request->validate([
            'name'        => 'required|string|max:255',
            'description' => 'required|string',
            'price'       => 'required|numeric|min:0',
            'image'       => 'required|image|mimes:jpeg,png,jpg,webp|max:2048',
            'status'      => 'required|in:active,inactive',
        ]);

        // Handle image upload
        $imagePath = $request->file('image')->store('new_arrivals', 'public');

        // Create new arrival entry
        NewArrival::create([
            'name'        => $request->name,
            'description' => $request->description,
            'price'       => $request->price,
            'image'       => $imagePath,
            'status'      => $request->status,
        ]);

        return redirect()->route('admin.new-arrivals.index')->with('success', 'New arrival added successfully.');
    }

    public function destroy($id)
    {
        $arrival = \App\Models\NewArrival::findOrFail($id);

        // if ($arrival->image && \Storage::disk('public')->exists($arrival->image)) {
        //     \Storage::disk('public')->delete($arrival->image);
        // }

        $arrival->delete();

        return redirect()->route('admin.new-arrivals.index')->with('success', 'New arrival deleted.');
    }

    public function update(Request $request, $id)
    {
        $arrival = \App\Models\NewArrival::findOrFail($id);

        $validated = $request->validate([
            'name'        => 'required|string|max:255',
            'description' => 'required|string',
            'price'       => 'required|numeric|min:0',
            'image'       => 'nullable|image|mimes:jpeg,png,jpg,webp|max:2048',
            'status'      => 'required|in:active,inactive',
        ]);

        // Update image if new one uploaded
        if ($request->hasFile('image')) {
            // Optional: Delete old image if exists
            // if ($arrival->image && \Storage::disk('public')->exists($arrival->image)) {
            //     \Storage::disk('public')->delete($arrival->image);
            // }

            $arrival->image = $request->file('image')->store('new_arrivals', 'public');
        }

        // Update all fields
        $arrival->name        = $request->name;
        $arrival->description = $request->description;
        $arrival->price       = $request->price;
        $arrival->status      = $request->status;

        $arrival->save();

        return redirect()->route('admin.new-arrivals.index')->with('success', 'New arrival updated successfully.');
    }
}
