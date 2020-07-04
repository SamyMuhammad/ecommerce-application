<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Gloudemans\Shoppingcart\Facades\ApiCart;
use App\Product;

class CartController extends Controller
{
    use ApiResponseTrait;

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $identifier = auth('api')->id();
        $default = ApiCart::instance('default')->restore($identifier);
        $saveForLater = ApiCart::instance('saveForLater')->restore($identifier);

        $cartItems = collect([
            "default" => $default,
            "saveForLater" => $saveForLater
        ]);

        return $this->dataResponse($cartItems);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $dublicates = ApiCart::instance('default')->search(function ($cartItem, $rowId) use ($request){
            return $cartItem->id == $request->id;
        });

        if ($dublicates->isNotEmpty()) {
            return $this->errorResponse('Item already exists in your cart!');
        }

        if (! $this->checkProductData($request)) {
            return $this->errorResponse('Product data is not correct.');
        }

        $quantity = $request->has('quantity') ? $request->quantity : 1;

        ApiCart::instance('default')->add($request->id, $request->name, $request->quantity, $request->price)
            ->associate('App\Product');

        return $this->successResponse('Item was added to your cart!');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $rowId)
    {
        if (! $this->itemExistsInCart($rowId)) {
            return $this->errorResponse('Item does not exist in your cart.');
        }

        $validator = Validator::make($request->all(), [
            'quantity' => 'required | between:1,5',
        ]);

        if ($validator->fails()) {
            return $this->errorResponse('Quantity must be between 1 and 5.');
        }

        ApiCart::instance('default')->update($rowId, $request->quantity);

        return $this->successResponse('Quantity was updated successfully!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($rowId)
    {
        if (! $this->itemExistsInCart($rowId)) {
            return $this->errorResponse('Item does not exist in your cart.');
        }

        ApiCart::instance('default')->remove($rowId);

        return $this->successResponse('Item has been removed!');
    }

    /**
     * Check the product data.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return boolean
     */
    protected function checkProductData(Request $request)
    {
        $product = Product::find($request->id);

        if (! $product) {
            return false;
        }
        elseif ($product->name === $request->name && $product->price == $request->price) {
            
            return true;
        }
        else{
            return false;
        }
    }

    /**
     * Check if item exists in the Cart
     *
     * @param int $id
     * @return boolean
     */
    protected function itemExistsInCart($id)
    {
        $dublicates = ApiCart::instance('default')->search(function ($cartItem, $rowId) use ($id){
            return $rowId == $id;
        });

        if ($dublicates->isNotEmpty()) {
            return true;
        }

        return false;
    }
}
