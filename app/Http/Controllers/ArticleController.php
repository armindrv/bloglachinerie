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

    	$data = DB::table('articles')
    		->join('sections', 'articles.id', 'sections.article_id')
    		->where('articles.id', $article_id)
    		->select('articles.id as id', 'articles.title as titre', 'sections.content as content')
    		->distinct()
    		->get();

    	//$filtered = $data->collapse();
    	dd($data);
    	//dd($data);
    	return response()->json($data);
    }
}
