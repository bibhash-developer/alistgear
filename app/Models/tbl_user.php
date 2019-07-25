<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_user extends Model
{
    protected $fillable = ['username', 'password'];
    protected $table    = "tbl_user";

    static public function loginSubmit($username, $password)
    {

       $user = DB::table('tbl_user')->where(['username' => $username, 
       	                                     'password' => $password
       	                                    ])
                                    ->get();
       
       if(isset($user[0]))
       {
       
         return $user[0];
       }else
       {

       	return false;
       }
    }
}
