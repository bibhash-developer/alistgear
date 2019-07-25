<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\tbl_web_signin;
use App\Models\tbl_author_details;
use App\Models\Home_model; 
use App\Models\tbl_new_create_profile;  
use App\Models\Details_model;
use App\Models\tbl_citation_details; 
use App\Models\tbl_parent_children_id; 
use DB;


class SigninController extends Controller
 {

   public function create_account()
    {
        return view('create_account');
    }

     public function rudr_instagram_api_curl_connect( $api_url ){
              $connection_c = curl_init(); // initializing
              curl_setopt( $connection_c, CURLOPT_URL, $api_url ); // API URL to connect
              curl_setopt( $connection_c, CURLOPT_RETURNTRANSFER, 1 ); // return the result, do not print
              curl_setopt( $connection_c, CURLOPT_TIMEOUT, 20 );
              $json_return = curl_exec( $connection_c ); // connect and get json data
              curl_close( $connection_c ); // close connection
              return json_decode( $json_return ); // decode and return
      } 

    public function search_signup_affiliation(Request $req)
    {
        $name      = $req->name; 
        $recourd   = Home_model::search_name_affiliation($name);
        
        $address   = array();
       
        if(isset($recourd[0])){
          foreach($recourd as $recourd2) { 
            $address[] = $recourd2->address;
          }          
        ?>
            <ul id="country-list" class="country_width">
                <?php foreach(array_unique($address) as $recourd2) { ?>
                <li onClick="select_affiliation_name('<?php echo $recourd2; ?>');">
                  <?php echo $recourd2; ?>
                </li><?php } ?>
            </ul><?php
       }
    } /*  End Search Affiliation. */

    public function search_affiliation(Request $req)
    {
        $name      = $req->name; 
        $top       = $req->top; 
        $botton    = $req->botton; 
        $recourd   = Home_model::search_name_affiliation($name);
        
        $address   = array();
       
        if(isset($recourd[0])){
          foreach($recourd as $recourd2) { 
            $address[] = $recourd2->address;
          }          
        ?>
            <ul id="country-list" class="country_width">
                <?php foreach(array_unique($address) as $recourd2) { ?>
                <li onClick="select_form_affiliation('<?php echo $top; ?>','<?php echo $botton; ?>','<?php echo $recourd2; ?>');">
                  <?php echo $recourd2; ?>
                </li><?php } ?>
            </ul><?php
       }
    } /*  End Search Affiliation. */

  
    public function register_submit(Request $req)
     {
      $this->validate($req,[ 
                            'affiliation' => 'required',
                            'email'     => 'required',
                            'fullname'  => 'required',
                            'password'  => 'required',
                            'con-pass'  => 'required',
                           ],[
                            'affiliation.required'  => 'Please Enter Affiliation.',
                            'email.required'        => 'Please Enter Email Id.',
                            'fullname.required'     => 'Please Enter Full Name.',
                            'password.required'     => 'Please Enter Password.',
                            'con-pass.required'     => 'Please enter Confirm Password.',
                          ]);

           $name          = trim($req->get('fullname'));
           $affiliation   = $req->get('affiliation');
           $password      = trim($req->get('password'));
           $conf_password = trim($req->get('con-pass'));

              
            if($password == $conf_password) {

               if($req->get('g-recaptcha-response') && !empty($req->get('g-recaptcha-response'))){ 
                    // Google reCAPTCHA API secret key 
                    $secretKey = '6LdhM6IUAAAAAHi6PnSWMs2aASlE9HElW0QrC-C0'; 
             
                   // Verify the reCAPTCHA response 
                  $verifyResponse = file_get_contents('https://www.google.com/recaptcha/api/siteverify?secret='.$secretKey.'&response='
                    .$_POST['g-recaptcha-response']);
                  // Decode json data 
                  $responseData = json_decode($verifyResponse); 
                   // If reCAPTCHA response is valid 
                  if($responseData->success){ 
                    
                     $claim_profile = tbl_web_signin::where(['email' =>$req->get('email')])->first();
                     if(empty($claim_profile)){
                         $data_record = tbl_web_signin::check_register_filed($affiliation, $name);
                         if(empty($data_record)){

                             $check_author = tbl_author_details::check_author_fields($affiliation, $name); 
                             
                              if(!empty($check_author->pid)){

                                   $data = [
                                             'pid'           => $check_author->pid,
                                             'name'          => trim($req->get('fullname')),
                                             'address'       => trim($req->get('affiliation')),
                                             'email'         => trim($req->get('email')),
                                             'password'      => trim($req->get('password')),
                                             'conf_password' => trim($req->get('con-pass')),
                                             'status'        =>1,
                                            ];
                                   $record = tbl_web_signin::add_register_record($data);
                                    if(!empty($record)){
                                          $req->session()->put('account_pid', $record);
                                          $req->session()->put('name', $req->get('fullname'));
                                          $req->session()->put('address', $req->get('affiliation'));

                                          $req->session()->put('account_pid', $record);
                                       $req->session()->flash('success', 'Your Account Has Been Successfully.');  
                                       //return redirect('/claim-account');
                                       return redirect('/profile-details-page');
                                     }
                              }else{

                                  $data = [
                                             'pid'           => substr(md5(rand()),0, 7),
                                             'name'          => trim($req->get('fullname')),
                                             'address'       => trim($req->get('affiliation')),
                                             'email'         => trim($req->get('email')),
                                             'password'      => trim($req->get('password')),
                                             'conf_password' => trim($req->get('con-pass')),
                                             'status'        =>1,
                                            ];
                                   $record_save = tbl_web_signin::add_register_record($data);
                                    if(!empty($record_save)){
                                          $req->session()->put('account_pid', $record_save);
                                         $req->session()->flash('success', 'Your Account Has Been Successfully.');  
                                         return redirect('/create-profile');
                                    }
                                  }
                            }else{
                                 $req->session()->flash('error', 'Your Account Has Already Created!.');
                                 return redirect('/create-account');
                               }
                       
                        }else{
                               $req->session()->flash('error', 'This Your Email Id Already Registered!.');
                               return redirect('/create-account');
                             }
                      } 

                  }else{
                        $req->session()->flash('error', 'Please Select RECaptcha!.');
                        return redirect('/create-account');
                    } /*End reCAPTCHA response*/
            }else{
                       $req->session()->flash('error', 'Those passwords did not match. Try again!.');
                       return redirect('/create-account');
              }
     }  /*  End Created Account. */

             
     
    public function claim_account(Request $req){

            $data  = tbl_web_signin::where(['pid' =>$req->session()->get('account_pid')])->first();
            return view('claim_account')->with(['data' => $data]);
     }

     public function create_profile(Request $req){

            $personal_data  = tbl_web_signin::where(['pid' =>$req->session()->get('account_pid')])->first();
            $country_data  =  DB::table('countries')->get();
            $data[] = $personal_data;
            $data[] = $country_data;

             return view('create_profile')->with(['data' => $data]);
     }

            /*  Fetch All State Name With Country Id. */

     public function fetch_state_name(Request $req){
            
           
            //echo $req->country_id;
            $all_state  =  DB::table('states')->where('country_id', $req->country_id)->get();
            /*echo "<pre>@@";
            print_r($all_state);*/
            foreach ($all_state as $key => $value) { ?>
              <option value="<?php echo $value->name; ?>"><?php echo $value->name; ?></option>;
          <?php  }
            
     }
     
       /*  Created Profile. */

     public function create_profile_sub(Request $req)
      {
          
        $create_profile = [
                             'pid'            => session()->get('account_pid'),
                             'university'     => $req->univ,
                             'uni_department' => $req->dep,
                             'topicarea'      =>  $req->topa, 
                             'company'        =>  $req->company,
                             'jobtitle'       =>  $req->jobtitle,
                             'com_department' => $req->com_dep,
                             'github'         => $req->giturl
                         ];

       $create_new_user    = tbl_web_signin::where('pid', session()->get('account_pid'))->first();
              
       $tbl_author_details = [
                            'pid'        => session()->get('account_pid'),
                            'name'       => $create_new_user->name,
                            'address'    => $create_new_user->address,
                            'city'       => $req->city,
                            'state'      => $req->state,
                            'country'    => $req->country,
                            'website_link'  => $req->weburl,
                          ];

             $recourd1 = tbl_author_details::InsertAuthorDetails($tbl_author_details);
             $recourd2 = tbl_new_create_profile::addCreateProfile($create_profile);
             $recourd3 = tbl_parent_children_id::insert(['author_pid' =>session()->get('account_pid')]);


             if(!empty($recourd1) && !empty($recourd2))
              {
                 $req->session()->flash('success', 'Records has successfully submit.');

                    $pid = session()->get('account_pid'); $req->session()->put('SignIn_pid', $pid);
                    //$req->session()->forget('account_pid');

                    return redirect('/profile-details-page');
              }else{
                   $req->session()->flash('error', 'Some Error Occurred!.');
                  return redirect('/create-profile');
               }
       }  /*  End Created Profile.*/


      public function login(){ 

          return view('login');
       }

       public function check_profile(Request $req){ 
           
           $pid = substr(md5(rand()),0, 7);
           $create_new_user  = tbl_web_signin::where('pid', session()->get('account_pid'))->update(['pid' => $pid]);
           $req->session()->flush('account_pid');
           $req->session()->put('account_pid', $pid); 

           return redirect('/create-profile');
      }




     public function login_submit(Request $req)
      {
        $this->validate($req,
                  ['password'  => 'required',
                   'email'     => 'required',
                  ],[
                    'password.required'   => 'Please Enter Password.',
                    'email.required'      => 'Please Enter Email Id.',
                  ]);
    
                 $email     = trim($req->get('email'));
                 $password  = trim($req->get('password'));

                 $check_login_status = tbl_web_signin::where(['email' => $email, 'password' => $password])->first();  

             if(!empty($check_login_status)){
                        
                        $pid = $check_login_status->pid;
                        $req->session()->put('SignIn_pid', $check_login_status->pid);
                        //echo "message".session()->get('SignIn_pid'); exit;
                        $req->session()->flash('success', 'Login has successfully.');
                        return redirect('/profile-details');
               }else{
                     $req->session()->flash('error', 'Some Error Occurred!.');
                     return redirect('/signIn');
             }
   }

  public function login_out(Request $request)
    {
      //unset(session()->get('login_pid')); 
      $request->session()->forget(['login_pid', 'name', 'SignIn_pid', 'account_pid']);  
      /*$request->session()->forget('username');
      $request->session()->forget('SignIn_pid');
      $request->session()->forget('account_pid'); */
      $request->session()->flush();

      return redirect('/signIn');
    }

   public function ForgetPassword()
   {
     return view('forgetpass');
   }
   
     /*  ----- submit password  ------*/

       public function submit_link(Request $req)
       {

        $this->validate($req,[ 
                                'email' => 'required',
                               ],[
                                'email.required'  => 'Please enter Email Id.',
                              ]);


        $email       = trim($req->get('email'));
        $data_record = tbl_web_signin::forgetpassword($email);
        
        $uid = base64_encode($data_record);
        
        if($email != $data_record)
        {
          session()->flash('error' , 'Your Email Id Does not Match');
          return redirect('/forgetPassword');
        }
        else 
        { 
               
            $to           = $email;

            $subject      = " FORGOT PASSWORD";

            $headers      = "MIME-Version: 1.0" . "\r\n";
            $headers     .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
            $headers     .= 'From: alistgear@gmail.com' . "\r\n" ."Reply-To: successive.testing@gmail.com" . "\r\n" 
            ."X-Mailer: PHP/";
            //$headers     .= "Bcc:". $to . "\r\n";
            $headers     .= "MIME-Version: 1.0\r\n";
            $headers     .= "Content-type: text/html\r\n";

            $htmlContent  = '<html><body>';
            $htmlContent  = "<div style='margin-left: 90px;'>------- FORGOT PASSWORD ------- <div>";
            $htmlContent .= '<table rules="all" style="border-color: #666;" cellpadding="10">';

            $htmlContent .= "<tr style='background: #eee;'><td><strong>
                              Reset Password:</strong> </td><td><a href='http://alistgear.com/forgetPasswords/$uid' target='_blank'>
                               http://alistgear.com/forgetPasswords/$uid</a></td></tr>";    
            $htmlContent  .= "</table>";
            $htmlContent  .= "</body></html>";
                         
                          
            if(mail($to,$subject,$htmlContent,$headers))
            {

                 session()->flash('success' , 'Check Your Mail Box');

                  return redirect('/forgetPassword');
            }else
            {
                  $req->session()->flash('error', '<div class="alert alert-danger" id="success-alert">
                                                          <button type="button" class="close" data-dismiss="alert">x</button>
                                                          <strong>Sorry! </strong><b>Email sending fail!.</b>
                                                         </div>');
                  return redirect('/forgetPassword');
            }
        }

       }  
   
     public function ChangePassword($uid)
       {
        return view('changepassword',compact('uid'));
       }

        /*  ----- Change password  ------*/

       public function change_password(Request $req)
        {
          $this->validate($req,[ 
                                'Cpassword' => 'required',
                                'Conpassword' => 'required',
                               ],[
                                'Cpassword.required'  => 'Please enter Change Password.',
                                'Conpassword.required'  => 'Please enter Confirm Password.',
                        ]);
      
            $uid     = trim($req->post('uid'));
            $email   = base64_decode($uid);

            $password        = trim($req->post('Cpassword'));
            $confirmpass     = trim($req->post('Conpassword'));

            if($password == $confirmpass) 
            {
              $data_record = tbl_web_signin::resetpassword($email,$password,$confirmpass);

                if($data_record){

                     session()->flash('success' , 'Password Reset Sucuessfully');
                     return redirect('/forgetPasswords/'.$uid);
                }else{
                     session()->flash('error' , 'Please try to check email id and password!');
                     return redirect('/forgetPasswords/'.$uid);
                }

            }else {

              session()->flash('error' , 'Password Did Not Match');

              return redirect('/forgetPasswords/'.$uid);
            }
        }
}
