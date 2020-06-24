<?php

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\DB;
use App\Coupon;
use App\Jobs\UpdateCoupon;
use Gloudemans\Shoppingcart\Facades\Cart;

class CartUpdatedListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  object  $event
     * @return void
     */
    public function handle($event)
    {
        
        // Update the coupon to work on the new Cart Item.
        $couponName = session('coupon')['name'];

        if ($couponName) {
            
            $coupon = Coupon::findByCode($couponName);

            dispatch_now(new UpdateCoupon($coupon));

        }
        
        // Store Cart in DB after Changes.
        $identifier = auth()->id();
        $instance = Cart::currentInstance();

        Cart::instance($instance)->deleteOldToStoreNew($identifier);

        Cart::instance($instance)->store($identifier);        

    }
}
