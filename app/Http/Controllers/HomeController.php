<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Carousel;
use App\Models\NewArrival;
use App\Models\Category;

class HomeController extends Controller
{
    public function index()
    {
        $carousels = Carousel::where('is_active', true)->latest()->get();
        $arrivals = NewArrival::where('status', 'active')->latest()->take(6)->get();
        $categories = Category::where('status', 'active')->latest()->take(6)->get();

        return view('frontend.index', compact('carousels', 'arrivals', 'categories'));
    }
}
