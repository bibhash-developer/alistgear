<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_grand_children extends Model
{
    protected $fillable = ['id', 'children_id', 'pid', 'grand_children_name', 'website_link', 'address', 'image_name'];
	protected $table    = "tbl_grand_children";
	public $timestamps  = false;

	static public function add($data)
	{
        $result = New tbl_grand_children($data);

        if($result->save())
	   	{
          $lastInsertedID = $result->id;
          return $lastInsertedID;
	   	}
	}

	static public function website_link($lastInsertedID, $wblink)
	{
		$weblink = DB::table('tbl_grand_children')->where('id', $lastInsertedID)
			   	                                     ->update(['website_link'=>$wblink]);
	    return true;
	}

	static public function dublicate_check($pid)
	{
		$result = DB::table('tbl_grand_children')->where('pid', $pid)
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