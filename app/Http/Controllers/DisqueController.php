<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Disque;

class DisqueController extends Controller
{
    
    // Récupère tous les titres et les pochettes des disques présents dans la base
	public function getAllDisques() {
    	$data = DB::table('disques')
    		->select('disque_title', 'image_url')
    		->get();

    	return response()->json($data);
    }

    // Récupère les infos d'un disque en particulier
    public function getDisque($disque_id) {

    	// Récupère le titre et la pochette du disque
    	$data = DB::table('disques')
    		->where('disques.id', $disque_id)
    		->select('disque_title', 'image_url')
    		->get();

    	$data = $data->toArray();


    	// Récupère les tracks et les numéros de track du disque
    	$data2 = DB::table('disques')
    		->join('disque_titres', 'disques.id', 'disque_titres.disque_id')
	     	->join('titres', 'titres.id', 'disque_titres.titre_id')
	     	->where('disques.id', $disque_id)
	     	->select('titres.track_title', 'disque_titres.track_number')
	     	->get();

	     $data2 = $data2->toArray();


	     // Fusion des deux tableaux
	     $data = array_merge($data, $data2);

	    return response()->json($data);

    }  
}
