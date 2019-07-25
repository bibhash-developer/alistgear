<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;
class tbl_collaborators extends Model
{
    protected $fillable = ['rel_pid','pid','collaborators_name','address', 'image_name'];
    protected $table    = "tbl_collaborators";
    public $timestamps  = false;
	
	
	static public function add_collaborators($collaborators)
	   {

		   	$collaborators = New tbl_collaborators($collaborators);
		   	
		   	if($collaborators->save())
		   	{
	          $lastInsertedID = $collaborators->id;
	          return $lastInsertedID;
		   	}
	   }

	  static public function dublicateCheck($id, $id1)
	   {
          $data = DB::table('tbl_collaborators')->where([
          	                'rel_pid' => $id,
          	                'pid'     => $id1,
                           ])->first();
          
          if(isset($data))
          {
             return true;
          }else
          {
          	return false;
          }
	  }
}
