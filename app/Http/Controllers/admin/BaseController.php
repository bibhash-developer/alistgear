<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class BaseController extends Controller
{
    public function __construct(Request $req){
    /*$username =  session()->get('username');
    echo $username; exit;*/
   /*$this->middleware(function ($request, $next){
        $username =  session()->get( 'username' );
       //dd($user_id); 
        
        if(!$username)
        {
          return redirect('/login');
        }else
        {
          return redirect('/dashboard');
        }
    });*/
  }
}
