<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_episodes extends Model
{
    protected $fillable = ['id', 'title','address'];
    protected $table    = "tbl_episodes";
    public $timestamps  = false;

}
?>