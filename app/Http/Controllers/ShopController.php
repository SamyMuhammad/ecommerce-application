<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Category;

class ShopController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $categories = Category::all();
        $paginatorNum = 6;
        // Showing specific Category.
        if (request()->has('category'))
        {
            $products = Product::with('categories')->whereHas('categories', function ($query){
                $query->where('slug', request('category'));
            });
        }else
        {
            $products = Product::take(count(Product::all()));
        }

        // Applying the price filter.
        if (request()->sort === 'low_to_high') {

            $products = $products->orderBy('price')->paginate($paginatorNum);

        }elseif (request()->sort === 'high_to_low') {

            $products = $products->orderBy('price', 'desc')->paginate($paginatorNum);
        }else{
            $products = $products->paginate($paginatorNum);   
        }

        return view('category', [
            'products' => $products,
            'categories' => $categories,
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $slug
     * @return \Illuminate\Http\Response
     */
    public function show($slug)
    {
        $product = Product::where('slug', $slug)->firstOrFail();
        
        $mightLike = Product::where('slug','!=', $slug)->inRandomOrder()->take(6)->get();

        return view('single-product', [
            'product' => $product,
            'mightLike' => $mightLike
        ]);
    }

    public function search(Request $request)
    {
        $request->validate([ 'query' => 'required|min:2' ]);

        $query = $request->query('query');

        // Manual Search
/*        $products = Product::where('name', 'like', "%$query%")
                            ->orWhere('details', 'like', "%$query%")
                            ->orWhere('description', 'like', "%$query%")
                            ->paginate(8);

*/


        // Using Searchable Packege
        $products = Product::search($query)->paginate(8);
        
        return view('search-results', compact("products"));
    }
}
