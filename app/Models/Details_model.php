<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;
class Details_model extends Model
{
  static public function details_author($pid)
    {

         $ourrecourd  = DB::table('tbl_author_details')->join('tbl_profile_update', 'tbl_author_details.pid', '=', 'tbl_profile_update.pid')
                                                       ->where('tbl_author_details.pid', $pid)
                                                       ->select('*')->first();
        if(isset($ourrecourd) >0){
             //unset($ourrecourd->introduction);
             $ourname['ourname'] = $ourrecourd;
          }else{
           $ourname['ourname']  = DB::table('tbl_author_details')->where('pid', $pid)->first();
           //$ourname['cover_image'] =0;
           //$ourname['ourname'] = $ourname['cover_image'];
          }

            $data = array();
          if(isset($ourname['ourname'])){
             $data['record'] = $ourname['ourname'];
             return $data;
          }
    }

     static public function educational_lineage($pid)
      {
        $ourrecourd['ourrecourd'] = DB::table('tbl_parent_children_id')
                                    ->where('author_pid', $pid)
                                    ->select('*')
                                    ->first();
       
        if(isset($ourrecourd['ourrecourd']) >0) {

              if(isset($ourrecourd['ourrecourd']->parent_pid)){
                  $parent_data       = explode("-", $ourrecourd['ourrecourd']->parent_pid);
                  $all_parent     = array();
                 foreach($parent_data as $parent){

                  $parent_data = DB::table('tbl_author_details')->where('pid', $parent)->select('*')->first();
                  if($parent_data){
                     $all_parent[] = $parent_data;
                  }
                 }
               }

                if(isset($ourrecourd['ourrecourd']->children_pid)){
                  $child_data   = explode("-", $ourrecourd['ourrecourd']->children_pid);
                  $all_children     = array();
                 foreach($child_data as $children){

                   $child_data = DB::table('tbl_author_details')->where('pid', $children)->select('*')->first();
                   if($child_data){
                     $all_children[] = $child_data;
                    }     
                  }
                }
              }
                    $record = array();
                    if(isset($all_parent)){
                       $record['parent'] = $all_parent;
                    }
                 if(isset($all_children)){
                   $record['children'] = $all_children;
                }
              if($record){
                  return $record;
              }
       }


    	  static public function collaborators($pid)
    	   {
           $ourrecourd['ourrecourd'] = DB::table('tbl_parent_children_id')->where('author_pid', $pid)->select('*')->first();
       
        if(isset($ourrecourd['ourrecourd']) >0) {

              if(isset($ourrecourd['ourrecourd']->collaborators_id)){
                  $collaborators  = explode("-", $ourrecourd['ourrecourd']->collaborators_id);
                  //$all_collabots     = array();
                 foreach($collaborators as $collaborator){

                   $coll_data = DB::table('tbl_author_details')->where('pid', $collaborator)->select('*')->first();  
                   if($coll_data){
                     $all_collabots[] = $coll_data;
                    }    
                 }

            if(isset($all_collabots)){
                  return $all_collabots;
                 }
            }             
    	   }
       }

       static public function show_video($pid)
        {
          $video_link = DB::table('tbl_profile_update')->where('pid', $pid)->select('video')->get();
             
           if(!empty($video_link[0]->video)){
                  return $video_link;
           }else{
                 return false;
           }                                          
        }

  
      static function search_grand_children($pid) 
      {
           $ourrecourd['ourrecourd'] = DB::table('tbl_parent_children_id')
                                    ->where('author_pid', $pid)
                                    ->select('*')
                                    ->first();
       
        if(isset($ourrecourd['ourrecourd']) >0) {

                if(isset($ourrecourd['ourrecourd']->children_pid)){
                  $child_data   = explode("-", $ourrecourd['ourrecourd']->children_pid);
                  $all_children     = array();
                 foreach($child_data as $children){

                   $child_data = DB::table('tbl_author_details')->where('pid', $children)->select('*')->first();
                   if($child_data){
                     $all_children[] = $child_data;
                    }     
                  }
                }
              } 
                 if(isset($all_children)){
                   $record['children'] = $all_children;
                }
              if($record){
                  return $record;
              }
      }

       static function search_grand_parent($pid) 
      {
             $ourrecourd['ourrecourd'] = DB::table('tbl_parent_children_id')
                                    ->where('author_pid', $pid)
                                    ->select('*')
                                    ->first();
       
        if(isset($ourrecourd['ourrecourd']) >0) {

                if(isset($ourrecourd['ourrecourd']->parent_pid)){
                  $parent_data   = explode("-", $ourrecourd['ourrecourd']->parent_pid);
                  $all_parent     = array();
                 foreach($parent_data as $parent){

                   $parent_data = DB::table('tbl_author_details')->where('pid', $parent)->select('*')->first();
                   if($parent_data){
                     $all_parent[] = $parent_data;
                    }     
                  }
                }
              } 
                 if(isset($all_parent)){
                   $record['parent'] = $all_parent;
                }
              if($record){
                  return $record;
              }
      }

    static public function topic_options()
      {
        $author_area = tbl_author_details::select('pid', 'area')->get();
        $grouped     = $author_area->groupBy('area');
        
        if(!empty($grouped)){
           return $grouped;
        }
        
      }


      static public function educational_lineage_search($pid, $pid1)
      {
        if(!empty($pid) && !empty($pid1)){

          $record['children'] = DB::table('tbl_author_details')
                                    ->where('pid', $pid)
                                    ->where('pid', $pid1)
                                    ->select('*')
                                    ->first();
       }else{
          $record['children'] = DB::table('tbl_author_details')
                                    ->where('pid', $pid)
                                    ->select('*')
                                    ->first();
       }

       if($record){
            return $record;
         }
      } 
  }