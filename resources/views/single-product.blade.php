@extends('layouts.theme')

@section('title', $product->name)

@section('extra-css')
	<style type="text/css">

		.img-fluid{
			width: 540px;
			height: 450px;
		}

		.mightLike-img{
			width: 120px;
    		height: 100px;
		}
	</style>
@endsection

@section('content')

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>{{ $product->name }}</h1>
					<nav class="d-flex align-items-center">
						<a href="{{ route('landing-page') }}">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="#">Shop<span class="lnr lnr-arrow-right"></span></a>
						<a href="single-product.html">{{ $product->name }}</a>
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
	<!--================Single Product Area =================-->
	<div class="product_image_area">
		<div class="container">
			<div class="row s_product_inner">
				<div class="col-lg-6">
					<div class="s_Product_carousel">
						<div class="single-prd-item">
							<img class="img-fluid" src="{{asset('storage/' . $product->image)}}" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-5 offset-lg-1">
					<div class="s_product_text">
						<h3>{{ $product->name }}</h3>
						<h2>${{ $product->price }}</h2>
						<p class="prod_pragraph">{{ $product->details }}</p>
						<p class="prod_pragraph">{!! $product->description !!}</p>
						
						<div class="card_area d-flex align-items-center">
							<form action="{{ route('cart.store') }}" method="POST">
								@csrf
								<input type="hidden" name="id" value="{{$product->id}}">
								<input type="hidden" name="name" value="{{$product->name}}">
								<input type="hidden" name="price" value="{{$product->price}}">
								<button type="submit" class="primary-btn">Add to Cart</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================End Single Product Area =================-->

	<!-- Start related-product Area -->
	<section class="related-product-area section_gap_bottom" style="margin-top: 60px">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6 text-center">
					<div class="section-title">
						<h1>You might also like..</h1>
					</div>
				</div>
			</div>
			<div class="row justify-content-center">
					@forelse ($mightLike as $product)
						<div class="col-lg-4 mb-20">
							<div class="single-related-product d-flex">
								<a href="{{ route('shop.show', $product->slug) }}">
									<img class="mightLike-img" src="{{asset('storage/' . $product->image)}}" alt="">
								</a>
								<div class="desc">
									<a href="{{ route('shop.show', $product->slug) }}" class="title">
										{{ $product->name }}
									</a>
									<div class="price">
										<h6>${{ $product->price }}</h6>
									</div>
								</div>
							</div>
						</div>
					@empty
						<h6>No Products Yet</h6>
					@endforelse	
			</div>
		</div>
	</section>
	<!-- End related-product Area -->

@endsection