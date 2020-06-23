@extends('layouts.theme')

@section('title', 'Orders')

@section('content')
	<section class="banner-area organic-breadcrumb">
		<div class="container">

		</div>
	</section>
	<div>
        @if (session()->has('success'))
            <div class="alert alert-success mt-1 text-center">{{ session('success') }}</div>
        @endif
    </div>
    
	<div class="container" style="margin-top: 65px;">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head"></div>
					<ul class="main-categories">
						<li class="main-nav-list"><a href="{{ route('users.edit') }}">Profile</a></li>
						<li class="main-nav-list active"><a href="{{ route('orders.index') }}">Orders</a></li>
					</ul>
				</div>
			</div>
			<div class="col-xl-9 col-lg-8 col-md-7">

				<!-- Start -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						<div class="col-md-12">	
							<div class="card-head">
								<h4 style="margin-top: 15px;">Your Orders</h4>
							</div>
							<div class="card-body">
		                        @forelse($orders as $order)
		                        	<div class="card" style="margin-bottom: 20px;">
									  <div class="card-header">
									    Order #{{$order->id}}
									  </div>
									  <div class="card-body">
									    <h5>Name: {{ $order->billing_name }}</h5>
									    <h5>Address: {{ $order->billing_address }}</h5>
									    <h5>Total Price: {{ $order->billing_total }}$</h5>
								    	<div class="row">
										    @foreach($order->products as $product)
												  <div class="col-sm-6 col-md-4 col-lg-4">
												    <div class="card">
												      <img class="card-img-top" src="{{asset('storage/' . $product->image)}}" alt="Card image cap">	
												      <div class="card-body">
												        <h5 class="card-title"><a href="{{ route('shop.show', $product->slug) }}">{{$product->name}}</a>
												        </h5>
												        <p class="card-text">{{$product->details}}</p>
												      </div>
												    </div>
												  </div>
										    @endforeach
										</div>
									  </div>
									</div>
		                        @empty
		                        	<h3>No Orders Yet.</h3>
		                        @endforelse
		                    </div>
						</div>
					</div>
				</section>
				<!-- End -->
			</div>
		</div>
	</div>

@endsection