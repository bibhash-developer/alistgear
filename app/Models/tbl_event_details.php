<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_event_details extends Model
{
    protected $fillable = ['id', 'title', 'address'];
    protected $table    = "tbl_event_details";
    public $timestamps  = false;
}