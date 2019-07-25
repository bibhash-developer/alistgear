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

         $user = tbl_web_signin::where(['address' => $affiliation, 'name' => $name])->first();
                  
          if($user){
             return true;
          }else{
            return false;
          }
     }

     static public function add_register_record($data)
     {
        $parent = New tbl_web_signin($data);

        if($parent->save())
        {
            $lastInsertedID = $parent->pid;
            return $lastInsertedID;
        }
     }

     static public function forgetpassword($email)
     {

         
         $user_email = DB::table('tbl_web_signin')->where('email', $email)->first();

           if(!empty($user_email)){
             return $user_email->email;
             return $user_email->id;
          }else{
            return false;
          }                                    
     }
 

    static public function resetpassword($email,$password,$confirmpass)
     {
         
        $result = DB::table('tbl_web_signin')->where('email', $email)
                                             ->update(['password' =>$password,'conf_password' =>$confirmpass]);

        if($result){
             return true;
          }else{
            return false;
          }
                                  
     }

    static public function check_login($email, $password)
     {

         $user = DB::table('tbl_web_signin')->where(['email' =>$email, 'password' =>$password, 'status' =>'1'])->first();
                                          
        if(!empty($user)){
             return $user->pid;
          }else{
            return false;
          }
     }


    static public function check_login_new($email, $password)
     {

         $user = DB::table('tbl_web_signin')->where(['email' =>$email, 'password' =>$password, 'status' =>'0'])->first();
                                          
        if(!empty($user)){
             return $user->pid;
          }else{
            return false;
          }
     }
}