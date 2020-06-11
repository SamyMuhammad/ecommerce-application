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
            'discount' => $this->getNumbers()->get('discount'),
            'newSubtotal' => $this->getNumbers()->get('newSubtotal'),
            'newTax' => $this->getNumbers()->get('newTax'),
            'newTotal' => $this->getNumbers()->get('newTotal')
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
                'amount' => $this->getNumbers()->get('newTotal'),
                'currency' => 'USD',
                'source' => $request->stripeToken,
                'description' =>'Order',
                // 'receipt_email' => '',
                'metadata' => [
                    // Change to Order Id when we start using DB
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
                            'subtotal' => $this->getNumbers()->get('newSubtotal'),
                            'tax' => $this->getNumbers()->get('newTax'),
                            'total' => $this->getNumbers()->get('newTotal')
                        ]);
        } catch (CardErrorException $e) {

            $errorMessage = $e->getMessage();

            $this->addToOrdersTables($request, $errorMessage);

            return back()->withErrors('Error! ' . $errorMessage);        
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
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
                    'billing_discount' => $this->getNumbers()->get('discount'),
                    'billing_discount_code' => $this->getNumbers()->get('code'),
                    'billing_subtotal' => $this->getNumbers()->get('newSubtotal'),
                    'billing_tax' => $this->getNumbers()->get('newTax'),
                    'billing_total' => $this->getNumbers()->get('newTotal'),
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

    private function getNumbers()
    {
        $taxPercentage = config('cart.tax') / 100;
        $discount = session('coupon')['discount'] ?? 0;
        $code = session('coupon')['name'] ?? null;
        $newSubtotal = Cart::subtotal() - $discount;
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
}
