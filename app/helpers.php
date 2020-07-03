<?php

use Gloudemans\Shoppingcart\Facades\ApiCart;

function getNumbers()
{
    $taxPercentage = config('cart.tax') / 100;
    $discount = session('coupon')['discount'] ?? 0;
    $code = session('coupon')['name'] ?? null;
    $newSubtotal = ApiCart::subtotal() - $discount;
    // To deal with "-" if discount is more than the product price.
    if ($newSubtotal < 0) {
        $newSubtotal = 0;
    }

    $newTax = $newSubtotal * $taxPercentage;
    $newTotal = $newSubtotal + $newTax;

    return collect([
        'taxPercentage' =>$taxPercentage,
        'discount' => $discount,
        'code' => $code,
        'newSubtotal' => $newSubtotal,
        'newTax' => $newTax,
        'newTotal' => $newTotal
    ]);
}