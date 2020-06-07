@extends('layouts.theme')

@section('title', 'Shop')

@section('content')
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Shop Category page</h1>
					<nav class="d-flex align-items-center">
						<a href="{{route('landing-page')}}">Home<span class="lnr lnr-arrow-right"></span></a>
						<a href="#">Shop</a>
					</nav>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head">Browse Categories</div>
					<ul class="main-categories">
						@forelse ($categories as $category)
							<li class="main-nav-list">
								<a href="{{ route('shop.index', ['category' => $category->slug]) }}">{{ $category->name }}</a>
							</li>
						@empty
						<li class="main-nav-list">No Categories yet</li>
						@endforelse
						
					</ul>
				</div>
				<div class="sidebar-filter mt-50">
					<div class="top-filter-head">Product Filters</div>
					<div class="common-filter">
						<div class="head">Brands</div>
						<form action="#">
							<ul>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="apple" name="brand"><label for="apple">Apple<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="asus" name="brand"><label for="asus">Asus<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="gionee" name="brand"><label for="gionee">Gionee<span>(19)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="micromax" name="brand"><label for="micromax">Micromax<span>(19)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="samsung" name="brand"><label for="samsung">Samsung<span>(19)</span></label></li>
							</ul>
						</form>
					</div>
					<div class="common-filter">
						<div class="head">Color</div>
						<form action="#">
							<ul>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="black" name="color"><label for="black">Black<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="balckleather" name="color"><label for="balckleather">Black
										Leather<span>(29)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="blackred" name="color"><label for="blackred">Black
										with red<span>(19)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="gold" name="color"><label for="gold">Gold<span>(19)</span></label></li>
								<li class="filter-list"><input class="pixel-radio" type="radio" id="spacegrey" name="color"><label for="spacegrey">Spacegrey<span>(19)</span></label></li>
							</ul>
						</form>
					</div>
					<div class="common-filter">
						<div class="head">Price</div>
						<div style="padding: 0 30px">
							<div>
								<a href="{{ route('shop.index', ['category' => request()->category, 'sort' => 'low_to_high']) }}">Low to High</a>
							</div>
							<div>
								<a href="{{ route('shop.index', ['category' => request()->category, 'sort' => 'high_to_low']) }}">High to Low</a>
							</div>
						</div>
						
					</div>
				</div>
			</div>
			<div class="col-xl-9 col-lg-8 col-md-7">

				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						<!-- single product -->
						@forelse ($products as $product)
							<div class="col-lg-4 col-md-6">
								<div class="single-product">
									<a href="{{ route('shop.show', $product->slug) }}">
										<img class="img-fluid" src="{{asset('storage/' . $product->image)}}" alt="">
									</a>
									<div class="product-details">
										<a href="{{ route('shop.show', $product->slug) }}">
											<h6>{{ $product->name }}</h6>
										</a>
										<h5>{{ $product->details }}</h5>
										<div class="price">
											<h6>${{ $product->price }}</h6>
										</div>
										<div class="prd-bottom">

											<a href="" class="social-info">
												<span class="ti-bag"></span>
												<p class="hover-text">add to bag</p>
											</a>
											<a href="" class="social-info">
												<span class="lnr lnr-heart"></span>
												<p class="hover-text">Wishlist</p>
											</a>
											
										</div>
									</div>
								</div>
							</div>
						@empty
						<h2 class="">No Products Yet.</h2>
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