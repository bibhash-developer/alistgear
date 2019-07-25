<?php

namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\tbl_event_details;

class EventController extends Controller  
{
   
   public function index(Request $req)
    {
       $data['data'] = tbl_event_details::where('id', '1')->get()->first();
       return view('events', $data);
    } 
}