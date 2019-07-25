<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_country extends Model
{
    protected $fillable = ['name'];
    protected $table    = "tbl_country";
    public $timestamps  = false;

    static public function check_country_id($id)
     {
        $country_name = DB::table('tbl_country')->where('id', $id)
                                                ->select('name')
                                                ->get();
        if(isset($country_name[0]->name))
        {
            return $country_name[0]->name;
        }
    }
}
?>