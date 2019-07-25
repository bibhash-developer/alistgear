<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;

class Home_model extends Model
{   

  static public function search_singlename($name)
  {
     $allName['allName'] = DB::table('tbl_parent_info')  
                            ->where('name', $name)
                            ->select('name as children_name', 'website_link',
                             'address', 'image_name', 'pid')
                            ->first();
          
            if($allName['allName'])
            {
                 return $allName['allName'];
            }else{

        $allName['allName'] = DB::table('tbl_children_releation')  
                            ->where('children_name', $name)
                            ->select('children_name', 'website_link',
                             'address', 'image_name', 'pid')
                            ->first();

               
          if($allName['allName'])
            {
                 return $allName['allName'];
        
            }else
            {
              $allName['allName'] = DB::table('tbl_grand_children')  
                                ->where('grand_children_name', $name)
                                ->select('grand_children_name as children_name',
                                 'website_link', 'address', 'image_name','pid')
                                ->first();

               return $allName['allName'];
            }
          }
    }
   /* static public function search_singlepid($pid)
  {
     $allName['allName'] = DB::table('tbl_parent_info')  
                            ->where('pid', $pid)
                            ->select('name as children_name', 'website_link',
                             'address', 'image_name', 'pid')
                            ->first();
          
            if($allName['allName'])
            {
                 return $allName['allName'];
            }else{

        $allName['allName'] = DB::table('tbl_children_releation')  
                            ->where('pid', $pid)
                            ->select('children_name', 'website_link',
                             'address', 'image_name', 'pid')
                            ->first();

               
          if($allName['allName'])
            {
                 return $allName['allName'];
        
            }else
            {
              $allName['allName'] = DB::table('tbl_parents_releation')  
                                ->where('pid', $pid)
                                ->select('parents_name as children_name',
                                 'website_link', 'address', 'image_name','pid')
                                ->first();

               return $allName['allName'];
            }
          }
    }*/
    
    
static public function search_profile_name($fname)
  {
               $records              = array();

               $allName['allName'] = DB::table('tbl_author_details')  
                                        ->where('name', 'LIKE', $fname.'%')
                                        ->select('name','pid','address','website_link','image_name')
                                        ->get();
                      
                  if(count($allName['allName']) > 0){
                    foreach($allName['allName'] as $data){
                       $records[] = $data;
                    }
                  }
             
            return $records;
  }

  static public function search_title($fname, $pid)
  {
               $records              = array();

               $allName['allName'] = DB::table('tbl_citation_details')  
                                        ->where('title', 'LIKE', $fname.'%')
                                        ->where('pid', $pid)->limit(10)
                                        ->select('title','links','cited_by','year')
                                        ->get();
                      
                  if(count($allName['allName']) > 0){
                    foreach($allName['allName'] as $data){
                       $records[] = $data;
                    }
                    return $records;
                  }        
            
  }


	static public function search_name($name)
   {
     $allName['allName'] = DB::table('tbl_author_details')  
                            ->where('name', 'LIKE', $name.'%')
                            ->limit(8)
                            ->select('name as children_name')
                            ->get();

            if(count($allName['allName']) >0){

                 return $allName['allName'];
              
               }else{
                      return false;
               }
    }

static public function search_name_affiliation($name)
   {
     $allName['allName'] = DB::table('tbl_author_details')  
                            ->where('address', 'LIKE', '%'. $name.'%')
                            //->groupBy('address')
                            ->select('address')
                            ->get();
                            
            if(count($allName['allName']) >0){

                 return $allName['allName'];
              
               }else{
                      return false;
               }
    }

    public static function country()
    {
      $data = DB::table('tbl_country')->select('*')
                                      ->get();
      if($data)
      {
         return $data;
      }else
      {
        return false;
      }
    }

    public static function state($id)
    {
      $data = DB::table('tbl_state')->where('country_id', $id)
                                    ->select('id', 'name as state_name')
                                    ->get();
      if($data)
      {
         return $data;
      }else
      {
        return false;
      }
    }

}
