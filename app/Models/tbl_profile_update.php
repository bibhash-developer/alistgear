<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_profile_update extends Model
{
    protected $fillable = ['id', 'pid', 'introduction', 'video', 'cover_image'];
    protected $table    = "tbl_profile_update";
    public $timestamps  = false;

     
    static public function add_author_details($pid, $video)
     {

      $user = DB::table('tbl_profile_update')->where('pid', $pid)->get();

       if(!empty($user[0])){

          if(!empty($user[0]->video)){

              $videos  = explode(',', $user[0]->video);

              $all_video_url = $user[0]->video.','.$video;
              $response = DB::table('tbl_profile_update')->where('pid', $pid)->update(['video' => $all_video_url]);

             if($response){
                   return true;
              }else{
                   return false;
             }

          }else{
             $response = DB::table('tbl_profile_update')->where('pid', $pid)->update(['video' => $video]);

             if($response){
                   return true;
              }else{
                   return false;
             }
          }

       }else{
           $response = DB::table('tbl_profile_update')->where('pid', $pid) ->insert(['pid' => $pid, 'video' =>$video]);

              if($response){
                   return true;
              }else{
                   return false;
             }
       }
    }
}