<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Illuminate\Support\Facades\DB;
use App\Categorie;

class CategorieController extends Controller
{
    public function getCategoriesBlog() {

    	$data = DB::table('categories')->where('isLocale', 0)->select('id', 'libelle as lib')->get();

    	return response()->json($data);
    }

    public function getCategoriesLocale() {

    	$data = DB::table('categories')->where('isLocale', 1)->select('id', 'libelle as lib')->get();

    	return response()->json($data);
    }    

    public function getCategories() {
    	$data = DB::table('categories')->select('id', 'libelle as lib')->get();

    	return response()->json($data);
    }

    public function getCategoriesDigging() {
        $data = DB::table('categories')->where('isDigging', 1)->select('id', 'libelle as lib')->get();

        return response()->json($data);
    }

    public function getDiggingByID($id) {
        $data = DB::table('categories')->where('id', $id)->select('url_channel')->get();

        return response()->json($data);
    }
}