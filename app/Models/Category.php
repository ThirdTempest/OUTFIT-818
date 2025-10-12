<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    // Allow mass assignment for these fields
    protected $fillable = [
        'name',
        'slug',
        'image',
        'status',
    ];
}
