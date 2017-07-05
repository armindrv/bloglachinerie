<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use App\Article;

class ArticleController extends Controller
{
    public function getFirstTenArticles(){

<<<<<<< HEAD
        $data = DB::table('articles')
            ->join('sections', 'articles.id', 'sections.article_id')
            ->where('sections.typeSection_id', 2)
            ->orderBy('articles.id', 'desc')
            ->select('articles.id as id', 'articles.title as titre', 'articles.description', 'sections.content as imageUrl')
            ->distinct()
            ->limit(10)
            ->get();

        return response()->json($data);
=======
    	$data = DB::table('articles')
    		->join('sections', 'articles.id', 'sections.article_id')
    		->where('sections.typeSection_id', 2)
    		->orderBy('articles.id', 'desc')
    		->select('articles.id as id', 'articles.title as titre', 'articles.description', 'sections.content as imageUrl')
    		->distinct()
    		->limit(10)
    		->get();

    	return response()->json($data);
>>>>>>> 78344a108e8f6e8508aa046e3f4be1138e020a3d
    }
}
