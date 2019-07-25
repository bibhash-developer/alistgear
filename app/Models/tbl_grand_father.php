<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_grand_father extends Model
{
   protected $fillable  = ['id', 'parent_id','super_parent_id', 'pid','grand_father_name', 'website_link', 'address', 'image_name'];

   protected $table     = "tbl_grand_father";
   public $timestamps   = false;
	
	
	static public function add($data)
	{
        $result = New tbl_grand_father($data);

        if($result->save())
	   	{
          $lastInsertedID = $result->id;
          return $lastInsertedID;
	   	}
	}

	static public function website_link($lastInsertedID, $wblink)
	{
		$weblink = DB::table('tbl_grand_father')->where('id', $lastInsertedID)
			   	                                ->update(['website_link'=>$wblink]);
	    return true;
	}

	static public function dublicate_check($parentid, $pid)
	{
		$result = DB::table('tbl_grand_father')->where('pid', $pid)
		                                       ->where('parent_id', $parentid)
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