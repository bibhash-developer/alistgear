<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_citation_details extends Model
{
    protected $fillable    = ['id', 'pid', 'links', 'cited_by','year', 'title', 'type_of_publication', 'publication_name'];

    protected $table       = "tbl_citation_details"; 
    
    public    $timestamps  = false;


    static public function publications($pid)
    {
    	
    	$publication['publication'] = DB::table('tbl_citation_details')->where('pid', $pid)->select('*')->take(10)->get();

         if(!empty($publication['publication'])){
          foreach ($publication['publication'] as $key => $value) {
            $data1[] = $value;
          }
           
            if(!empty($data1[0])){
                 return $data1;
            }else{
            	return false;
            }
         }
    }

    
   static public function search_publication($fname, $pid)
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

    static public function add_publications($records){
             $joinus = New tbl_citation_details($records);
    
            if($joinus->save()){
                return true;
            }else{
              return false;
           }
    }
}
