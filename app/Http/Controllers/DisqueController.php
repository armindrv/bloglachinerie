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


    	// Récupère les tracks, les numéros de track du disque et l'url vers les mp3
    	$data2 = DB::table('disques')
    		->join('disque_titres', 'disques.id', 'disque_titres.disque_id')
	     	->join('titres', 'titres.id', 'disque_titres.titre_id')
	     	->where('disques.id', $disque_id)
	     	->select('titres.track_title', 'titres.mp3_url', 'disque_titres.track_number')
	     	->get();

	     $data2 = $data2->toArray();


	     // Fusion des deux tableaux
	     $data = array_merge($data, $data2);
         dd($data);
	    return response()->json($data);

    }  

    // Retourne tous les disques d'un label
    public function getDisqueFromLabel($id) {
        // Récupère l'id, le titre et l'image des disques du label
        $data = DB::table('disques')
            ->where('label_id', $id)
            ->select('disques.id', 'disques.disque_title', 'disques.image_url')
            ->get();

        // Récupère le ou les artistes présents sur les disques
        foreach($data as $disque) {
           
        $res = DB::table('disques')
            ->join('disque_titres', 'disques.id', 'disque_titres.disque_id')
            ->join('titres', 'titres.id', 'disque_titres.titre_id')
            ->join('titre_artistes', 'titres.id', 'titre_artistes.titre_id')
            ->join('artistes', 'titre_artistes.artiste_id', 'artistes.id')
            ->where('disques.id', $disque->id)
            ->groupBy('artistes.name')
            ->select('artistes.name')
            ->get();
            
            // ajout des artistes au disque
            $array[] = array("id"=>$disque->id, "disque_title"=>$disque->disque_title, "image_url"=>$disque->image_url, "artiste_name"=>$res);

            
        }
        if(isset($array)){
            return response()->json($array);
        } else {
            return null;
        }
        
    }
}
