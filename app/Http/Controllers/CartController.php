<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\Validator;

class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('cart', [
            'discount' => getNumbers()->get('discount'),
            'newSubtotal' => getNumbers()->get('newSubtotal'),
            'newTax' => getNumbers()->get('newTax'),
            'newTotal' => getNumbers()->get('newTotal')
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
    public function store(Request $request)
    {
        $dublicates = Cart::search(function ($cartItem, $rowId) use ($request){
            return $cartItem->id === $request->id;
        });

        if ($dublicates->isNotEmpty()) {
            return redirect()->route('cart.index')->with('success', 'Item already exists in your cart!');
        }

        Cart::instance('default')->add($request->id, $request->name, 1, $request->price)
            ->associate('App\Product');

        // Cart::store(auth()->id());    

        return redirect()->route('cart.index')->with('success', 'Item was added to your cart!');    
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
        $validator = Validator::make($request->all(), [
            'qty' => 'required | numeric | between:1,5',
        ]);

        if ($validator->fails()) {
            session()->flash('errors', collect(['Quantity must be between 1 and 5.']));
            return response()->json(['success' => false], 400);
        }

        Cart::update($id, $request->qty);

        session()->flash('success', 'Quantity was updated successfully!');
        return response()->json(['success' => true]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        Cart::remove($id);

        return back()->with('success', 'Item has been removed!');
    }

    /**
     * Switch product from shopping cart to save for later list.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function saveForLater($id)
    {
        $item = Cart::get($id);

        Cart::remove($id);

        $dublicates = Cart::instance('saveForLater')->search( function ($cartItem, $rowId) use ($id){
            return $rowId === $id;
        });

        if ($dublicates->isNotEmpty()) {
            return redirect()->route('cart.index')->with('success', 'Item already exists in your save for later list!');
        }

        Cart::instance('saveForLater')->add($item->id, $item->name, 1, $item->price)
            ->associate('App\Product');

        // Cart::instance('saveForLater')->store(auth()->id());    

        return redirect()->route('cart.index')->with('success', 'Item has been saved for later!');
    }
}
