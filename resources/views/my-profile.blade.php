@extends('layouts.theme')

@section('title', 'Profile')

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
						<li class="main-nav-list active"><a href="{{ route('users.edit') }}">Profile</a></li>
						<li class="main-nav-list"><a href="{{ route('orders.index') }}">Orders</a></li>
					</ul>
				</div>
			</div>
			<div class="col-xl-9 col-lg-8 col-md-7">

				<!-- Start -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						<div class="col-md-12">	
							<div class="card-head">
								<h4 style="margin-top: 15px;">Profile Data</h4>
							</div>
							<div class="card-body">
		                        <form method="POST" action="{{ route('users.update') }}">
		                            @method('patch')
		                            @csrf

		                            <div class="form-group row">
		                                <label for="name" class="col-md-4 col-form-label text-md-right">Name</label>

		                                <div class="col-md-6">
		                                    <input id="name" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name', $user->name)}}" required autocomplete="name" autofocus>

		                                    @error('name')
		                                        <span class="invalid-feedback" role="alert">
		                                            <strong>{{ $message }}</strong>
		                                        </span>
		                                    @enderror
		                                </div>
		                            </div>

		                            <div class="form-group row">
		                                <label for="email" class="col-md-4 col-form-label text-md-right">E-Mail Address</label>

		                                <div class="col-md-6">
		                                    <input id="email" type="email" class="form-control" name="email" value="{{ old('email', $user->email) }}" readonly autocomplete="email">

		                                    @error('email')
		                                        <span class="invalid-feedback" role="alert">
		                                            <strong>{{ $message }}</strong>
		                                        </span>
		                                    @enderror
		                                </div>
		                            </div>

		                            <div class="form-group row">
		                                <label for="password" class="col-md-4 col-form-label text-md-right">Password</label>

		                                <div class="col-md-6">
	                                    <small>Leave password blank to keep the old password.</small>
		                                    <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" autocomplete="new-password">
		                                    @error('password')
		                                        <span class="invalid-feedback" role="alert">
		                                            <strong>{{ $message }}</strong>
		                                        </span>
		                                    @enderror
		                                </div>
		                            </div>

		                            <div class="form-group row">
		                                <label for="password-confirm" class="col-md-4 col-form-label text-md-right">Confirm Password</label>

		                                <div class="col-md-6">
		                                    <input id="password-confirm" type="password" class="form-control" name="password_confirmation" autocomplete="new-password">
		                                </div>
		                            </div>

		                            <div class="form-group row mb-0">
		                                <div class="col-md-6 offset-md-4">
		                                    <button type="submit" class="genric-btn primary btn">
		                                        Submit
		                                    </button>
		                                </div>
		                            </div>
		                        </form>
		                    </div>
						</div>
					</div>
				</section>
				<!-- End -->
			</div>
		</div>
	</div>

@endsection