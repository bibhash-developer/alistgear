<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_addjoin_us extends Model
{
    protected $fillable = ['country', 'state', 'name', 'affiliation', 'email', 'areaOinterest', 
                            'homepage', 'company', 'city'];
    protected $table    = "tbl_addjoin_us";
    public $timestamps  = false;

    static public function addjoinUs($data)
     {
        $joinus = New tbl_addjoin_us($data);
  
        if($joinus->save())
        {
            return true;
        }
    }

    static public function showjoinUs()
     {
        $joinus = DB::table('tbl_author_details')
                           ->join('tbl_web_signin','tbl_author_details.pid','=','tbl_web_signin.pid')
                                 ->select('*')
                                 ->orderBy('tbl_author_details.id', 'tbl_author_details.desc')
                                 ->get();
  
        if(isset($joinus))
        {
            return $joinus;
        }else
        {
           return false;
        }
    }

    static public function delete_joinus($id)
    {
       $data = DB::table('tbl_author_details')->where('id', $id)
                                          ->delete();
      if($data)
      {
        return true;
      }else
      {
        return false;
      }
    }
}
