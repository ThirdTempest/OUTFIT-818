<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class CartItem extends Model
{
    protected $fillable = [
        'user_id',
        'product_id',
        'size',
        'quantity'
    ];

    public function product()
    {
        return $this->belongsTo(\App\Models\Product::class);
    }
}
