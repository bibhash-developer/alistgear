<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\tbl_web_signin; 
use App\Models\tbl_author_details;
use App\Models\tbl_profile_update;
use Validator;

class UpdateProfile extends Controller
 {

   public function explore_data()
    {
      
      if(!empty(session()->get('login_pid'))) {

             $author_record = tbl_profile_update::join('tbl_author_details', 
                                                       'tbl_profile_update.pid', '=', 'tbl_author_details.pid')
                                                  ->where('tbl_author_details.pid', session()->get('login_pid'))->first();

             if(!empty($author_record)){
                 $author_details[] = $author_record;

             }else
             {
                 $author_video_record = tbl_author_details::where('pid', session()->get('login_pid'))->first();

                  if(!empty($author_video_record)){
                  $author_details[] = $author_video_record;
                 }
             }
              return view('explore')->with('author_details', $author_details);

      }else{
            return redirect('/signIn');
      }
    }

    public function check_pin($pid)
    {
      if($pid == session()->get('login_pid')){
           return redirect('explore-data');
      }else{
            return redirect('signIn');
      }
    }

    public function update_record(Request $req)
     { 
             $validator = Validator::make($req->all(), [
                     'cover_image'   => 'mimes:jpeg,jpg,png,gif', //only allow this type extension file.
                     'profile_image' => 'mimes:jpeg,jpg,png,gif',
             ]);

          if ($validator->fails()){

                    $req->session()->flash('error', '<div class="alert alert-danger custem-error" id="success-alert" style="width: 100%;">
                                                <button type="button" class="close" data-dismiss="alert">x</button>
                                               <strong>Sorry! </strong> <b>Please upload only Image!.</b></div>');               
                         
                    return redirect('explore-data');

            }else{
                  
                    if(!empty($req->get('city'))){
                         
                         $city = $req->get('city');
                    }else{
                         $city = 'NULL';
                    }

                    if(!empty($req->get('state'))){
                         
                         $state = $req->get('state');
                    }else{
                         $state = 'NULL';
                    }

                    if(!empty($req->get('country'))){
                         
                         $country = $req->get('country');
                    }else{
                         $country = 'NULL';
                    }
                    
                    
                    if(!empty($req->get('introduction'))){
                         
                         $introduction = $req->get('introduction');
                    }else{
                         $introduction = 'NULL';
                    }

             if(!empty($req->get('video_url')['0'])){
                foreach($req->get('video_url') as $item){
                          if(substr($item, 0, 32) !== "https://www.youtube.com/watch?v="){
                             $message  = "not metch";
                          }
                        }
                }
                
              if (empty($message)) {
                       
                    if(!empty($req->get('video_url')['0'])){
                         
                         $video = implode(",", $req->get('video_url'));
                    }elseif(!empty($req->get('video_url1'))) {

                         $video = $req->get('video_url1');
                    }else{ 
                         $video = 'NULL';
                    }

                    if(!empty($req->file('cover_image'))) {
                         
                        $cover            = $req->file('cover_image');
                        $cover_image      = time().'.'.$cover->getClientOriginalName();
                        $destinationPath1 = public_path('assets/banner');
                        $cover->move($destinationPath1, $cover_image);

                    }elseif(!empty($req->get('cover_image1'))) {
                         $cover_image = $req->get('cover_image1');

                    }else {
                        $cover_image = 'NULL';
                    }

                     if(!empty($req->file('profile_image'))){
                         
                          $image           = $req->file('profile_image');
                          $profile_image   = time().'.'.$image->getClientOriginalName();
                          $destinationPath = public_path('assets/images');
                          $image->move($destinationPath, $profile_image);
                    }elseif(!empty($req->get('profile_image1'))){
                         $profile_image    = $req->get('profile_image1');
                    }else {
                        $profile_image     = 'NULL';
                    }
                    
                        $pid  = trim($req->get('pid'));

               $data   = [
                             'city'          => trim($city),
                             'state'         => trim($state),
                             'country'       => trim($country),
                             'image_name'    => $profile_image,
                        ];

              $records = [
                         'pid'           => trim($pid),
                         'introduction'  => trim($introduction),
                         'video'         => $video,
                         'cover_image'   => $cover_image,
                         ];
              
                   //$record = tbl_author_details::update_author_details($data, $pid);
                   $record = tbl_author_details::firstOrNew(['pid' => $pid]);
                   $record->city = trim($city);
                   $record->state = trim($state);
                   $record->country = trim($country);
                   $record->image_name = trim($profile_image);

                  if(!empty($record->save())){

                     $profile_pid = tbl_profile_update::where('pid', $pid)->first();

                   if(!empty($profile_pid)){

                        $data        = tbl_profile_update::where('pid', $pid)->update($records);
                        $req->session()->flash('success', '<div class="alert alert-success custem-success" id="success-alert" style="width: 100%;">
                                                            <button type="button" class="close" data-dismiss="alert">x</button>
                                                           <strong>success! </strong> <b>Record has successfully Updated!.</b></div>');                          
                        return redirect('explore-details');
                     }else{

                        $data        = tbl_profile_update::add_author_details($records);
                        $req->session()->flash('success', '<div class="alert alert-success custem-success" id="success-alert" style="width: 100%;">
                                                    <button type="button" class="close" data-dismiss="alert">x</button>
                                                   <strong>success! </strong> <b>Record has successfully Updated!.</b></div>');            
                        return redirect('explore-details');
                     }
                    
                  }else{
                          $req->session()->flash('error', '<div class="alert alert-danger custem-error" id="success-alert" style="width: 100%;">
                                                <button type="button" class="close" data-dismiss="alert">x</button>
                                               <strong>Sorry! </strong> <b>Some Error Occurred!.</b></div>');               
                          return redirect('explore-data');
                  }  
              } else {
                          $req->session()->flash('error', '<div class="alert alert-danger custem-error" id="success-alert" style="width: 100%;">
                                                <button type="button" class="close" data-dismiss="alert">x</button>
                                               <strong>Sorry! </strong> <b>Please input only youtube Url!</b></div>');               
                          return redirect('explore-data');
              }   
         }  
    }  
}
