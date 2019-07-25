<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_video extends Model
{
    protected $fillable = ['pid', 'people_name', 'video_name', 'title'];

    protected $table    = "tbl_video";

    static public function all_people_name()
    {

       $allPeople=array();

       $parent = DB::table('tbl_parent_info')
                 ->join('tbl_children_releation', 'tbl_parent_info.id', '='
                  ,'tbl_children_releation.people_id')

                 ->join('tbl_parents_releation', 'tbl_children_releation.id', 
                  '=', 'tbl_parents_releation.children_id')

                 ->select('tbl_parent_info.pid', 'tbl_parent_info.name', 
                  'tbl_children_releation.children_name as name', 
                  'tbl_children_releation.pid','tbl_parents_releation.pid', 
                  'tbl_parents_releation.parents_name  as name'
                  )
                 ->get();

       
      

         $allPeople[] = $parent;
         
        if($allPeople)
          {
             return $allPeople;
          }
    }

    static public function AddVodeo_link($pid, $people_name, $video_link,$title)
    {
    	$video =new tbl_video();
        $video ->pid = $pid;
        $video ->people_name = $people_name;
        $video ->video_name  = $video_link;
        $video ->title       = $title;
        
    	if($video->save())
    	{
           return true;
    	}else
    	{
    		return false;
    	}

    }


   static public function show_video_link()
    {

       $video_link = DB::table('tbl_video')->orderby('id','DESC')->get();

       if($video_link)
       {
        return $video_link;
       }                                          
    }

  static public function delete_video_link($id)
    {

       $video_link = DB::table('tbl_video')->where('id',$id)
                                           ->delete();

       if($video_link)
       {
        return true;
       }else
       {
        return false;
       }                                         
    }

    static public function update_video_link($pid)
    {

        $users = DB::table('tbl_video')
                ->where('id', $pid)
                ->select('*')
                ->get();

       if(isset($users))
       {
        return $users;
       }else
       {
        return false;
       }                                         
    }

    static public function EditVodeo_link($id, $recourd)
    {
         $data = DB::table('tbl_video')->where('id', $id)->update($recourd);
         if($data)
         {
            return true;
         }else
         {
            return false;
         }
    }
}
