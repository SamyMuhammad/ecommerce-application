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

        if (auth()->check()) { 

            $identifier = auth()->id();
            Cart::instance('default')->restore($identifier);
            Cart::instance('saveForLater')->restore($identifier);
        }

        return $next($request);
    }
}
