<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Support\Facades\Auth;
//use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\User;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    //use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    /*protected $redirectTo = '/home';

    *
     * Create a new controller instance.
     *
     * @return void

    public function __construct()
    {
        $this->middleware('guest')->except('logout');
    }*/

    public function login() {
        $req = json_decode(file_get_contents("php://input"));
        if (Auth::attempt(['email' => $req->email, 'password' => $req->password])) {
            // Authentication passed...

            $id = Auth::id();

            $data = DB::table('users')
                ->join('categorie_users', 'users.id', 'categorie_users.user_id')
                ->where('categorie_users.user_id', $id)
                ->select('categorie_users.categorie_id', 'categorie_users.user_id', 'users.role_id')
                ->get();

            return response()->json($data);

        } else {
            return response()->json(false);
        }
    }

    // Retourne tous les articles des catégories liées à l'utilisateur (modérateur/admin)
    public function getArticlesFromUser($id) {

        // On récupère l'id, le titre et le statut (en attente, validé, refusé) de l'article
        $data = DB::table('users')->distinct()
            ->join('categorie_users', 'users.id', 'categorie_users.user_id')
            ->join('article_categories', 'categorie_users.categorie_id', 'article_categories.categorie_id')
            ->join('articles', 'article_categories.article_id', 'articles.id')
            ->where('users.id', $id)
            ->select('articles.id', 'articles.title', 'articles.statut')
            ->get();
        // On ajoute la ou les catégories à l'article
        foreach ($data as $art) {
            $arr = DB::table('article_categories')
                ->where('article_categories.article_id', $art->id)
                ->select('categorie_id')
                ->get();

            $myarray[] = array("id"=>$art->id, "title"=>$art->title, "statut"=>$art->statut, "categorie_id"=>$arr);

        }
        if(isset($myarray)){
            return response()->json($myarray);
        } else {
            return null;
        }
    }

    // Mise à jour du statut d'un article
    public function updateArticleStatut() {
        $req = json_decode(file_get_contents("php://input"));
        $id = $req->idArticle;
        $statut = $req->statut;
        DB::table('articles')
        ->where('articles.id', $id)
        ->update(['statut' => $statut]);
    }

}
