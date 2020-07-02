<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Category;
use App\Product;

class ShopController extends Controller
{
    use ApiResponseTrait;

    /**
     * Display a listing of the Categories.
     *
     * @return \Illuminate\Http\Response
     */
    public function categories()
    {
        $categories = Category::get();

        return $this->dataResponse($categories);
    }

    /**
     * Display a listing of the Products.
     *
     * @return \Illuminate\Http\Response
     */
    public function products()
    {
        $paginationNumber = request()->query('paginate');
        
        $products = Product::paginate($paginationNumber);

        return $this->dataResponse($products);
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function product($slug)
    {
        $product = Product::where('slug', $slug)->first();

        if (! $product) {
            return $this->errorResponse('Product not found.', 404);
        }

        return $this->dataResponse($product);
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

    /**
     * Search for a product.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function search(Request $request)
    {
        $validator = Validator::make($request->all(), [ 'query' => 'required|min:3' ]);

        if ($validator->fails()) {
            
            return $this->errorResponse($validator->errors(), 400);
        }

        $query = $request->query('query');

        // Using Searchable Packege
        $products = Product::search($query)->paginate(10);
        
        return $this->dataResponse($products);
    }
}
