<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_web_forgetpassword extends Model
{
   
     
    static public function forgetpassword($email)
     {

          echo $email; die;
         $user = DB::table('tbl_web_signin')->where('email', $email)->first();
                                                
     }

    
   
}