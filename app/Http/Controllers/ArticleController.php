<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\DB;

use App\Article;
use App\Section;

class ArticleController extends Controller
{
    public function getFirstTenArticles(){

    	$data = DB::table('articles')
    		->join('sections', 'articles.id', 'sections.article_id')
    		->where('sections.typeSection_id', 2)
            ->where('articles.statut', 1)
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
            ->where('articles.statut', 1)
    		->where('sections.typeSection_id', 2)
    		->select('articles.id', 'articles.title as titre', 'articles.description', 'sections.content as imageUrl')
    		->get();
            
    	return response()->json($data);
    }

    public function createArticle() {
        $req = json_decode(file_get_contents("php://input"));

        $content = $req->article;
        $encoded_img = $req->image;
        $titre = "blablabla";
        $desc = "albalbalb";
        $encoded_img = str_replace('data:image/png;base64,', '', $encoded_img);
        $image = base64_decode($encoded_img);

        $article = new Article;
        $article->description = $desc;
        $article->title = $titre;
        $article->statut = null;

        $article->save();

        $artID = $article->id;

        Storage::put('img/articles/'.$artID.'/'.$artID.'.png', $image);

        $path_to_img = Storage::disk('public')->url($artID.'/'.$artID.'.png');

        DB::table('sections')->insert([
            ['content' => $content, 'typeSection_id' => 1, 'article_id' => $artID],
            ['content' => $path_to_img, 'typeSection_id' => 2, 'article_id' => $artID]
        ]);
        
    }
}
