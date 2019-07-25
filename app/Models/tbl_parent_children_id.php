<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_parent_children_id extends Model
{
    protected $fillable = ['author_pid', 'parent_pid', 'children_pid'];
    protected $table    = "tbl_parent_children_id";
    public $timestamps  = false;

        /*  child pid check and update*/


      static public function InsertAuthorPid($data)
	   {

		   	$parent = New tbl_parent_children_id($data);
		   	
		   	if($parent->save())
		   	{
	          $lastInsertedID = $parent->id;
	          return $lastInsertedID;
		   	}
	   }

	    static public function CheckchildPid($pid)
        {	
         	
	        $user = DB::table('tbl_parent_children_id')->where('author_pid', $pid)->first();

	        if($user){
	           return $user->id;
	        }else{
	          return false;
	        }
         } 

       static public function CheckChildUpdate($pid, $piddetails)
         {	
         	
	        $user = DB::table('tbl_parent_children_id')->where('author_pid', $pid)->get();
	        $dbChild  = explode('-', $user[0]->children_pid);
	        $newChild = explode('-', $piddetails['children_pid']);
            
            $AllChildPid = array();
            $data = array();

            foreach($newChild as $childPid)
            {
                if(!in_array($childPid, $dbChild)){
                    $data[] = $childPid;   
                }
            }

           if(isset($data[0])){
           	     
                  /*update Old child author pid*/
                  foreach ($dbChild as $key => $value) {
                  	$AllChildPid[] = $value;
                  }
                    /*update New child author pid*/

                  foreach ($data as $key => $value1) {
                  	$AllChildPid[] = $value1;
                  }
                 
                 $record = DB::table('tbl_parent_children_id')->where('author_pid', $pid)
                                                            ->update(['children_pid' => implode('-', $AllChildPid)]);
                 if($record){
	                 return $pid;
	               }else{
	                return false;
	           }
            }
        } 

          /*  Parent pid check and update*/

      public static function CheckParentPid($pid)
       {
       	  $user = DB::table('tbl_parent_children_id')->where('author_pid', $pid)->first();

	        if($user){
	           return $user->id;
	        }else{
	          return false;
	        }
       }

       static public function CheckParentUpdate($pid, $piddetails)
         {	
         	
	        $user = DB::table('tbl_parent_children_id')->where('author_pid', $pid)->get();
	        $dbParent  = explode('-', $user[0]->parent_pid);
	        $newparent = explode('-', $piddetails['parent_pid']);
            
            if(!$user[0]->parent_pid){

            		 $record = DB::table('tbl_parent_children_id')->where('author_pid', $pid)
                                                                  ->update($piddetails);
		   	
				   	if($record){
			          return $pid;
				   	}
		}else{

            $AllParentPid = array();
            $data = array();

            foreach($newparent as $parentPid)
            {
                if(!in_array($parentPid, $dbParent)){
                    $data[] = $parentPid;   
                }
            }

           if(isset($data[0])){
           	
           	     /*update OLd Parent author pid*/

                  foreach ($dbParent as $key => $value) {
                  	$AllParentPid[] = $value;
                  }
                    /*update New Parent author pid*/

                  foreach ($data as $key => $value1) {
                  	$AllParentPid[] = $value1;
                  }
                 
                 $record = DB::table('tbl_parent_children_id')->where('author_pid', $pid)
                                                            ->update(['parent_pid' => implode('-', $AllParentPid)]);
                 if($record){
	                 return $pid;
	               }else{
	                return false;
	           }
            }
        } 
    }

     public static function UpdateParentPid($pid, $piddetails)
	   {
	   	           
	   	  $result = DB::table('tbl_parent_children_id')->where('author_pid', $pid)->update($piddetails);

	   	  if($result){
             
	           return $pid;
	        }else{
	          return false;
	        }
	   }

       static public function CheckCollaboratorsUpdate($pid, $piddetails)
         {  
          
          $user = DB::table('tbl_parent_children_id')->where('author_pid', $pid)->get();
          $dbCollaborat  = explode('-', $user[0]->collaborators_id);
          $newCollaborat = explode('-', $piddetails['collaborators_id']);
            
            if(!$user[0]->collaborators_id){

                 $record = DB::table('tbl_parent_children_id')->where('author_pid', $pid)
                                                              ->update($piddetails);
            if($record){
                return $pid;
            }
         }else{

            $AllCollaPid = array();
            $data = array();

            foreach($newCollaborat as $collaboratPid)
            {
                if(!in_array($collaboratPid, $dbCollaborat)){
                    $data[] = $collaboratPid;   
                }
            }

           if(isset($data[0])){
            
                 /*update Old Collaborat pid*/

                  foreach ($dbCollaborat as $key => $value) {
                    $AllCollaPid[] = $value;
                  }
                    /*update New Collaborat pid*/

                  foreach ($data as $key => $value1) {
                    $AllCollaPid[] = $value1;
                  }
                 
                 $record = DB::table('tbl_parent_children_id')->where('author_pid', $pid)
                                                            ->update(['collaborators_id' => implode('-', $AllCollaPid)]);
                 if($record){
                   return $pid;
                 }else{
                  return false;
             }
            }
        } 
    }

    public static function UpdateCollaboratPid($pid, $piddetails)
      {        
        $result = DB::table('tbl_parent_children_id')->where('author_pid', $pid)->update($piddetails);

        if($result){
             
             return $pid;
          }else{
            return false;
          }
     }

    /* Add parent id from website where add parent form. */

     static public function add_parent_id($pid, $newparentId)
         {  
          $user = DB::table('tbl_parent_children_id')->where('author_pid', $pid)->get();
          
          if(!empty($user[0]->parent_pid)){

              $all_parnt_id  = explode('-', $user[0]->parent_pid);
      
              $AllParentPid = array();
              /*update Old parent author pid*/
              foreach ($all_parnt_id as $key => $parent_pid) {
                      $AllParentPid[] = $parent_pid;
              }
            /*update New parent author pid*/
                    
             $AllParentPid[] = $newparentId;

             $response = DB::table('tbl_parent_children_id')->where('author_pid', $pid)
                                                            ->update(['parent_pid' => implode('-', $AllParentPid)]);
            if($response){
                   return true;
              }else{
                   return false;
             }

          }else{
              $response = DB::table('tbl_parent_children_id')->where('author_pid', $pid)->update(['parent_pid' =>$newparentId]);

              if($response){
                   return true;
              }else{
                   return false;
             }
          }
      } 

       /* Add Children id from website where add children form. */

     static public function add_children_id($pid, $newchildrenId)
         {  
          $user = DB::table('tbl_parent_children_id')->where('author_pid', $pid)->get();
          
          if(!empty($user[0]->children_pid)){

              $all_children_id  = explode('-', $user[0]->children_pid);

              $AllChildrenPid = array();
              /*update Old children author pid*/
              foreach ($all_children_id as $key => $children_pid) {
                      $AllChildrenPid[] = $children_pid;
              }
            /*update New children author pid*/
                    
             $AllChildrenPid[] = $newchildrenId;

             $response = DB::table('tbl_parent_children_id')->where('author_pid', $pid)
                                                            ->update(['children_pid' => implode('-', $AllChildrenPid)]);
            if($response){
                   return true;
              }else{
                   return false;
             }

          }else{
              $response = DB::table('tbl_parent_children_id')->where('author_pid', $pid)->update(['children_pid' =>$newchildrenId]);

              if($response){
                   return true;
              }else{
                   return false;
             }
          }
      } 


      /* Add collaborators id from website where add collaborators form. */

     static public function add_collaborators_id($pid, $newcollaboratorsId)
         {  
          $user = DB::table('tbl_parent_children_id')->where('author_pid', $pid)->get();
          
          if(!empty($user[0]->collaborators_id)){

              $all_collaborators_id  = explode('-', $user[0]->collaborators_id);
      
              $AllCollaboratorsPid = array();
              /*update Old collaborators author pid*/
              foreach ($all_collaborators_id as $key => $collaborators_pid) {
                      $AllCollaboratorsPid[] = $collaborators_pid;
              }
            /*update New collaborators author pid*/
                    
             $AllCollaboratorsPid[] = $newcollaboratorsId;

             $response = DB::table('tbl_parent_children_id')->where('author_pid', $pid)
                                                            ->update(['collaborators_id' => implode('-', $AllCollaboratorsPid)]);
            if($response){
                   return true;
              }else{
                   return false;
             }

          }else{
              $response = DB::table('tbl_parent_children_id')->where('author_pid', $pid)
                                                             ->update(['collaborators_id' =>$newcollaboratorsId]);

              if($response){
                   return true;
              }else{
                   return false;
             }
          }
      } 

}
  