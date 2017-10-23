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

// Récupère toutes les catégories

Route::get('/all_categories', 'CategorieController@getCategories');

// Récupère toutes les catégories digging

Route::get('/categoriesDigging', 'CategorieController@getCategoriesDigging');

// Récupère l'id de la chaine youtube de la catégorie

Route::get('/get_youtube_channel/{id}', 'CategorieController@getDiggingByID');

//#################################	  ARTICLES   ###########################################


// Récupère les dix articles les plus récents

Route::get('/firstTenArticles', 'ArticleController@getFirstTenArticles');

// Récupère un article en particulier

Route::get('/article/{article_id}', 'ArticleController@getArticle');

// Récupère tous les articles d'une catégorie donnée

Route::get('/categorie/{categorie_id}', 'ArticleController@getArticlesFromCategorie');

// Insère un article en base

Route::post('/create_article', 'ArticleController@createArticle');

//#################################	  DISQUES   ###########################################

// Route vers une fonction pour récupérer tous les disques de la base

Route::get('/disques/all', 'DisqueController@getAllDisques');

// Route vers une fonction pour récupérer un disque en particulier

Route::get('/disques/{disque_id}', 'DisqueController@getDisque');


//#################################	  USERS   ###########################################

 // Insère un nouvel utilisateur en base

 Route::post('/signup', 'LoginController@signUp');

 // Connecte un utilisateur

 Route::post('/login', 'LoginController@login');

 // Retourne les infos relatives à l'utilisiteur connecté

 Route::get('/get_user', 'LoginController@getConnectedUser');

 // Déconnecte l'utilisateur connecté

 Route::get('/logout_user', 'LoginController@logout');

 //		-----	ADMIN -----

 // Route vers une fonction pour accéder à la modération d'articles

 Route::get('/moderation_article/{user_id}', 'LoginController@getArticlesFromUser');

 // Route vers une fonction pour mettre à jour le statut de l'article

 Route::post('/set_article_status', 'LoginController@updateArticleStatut');

 //#################################	LABEL 	###########################################

 // Récupère tous les labels

 Route::get('/label_list', 'LabelController@getLabels');

 // Récupère tous les disques d'un label

 Route::get('/label_releases/{id}', 'DisqueController@getDisqueFromLabel');

 //#################################	ARTISTES	###########################################

 // Récupère tous les artistes
 
 Route::get('/artistes/all', 'ArtisteController@getAllArtistes');

 // Récupère un artiste par ID

 Route::get('/artiste/{id}', 'ArtisteController@getArtisteById');