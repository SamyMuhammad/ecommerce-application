<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ConfirmationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (! session()->has('success'))
        {
            return redirect('/');
        }

        return view('confirmation')->with([
            'subtotal' => getNumbers()->get('newSubtotal'),
            'tax' => getNumbers()->get('newTax'),
            'total' => getNumbers()->get('newTotal')
        ]);
    }
}
