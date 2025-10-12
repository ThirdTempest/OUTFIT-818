<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class FeaturedProduct extends Model
{
    protected $fillable = [
        'title',
        'tagline',
        'description',
        'original_price',
        'discounted_price',
        'image_path',
        'is_active',
        'button_text',
        'button_link',
    ];
    
}
