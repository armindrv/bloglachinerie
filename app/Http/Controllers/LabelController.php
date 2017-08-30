<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Label;

class LabelController extends Controller
{
    public function getLabels() {
        $data = DB::table('labels')
            ->select('id', 'name')
            ->get();

        return response()->json($data);
    }
}
