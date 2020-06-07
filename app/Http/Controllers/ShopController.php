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
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
