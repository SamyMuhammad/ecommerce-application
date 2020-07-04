@extends('layouts.theme')

@section('title', 'Search Results')

@section('extra-css')
	<link rel="stylesheet" type="text/css" href="{{asset('css/custom.css')}}">
@endsection

@section('content')
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Results</h1>
					<nav class="d-flex align-items-center">
						<a href="{{route('landing-page')}}">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="#">Search</a>
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

	<div class="container">
		<div class="row">
			
			<div class="col-lg-12 col-md-7">
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						<!-- single product -->
						@forelse ($products as $product)
							<div class="col-lg-3 col-md-6">
								<div class="single-product">
									<a href="{{ route('shop.show', $product->slug) }}">
										<img class="img-fluid" src="{{asset('storage/' . $product->image)}}" alt="">
									</a>
									<div class="product-details">
										<a href="{{ route('shop.show', $product->slug) }}">
											<h6>{{ $product->name }}</h6>
										</a>
										<h5>{{ Str::limit($product->details, 75) }}</h5>
										<div class="price">
											<h6>${{ $product->price }}</h6>
										</div>
										<div class="prd-bottom">

											<form action="{{ route('cart.store') }}" method="POST" id="cartAdding" class="hidden-form">
												@csrf
												<input type="hidden" name="id" value="{{$product->id}}">
												<input type="hidden" name="name" value="{{$product->name}}">
												<input type="hidden" name="price" value="{{$product->price}}">
												<span class="cart-icon">
													<i class="fa fa-shopping-cart fa-2x" aria-hidden="true"></i>
													<button type="submit" class="text">Add to Cart</button>
												</span>
											</form>

										</div>
									</div>
								</div>
							</div>
						@empty
							<h2 style="margin: 0 auto; margin-top: 30px;">No Products Found.</h2>
						@endforelse
					</div>
				</section>
				<!-- End Best Seller -->

				<!-- Start Filter Bar -->
				<div style="margin-bottom: 30px;">
					{{ $products->appends(request()->input())->links() }}
				</div>
				<!-- End Filter Bar -->

			</div>
		</div>
	</div>

@endsection