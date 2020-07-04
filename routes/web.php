<?php

use Illuminate\Support\Facades\Route;
use Gloudemans\Shoppingcart\Facades\ApiCart;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::middleware('restore.cart')->group(function (){
	
	Route::get('/', 'LandingPageController@index')->name('landing-page');

	Route::get('/shop', 'ShopController@index')->name('shop.index');
	Route::get('/shop/{product}', 'ShopController@show')->name('shop.show');
	Route::get('/search', 'ShopController@search')->name('search');
});

Route::middleware(['auth', 'restore.cart'])->group(function (){

	Route::get('/cart', 'CartController@index')->name('cart.index');
	Route::post('/cart', 'CartController@store')->name('cart.store');
	Route::delete('/cart/{product}', 'CartController@destroy')->name('cart.destroy');
	Route::patch('/cart/{product}', 'CartController@update')->name('cart.update');
	Route::post('/cart/save-for-later/{product}', 'CartController@saveForLater')
			->name('cart.saveForLater');

	Route::delete('/save-for-later/{product}', 'SaveForLaterController@destroy')
			->name('saveForLater.destroy');
	Route::post('/save-for-later/add-to-cart/{product}', 'SaveForLaterController@addToCart')
			->name('saveForLater.addToCart');

	Route::post('/coupon', 'CouponsController@store')->name('coupon.store');
	Route::delete('/coupon', 'CouponsController@destroy')->name('coupon.destroy');

	Route::get('checkout', 'CheckoutController@index')->name('checkout.index')->middleware('CartHasItems');	
	Route::post('checkout', 'CheckoutController@store')->name('checkout.store');

	Route::get('confirmation', 'ConfirmationController@index')->name('confirmation.index');

	Route::get('/my-profile', 'UsersController@edit')->name('users.edit');
	Route::patch('/my-profile', 'UsersController@update')->name('users.update');

	Route::get('/my-orders', 'OrdersController@index')->name('orders.index');
});

Auth::routes();

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});

Route::fallback(function () {
    return redirect()->route('landing-page');
});

// Route::get('/home', 'HomeController@index')->name('home');

Route::get('do', function () {
	
	// update products set image = 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg' where id between 62 and 80;
	
	// \Cart::destroy();
	dd(session()->all()['cart']); // get >> returns Collection object
	// dd(session()->all()['cart']['key'] = 'value'); // put 
	// dd(session()->all()['cart']); // remove unset($array['key'])
});