<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Gloudemans\Shoppingcart\Facades\ApiCart;
use App\Product;

class SaveForLaterController extends Controller
{
    use ApiResponseTrait;

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $dublicates = ApiCart::instance('saveForLater')->search(function ($cartItem, $rowId) use ($request){
            return $cartItem->id == $request->id;
        });

        if ($dublicates->isNotEmpty()) {
            return $this->errorResponse('Item is already saved!');
        }

        if (! $this->checkProductData($request)) {
            return $this->errorResponse('Product data is not correct.');
        }

        ApiCart::instance('saveForLater')->add($request->id, $request->name, 1, $request->price)
            ->associate('App\Product');

        return $this->successResponse('Item was saved successfully!');
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
            return $this->errorResponse('Item is not saved.');
        }

        ApiCart::instance('saveForLater')->remove($rowId);

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
        $dublicates = ApiCart::instance('saveForLater')->search(function ($cartItem, $rowId) use ($id){
            return $rowId == $id;
        });

        if ($dublicates->isNotEmpty()) {
            return true;
        }

        return false;
    }
}
