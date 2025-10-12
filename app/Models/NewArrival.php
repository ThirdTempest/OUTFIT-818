<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class NewArrival extends Model
{
    protected $fillable = ['name', 'description', 'price', 'image', 'status'];

}
