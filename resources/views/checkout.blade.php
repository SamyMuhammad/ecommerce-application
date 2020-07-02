@extends('layouts.theme')

@section('title', 'Checkout')

@section('extra-css')
    <script src="https://js.stripe.com/v3/"></script>
    <link rel="stylesheet" type="text/css" href="{{asset('css/custom.css')}}">
@endsection

@section('content')
    <!-- Start Banner Area -->
    <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Checkout</h1>
                    <nav class="d-flex align-items-center">
                        <a href="{{route('landing-page')}}">Home<span class="lnr lnr-arrow-right"></span></a>
                        <a href="#">Checkout</a>
                    </nav>
                </div>
            </div>
        </div>
    </section>
    <!-- End Banner Area -->
    <div>
        @if (session()->has('success'))
            <div class="alert alert-success mt-1 text-center">{{ session('success') }}</div>
        @endif

        @if (count($errors) > 0)
            <div class="alert alert-danger mt-1 text-center">
                <ul>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error}}</li>
                    @endforeach    
                </ul>
            </div>
        @endif
    </div>

    <!--================Checkout Area =================-->
    <section class="checkout_area section_gap">
        <div class="container">  
            <div class="billing_details">
                <div class="row">
                    <div class="col-lg-8">
                        <!-- PAYMENT FORM -->
                        <form class="row contact_form" id="payment-form" action="{{ route('checkout.store') }}" method="POST">
                            @csrf
                            <h3>Payment</h3>
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Name" value="{{ old('name') }}" required>
                            </div>
                            <div class="col-md-6 form-group p_star">
                                <input type="text" class="form-control" id="number" name="phone" placeholder="Phone number" value="{{ old('phone') }}" required>
                            </div>
                            <div class="col-md-6 form-group p_star">
                                <input type="email" class="form-control" id="email" name="email" placeholder="Email Address" value="{{ auth()->user()->email }}" readonly>
                            </div>
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" id="address" name="address" placeholder="Address" value="{{ old('address') }}" required>
                            </div>
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" id="city" name="city" placeholder="Town/City" value="{{ old('city') }}" required>
                            </div>
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" id="province" name="province" placeholder="Province" value="{{ old('province') }}" required>
                            </div>
                            <div class="col-md-12 form-group p_star">
                                <input type="text" class="form-control" id="name_on_card" name="name_on_card" placeholder="Name on card" value="{{ old('name_on_card') }}" required>
                            </div>
                            <div class="col-md-12 form-group p_star">
                                <div id="card-element" style="border: 1px solid #ced4da;">
                                  <!-- A Stripe Element will be inserted here. -->
                                </div>
                                <div id="card-errors" role="alert"></div>
                            </div>
                            <button id="complete-order" style="margin-bottom: 20px;" class="primary-btn" type="submit">Submit</button>
                        </form>
                    </div>
                    
                    <!-- Your Order -->
                    <div class="col-lg-4">
                        <div class="order_box">
                            <h2>Your Order</h2>
                            <ul class="list">
                                <li><span class="prices-head" style="font-weight: 500">Product <span class="price-span" style="font-weight: 500">Total</span></span></li>
                                @forelse (Cart::content() as $item)
                                    <li>
                                        <span class="prices-head"> {{ $item->model->name }} 
                                            <span class="middle" style="margin-left: 5px;">x {{ $item->qty }}</span> 
                                            <span class="last price-span">${{ $item->model->price }}</span>
                                        </a>
                                    </li>
                                @empty
                                @endforelse    
                            </ul>
                            <ul class="list list_2">
                                <li><span class="prices-head">Subtotal <span class="price-span">${{ Cart::subtotal() }}</span></span></li>
                                @if (session()->has('coupon'))
                                    <li>
                                        <span class="prices-head">Discount ({{ session('coupon')['name'] }})
                                            <form action="{{ route('coupon.destroy') }}" method="POST"
                                            style="display: inline;">
                                                @csrf
                                                @method('delete')
                                                <button type="submit" class="btn-to-link">Remove</button>
                                            </form>
                                            <span class="price-span">- ${{ $discount }}</span>
                                        </span>
                                    </li>
                                <hr>    
                                <li><span class="prices-head">New Subtotal<span class="price-span">${{ $newSubtotal }}</span></span></li>
                                @endif
                                <li><span class="prices-head">Tax (14%)<span class="price-span">${{ $newTax }}</span></span></li>
                                <li><span class="prices-head" style="font-weight: 500">Total <span class="price-span">${{ $newTotal }}</span></span></li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Checkout Area =================-->

    @section('extra-js')
        <script type="text/javascript" src="{{asset('js/stripe-checkout.js')}}"></script>
    @endsection

@endsection