<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_web_signin extends Model
{
    protected $fillable = ['id', 'pid', 'name', 'address', 'email', 'password', 'conf_password', 'status'];
    protected $table    = "tbl_web_signin";
    public $timestamps  = false;

     
    static public function check_register_filed($affiliation, $name)
     {

         $user = DB::table('tbl_author_details')->where('address', $affiliation)
                                                ->where('name', $name)->first();

          if($user){
             return $user->pid;
          }else{
            return false;
          }
     }

    
   
}