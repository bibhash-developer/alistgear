<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_parents_releation extends Model
{
    protected $fillable = ['pid', 'super_parent_id', 'children_id', 
                           'parents_name', 'website_link', 'address', 
                           'image_name'];

    protected $table    = "tbl_parents_releation";
    public  $timestamps = false;
 
     static public function dubChildrenParent($pid, $chlidrenid)
         {
         	
	        $user = DB::table('tbl_parents_releation')->where('pid', $pid)
	                                                  ->where('children_id', $chlidrenid)
	                                                  ->first();

	        if($user)
	        {
	           return true;
	        }else
	        {
	          return false;
	        }
         } 

   static public function parent_to_children_releation($pid, $parentid, 
   	                 $chlidrenid, $parents_releation, $address, $imageLink)
	   {

		   	$children = new tbl_parents_releation();
		   	$children->pid             = $pid;
		   	$children->super_parent_id = $parentid;
		    $children->children_id     = $chlidrenid;
		   	$children->parents_name    = trim($parents_releation);
		   	$children->address         = trim($address);
		   	$children->image_name      = trim($imageLink);
		   	
		   	if($children->save())
		   	{
	          $lastInsertedID = $children->id;
	          return $lastInsertedID;
		   	}
	   }

	   static public function allParentChildrenParent()
         {
         	
	        $user = DB::table('tbl_parents_releation')->get();

	        if($user)
	        {
	           return $user;
	        }else
	        {
	          return false;
	        }
         } 

          static public function chToParwebLink($pid, $wblink)
		   {

			   	$weblink = DB::table('tbl_parents_releation')->where('pid', $pid)
			   	                                    ->update(['website_link'=>$wblink]);
			   	
			   	if($weblink)
			   	{
		          
		            return true;
			   	}else
			   	{
			   		return false;
			   	}
		   }

}
