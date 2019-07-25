<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class My_profile_details extends Model
{
   public static function search_name($fname, $Lname)
    {
       $data               = array();

       $allName1['allName1'] = DB::table('tbl_parent_info')  
                            ->where('name', 'LIKE', $fname.'%')
                            //->where('name', 'LIKE', '%'.$Lname)
                            ->select('name','pid','address','website_link',
                              'image_name')
                            ->get();
              
          if(count($allName1['allName1']) > 0){
            foreach($allName1['allName1'][0] as $data1){
               $data[] = $data1;
            }
          }
                
        $allName2['allName2'] = DB::table('tbl_children_releation')  
                             ->where('children_name', 'LIKE', $fname.'%')
                             ->where('children_name', 'LIKE', '%'.$Lname)
                             ->select('children_name as name', 'pid', 'address',
                                      'website_link', 'address', 'image_name')
                             ->get();

               
          if(count($allName2['allName2']) >0){
              foreach($allName2['allName2'][0] as $data2){
                 $data[] = $data2;
              }
        
            }
              $allName3['allName3'] = DB::table('tbl_parents_releation')  
                            ->where('parents_name', 'LIKE', $fname.'%')
                            ->where('parents_name', 'LIKE', '%'.$Lname)
                            ->select('parents_name as name', 'pid', 
                                     'website_link', 'address', 'image_name')
                            ->get();

            if(count($allName3['allName3']) >0){
              foreach($allName3['allName3'][0] as $data3){
                 $data[] = $data3;
              }
        
            }

          if(count($data) >0)
            {
               return $data;
        
            }else
            {
               $records              = array();

               $allName1['allName1'] = DB::table('tbl_parent_info')  
                                        ->where('name', 'LIKE', $fname.'%')
                                        ->select('name','pid','address','website_link','image_name')
                                        ->get();
                      
                  if(count($allName1['allName1']) > 0){
                    foreach($allName1['allName1'][0] as $data1){
                       $records[] = $data1;
                    }
                  }
                        
                $allName2['allName2'] = DB::table('tbl_children_releation')  
                                        ->where('children_name', 'LIKE', $fname.'%')
                                        ->select('children_name as name', 'pid', 'address',
                                              'website_link', 'address', 'image_name')
                                        ->get();

                       
                  if(count($allName2['allName2']) >0){
                      foreach($allName2['allName2'][0] as $data2){
                         $records[] = $data2;
                      }
                
                    }
                      $allName3['allName3'] = DB::table('tbl_parents_releation')  
                                               ->where('parents_name', 'LIKE', $fname.'%')
                                               ->select('parents_name as name', 'pid', 
                                             'website_link', 'address', 'image_name')
                                               ->get();

                    if(count($allName3['allName3']) >0){
                      foreach($allName3['allName3'][0] as $data3){
                         $records[] = $data3;
                      }
                    }
             return $records;
            }
    }

       public static function join_profile_details($pid)
        {   
          
           $profilePid = DB::table('tbl_claim_profiles')->where('pid', $pid)
                                                        ->select('status')
                                                        ->get();
           if(isset($profilePid))
           {
            return $profilePid;
           }else
           {
            return false;
           }
       }
}
