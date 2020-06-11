@extends('layouts.theme')

@section('title', 'Checkout')

@section('extra-css')
    <script src="https://js.stripe.com/v3/"></script>
    <style type="text/css">
        .StripeElement {
          box-sizing: border-box;

          height: 40px;

          padding: 10px 12px;

          border: 1px solid transparent;
          border-radius: 4px;
          background-color: white;

          box-shadow: 0 1px 3px 0 #e6ebf1;
          -webkit-transition: box-shadow 150ms ease;
          transition: box-shadow 150ms ease;
        }

        .StripeElement--focus {
          box-shadow: 0 1px 3px 0 #cfd7df;
        }

        .StripeElement--invalid {
          border-color: #fa755a;
        }

        .StripeElement--webkit-autofill {
          background-color: #fefde5 !important;
        }

        #card-errors{
            color: #fa755a;
        }

        .btn-to-link{
            background-color: inherit;
            border: none;
            color: blue;
            text-decoration: underline;
            font-size: 12px;
            cursor: pointer;
        }
        .prices-head{
            text-transform: uppercase;
            color: #222222;
            font-weight: 300;
        }
        .price-span{
            float: right;
        }
    </style>
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
            {{-- Coupon Area --}}
            @if (! session()->has('coupon'))
                <div class="cupon_area">
                    <div class="check_title">
                        <h2>Have a coupon?</h2>
                    </div>
                    <form method="POST" action="{{ route('coupon.store') }}">
                        @csrf
                        <input type="text" name="coupon_code" placeholder="Enter coupon code" value="{{ old('coupon_code') }}">
                        <button type="submit" class="tp_btn">Apply Coupon</button>
                    </form>   
                </div>
            @endif    
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
                            <div class="payment_item">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option5" name="selector">
                                    <label for="f-option5">Check payments</label>
                                    <div class="check"></div>
                                </div>
                                <p>Please send a check to Store Name, Store Street, Store Town, Store State / County, Store Postcode.</p>
                            </div>
                            <div class="payment_item active">
                                <div class="radion_btn">
                                    <input type="radio" id="f-option6" name="selector">
                                    <label for="f-option6">Paypal </label>
                                    <img src="img/product/card.jpg" alt="">
                                    <div class="check"></div>
                                </div>
                                <p>Pay via PayPal; you can pay with your credit card if you don’t have a PayPal account.</p>
                            </div>
                            <div class="creat_account">
                                <input type="checkbox" id="f-option4" name="selector">
                                <label for="f-option4">I’ve read and accept the </label>
                                <a href="#">terms & conditions*</a>
                            </div>
                            <a class="primary-btn" href="#">Proceed to Paypal</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!--================End Checkout Area =================-->

    @section('extra-js')
        <script type="text/javascript">
            (function () {
                // Create a Stripe client.
                var stripe = Stripe('pk_test_8P0Dmhvyk2OrDLDGGluJGDQB003VAlxU2G');

                // Create an instance of Elements.
                var elements = stripe.elements();

                // Custom styling can be passed to options when creating an Element.
                // (Note that this demo uses a wider set of styles than the guide below.)
                var style = {
                  base: {
                    color: '#32325d',
                    fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
                    fontSmoothing: 'antialiased',
                    fontSize: '16px',
                    '::placeholder': {
                      color: '#aab7c4'
                    }
                  },
                  invalid: {
                    color: '#fa755a',
                    iconColor: '#fa755a'
                  }
                };

                // Create an instance of the card Element.
                var card = elements.create('card', {style: style});

                // Add an instance of the card Element into the `card-element` <div>.
                card.mount('#card-element');

                // Handle real-time validation errors from the card Element.
                card.on('change', function(event) {
                  var displayError = document.getElementById('card-errors');
                  if (event.error) {
                    displayError.textContent = event.error.message;
                  } else {
                    displayError.textContent = '';
                  }
                });

                // Handle form submission.
                var form = document.getElementById('payment-form');
                form.addEventListener('submit', function(event) {
                  event.preventDefault();

                  //disable the submit button to prevent repeated clicks.
                  document.getElementById('complete-order').disabled = true;

                  var options = {
                    name: document.getElementById('name_on_card').value,
                    address_line1: document.getElementById('address').value,
                    address_city: document.getElementById('city').value,
                    address_state: document.getElementById('province').value
                  }

                  stripe.createToken(card, options).then(function(result) {
                    if (result.error) {
                      // Inform the user if there was an error.
                      var errorElement = document.getElementById('card-errors');
                      errorElement.textContent = result.error.message;

                      //Enable the submit button
                      document.getElementById('complete-order').disabled = false;

                    } else {
                      // Send the token to your server.
                      stripeTokenHandler(result.token);
                    }
                  });
                });

                // Submit the form with the token ID.
                function stripeTokenHandler(token) {
                  // Insert the token ID into the form so it gets submitted to the server
                  var form = document.getElementById('payment-form');
                  var hiddenInput = document.createElement('input');
                  hiddenInput.setAttribute('type', 'hidden');
                  hiddenInput.setAttribute('name', 'stripeToken');
                  hiddenInput.setAttribute('value', token.id);
                  form.appendChild(hiddenInput);

                  // Submit the form
                  form.submit();
                }
            })();
           
        </script>
    @endsection

@endsection