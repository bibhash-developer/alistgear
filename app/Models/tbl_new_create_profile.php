<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_new_create_profile extends Model
{
    protected $fillable = ['pid', 'university', 'uni_department', 'topicarea', 'company', 'jobtitle', 'com_department', 'github'];
    protected $table    = "tbl_new_create_profile";
    public $timestamps  = false;



     static public function addCreateProfile($data)
     {
        $parent = New tbl_new_create_profile($data);
        
        if($parent->save())
        {
            $lastInsertedID = $parent->id;
            return $lastInsertedID;
        }
     }
}