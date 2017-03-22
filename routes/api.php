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

        /*
        |--------------------------------------------------------------------------
        | Tag
        |--------------------------------------------------------------------------
        */
        $api->post('/tag/save', [
            'as' => 'api.tag.create',
            'uses' => 'App\Http\Controllers\System\TagController@save',
        ]);

        $api->post('/tag/save/{id}', [
            'as' => 'api.tag.update',
            'uses' => 'App\Http\Controllers\System\TagController@save',
        ]);

        $api->delete('/tag/delete/{id}', [
            'as' => 'api.tag.delete',
            'uses' => 'App\Http\Controllers\System\TagController@delete',
        ]);

        /*
        |--------------------------------------------------------------------------
        | Article Tag
        |--------------------------------------------------------------------------
        */
        $api->post('/article_tag/save', [
            'as' => 'api.article_tag.create',
            'uses' => 'App\Http\Controllers\System\ArticleTagController@save',
        ]);

        $api->post('/article_tag/save/{id}', [
            'as' => 'api.article_tag.update',
            'uses' => 'App\Http\Controllers\System\ArticleTagController@save',
        ]);

        $api->delete('/article_tag/delete/{id}', [
            'as' => 'api.article_tag.delete',
            'uses' => 'App\Http\Controllers\System\ArticleTagController@delete',
        ]);

        /*
        |--------------------------------------------------------------------------
        | Slide
        |--------------------------------------------------------------------------
        */
        $api->post('/slide/save', [
            'as' => 'api.slide.create',
            'uses' => 'App\Http\Controllers\System\SlideController@save',
        ]);

        $api->post('/slide/save/{id}', [
            'as' => 'api.slide.update',
            'uses' => 'App\Http\Controllers\System\SlideController@save',
        ]);

        $api->delete('/slide/delete/{id}', [
            'as' => 'api.slide.delete',
            'uses' => 'App\Http\Controllers\System\SlideController@delete',
        ]);

        /*
        |--------------------------------------------------------------------------
        | Article
        |--------------------------------------------------------------------------
        */
        $api->post('/article/save', [
            'as' => 'api.article.create',
            'uses' => 'App\Http\Controllers\System\ArticleController@save',
        ]);

        $api->post('/article/save/{id}', [
            'as' => 'api.article.update',
            'uses' => 'App\Http\Controllers\System\ArticleController@save',
        ]);

        $api->delete('/article/delete/{id}', [
            'as' => 'api.article.delete',
            'uses' => 'App\Http\Controllers\System\ArticleController@delete',
        ]);

        /*
        |--------------------------------------------------------------------------
        | Picture
        |--------------------------------------------------------------------------
        */
        $api->post('/picture/save', [
            'as' => 'api.picture.create',
            'uses' => 'App\Http\Controllers\System\PictureController@save',
        ]);

        $api->post('/picture/save/{id}', [
            'as' => 'api.picture.update',
            'uses' => 'App\Http\Controllers\System\PictureController@save',
        ]);

        $api->delete('/picture/delete/{id}', [
            'as' => 'api.picture.delete',
            'uses' => 'App\Http\Controllers\System\PictureController@delete',
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

    /*
    |--------------------------------------------------------------------------
    | Tag
    |--------------------------------------------------------------------------
    */
    $api->get('/tag/index', [
        'as' => 'api.tag.index',
        'uses' => 'App\Http\Controllers\System\TagController@index',
    ]);

    $api->get('/tag/show/{id}', [
        'as' => 'api.tag.show',
        'uses' => 'App\Http\Controllers\System\TagController@show',
    ]);

    /*
    |--------------------------------------------------------------------------
    | Article Tag
    |--------------------------------------------------------------------------
    */
    $api->get('/article_tag/index', [
        'as' => 'api.article_tag.index',
        'uses' => 'App\Http\Controllers\System\ArticleTagController@index',
    ]);

    $api->get('/article_tag/show/{id}', [
        'as' => 'api.article_tag.show',
        'uses' => 'App\Http\Controllers\System\ArticleTagController@show',
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
