<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_great_grandparent extends Model
{
   protected $fillable  = ['id', 'parent_info_id','pid','grand_parent_name', 'address', 'website_link', 'image_name'];

   protected $table     = "tb_great_grandparent";
   public $timestamps   = false;
	
	
	static public function add($data)
	{
        $result = New tbl_great_grandparent($data);

        if($result->save())
	   	{
          $lastInsertedID = $result->id;
          return $lastInsertedID;
	   	}

	}

	static public function website_link($lastInsertedID, $wblink)
	{
		$weblink = DB::table('tb_great_grandparent')->where('id', $lastInsertedID)
			   	                                ->update(['website_link'=>$wblink]);
	    return true;
	}

	static public function dublicate_check($parentid, $pid)
	{
		$result = DB::table('tb_great_grandparent')->where('pid', $pid)
		                                       ->where('parent_info_id', $parentid)
		                                       ->select('*')
		                                       ->get();
		 if(isset($result['0'])){
             return true;
		 }else{
		 	return false;
		 }

	}
}
?>