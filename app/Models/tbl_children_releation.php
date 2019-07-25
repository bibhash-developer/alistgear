<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_children_releation extends Model
{
	protected $fillable =['pid', 'people_id', 'children_name', 'website_link', 
	                       'address', 'image_name'];
	protected $table    = "tbl_children_releation";
	public $timestamps  = false;
    
    static public function children_releation($data)
	   {

		   	$children = New tbl_children_releation($data);
		   	
		   	if($children->save())
		   	{
	          $lastInsertedID = $children->id;
	          return $lastInsertedID;
		   	}
	   }

	   static public function DublicateChildren($pid, $parentId)
         {	
         	
	        $user = DB::table('tbl_children_releation')->where('pid', $pid)
	                                                   ->where('people_id', $parentId)
	                                                   ->first();

	        if($user)
	        {
	           return true;
	        }else
	        {
	          return false;
	        }
         }  

          static public function childrenwebLink($pid, $wblink)
		   {

			   	$weblink = DB::table('tbl_children_releation')->where('pid', $pid)
			   	                                     ->update(['website_link'=>$wblink]);
			   	
			   	if($weblink)
			   	{
		          
		            return true;
			   	}else
			   	{
			   		return false;
			   	}
		   }

		static public function all_child_record()
		{
			$childrecord = DB::table('tbl_children_releation')->select('*')->get();
			
			if(isset($childrecord['0'])){
                return $childrecord;
			}else{
                return false;
			}
			
		}
}
