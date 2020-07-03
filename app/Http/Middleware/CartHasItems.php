<?php

namespace App\Http\Middleware;

use Closure;
use Gloudemans\Shoppingcart\Facades\Cart;

class CartHasItems
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        
        if (Cart::instance('default')->count() < 1 ) {
            
           return redirect()->route('shop.index')->withErrors('Please add one item or more to the cart before checkout.');
        }

        return $next($request);
    }
}
