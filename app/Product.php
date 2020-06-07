<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    protected $fillable = ['name', 'slug', 'details', 'price', 'description'];

    public function categories()
	{
		return $this->belongsToMany(Category::class)->withTimestamps();
	}
}
