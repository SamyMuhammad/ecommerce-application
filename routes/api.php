<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

/*Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
*/

/*
	Register
	Login
	Logout
	Show all products
	Show a single product
	Search for products
	Show Cart Items
	Add to Cart Items
	Change qty for a Cart item
	Remove from Cart
	Add to SaveForLater
	Remove from SavefroLater
	Get the checkout data.
	Show profile info
	Update profile info
*/

Route::group([
	'middleware' => ['api', 'api.checkpassword'],
	'namespace' => 'Api'], function (){
	
		Route::post('register', 'RegisterController@register');
		Route::post('login', 'AuthController@login');
	    Route::post('logout', 'AuthController@logout');
		
		Route::get('categories', 'ShopController@categories');
		Route::get('products', 'ShopController@products');
		Route::get('products/{slug}', 'ShopController@product');
		Route::get('/search', 'ShopController@search');
});

Route::group([
	'middleware' => ['api', 'api.checkpassword', 'auth:api'],
	'namespace' => 'Api'], function (){

		Route::get('cart', 'CartController@index');
		Route::post('cart/add', 'CartController@store');
		Route::patch('cart/{id}', 'CartController@update');
		Route::delete('cart/{id}', 'CartController@destroy');

		Route::post('save-for-later/add', 'SaveForLaterController@store');
		Route::delete('save-for-later/{id}', 'SaveForLaterController@destroy');

		Route::get('checkout', 'CheckoutController@index');

		Route::get('/profile', 'UsersController@get');
		Route::patch('/profile', 'UsersController@update');
});