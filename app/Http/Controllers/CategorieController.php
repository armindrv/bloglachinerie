<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use App\Categorie;

class CategorieController extends Controller
{
    public function getCategoriesBlog(){

    	$data = DB::table('categories')->select('id', 'libelle as lib')->get();

    	return response()->json($data);
    }
}