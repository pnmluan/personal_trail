<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$api = $app->make(Dingo\Api\Routing\Router::class);

$api->version('v1', function ($api) {
    $api->post('/auth/login', [
        'as' => 'api.auth.login',
        'uses' => 'App\Http\Controllers\Auth\AuthController@login',
    ]);

    $api->group([
        'middleware' => 'api.auth',
    ], function ($api) {
        $api->get('/', [
            'uses' => 'App\Http\Controllers\APIController@getIndex',
            'as' => 'api.index'
        ]);
        $api->get('/auth/user', [
            'uses' => 'App\Http\Controllers\Auth\AuthController@getUser',
            'as' => 'api.auth.user'
        ]);
        $api->patch('/auth/refresh', [
            'uses' => 'App\Http\Controllers\Auth\AuthController@patchRefresh',
            'as' => 'api.auth.refresh'
        ]);
        $api->delete('/auth/logout', [
            'uses' => 'App\Http\Controllers\Auth\AuthController@deleteInvalidate',
            'as' => 'api.auth.logout'
        ]);


        /*
        |--------------------------------------------------------------------------
        | Category
        |--------------------------------------------------------------------------
        */
        $api->post('/category/save', [
            'as' => 'api.category.create',
            'uses' => 'App\Http\Controllers\System\CategoryController@save',
        ]);

        $api->post('/category/save/{id}', [
            'as' => 'api.category.update',
            'uses' => 'App\Http\Controllers\System\CategoryController@save',
        ]);

        $api->delete('/category/delete/{id}', [
            'as' => 'api.category.delete',
            'uses' => 'App\Http\Controllers\System\CategoryController@delete',
        ]);
    });

    /*
    |--------------------------------------------------------------------------
    | Category
    |--------------------------------------------------------------------------
    */
    $api->get('/category/index', [
        'as' => 'api.category.index',
        'uses' => 'App\Http\Controllers\System\CategoryController@index',
    ]);

    $api->get('/category/show/{id}', [
        'as' => 'api.category.show',
        'uses' => 'App\Http\Controllers\System\CategoryController@show',
    ]);

    $api->get('/category/list', [
        'as' => 'api.category.list',
        'uses' => 'App\Http\Controllers\System\CategoryController@list',
    ]);

    /*
    |--------------------------------------------------------------------------
    | Article
    |--------------------------------------------------------------------------
    */
    $api->get('/article/index', [
        'as' => 'api.article.index',
        'uses' => 'App\Http\Controllers\System\ArticleController@index',
    ]);

    $api->get('/article/show/{id}', [
        'as' => 'api.article.show',
        'uses' => 'App\Http\Controllers\System\ArticleController@show',
    ]);

    /*
    |--------------------------------------------------------------------------
    | Picture
    |--------------------------------------------------------------------------
    */
    $api->get('/picture/index', [
        'as' => 'api.picture.index',
        'uses' => 'App\Http\Controllers\System\PictureController@index',
    ]);

    $api->get('/picture/show/{id}', [
        'as' => 'api.picture.show',
        'uses' => 'App\Http\Controllers\System\PictureController@show',
    ]);

    /*
    |--------------------------------------------------------------------------
    | Slide
    |--------------------------------------------------------------------------
    */
    $api->get('/slide/index', [
        'as' => 'api.slide.index',
        'uses' => 'App\Http\Controllers\System\SlideController@index',
    ]);

    $api->get('/slide/show/{id}', [
        'as' => 'api.slide.show',
        'uses' => 'App\Http\Controllers\System\SlideController@show',
    ]);

    /*
    |--------------------------------------------------------------------------
    | User
    |--------------------------------------------------------------------------
    */
    $api->get('/user/index', [
        'as' => 'api.user.index',
        'uses' => 'App\Http\Controllers\System\UserController@index',
    ]);

    $api->get('/user/show/{id}', [
        'as' => 'api.user.show',
        'uses' => 'App\Http\Controllers\System\UserController@show',
    ]);
    
});
