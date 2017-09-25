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
    		->where('isRoaster', 1)
    		->select('id', 'img_url', 'name', 'biographie', 'sc_link')
    		->get();

    	return response()->json($data);
    }

    public function youtube() {
    	$data = '<iframe title="exemple 1 avec iframe" src="https://www.googleapis.com/youtube/v3/videos?id=6tVTre09Z4I&key=AIzaSyAnvhgRi09RUGMxnQoux0WitkqJqEKaM0M" width="400" height="300">
  <p>Your browser does not support iframes.</p>
</iframe>';

    	return response()->json($data);
    }
}
