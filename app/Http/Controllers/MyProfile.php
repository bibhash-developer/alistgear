<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\My_profile_details;
use App\Models\Home_model;

class MyProfile extends Controller
{
    public function profile()
    {
        return view('profile');
    }
    
   public function my_profile(Request $req)
    {
      
         $fname       = trim($req->fname);
         $lname       = trim($req->lname);
         $allprofile  = My_profile_details::search_name($fname, $lname);
         $records     = array();
    foreach($allprofile as $value)
        {
         if(!in_array($value, $records))
          {
            $records[] =$value;
          }
        }
   
          ?>  
 
  <?php  
     /* echo "<pre>";
      print_r($records); exit;*/
  if(isset($records[0])){ ?>
   <script type="text/javascript">
  jQuery('.close').click(function () {
  jQuery("#tm-user").css("display", "none");
  location.reload();
});
  </script>
     <div class="modal fade in" id="tm-user" style="display: block;">
       <div class="modal-dialog">
         <div class="modal-content">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <!-- Modal Header -->
           <div class="modal-header-m">
              <div class="tm-modal-title">Search Profile.</div>  
            </div>                        
             <!-- Modal body -->
             <div class="modal-body">
              <div class="popupbox">   
               <?php foreach(array_chunk($records,5) as $claimrecord){ ?>
               <div class="profileBox">
                <div class="col-md-6">
                  <div class="profileImg">
                    <?php if($claimrecord[4]){
                     if(strpos($claimrecord[4], 
                        "https://neurotree.org") !== false){ ?>

                        <img alt="" src="<?php echo $claimrecord[4]; ?>" style="border-radius: 100%; width: 90px;">

                        <?php } else if(strpos($claimrecord[4], 
                                "http://www.cns.nyu.edu") !== false){ ?>
                                <img alt="" 
                                src="<?php echo $claimrecord[4]; ?>" 
                                style="border-radius: 100%; width: 90px;">
                            <?php }else{ ?>
                                <img alt="" 
                                 src="https://neurotree.org<?php echo $claimrecord[4]; ?>" 
                                 style="border-radius: 100%; width: 90px;">
                                 <?php } }else{ ?>
                                  <img src="<?php echo base_url.'public/assets/images/Jeremy Freeman.jpg'; ?>" style="border-radius: 100%; width: 90px;">
                              <?php } ?>
                      </div>
                      <div class="profile-des">
                          <h4><?php echo $claimrecord[0]; ?></h4><p>
                            <?php echo  $claimrecord[0]; ?></p>
                      </div>
                    </div>
          <?php
    $joinprofile['joinprofile']  = My_profile_details::join_profile_details($claimrecord[1]);
      if(isset($joinprofile['joinprofile'][0])) {
           $status = $joinprofile['joinprofile'][0]->status;
       }else{
               $status =0;
       }
    if($status == 1){
            ?>
                     <div class="col-md-6">
                        <div class="claimed">
                            <button class="btn btn-default pull-right">Claimed</button>
                        </div>
                        <div class="profileDespu">
                      <a href="<?php echo "dispute-profile/".$claimrecord[1]; ?>" class="pull-right">
                       Dispute Profile</a>
                        </div>
                      </div>
                      <?php } else { ?>
                    <div class="col-md-6">
                      <div class="dropdown pull-right">
                          <button class="btn btn-default dropdown-toggle tm-primery-bt" type="button" data-toggle="dropdown">This is Me
                          <span class="caret"></span></button>
                          <ul class="dropdown-menu profile-drop">
                              <li>
                                 <a href="<?php echo "my-claim-profile/".$claimrecord[1]; ?>">
                                    <i class="fa fa-user" aria-hidden="true">
                                    </i> Claim Profile
                                 </a>
                               </li>
                              <li>
                                <a href="<?php echo "show-profile/".$claimrecord[1]; ?>">
                            <i class="fa fa-eye" aria-hidden="true">
                                  </i> View Profile
                                </a>
                              </li>      
                            </ul>
                           </div>
                          </div>
                          <?php } ?>
                        </div>
                        <?php } ?>
                        </div>
                       <div class="model-footer">
                            <div class="col-md-6">
                                <div class="footer-left">
                                    Go Back to <a href="<?php echo URL('/profile'); ?>">Find Profile</a>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="footer-right">
                                    <div class="footerText" style="margin-left: 90px;">
                                    Don't See Your Profile?</div>
                                    <a href="<?php echo URL('/joinus'); ?>">
                                    <button class="btn btn-primery" style="color:white;    margin-left: 90px;">
                                    Creat Your Own Profile</button>
                                  </a>
                                </div>
                            </div>
                      </div>
                 </div>
               </div>
            </div>
        </div>
    <?php } } 

     public function my_claim_profile(Request $req)
     {
          $pid =  $req->pid;
           $req->session()->put('pid', $pid);
          return redirect('my-claim-profile-pid');
         //return view('claim_profile_details');    
     }

     public function my_claim_profile_pid(Request $req)
     {
          $pid =  $req->session()->get('pid');
          return view('claim_profile_details')->with('pid', $pid);

     }
}
?>