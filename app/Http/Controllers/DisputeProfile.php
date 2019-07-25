<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\tbl_dispute_profile;
use App\Models\Home_model;
use App\Models\tbl_claim_profiles;

class DisputeProfile extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function dispute_profile(Request $req)
    {
       $pid = $req->pid; 
       $req->session()->put('pid', $pid);
       return redirect('dispute-profile-pid');
    }
    
    public function dispute_profile_pid(Request $req)
    {
        $pid = $req->session()->get('pid');
        return view('dispute_profile')->with('pid', $pid);  
    }

    public function add_dispute_profile(Request $req)
    {
        $this->validate($req,
             ['email' => 'required', 'desc' => 'required'],
             ['email.required' => 'Please Enter email id.',
              'desc.required' => 'Please Enter description.']
         );       
        
         $email = $req->input('email');
         $desc  = $req->input('desc');
         $pid   = $req->input('pid');

    if(isset($pid))
       {
        $all_check_dispute_claim = tbl_claim_profiles::all_check_dispute_profile($email);
        if(!$all_check_dispute_claim){

       	 $disputerecourd = tbl_dispute_profile::pid_check_record($pid);
      if(!$disputerecourd)
       	 {
           $name       = Home_model::search_singlepid($pid);
           $data = array(
                       'pid'         => $pid,
                       'name'       => $name->children_name,
                       'email'       => $email,
                       'description' => $desc,
                      );

	        $to       = $email;
	        $subject  = "Claim Dispute Profile";
	      
	        $headers  = "MIME-Version: 1.0" . "\r\n";
	        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
	        //$headers .= 'From: dkthakur870@gmail.com' . "\r\n";

	        $htmlContent = '<html><body>';  
	        $htmlContent = "<div style='margin-left: 90px;'>Dispute Profile <div>";
	        $htmlContent .= '<table rules="all" style="border-color: #666;" cellpadding="10">';

	        $htmlContent .= "<tr style='background: #eee;'><td><strong>". $desc ."
	                        </strong> </td></tr>";          
	        $htmlContent .= "</table>";
	        $htmlContent .= "</body></html>";
	        $headers    .= "Bcc:". $req->input('email') . "\r\n";
        if(mail($to,$subject,$htmlContent,$headers)){
           
            $response = tbl_dispute_profile::add_dispute_profile($data);
             
            if($response)
              {
                  //$req->session()->forget('pid');
                  $req->session()->flash('success', '<div class="alert alert-success custem-success1" id="success-alert">
                    <button type="button" class="close" data-dismiss="alert">x</button>
                    <strong>Success! </strong><b>Email has sent successfully.</b></div>');
                   return redirect('/dispute-profile-pid');
              }else
              {  //$req->session()->forget('pid');
                 $req->session()->flash('error', '<div class="alert alert-danger custem-error1" id="success-alert">
                  <button type="button" class="close" data-dismiss="alert">x</button>
                 <strong>Sorry! </strong> <b>Some Error Occurred!.</b></div>');
                return redirect('/dispute-profile-pid');
              }
            }else{
                //$req->session()->forget('pid');
                $req->session()->flash('error', '<div class="alert alert-danger custem-error1" id="success-alert">
                 <button type="button" class="close" data-dismiss="alert">x</button>
                 <strong>Sorry! </strong> <b>Email sending fail!.</b></div>');
                return redirect('/dispute-profile-pid');
               }
            }else{
                //$req->session()->forget('pid');
                $req->session()->flash('error', '<div class="alert alert-danger custem-error1" id="success-alert">
                <button type="button" class="close" data-dismiss="alert">x</button>
                <strong>Sorry! </strong> <b>You have already Dispute.</b></div>');
                return redirect('/dispute-profile-pid');
               }

              }else{
                $req->session()->flash('error', '<div class="alert alert-danger custem-error1" id="success-alert">
                <button type="button" class="close" data-dismiss="alert">x</button>
                <strong>Sorry! </strong> <b>This Email Id Has Already Exist.</b></div>');
                return redirect('/dispute-profile-pid');
               }
           }else{
               $req->session()->flash('error', '<div class="alert alert-danger custem-error1" id="success-alert">
                <button type="button" class="close" data-dismiss="alert">x</button>
               <strong>Sorry! </strong> <b>Please select the author name.</b></div>');
                return redirect('/');
             }
    }
}

 ?>