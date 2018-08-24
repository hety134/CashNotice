<?php

use Illuminate\Routing\Router;

Admin::registerAuthRoutes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index');

    $router->resource('employee', UserController::class);

    $router->get("batch","UserController@getBatch");

    $router->post("export","UserController@export");

    $router->get("cash","UserController@cash");

    $router->post("sendEmail","UserController@sendEmail");

});
