<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Coupon;
use App\Jobs\UpdateCoupon;

class CouponsController extends Controller
{    
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $coupon = Coupon::findByCode($request->coupon_code);

        if (! $coupon) {

            return redirect()->route('checkout.index')->withErrors('Invalid coupon code. please try again.');
        }

        dispatch_now(new UpdateCoupon($coupon));
        
        return redirect()->route('cart.index')->with('success', 'Coupon has been aplied!');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @return \Illuminate\Http\Response
     */
    public function destroy()
    {
        session()->forget('coupon');

        return redirect()->route('cart.index')->with('success', 'Coupon has been removed!');
    }
}
