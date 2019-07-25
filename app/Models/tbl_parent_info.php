<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_parent_info extends Model
{
    protected $fillable = ['pid', 'name', 'address','website_link','image_name'];
    protected $table    = "tbl_author_details";
    public $timestamps  = false;


      static public function CheckAuthorPid($pid)
        {	
         	
	        $user = DB::table('tbl_author_details')->where('pid', $pid)->first();

	        if($user)
	        {
	           return true;
	        }else
	        {
	          return false;
	        }
         } 

	 static public function InsertAuthorDetails($data)
	   {

		   	$parent = New tbl_parent_info($data);
		   	
		   	if($parent->save())
		   	{
	          $lastInsertedID = $parent->id;
	          return $lastInsertedID;
		   	}
	   }

	 static public function AuthorWebLink($lastInsertedID, $wblink)
       {

          $weblink = DB::table('tbl_author_details')->where('id', $lastInsertedID)
                                                    ->update(['website_link' => $wblink]);
          
          if($weblink){ 
             return true;
          }else {
            return false;
          }
       }
}



