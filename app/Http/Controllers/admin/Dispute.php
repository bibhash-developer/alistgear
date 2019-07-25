<?php

namespace App\Http\Controllers\admin;
use Illuminate\Http\Request;
use App\Models\tbl_dispute_profile;

class Dispute extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index(Request $req)
    {
       $recourds['recourds'] = tbl_dispute_profile::show_dispute_record();
       return view('admin/show_dispute_profile')->with('recourds', $recourds['recourds']);
    }

      public function delete_dispute_profile(Request $req)
    {
        $id     = $req->id;
        $recourds = tbl_dispute_profile::delete_dispute_profile($id);
       if($recourds)
       {
        $req->session()->flash('success', '<div class="alert alert-success" id="success-alert">
                               <button type="button" class="close" data-dismiss="alert">x</button>
                               <strong>Success! </strong>Successfully records deleted.</div>');
           return redirect('/show-dispute-profile');
       }else
       {
        $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                   <button type="button" class="close" data-dismiss="alert">x</button>
                                   <strong>Sorry! </strong>Some Error Occurred!.</div>');
        return redirect('/show-dispute-profile');
       }
    }

     public function status_dispute_profile(Request $req)
     {
       $id      = $req->id;
       $recourd = tbl_dispute_profile::status_approve_check_dispute($id);
       /*echo "<pre>";
       print_r($recourd); exit;*/
        $status   = $recourd->status;      
        $to       = $recourd->email;
        $subject  = "Show Dispute Profile";
      
        $headers  = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
        //$headers .= 'From: dkthakur870@gmail.com' . "\r\n";

        $htmlContent = '<html><body>';
        $htmlContent = "<div style='margin-left: 90px;'>Claim your Profile <div>";
        $htmlContent .= '<table rules="all" style="border-color: #666;" cellpadding="10">';
    if($status == 0)
        { 
        $htmlContent .= "<tr style='background: #eee;'><td><strong>
                               Your profile is approved. Now you can review your profile.</strong> 
                               </td></tr>"; 
        }else
          {
        $htmlContent .= "<tr style='background: #eee;'><td><strong>Thank you providing your 
                                  email. We will review your profile and approve ASAP.</strong> 
                               </td></tr>"; 
          }         
        $htmlContent .= "</table>";
        $htmlContent .= "</body></html>";
        $headers    .= "Bcc:". $req->input('email') . "\r\n";

    if(mail($to,$subject,$htmlContent,$headers))
     {
       $joinus = tbl_dispute_profile::status_dispute_update($id, $status);
        if($joinus)
         {
            $req->session()->flash('success', '<div class="alert alert-success" id="success-alert">
                                   <button type="button" class="close" data-dismiss="alert">x</button>
                                   <strong>Success! </strong>Email has sent successfully.</div>');
            return redirect('/show-dispute-profile');
         }else
         {
           $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                   <button type="button" class="close" data-dismiss="alert">x</button>
                                   <strong>Sorry! </strong>Some Error Occurred!.</div>');
           return redirect('/show-dispute-profile');
         }
     }else
       {
          $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                   <button type="button" class="close" data-dismiss="alert">x</button>
                                   <strong>Sorry! </strong>Email sending fail!.</div>');
         return redirect('/show-profile-joinus');
       }
    }
}
