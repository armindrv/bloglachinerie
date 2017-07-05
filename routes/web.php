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

Route::get('/categoriesBlog', 'CategorieController@getCategoriesBlog');

Route::get('/categoriesLocale', 'CategorieController@getCategoriesLocale');

Route::get('/firstTenArticles', 'ArticleController@getFirstTenArticles');

Route::get('/article/{article_id}', ['uses' => 'ArticleController@getArticle']);

