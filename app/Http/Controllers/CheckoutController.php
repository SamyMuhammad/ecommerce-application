<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Requests\CheckoutRequest;
use Gloudemans\Shoppingcart\Facades\Cart;
use Cartalyst\Stripe\Laravel\Facades\Stripe;
use Cartalyst\Stripe\Exception\CardErrorException;
use App\Order;
use App\OrderProduct;
use Illuminate\Support\Facades\Mail;
use App\Mail\OrderPlaced;

class CheckoutController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('checkout')->with([
            'discount' => getNumbers()->get('discount'),
            'newSubtotal' => getNumbers()->get('newSubtotal'),
            'newTax' => getNumbers()->get('newTax'),
            'newTotal' => getNumbers()->get('newTotal')
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CheckoutRequest $request)
    {   
        
        $contents = Cart::content()->map( function ($item){
            return $item->model->slug . ', ' . $item->qty;
        })->values()->toJson();

        try {
            $sharge = Stripe::charges()->create([
                'amount' => getNumbers()->get('newTotal'),
                'currency' => 'USD',
                'source' => $request->stripeToken,
                'description' =>'Order',
                // 'receipt_email' => '',
                'metadata' => [
                    
                    'contents' => $contents,
                    'quantity' => Cart::instance('default')->count(),
                    'discount' => collect(session('coupon'))->toJson()
                ],
            ]);

            $order = $this->addToOrdersTables($request, null);
            Mail::send(new OrderPlaced($order));

            //Successful
            return redirect()->route('confirmation.index')
                        ->with('success', 'Thank you! Your payment has been successfully accepted!')
                        ->with([
                            'subtotal' => getNumbers()->get('newSubtotal'),
                            'tax' => getNumbers()->get('newTax'),
                            'total' => getNumbers()->get('newTotal')
                        ]);
        } catch (CardErrorException $e) {

            $errorMessage = $e->getMessage();

            $this->addToOrdersTables($request, $errorMessage);

            return back()->withErrors('Error! ' . $errorMessage);        
        }
    }

    protected function addToOrdersTables($request, $error)
    {
        // Insert into orders table
        $order = Order::create([
                    'user_id' => auth()->id(),
                    'billing_email' => $request->email,
                    'billing_name' => $request->name,
                    'billing_address' => $request->address,
                    'billing_city' => $request->city,
                    'billing_province' => $request->province,
                    'billing_phone' => $request->phone,
                    'billing_name_on_card' => $request->name_on_card,
                    'billing_discount' => getNumbers()->get('discount'),
                    'billing_discount_code' => getNumbers()->get('code'),
                    'billing_subtotal' => getNumbers()->get('newSubtotal'),
                    'billing_tax' => getNumbers()->get('newTax'),
                    'billing_total' => getNumbers()->get('newTotal'),
                    'error' => $error
                ]);

        // Insert into order_product table
        foreach (Cart::content() as $item) {
            OrderProduct::create([
                'order_id' => $order->id,
                'product_id' => $item->model->id,
                'quantity' => $item->qty
            ]);
        }

        return $order;
    }
}
