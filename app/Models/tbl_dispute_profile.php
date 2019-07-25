<?php
namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_dispute_profile extends Model
{
    protected $fillable = ['pid','name', 'email','description','status'];
    protected $table    = "tbl_dispute_profile";
    public $timestamps  = false;

      static public function add_dispute_profile($data)
      {
        $result = New tbl_dispute_profile($data);
        if($result->save())
        {
           return $result;
        }
       
      }

      static public function pid_check_record($pid)
      {
         $result = DB::table('tbl_dispute_profile')->where('pid', $pid)
                                                   ->get();
        if(isset($result[0]))
        {
           return $result[0];
        }else{
           return false;
        }
      }

      static public function show_dispute_record()
      {
         $result = DB::table('tbl_dispute_profile')->orderBy('id', 'DESC')
                                                   ->get();                                          
        if(isset($result[0]))
        {
           return $result;
        }else{
           return false;
        }
      }

      static public function delete_dispute_profile($id)
      { 
        $result = DB::table('tbl_dispute_profile')->where('id', $id)->delete();
                                                                                             
        if($result)  
        {
           return true;
        }else{
           return false;
        }
      }

      static public function status_approve_check_dispute($id)
      { 
        $result = DB::table('tbl_dispute_profile')->where('id', $id)
                                                  ->get();
                                                                                             
        if(isset($result[0])) 
        {
           return $result[0];
        }else{
           return false;  
        }
      }
      static public function status_dispute_update($id, $status)
    {
       if($status == 0)
       {
          $result = DB::table('tbl_dispute_profile')->where('id', $id)->update(['status' =>1]);
       }else
       {
          $result = DB::table('tbl_dispute_profile')->where('id', $id)->update(['status' =>0]);
       }
                                                  
      if($result)
      {
        return true;
      }else
      {
        return false;
      }
    }
}
