<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');
    $router->resource('/users', 'UserController');
    $router->resource('/courses', 'CourseController');
    $router->resource('/categories', 'CategoryController');
    $router->resource('/terms', 'TermsController');
    $router->resource('/callus', 'CallusController');
    $router->resource('/paypal', 'PaypalCodeController');
    

});