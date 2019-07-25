<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_parent_info extends Model
{
    protected $fillable = ['pid', 'name', 'address','website_link','image_name'];
    protected $table    = "tbl_parent_info";
    public $timestamps  = false;


      static public function DublicateParentInfo($pid)
         {	
         	
	        $user = DB::table('tbl_parent_info')->where('pid', $pid)->first();

	        if($user)
	        {
	           return true;
	        }else
	        {
	          return false;
	        }
         } 

	   static public function parent_info($data)
	   {

		   	$parent = New tbl_parent_info($data);
		   	
		   	if($parent->save())
		   	{
	          $lastInsertedID = $parent->id;
	          return $lastInsertedID;
		   	}
	   }

	    static public function parentwebLink($pid, $wblink)
		   {

			   	$weblink = DB::table('tbl_parent_info')->where('pid', $pid)
			   	                                    ->update(['website_link'=>$wblink]);
			   	
			   	if($weblink)
			   	{
		          
		            return true;
			   	}else
			   	{
			   		return false;
			   	}
		   }

		static public function Parent_records()
		{
			$weblink = DB::table('tbl_parent_info')->get();	 
			  	                                
		    	if($weblink)
			   	{
		          
		            return $weblink;
			   	}else
			   	{
			   		return false;
			   	}
		}

		static public function text()
		{
			echo "text";
		}

}



