<?php

namespace App\Models;
use Illuminate\Database\Eloquent\Model;
use DB;

class tbl_claim_profiles extends Model
{
    protected $fillable = ['pid','name', 'email','description','status'];
    protected $table    = "tbl_claim_profiles";
    public $timestamps  = false;

    static public function add_claim_profile($data)
     {
        $joinus = New tbl_claim_profiles($data);
  
        if($joinus->save())
        {
            return true;
        }
    }

      static public function show_profile_joinUs()
      {
        $joinus = DB::table('tbl_claim_profiles')
                                 ->select('tbl_claim_profiles.email','tbl_claim_profiles.pid',
                                          'tbl_claim_profiles.description',
                                          'tbl_claim_profiles.status','tbl_claim_profiles.name',
                                          'tbl_claim_profiles.id')
                                 ->orderBy('tbl_claim_profiles.id', 'desc')
                                 ->get();
  
        if(isset($joinus))
        {
            return $joinus;
        }else
        {
           return false;
        }
    }

    static public function delete_profile_joinus($id)
    {
       $data = DB::table('tbl_claim_profiles')->where('id', $id)
                                              ->delete();
      if($data)
      {
        return true;
      }else
      {
        return false;
      }
    }

  static public function status_approve_check($id)
    {
       $data = DB::table('tbl_claim_profiles')->where('id', $id)
                                              ->get();
      if($data)
      {
        return $data;
      }else
      {
        return false;
      }
    }

  static public function status_approve_update($id, $status)
    {
       if($status == 0)
       {
          $result = DB::table('tbl_claim_profiles')->where('id', $id)->update(['status' =>1, 
            'description' => ' Your profile is approved. Now you can review your profile.']);
       }else
       {
          $result = DB::table('tbl_claim_profiles')->where('id', $id)->update(['status' =>0, 
             'description' =>'Thank you providing your email. We will review your profile and approve ASAP.']);
       }
                                                  
      if($result)
      {
        return true;
      }else
      {
        return false;
      }
    }

  static public function check_profile_joinus($pid)
    {
       $data = DB::table('tbl_claim_profiles')->where('pid', $pid)
                                              ->select('*')
                                              ->get();
    if(isset($data[0]))
      {
         /*echo "<pre>";
         print_r($data[0]); exit;*/
        return true;
      }else
      {
        return false;
      }
    }
   static public function all_check_profile_joinus($email)
    {
       $data = DB::table('tbl_claim_profiles')->where('email', $email)
                                              ->select('*')
                                              ->get();
    if(isset($data[0]))
      {
        return true;
      }else
      {
        return false;
      }
    }
     static public function all_check_dispute_profile($email)
    {
       $data = DB::table('tbl_dispute_profile')->where('email', $email)
                                              ->select('*')
                                              ->get();
    if(isset($data[0]))
      {
        return true;
      }else
      {
        return false;
      }
    }
}
