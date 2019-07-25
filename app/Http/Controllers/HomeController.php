<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Home_model;
use App\Models\tbl_video;
use App\Models\tbl_addjoin_us;
use App\Models\tbl_dispute_profile;
use App\Models\Details_model;
use App\Models\tbl_claim_profiles;
use App\Models\tbl_country;
use App\Models\My_profile_details;
use App\Models\tbl_new_create_user;
use App\Models\tbl_web_signin;
use App\Models\tbl_author_details;

class HomeController extends Controller  
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */


    public function home_details()
    {
    
          return view('home');
    }





  public function index(Request $req)
    {
         $id   = trim($req->pid);
         $id   = explode("=", $id);
         
    $data = array(
             'author'       => Home_model::home_author(), 

             'collaborators' => Home_model::collaborators(),

             'videos'        => tbl_video::show_video_link(),

             'publications'  => Home_model::publications()
        );

       return view('home1')->with('data', $data);
    }

  public function joinus()
   {
    $country = Home_model::country();

        if($country[0])
        {
         return view('joinus')->with('country', $country);
        }else
        {
            return redirect('/');
        }
   }

   public function state(Request $req)
   {
     $id  = $req->id;
     $state = Home_model::state($id);

     if($state[0])
        {
            foreach ($state as $key => $value) {
              echo '<option value="'.$value->state_name.'">'.
               $value->state_name; '.</option>';
              
            }
        }else
        {
            return redirect('/');
        }
   }

   public function addjoinus(Request $req)
   {
    /*echo $req->input('country');
    exit;*/
     $this->validate($req,
             [
             'name'         => 'required',
             'country'      => 'required',
             'affiliation'  => 'required',
             'email'        => 'required',
             'areaOi'       => 'required',
             'company'      => 'required',
             'city'         => 'required',
             ]
         );
             if($req->input('homepage'))
             {
                $homepage = $req->input('homepage');
             }else
             {
               $homepage = "0";
             }
    $data = array(
             'country'    => $req->input('country'),
             'state'      => $req->input('state'),
             'name'       => $req->input('name'),
             'affiliation'=> $req->input('affiliation'),
             'email'      => $req->input('email'),
             'areaOinterest' => $req->input('areaOi'),
             'company'    => $req->input('company'),
             'city'       => $req->input('city'),
             'homepage'   => $homepage,
             );

        $to      = $req->input('email');
        $subject = "---------- Join Us ---------";
      
        $headers = "MIME-Version: 1.0" . "\r\n";
        $headers .= "Content-type:text/html;charset=UTF-8" . "\r\n";
        //$headers .= 'From: dkthakur870@gmail.com' . "\r\n";

        $htmlContent = '<html><body>';
        $htmlContent = "<div style='margin-left: 90px;'>------- Join Us ------- <div>";
        $htmlContent .= '<table rules="all" style="border-color: #666;" cellpadding="10">';

        $htmlContent .= "<tr style='background: #eee;'><td><strong>
                          Name:</strong> </td><td>" . $req->input('name') . "</td></tr>";

        $htmlContent .= "<tr style='background: #eee;'><td><strong>country :
                        </strong> </td><td>" . $req->input('country') . "</td></tr>";

        $htmlContent .= "<tr style='background: #eee;'><td><strong>State :</strong> </td>
                        <td>" . $req->input('state') . "</td></tr>";

        $htmlContent .= "<tr style='background: #eee;'><td><strong>Affiliation :
                        </strong> </td><td>" . $req->input('affiliation') . "</td></tr>";

        $htmlContent .= "<tr><td><strong>Email:</strong> </td><td>" . $req->input('email') . "</td>
                        </tr>";
        $htmlContent .= "<tr><td><strong>Areas of interest:</strong> </td><td>" . 
                        $req->input('areaOi') . "</td></tr>";

        $htmlContent .= "<tr><td><strong>Homepage :</strong> </td><td>" . 
                        $req->input('homepage') . 
                        "</td></tr>";
        $htmlContent .= "<tr><td><strong>Company affiliation:</strong> </td><td>" . 
                        $req->input('company') . "</td></tr>";

        $htmlContent .= "<tr><td><strong> City:</strong> </td><td>" . 
                        $req->input('city') ."</td></tr>";
                    
        $htmlContent .= "</table>";
        $htmlContent .= "</body></html>";
        $headers    .= "Bcc:". $req->input('email') . "\r\n";
        
      if(mail($to,$subject,$htmlContent,$headers)){
       $recourd = tbl_addjoin_us::addjoinUs($data);

       if($recourd)
              {
             $req->session()->flash('success', '<div class="alert alert-success" id="success-alert">
                                 <button type="button" class="close" data-dismiss="alert">x</button>
                            <strong>Success! </strong><b>Records has sent successfully on email id.</b>
                                  </div>');
                return redirect('/joinus');
              }else
                {
                   $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                    <button type="button" class="close" data-dismiss="alert">x</button>
                                     <strong>Sorry! </strong><b>Some Error Occurred!.</b></div>');
                  return redirect('/joinus');
                }
             
           }
           else
           {
           $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                              <button type="button" class="close" data-dismiss="alert">x</button>
                               <strong>Sorry! </strong><b>Email sending fail!.</b></div>');
              return redirect('/joinus');
           }
        }

    public function show_profile(Request $req)
    {
       session()->put('pid1', $req->pid);
      return redirect('/view-profile');
    }

    public function view_profile(Request $req)
    {
        $pid = session()->get('pid1');
        $data = array(
                  'personalRecourd'     => Details_model::details_author($pid),
                   'educationalLineage'  => Details_model::educational_lineage($pid), 
                   'collaborators'       => Details_model::collaborators($pid), 
                   'videos'              => Details_model::show_video($pid),
                   'publications'        => Details_model::publications($pid)
              );
         if(isset($data['personalRecourd']))
         {
           return view('details')->with('data', $data);
         }else
          {
              return redirect('/');
          }
     }

                   /*  Create New User Parth   */
                   
     public function add_new_user(Request $req){
      
         $getUserName = tbl_web_signin::where('pid', session()->get('login_pid'))->first();

         if(!empty($getUserName)){
          return view('create_new_user')->with('getUserName', $getUserName);
         }else{
          return redirect("/signIn");
         }
         
     }

     public function create_page(Request $req)
      {

        if($req->input('unv_record') == 'Yes' && $req->input('company_record') == 'Yes'){
            $this->validate($req,
                                 [
                                 'university'      => 'required',
                                 'uni_department'  => 'required',
                                 'topicarea'       => 'required',
                                 'company'         => 'required',
                                 'jobtitle'        => 'required',
                                 'com_department'  => 'required',
                                 'city'            => 'required',
                                 'state'           => 'required',
                                 'country'         => 'required',
                                 'per_web'         => 'required',
                                 'github'          => 'required',
                           ]);

        } elseif($req->input('company_record') == 'Yes') {
          $this->validate($req,
                                 [
                                  'company'         => 'required',
                                  'jobtitle'        => 'required',
                                  'com_department'  => 'required',
                                  'city'            => 'required',
                                  'state'           => 'required',
                                  'country'         => 'required',
                                  'per_web'         => 'required',
                                  'github'          => 'required',
          ]);

        } elseif($req->input('unv_record') == 'Yes') {
           $this->validate($req,
                                 [
                                 'university'      => 'required',
                                 'uni_department'  => 'required',
                                 'topicarea'       => 'required',
                                 'city'            => 'required',
                                 'state'           => 'required',
                                 'country'         => 'required',
                                 'per_web'         => 'required',
                                 'github'          => 'required',
          ]);
        }else{
          $this->validate($req,
                                 [
                                 'city'            => 'required',
                                 'state'           => 'required',
                                 'country'         => 'required',
                                 'per_web'         => 'required',
                                 'github'          => 'required',
          ]);
        }

          
         //$university = implode("-",$req->input('university'));
         //$company    = implode("-",$req->input('company'));

        if(!empty($req->input('university'))){
          $university = $req->input('university');
           
        }else{
          $university = 'NULL';
        }

        if(!empty($req->input('uni_department'))){
          $uni_department = $req->input('uni_department');
           
        }else{
          $uni_department = 'NULL';
        }

        if(!empty($req->input('topicarea'))){
          $topicarea = $req->input('topicarea');
           
        }else{
          $topicarea = 'NULL';
        }
        
        if(!empty($req->input('company'))){
          $company = $req->input('company');
           
        }else{
          $company = 'NULL';
        }

         if(!empty($req->input('jobtitle'))){
          $jobtitle = $req->input('jobtitle');
           
        }else{
          $jobtitle = 'NULL';
        }

         if(!empty($req->input('com_department'))){
          $com_department = $req->input('com_department');
           
        }else{
          $com_department = 'NULL';
        }

                    
        $tbl_new_page = array(
                             'pid'         => $req->input('pid'),
                             'help_us'     => $req->input('selector'),
                             'university'  => $university,
                             'uni_department'  => $uni_department,
                             'topicarea'   => $topicarea,
                             'aiml'        => $req->input('aiml'),
                             'company'     => $company,
                             'jobtitle'    => $jobtitle,
                             'com_department' => $com_department,
                             'per_website' => $req->input('per_web'),
                             'github'      => $req->input('github'),
                       );

               
         $create_new_user    = tbl_web_signin::where('pid', $req->input('pid'))->first();

         if(!empty($create_new_user->pid)){

         $tbl_author_details = [
                                'pid'        => $req->input('pid'),
                                'name'       => $create_new_user->name,
                                'address'    => $create_new_user->address,
                                'city'       => $req->input('city'),
                                'state'      => $req->input('state'),
                                'country'    => $req->input('country'),
                                'website_link'  => 'NULL',
                                'area'          => 'NULL',
                                'image_name'    => 'NULL',
                              ]; 
             //print_r($tbl_author_details); exit;
            $create_new_user    = tbl_author_details::where('pid', $req->input('pid'))->first();
           //echo $create_new_user; exit;
            if(empty($create_new_user)){
        
             $recourd1 = tbl_author_details::InsertAuthorDetails($tbl_author_details);
             $recourd2 = tbl_new_create_user::addCreatePage($tbl_new_page);
             $recourd3 = tbl_web_signin::where(['pid' =>$req->input('pid')])->update(['status' =>1]);

             if(!empty($recourd1) && !empty($recourd2))
              {
                 $req->session()->flash('success', '<div class="alert alert-success" id="success-alert">
                                       <button type="button" class="close" data-dismiss="alert">x</button>
                                       <strong>Success! </strong><b>Records has successfully submit.</b>
                                      </div>');
                    return redirect('/');
              }else{
                   $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                    <button type="button" class="close" data-dismiss="alert">x</button>
                                     <strong>Sorry! </strong><b>Some Error Occurred!.</b></div>');
                  return redirect('/add_new_author');
                }
              }else{
                $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                    <button type="button" class="close" data-dismiss="alert">x</button>
                                     <strong>Sorry! </strong><b>Your record already exist!.</b></div>');
                  return redirect('/');
              }

             }else{
              return redirect('/signUp');
             }
          }
}
