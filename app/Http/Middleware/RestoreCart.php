<?php

namespace App\Http\Middleware;

use Closure;
use Gloudemans\Shoppingcart\Facades\Cart;

class RestoreCart
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

        if (auth()->check() && ! session()->has('cart')) {
            
            // if (\DB::table('shoppingcart')->where('identifier', auth()->id())->exists()) {
                
                Cart::restore(auth()->id());
                Cart::instance('saveForLater')->restore(auth()->id());
            // }
        }

        return $next($request);
    }
}
