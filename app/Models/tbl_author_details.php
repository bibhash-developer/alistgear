<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_author_details extends Model
{
    protected $fillable = ['pid', 'name', 'address', 'city', 'state', 'country', 'area', 'website_link','image_name'];
    protected $table    = "tbl_author_details";
    public $timestamps  = false;



     static public function InsertAuthorDetails($data)
     {
        $parent = New tbl_author_details($data);
        
        if($parent->save())
        {
            $lastInsertedID = $parent->id;
            return $lastInsertedID;
        }
     }

    static public function search_name($name)
     {
     $allName['allName'] = DB::table('tbl_author_details')  
                            ->where('name', 'LIKE', '%'.$name.'%')
                            ->select('name as children_name')
                            ->get();

            if(count($allName['allName']) >0){

                 return $allName['allName'];
              
               }else{
                      return false;
               }
    }

     static public function search_profile_name($fname)
      {

                   $records              = array();

                   $allName['allName'] = tbl_author_details::where('name', 'LIKE', '%'. $fname)
                                            ->select('name','pid','address','website_link','image_name')
                                            ->get();
                          
                      if(count($allName['allName']) > 0){
                        foreach($allName['allName'] as $data){
                           $records[] = $data;
                        }
                      }
                 
                return $records;
      }












     static public function check_author_fields($affiliation, $name)
     {
         $user = tbl_author_details::where(['address' => $affiliation, 'name' => $name])->first();
                  
          if($user){
             return $user;
          }else{
            return false;
          }
     }






      static public function CheckAuthorPid($pid)
        {	
	        $user = DB::table('tbl_author_details')->where('pid', $pid)->first();

	        if($user)
	        {
	           return true;
	        }else
	        {
	          return false;
	        }
         } 

	 static public function AuthorWebLink($lastInsertedID, $wblink)
       {
          $weblink = DB::table('tbl_author_details')->where('id', $lastInsertedID)
                                                    ->update(['website_link' => $wblink]);
          
          if($weblink){ 
             return true;
          }else {
            return false;
          }
       }

     static public function update_author_details($data, $pid)
      {
       	$record = DB::table('tbl_author_details')->where('pid', $pid)->update($data);
        
            if($record){ 
               return true;
            }else {
              return false;
            }
     }

     static public function all_author_show()
      {
        $author = tbl_author_details::all();

          if($author[0]){
             return $author;
          }else{
            return false;
          }
     }
}



