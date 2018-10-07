<?php

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

Route::get('/', function () {
    return view('index');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

//payment form
Route::get('/payment', 'PaymentController@index');
// route for processing payment
Route::post('paypal', 'PaymentController@payWithPaypal');
// route for check status of the payment
Route::get('status', 'PaymentController@getPaymentStatus');
