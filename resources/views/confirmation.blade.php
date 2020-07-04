@extends('layouts.theme')

@section('title', 'Confirmation')

@section('content')
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Confirmation</h1>
					<nav class="d-flex align-items-center">
						<a href="{{route('landing-page')}}">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="#">Confirmation</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<div>
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

	<!--================Order Details Area =================-->
	<section class="order_details section_gap">
		<div class="container">
			<div>
		        @if (session()->has('success'))
		        	<h3 class="title_confirmation" style="color: darkblue;">
		            	{{ session('success') }}
		            </h3>	
		        @endif

		        @if (count($errors) > 0)
		            <div class="alert alert-danger">
		                <ul>
		                    @foreach ($errors->all() as $error)
		                        <li>{{ $error}}</li>
		                    @endforeach    
		                </ul>
		            </div>
		        @endif
		    </div>
			<div class="order_details_table">
				<h2>Order Details</h2>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Product</th>
								<th scope="col">Quantity</th>
								<th scope="col">Total</th>
							</tr>
						</thead>
						<tbody>
							@foreach (Cart::instance('default')->content() as $item)
								<tr>
									<td>
										<p>{{ $item->model->name }}</p>
									</td>
									<td>
										<h5>x {{ $item->qty }}</h5>
									</td>
									<td>
										<p>${{ $item->model->price }}</p>
									</td>
								</tr>
							@endforeach	
							<tr>
								<td>
									<h4>Subtotal</h4>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<p>${{ $subtotal }}</p>
								</td>
							</tr>
							<tr>
								<td>
									<h4>Tax (14%)</h4>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<p>${{ $tax }}</p>
								</td>
							</tr>
							<tr>
								<td>
									<h4>Total</h4>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<p>${{ $total }}</p>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>
	@php
        Cart::instance('default')->destroy();
		session()->forget('coupon');
	@endphp
	<!--================End Order Details Area =================-->

@endsection('content')