<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_about_us extends Model
{
    protected $fillable = ['id', 'title','address'];
    protected $table    = "tbl_about_us";
    public $timestamps  = false;

}
?>