<?php

namespace App\Http\Controllers\admin;

use Illuminate\Http\Request;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\tbl_video;
use App\Models\tbl_addjoin_us;
use App\Models\tbl_claim_profiles;

class video extends BaseController
{
    
    public function index()
    {
        $data['data'] = tbl_video::all_people_name();
        if(count($data['data']))
        {
           return view('admin/addVideo', $data);
        }
    }

    
    public function store(Request $req)
    {
        $this->validate($req, [

            'person'     => 'required', 
            'video_link' => 'required|max:100',
            'title'      => 'required',
        ]);

           $pidName      = explode("$", $req->get('person'));
           $pid          = $pidName[0]; 
           $name         = $pidName[1];     
          
          $video_link = $req->get('video_link');
          $title      = $req->get('title');
          
         $result = tbl_video::AddVodeo_link($pid, $name, $video_link, $title); 

             if(isset($result))
             {
              $req->session()->flash('success', '<div class="alert alert-success" id="success-alert">
                               <button type="button" class="close" data-dismiss="alert">x</button>
                               <strong>Success! </strong>Record successfully submited.</div>');
                return redirect('/show-video');
             }else 
             {
                $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                   <button type="button" class="close" data-dismiss="alert">x</button>
                                   <strong>Sorry! </strong>Some Error Occurred!.</div>');
                return redirect('/video');
             }
      }
    

    public function show()
    {
        $video_link['video_link'] = tbl_video::show_video_link();
       
        if(count($video_link))
        {
           return view('admin.showVideo', $video_link); 
        }
    }
   

    public function deleteVideo(Request $req)
    {
        $id=$req->id;
        $video_link = tbl_video::delete_video_link($id);

        if($video_link)
        {
            $req->session()->flash('success', '<div class="alert alert-success" id="success-alert">
                               <button type="button" class="close" data-dismiss="alert">x</button>
                               <strong>Success! </strong>Successfully records deleted.</div>');

            return redirect('/show-video');
        }else
        {
            $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                   <button type="button" class="close" data-dismiss="alert">x</button>
                                   <strong>Sorry! </strong>Some Error Occurred!.</div>');

           return redirect('/show-video');
        }
    }

    
    public function updateVideo(Request $req)
    {
        $pid           = $req->id;

    
    $data  = [
               'videoupdate' => tbl_video::update_video_link($pid),

                'video'       => tbl_video::all_people_name()
          ];
   
      if(count($data))
        {
          return view('admin.updateVideo')->with('data', $data);; 
        }else
        {
           return redirect('/show-video'); 
        }
    }

    
    public function editVideo(Request $req)
    {
        $id       =  $req->id; 
        $pidName  = explode("$", $req->get('person'));
        $pid      = $pidName[0]; 
        $name     = $pidName[1];     
          
         $video_link = $req->get('video_link');
         $title = $req->get('title');

         $recourd =[
                     'pid'         => $pid,
                     'people_name' => $name,
                     'video_name'  => $video_link,
                     'title'       => $title
                   ];

         $result = tbl_video::EditVodeo_link($id, $recourd);

         if(isset($result))
         {
            $req->session()->flash('success', '<div class="alert alert-success" id="success-alert">
                               <button type="button" class="close" data-dismiss="alert">x</button>
                               <strong>Success! </strong>Records successfully updated.</div>');
            return redirect('/show-video');
            
         }else
         {
            $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                   <button type="button" class="close" data-dismiss="alert">x</button>
                                   <strong>Sorry! </strong>Some Error Occurred!.</div>');
           return redirect('/update-video/'.$id); 
         } 

    }

    public function show_joinus(Request $req)
    {
       $joinus= tbl_addjoin_us::showjoinUs();

      /* echo "<pre>";
       print_r($joinus); exit;*/
       if(isset($joinus[0]))
       {
         return view('admin/show_joinus')->with('joinus', $joinus);
       }else
       {
        return view('/admin/show_joinus');
       }
    }

    public function delete_joinus(Request $req)
    {
        $id     = $req->id;
        $joinus = tbl_addjoin_us::delete_joinus($id);
       
       if($joinus)
       {
        $req->session()->flash('success', '<div class="alert alert-success" id="success-alert">
                               <button type="button" class="close" data-dismiss="alert">x</button>
                               <strong>Success! </strong>Successfully records deleted.</div>');
           return redirect('/show-joinus');
       }else
       {
        $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                   <button type="button" class="close" data-dismiss="alert">x</button>
                                   <strong>Sorry! </strong>Some Error Occurred!.</div>');
        return redirect('/show-joinus');
       }
    }

     // ............................. profile join us..................................

      public function show_profile_joinus(Request $req)
      {
       $joinus= tbl_claim_profiles::show_profile_joinUs();

        /* echo "<pre>";
         print_r($joinus[0]); exit;*/
       if(isset($joinus[0]))
       {
         return view('admin/show_profile_joinus')->with('joinus', $joinus);
       }else
       {
        return view('/admin/show_profile_joinus');
       }
    }

    public function delete_profile_joinus(Request $req)
    {
        $id     = $req->id;
        $joinus = tbl_claim_profiles::delete_profile_joinus($id);
       
       if($joinus)
       {
        $req->session()->flash('success', '<div class="alert alert-success" id="success-alert">
                               <button type="button" class="close" data-dismiss="alert">x</button>
                               <strong>Success! </strong>Successfully records deleted.</div>');
           return redirect('/show-profile-joinus');
       }else
       {
        $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                   <button type="button" class="close" data-dismiss="alert">x</button>
                                   <strong>Sorry! </strong>Some Error Occurred!.</div>');
        return redirect('/show-profile-joinus');
       }
    }

     public function status_approve_profile(Request $req)
    {
       $id     = $req->id;
       $recourd = tbl_claim_profiles::status_approve_check($id);
       $status = $recourd[0]->status;
              
        $to       = $recourd[0]->email;
        $subject  = "Claim your Profile";
      
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

    if(mail($to,$subject,$htmlContent,$headers)){
       $joinus = tbl_claim_profiles::status_approve_update($id, $status);
        if($joinus)
         {
              $req->session()->flash('success', '<div class="alert alert-success" id="success-alert">
                                   <button type="button" class="close" data-dismiss="alert">x</button>
                                   <strong>Success! </strong>Email has sent successfully.</div>');
              return redirect('/show-profile-joinus');
         }else
         {
           $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                   <button type="button" class="close" data-dismiss="alert">x</button>
                                   <strong>Sorry! </strong>Some Error Occurred!.</div>');
          return redirect('/show-profile-joinus');
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
