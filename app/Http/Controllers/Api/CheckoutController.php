<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\ApiCart;

class CheckoutController extends Controller
{
    use ApiResponseTrait;

    /**
     * Get the checkout data [subtotal, tax, total]
     *
     * @return Collection
     */
    public function index()
    {
    	if (ApiCart::instance('default')->count() < 1) {
    		
    		return $this->errorResponse('There is no items in the Cart.');
    	}

    	$taxPercentage = config('cart.tax') / 100;
	    // $discount 

	    $subtotal = ApiCart::subtotal();
	    
	    $tax = ApiCart::tax();

	    $total = ApiCart::total();

	    $data = collect([
	        'taxPercentage' =>$taxPercentage,
	        'subtotal' => $subtotal,
	        'tax' => $tax,
	        'total' => $total
	    ]);

	    return $this->dataResponse($data);
    }
}
