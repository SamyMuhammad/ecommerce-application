@extends('layouts.theme')

@section('title', 'Cart')

@section('extra-css')
    <link rel="stylesheet" type="text/css" href="{{asset('css/custom.css')}}">
@endsection

@section('content')

    <!-- Start Banner Area -->
    <section class="banner-area organic-breadcrumb">
        <div class="container">
            <div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
                <div class="col-first">
                    <h1>Shopping Cart</h1>
                    <nav class="d-flex align-items-center">
                        <a href="{{ route('landing-page') }}">Home<span class="lnr lnr-arrow-right"></span></a>
                        <a href="#">Cart</a>
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
    <!--================Cart Area =================-->
    @if (Cart::instance('default')->count() > 0)
        <section class="cart_area">
            <div class="container">
                <h4 class="text-center">{{ Cart::count() }} item(s) in Shopping Cart</h4>
                <div class="cart_inner">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col">Price</th>
                                    <th scope="col">Quantity</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                {{-- @php dd(Cart::instance('default')->content()) @endphp --}}
                                @foreach (Cart::instance('default')->content() as $item)
                                    <tr>
                                        <td>
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="cart-image" src="{{asset('storage/' . $item->model->image)}}" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <p>{{ $item->model->name }}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <h5>${{ $item->model->price }}</h5>
                                        </td>
                                        <td>
                                            <div class="product_count">
                                                {{-- <input type="number" name="qty" class="qty" value="1" min="1" data-id="{{ $item->rowId }}"> --}}
                                                <select name="qty" class="qty ignore" data-id="{{ $item->rowId }}">
                                                    @for ($i = 1; $i < 6; $i++)
                                                        <option value="{{ $i }}" 
                                                            {{ $item->qty == $i ? "selected" : '' }}>
                                                            {{ $i }}
                                                        </option>
                                                    @endfor
                                                </select>
                                            </div>
                                        </td>
                                        <td style="width: 10%">
                                            <h5 class="mb-3">
                                                <form action="{{ route('cart.destroy', $item->rowId) }}" method="POST">
                                                    @csrf
                                                    @method('delete')
                                                    <button class="genric-btn danger-border circle small" style="padding: 0 7px;" type="submit">Remove</button>
                                                </form>
                                            </h5>
                                            <h5>
                                                <form  method="POST" 
                                                action="{{ route('cart.saveForLater', $item->rowId) }}">
                                                    @csrf
                                                    <button class="genric-btn info-border circle small" style="padding: 0 7px;" type="submit">Save for Later</button>
                                                </form>
                                            </h5>
                                        </td>
                                    </tr>
                                @endforeach

                                <tr>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                    <td>
                                        <h5>Subtotal</h5>
                                    </td>
                                    <td>
                                        <h5>${{ Cart::subtotal() }}</h5>
                                    </td>
                                    @if (session()->has('coupon'))
                                        <tr>
                                            <td>
                                                <h5>Coupon ({{ session('coupon')['name'] }})</h5>

                                                <form action="{{ route('coupon.destroy') }}" method="POST"
                                                style="display: inline;">
                                                    @csrf
                                                    @method('delete')
                                                    <button type="submit" class="btn-to-link">Remove</button>
                                                </form>
                                            </td>
                                            <td>
                                            </td>
                                            <td>
                                                <h5>Discount</h5>
                                            </td>
                                            <td>
                                                <h5>- ${{ $discount }}</h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                            </td>
                                            <td>    
                                            </td>
                                            <td>
                                                <h5>New Subtotal</h5>
                                            </td>
                                            <td>
                                                <h5>${{ $newSubtotal }}</h5>
                                            </td>
                                        </tr>
                                        
                                    @endif
                                </tr>

                                <tr>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                    <td>
                                        <h5>Tax(14%)</h5>
                                    </td>
                                    <td>
                                        <h5>${{ $newTax }}</h5>
                                    </td>
                                </tr>
                                
                                <tr>
                                    <td>

                                    </td>
                                    <td>

                                    </td>
                                    <td>
                                        <h5>Total</h5>
                                    </td>
                                    <td>
                                        <h5>${{ $newTotal }}</h5>
                                    </td>
                                </tr>

                                </tr>
                                <tr class="out_button_area">
                                    <td>
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
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                    </td>
                                    <td>
                                        <div class="checkout_btn_inner d-flex align-items-center">
                                            <a class="gray_btn" href="{{ route('shop.index') }}">Continue Shopping</a>
                                            <a class="primary-btn" href="{{ route('checkout.index') }}">Proceed to checkout</a>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    @else
        <h2 class="text-center" style="margin-top: 50px; margin-bottom: 50px;">No Items in Cart</h2>
    @endif
    <!--================End Cart Area =================-->

    <!-- Saved For Later -->
    @if (Cart::instance('saveForLater')->count() > 0)
        <section class="cart_area">
            <div class="container">
                <h4 class="text-center">{{ Cart::instance('saveForLater')->count() }} item(s) is Saved for Later</h4>
                <div class="cart_inner">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th scope="col">Product</th>
                                    <th scope="col">Price</th>
                                    <th scope="col"></th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach (Cart::instance('saveForLater')->content() as $item)
                                    <tr>
                                        <td>
                                            <div class="media">
                                                <div class="d-flex">
                                                    <img class="cart-image" src="{{asset('storage/' . $item->model->image)}}" alt="">
                                                </div>
                                                <div class="media-body">
                                                    <p>{{ $item->model->name }}</p>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <h5>${{ $item->model->price }}</h5>
                                        </td>
                                        <td style="width: 10%">
                                            <h5 class="mb-3">
                                                <form action="{{ route('saveForLater.destroy', $item->rowId) }}" method="POST">
                                                    @csrf
                                                    @method('delete')
                                                    <button class="genric-btn danger-border circle small" style="padding: 0 7px;" type="submit">Remove</button>
                                                </form>
                                            </h5>
                                            <h5>
                                                <form  method="POST" 
                                                action="{{ route('saveForLater.addToCart', $item->rowId) }}">
                                                    @csrf
                                                    <button class="genric-btn info-border circle small" style="padding: 0 7px;" type="submit">Add to Cart</button>
                                                </form>
                                            </h5>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>
    @endif 

@endsection

@section('extra-js')

    <script src="{{ asset('js/app.js') }}"></script>
    
    <script>

        (function () {
            const classname = document.querySelectorAll('.qty');

            Array.from(classname).forEach(function (element){
                element.addEventListener('change', function (){
                    const id = element.getAttribute('data-id')
                    axios.patch(`cart/${id}`, {
                        qty : this.value
                      })
                      .then(function (response) {
                        // console.log(response);
                        window.location.href = "{{ route('cart.index') }}"
                      })
                      .catch(function (error) {
                        console.log(error);
                        window.location.href = "{{ route('cart.index') }}"
                      });
                })
            })
        })();
    </script>

@endsection