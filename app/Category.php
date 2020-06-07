<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
	protected $table = 'app_categories';

	public function products()
	{
		return $this->belongsToMany(Product::class)->withTimestamps();
	}    
}
