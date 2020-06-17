<?php

namespace App\Listeners;

use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use App\Coupon;
use App\Jobs\UpdateCoupon;

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
        $couponName = session('coupon')['name'];

        if ($couponName) {
            
            $coupon = Coupon::findByCode($couponName);

            dispatch_now(new UpdateCoupon($coupon));

        }

    }
}
