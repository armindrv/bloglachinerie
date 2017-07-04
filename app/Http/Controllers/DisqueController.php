<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Disque;

class DisqueController extends Controller
{
    public function show($id) {

    	$disque = DB::table('disques')
	     	->join('disque_titres', 'disques.id', 'disque_titres.disque_id')
	     	->join('titres', 'titres.id', 'disque_titres.titre_id')
	     	->where('disques.id', $id)
	     	->select('titres.track_title', 'disques.disque_title', 'disque_titres.track_number')
	     	->get();

	    return $disque; 

	    return view('disques.show', compact('disque'));

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
