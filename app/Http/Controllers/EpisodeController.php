<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\tbl_episodes;

class EpisodeController extends Controller  
{
   
   public function index(Request $req)
    {
      $data['data'] = tbl_episodes::where('id', '1')->get()->first();
       return view('episodes', $data);
    } 
}
