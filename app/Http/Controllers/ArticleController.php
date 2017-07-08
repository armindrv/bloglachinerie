<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use App\Article;

class ArticleController extends Controller
{
    public function getFirstTenArticles(){

    	$data = DB::table('articles')
    		->join('sections', 'articles.id', 'sections.article_id')
    		->where('sections.typeSection_id', 2)
    		->orderBy('articles.id', 'desc')
    		->select('articles.id as id', 'articles.title as titre', 'articles.description', 'sections.content as imageUrl')
    		->distinct()
    		->limit(10)
    		->get();

    	return response()->json($data);
    }

    public function getArticle($article_id){

    	
    	// Récupère le titre et la pochette du disque
    	$data = DB::table('articles')
    		->where('articles.id', $article_id)
    		->select('articles.id as id', 'articles.title as titre')
    		->get();

    	$data = $data->toArray();


    	// Récupère les tracks et les numéros de track du disque
    	$data2 = DB::table('articles')
    		->join('sections', 'articles.id', 'sections.article_id')
    		->where('articles.id', $article_id)
    		->select('sections.content as content')
    		->distinct()
    		->get();

	     $data2 = $data2->toArray();


	     // Fusion des deux tableaux
	     $data = array_merge($data, $data2);


    		
    	return response()->json($data);
    }

    public function getArticlesFromCategorie($categorie_id){

    	$data = DB::table('articles')
    		->join('article_categories', 'articles.id', 'article_categories.article_id')
    		->join('sections', 'articles.id', 'sections.article_id')
    		->where('article_categories.categorie_id', $categorie_id)
    		->where('sections.typeSection_id', 2)
    		->select('articles.id', 'articles.title as titre', 'articles.description', 'sections.content as imageUrl')
    		->get();

    	return response()->json($data);
    }
}
