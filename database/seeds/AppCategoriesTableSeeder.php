<?php

use Illuminate\Database\Seeder;
use App\Category;

class AppCategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Category::insert([
            ['name' => 'Laptops', 'slug' => 'laptops'],
        	['name' => 'TVs', 'slug' => 'TVs'],
        	['name' => 'Watches', 'slug' => 'watches'],
        	['name' => 'Shoes', 'slug' => 'shoes'],
        	['name' => 'All Electronics', 'slug' => 'all-electronics'],
        ]);
    }
}
