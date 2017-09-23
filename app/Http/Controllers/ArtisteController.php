<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ArtisteController extends Controller
{
    public function getAllArtistes() {
    	$data = DB::table('artistes')
    		->select('id', 'name', 'img_url')
    		->get();

    	return response()->json($data);
    }

    public function getArtisteById($id) {
    	$data = DB::table('artistes')
    		->where('id', $id)
    		->select('id', 'img_url', 'name', 'biographie', 'sc_link')
    		->get();
    	return response()->json($data);
    }
}
