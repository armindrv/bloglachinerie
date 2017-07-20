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


//#################################	  CATEGORIES   ###########################################


// Récupère toutes les catégories de la partie blog

Route::get('/categoriesBlog', 'CategorieController@getCategoriesBlog');

// Récupère toutes les catégories locales

Route::get('/categoriesLocale', 'CategorieController@getCategoriesLocale');


//#################################	  ARTICLES   ###########################################


// Récupère les dix articles les plus récents

Route::get('/firstTenArticles', 'ArticleController@getFirstTenArticles');

// Récupère un article en particulier

Route::get('/article/{article_id}', 'ArticleController@getArticle');

// Récupère tous les articles d'une catégorie donnée

Route::get('/categorie/{categorie_id}', 'ArticleController@getArticlesFromCategorie');

//#################################	  DISQUES   ###########################################

// Route vers une fonction pour récupérer tous les disques de la base

Route::get('/disques/all', 'DisqueController@getAllDisques');

// Route vers une fonction pour récupérer un disque en particulier

Route::get('/disques/{disque_id}', 'DisqueController@getDisque');


//#################################	  USERS   ###########################################

 Auth::routes();

 Route::get('/login', 'LoginController@authenticate');

 Route::post('/login', 'LoginController@authenticate');

