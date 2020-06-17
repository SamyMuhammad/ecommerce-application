<?php

use Illuminate\Support\Facades\Route;

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


Route::get('/', 'LandingPageController@index')->name('landing-page');

Route::get('/shop', 'ShopController@index')->name('shop.index');
Route::get('/shop/{product}', 'ShopController@show')->name('shop.show');
Route::get('/search', 'ShopController@search')->name('search');

Route::get('/cart', 'CartController@index')->name('cart.index');
Route::post('/cart', 'CartController@store')->name('cart.store');
Route::delete('/cart/{product}', 'CartController@destroy')->name('cart.destroy');
Route::patch('/cart/{product}', 'CartController@update')->name('cart.update');
Route::post('/cart/save-for-later/{product}', 'CartController@saveForLater')->name('cart.saveForLater');

Route::delete('/save-for-later/{product}', 'SaveForLaterController@destroy')
		->name('saveForLater.destroy');
Route::post('/save-for-later/add-to-cart/{product}', 'SaveForLaterController@addToCart')
		->name('saveForLater.addToCart');

Route::post('/coupon', 'CouponsController@store')->name('coupon.store');
Route::delete('/coupon', 'CouponsController@destroy')->name('coupon.destroy');

Route::get('checkout', 'CheckoutController@index')->name('checkout.index')->middleware('auth');	
Route::post('checkout', 'CheckoutController@store')->name('checkout.store');

Route::get('confirmation', 'ConfirmationController@index')->name('confirmation.index');

Route::get('do', function () {
	/*
	update products set image = 'products/June2020/6UM0m4lC1G15LaOxhl6N.jpg' where id between 62 and 80;
	*/
	\Cart::destroy();
});


Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');


Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
