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

    public function index() {

    	$data = DB::table('disques')
    		->join('disque_titres', 'disques.id', 'disque_titres.disque_id')
	     	->join('titres', 'titres.id', 'disque_titres.titre_id')
	     	->select('titres.track_title', 'disques.disque_title', 'disque_titres.track_number')
	     	->get();

	    $disqueIDs = DB::table('disques')->select('id')->get();

	    $disqueIDs = $disqueIDs->toArray();
	   
	    for($i = 0;$i < sizeof($disqueIDs); $i++){
	    	$dataa[$i] = DB::select(DB::raw('SELECT `titres`.`track_title` 
				FROM disques
				INNER JOIN `disque_titres` ON `disques`.`id` = `disque_titres`.`disque_id` 
				INNER JOIN `titres` ON `titres`.`id` = `disque_titres`.`titre_id`
				WHERE (`disque_titres`.`disque_id` = '.$disqueIDs[$i]->id.' AND `titres`.`id` = `disque_titres`.`titre_id`)'));
	    }		

	    $trackTitle = DB::table('disques')
	    	->join('disque_titres', 'disques.id', 'disque_titres.disque_id')
	     	->join('titres', 'titres.id', 'disque_titres.titre_id')
	     	->where([
	     		['disques.id', '=', 'disque_titre.disque_id'],
	     		['disque_titres.titre_id', '=', 'titres.id']
	     	])
	     	->select('titres.track_title') 
	     	->get();

	     	$dataaCol = collect($dataa);
	     	echo(gettype($dataaCol));
	     	//dd($dataaCol);
    	return view('disques.index', ['name' => $data, 'title' => $data]);
    }
}
