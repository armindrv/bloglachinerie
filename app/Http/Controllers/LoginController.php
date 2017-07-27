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
            //dd($data);
            return response()->json($data);

        } else {
            return response()->json(false);
        }
    }

    public function getArticlesFromUser($id) {
        $data = DB::table('users')
            ->join('categorie_users', 'users.id', 'categorie_users.user_id')
            ->join('article_categories', 'categorie_users.categorie_id', 'article_categories.categorie_id')
            ->join('articles', 'article_categories.article_id', 'articles.id')
            ->where('users.id', $id)
            ->select('articles.id', 'articles.title', 'categorie_users.categorie_id', 'articles.statut')
            ->get();

            return response()->json($data);
    }

}
