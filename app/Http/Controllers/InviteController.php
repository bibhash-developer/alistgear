<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Details_model;
use App\Models\Home_model;
use App\Models\tbl_video;
use App\Models\tbl_claim_profiles;
use App\Models\tbl_country;
use App\Models\My_profile_details;
use DB; 

class InviteController extends Controller
{
  public function index()
    {
        return view('/invite');
    } 

    public function add_invite(Request $req)
    {
      $this->validate($req,
             [
              'fname' => 'required',
              'lname' => 'required',
              'email' => 'required',
             ],
             [
              'fname.required' => 'Please Enter First Name.',
              'lname.required' => 'Please Enter Last Name.',
              'email.required' => 'Please Enter Email Id.',
            ]
         );       
        
        $email      = $req->input('email');
        $firstname  = $req->input('fname');
        $lastname   = $req->input('lname');
       if($email)
        {
        $to       = $email;
        $subject  = "Invite Profile";
      
        $headers  = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
        //$headers .= 'From: dkthakur870@gmail.com' . "\r\n";

        $htmlContent = '<html><body>';
        $htmlContent = "<div style='margin-left: 90px;'>Invite Profile <div>";
        $htmlContent .= '<table rules="all" style="border-color: #666;" cellpadding="10">';
        $htmlContent .= "<tr><td><strong>First Name:</strong> </td><td>" . $firstname . "</td></tr>";
        $htmlContent .= "<tr><td><strong>First Name:</strong> </td><td>" . $lastname . "</td></tr>";
        $htmlContent .= "<tr style='background: #eee;'><td><strong>
                        Thank you. You Have Applied For Invite My Profile .</strong></td></tr>";          
        $htmlContent .= "</table>";
        $htmlContent .= "</body></html>";
        $headers    .= "Bcc:". $req->input('email') . "\r\n";
        
        
      if(mail($to,$subject,$htmlContent,$headers)){
                  $req->session()->flash('success', '<div class="alert alert-success custem-success" id="success-alert">
                    <button type="button" class="close" data-dismiss="alert">x</button>
                    <strong>Success! </strong><b>Email has sent successfully.</b></div>');
                   return redirect('/invite');
              }else
              { 
                 $req->session()->flash('error', '<div class="alert alert-danger custem-error" id="success-alert">
                  <button type="button" class="close" data-dismiss="alert">x</button>
                 <strong>Sorry! </strong> <b>Some Error Occurred!.</b></div>');
                return redirect('/invite');
              }
            }
      } 
}   
  
