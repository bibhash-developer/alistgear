<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_new_create_user extends Model
{
    protected $fillable = ['pid', 'help_us', 'university', 'uni_department', 'topicarea', 'aiml', 'company', 'jobtitle', 'com_department', 
                           'per_website', 'github'];
                           
    protected $table    = "tbl_new_create_user";
    public $timestamps  = false;


  static public function addCreatePage($data)
     {
        $joinus = New tbl_new_create_user($data);
  
        if($joinus->save())
        {
            return true;
        }else{
          return false;
        }
    }
}
?>