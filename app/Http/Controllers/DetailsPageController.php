<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Details_model;
use App\Models\tbl_citation_details;
use App\Models\tbl_author_details;  
use DB;
use App\Models\tbl_profile_update;
use App\Models\tbl_web_signin; 
use App\Models\tbl_parent_children_id;


class DetailsPageController extends Controller  
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */


    public function search_profile_details(Request $req)
    { 
    	   $pid       =   session()->get('account_pid');

         if(isset($pid)){

             $video_link = Details_model::show_video($pid);
          if(!empty($video_link[0]->video)){
               $videos = explode(",", $video_link[0]->video);
            }else{
               $videos = 0;
            }
         
        $map_data = $this->all_author_details($pid);

         /* LIST OF TOPIC OPTIONS*/

         $topic_options = Details_model::topic_options();
      
          $topic_section = array(); $area_explode = array();
         foreach ($topic_options as $key => $value) {
              if($value[0]->area != 'NULL'){

                $area_explode = explode(',', $value[0]->area);
               }   
                $topic_section[]  = $area_explode;  
          }

           $topic_area = array();
           foreach ($topic_section as $key => $value1) {
           foreach($value1 as $key=>$value2){
               if(!empty($value2)){
                    $remove[] = "&";
                    $remove[] = '"';

                   $topic_areas[] =ltrim(str_replace($remove,'',ltrim(ucwords($value2))));
                 }
              }
            }
             
             sort($topic_areas);
            foreach(array_unique($topic_areas) as $key => $value){
               $topic_area[]= "<option value='".$value."'>".ucwords($value)."</option>"; 
            }


        $data = array(
                   'personalRecourd'     => Details_model::details_author($pid),
                   'educationalLineage'  => Details_model::educational_lineage($pid), 
                   'collaborators'       => Details_model::collaborators($pid), 
                   'videos'              => $videos,
                   'publications'        => tbl_citation_details::publications($pid),
                   'geographic_network'  => $map_data,
                   'topic_options'       => $topic_area
                  );
           
           
                if(isset($data['personalRecourd'])){
                    return view('details')->with(['data' => $data]);
               }else{
                      $req->session()->flash('error', 'Some Error Occurred!.');
                 return redirect('/signIn');
               }
          }else{
                 return redirect('/signIn');
         }
    } // End account profile details. 



    /*  ------------------   Profile Details Page After SignIn ---------------------*/ 

    public function profile_details(Request $req)
    {

         $pid        = session()->get('SignIn_pid');

       if(isset($pid)){

             $video_link = Details_model::show_video($pid);
          if(!empty($video_link[0]->video)){
               $videos = explode(",", $video_link[0]->video);
            }else{
               $videos = 0;
            }

         $map_data = $this->all_author_details($pid);

         /* LIST OF TOPIC OPTIONS*/

         $topic_options = Details_model::topic_options();
        
         $topic_section = array(); $area_explode = array();
         foreach ($topic_options as $key => $value) {
              if($value[0]->area != 'NULL'){

                $area_explode = explode(',', $value[0]->area);
               }   
                $topic_section[]  = $area_explode;  
          }

           $topic_area = array();
           foreach ($topic_section as $key => $value1) {
           foreach($value1 as $key=>$value2){
               if(!empty($value2)){
                    $remove[] = "&";
                    $remove[] = '"';

                   $topic_areas[] =ltrim(str_replace($remove,'',ltrim(ucwords($value2))));
                 }
              }
            }
             
             sort($topic_areas);
            foreach(array_unique($topic_areas) as $key => $value){
               $topic_area[]= "<option value='".$value."'>".ucwords($value)."</option>"; 
            }

        $data = array(

                   'personalRecourd'     => Details_model::details_author($pid),
                   'educationalLineage'  => Details_model::educational_lineage($pid), 
                   'collaborators'       => Details_model::collaborators($pid), 
                   'videos'              => $videos,
                   'publications'        => tbl_citation_details::publications($pid),
                   'geographic_network'  => $map_data,
                   'topic_options'       => $topic_area
                  );
           
           
                if(isset($data['personalRecourd'])){
                    return view('details')->with(['data' => $data]);
               }else{
                      $req->session()->flash('error', 'Some Error Occurred!.');
                 return redirect('/signIn');
               }
          }else{
                 return redirect('/signIn');
         }
    } // End Profile details.

   
 /*  ------------------  All author details  ---------------------*/ 

    public function all_author_details($pid){

         $all_author_limit = tbl_author_details::limit(100);
         $all_author      = tbl_author_details::union($all_author_limit)->where('pid', $pid)->get();
       /*echo "<pre>";
       print_r($all_author); exit;*/
       $map_data = $this->geographic_network($all_author);
       return $map_data;

    }
   
 /*  ------------------  map geographic netword  ---------------------*/ 

     public function geographic_network($author_details){
        
        if(!empty($author_details[0])){

          foreach ($author_details as $key => $value) {
           
                if($value->address != 'NULL'){
                      $address = $value->address;
                  } 

                   if($value->city != 'NULL'){
                      $city = $value->city;
                  } 

                   if($value->state != 'NULL'){
                      $state = $value->state;
                  } 
                 
                 if($value->country != 'NULL'){
                      $country = $value->country;
                  }else{
                      $country = "";
                  }

                  $location = $address .','. $city .','. $state.','. $country;
                   
                  $data = $this->getLatLong($location);
                   
                   $author_data['pid']       =  $value->pid;
                   $author_data['name']      =  $value->name;
                   $author_data['address']   =  $location;
                   $author_data['longitude'] =  $data['longitude'];
                   $author_data['latitude']  =  $data['latitude'];
                   $author_record[]          = $author_data;
              }
               return $author_record;
        }
        
      }
            //Return latitude and longitude of the given address

 static function getLatLong($address){ 

        if(!empty($address)){
            //Formatted address
            $address_formate = str_replace(' ','+',$address);
            //Send request and receive json data by address
           /* $geocodeFromAddr = file_get_contents('https://api.opencagedata.com/geocode/v1/json?q='.urlencode($address).'&key=50a97fbc33454d76b46f03085076ccdf&pretty=1'); */

            $geocodeFromAddr = file_get_contents('https://maps.googleapis.com/maps/api/geocode/json?address='.$address_formate.'&key=AIzaSyC0dA1veZiTkpfneIDt-ikKOCbs9MBqCco'); 
            $output = json_decode($geocodeFromAddr);
            //echo "<pre>@@@"; print_r($output->results[0]->geometry->location->lat); exit;
            //Get latitude and longitute from json data  
            if(!empty($output->results[0])){
               $data['latitude']  = $output->results[0]->geometry->location->lat; 
               $data['longitude'] = $output->results[0]->geometry->location->lng;
              //Return latitude and longitude of the given address
            }
           
            if(!empty($data)){
                return $data;
            }else{
                return false;
            }
        }else{
            return false;   
        }
    }

/*  ------------------  Search Header autosuggestion---------------------*/ 

   public function search_header_author(Request $req)
    {
        $name    = trim($req->name);
        $data    = tbl_author_details::search_name($name);
        $recourd   = array();
      
     if(!empty($data[0])){
        foreach($data as $value)
        {
         if(!in_array($value, $recourd))
          {
            $recourd[] =$value;
          }
        }
        sort($recourd);
      if(isset($recourd[0])){
         ?>
            <ul id="country-list">
                <?php 
                foreach($recourd as $recourd2) { ?>
              <li class="author-search" onClick="selectmyprofile('<?php echo $recourd2->children_name; ?>');" >
                    <?php echo $recourd2->children_name; ?>
              </li>
               <?php } ?>
            </ul><?php
       }
     }else{ ?>
          <b>No Records found.</b>
      <?php
     }
  }

  /*  ------------------  Search Header autosuggestion for network ---------------------*/ 

   public function search_header_network(Request $req)
    {
        $name    = trim($req->name);
        $data    = tbl_author_details::search_name($name);
        $recourd   = array();
      
     if(!empty($data[0])){

        foreach($data as $value)
        {
         if(!in_array($value, $recourd))
          {
            $recourd[] =$value;
          }
        }
        sort($recourd);
      if(isset($recourd[0])){
         ?>
            <ul id="country-list">
                <?php 
                foreach($recourd as $recourd2) { ?>
              <li class="author-search" onClick="selectnetwork('<?php echo $recourd2->children_name; ?>');" >
                    <?php echo $recourd2->children_name; ?>
              </li>
               <?php } ?>
            </ul><?php
       }
     }else{ ?>
          <b>No Records found.</b>
      <?php
     }
  }

   public function search_header_details(Request $req)
    {   
         $this->validate($req,
             ['author_search' => 'required'],['author_search.required' => 'Please Enter Name.']
         );

           $name     = trim($req->get('author_search'));
           $id       = tbl_author_details::search_profile_name($name);
          
         if(isset($id[0])){

             $pid       = $id[0]->pid;
             $video_link = Details_model::show_video($pid);
          if(!empty($video_link[0]->video)){
               $videos = explode(",", $video_link[0]->video);
            }else{
               $videos = 0;
            }
            
          $map_data = $this->all_author_details($pid);

          /* LIST OF TOPIC OPTIONS*/

          $topic_options = Details_model::topic_options();
      
          $topic_section = array(); $area_explode = array();
         foreach ($topic_options as $key => $value) {
              if($value[0]->area != 'NULL'){

                $area_explode = explode(',', $value[0]->area);
               }   
                $topic_section[]  = $area_explode;  
          }

           $topic_area = array();
           foreach ($topic_section as $key => $value1) {
           foreach($value1 as $key=>$value2){
               if(!empty($value2)){
                    $remove[] = "&";
                    $remove[] = '"';

                   $topic_areas[] =ltrim(str_replace($remove,'',ltrim(ucwords($value2))));
                 }
              }
            }
             
             sort($topic_areas);
            foreach(array_unique($topic_areas) as $key => $value){
               $topic_area[]= "<option value='".$value."'>".ucwords($value)."</option>"; 
            }
        
        $data = array(
                   'personalRecourd'     => Details_model::details_author($pid),
                   'educationalLineage'  => Details_model::educational_lineage($pid), 
                   'collaborators'       => Details_model::collaborators($pid), 
                   'videos'              => $videos,
                   'publications'        => tbl_citation_details::publications($pid),
                   'geographic_network'  => $map_data,
                   'topic_options'       => $topic_area
                  );
           
               if(isset($data['personalRecourd'])){
                    return view('details')->with(['data' => $data]);
               }else{
                      $req->session()->flash('error', 'Some Error Occurred!.');
                 return redirect('/signIn');
               }
          }else{
           return redirect('/signIn');
          }
     }

           /* Selected OF TOPIC AREA*/
     public function focus_area(Request $req){

         $selectedtopic     = $req->selectedtopic; 
         $map_data = $this->fetch_selected_topic($selectedtopic); ?>
      <script
      async
      defer
      src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC0dA1veZiTkpfneIDt-ikKOCbs9MBqCco&callback=initMap">
      </script>
     
<script type="text/javascript">
 var map
 function initMap() {


  <?php 
       $sum =0;
       if(!empty($map_data[0])){
       foreach ($map_data as $key => $value) { ?>

         var broadway<?php echo $key; ?>= { 
         info: '<strong><a href="<?php echo base_url; ?>author-details/<?php echo $value['pid']; ?>"><?php echo $value['name']; ?></a>,</strong><br><?php echo $value['address']; ?><br>',
         lat:<?php echo $value['latitude']; ?>,
         long:<?php echo $value['longitude'];?>,
   }
 <?php } }

     function location_details($id){

      for($i=0; $i<$id; $i++){
       echo "[broadway$i.info, broadway$i.lat, broadway$i.long, $i],";
     }
    }?>

    var locations = [<?php location_details(count($map_data)); ?>]

    var map = new google.maps.Map(document.getElementById('map'), {
      zoom: 13,
      center: new google.maps.LatLng(<?php echo $map_data[0]['latitude']; ?>, 
      <?php echo $map_data[0]['longitude']; ?>),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
    })

    var infowindow = new google.maps.InfoWindow({})

    var marker, i

  for (i = 0; i < locations.length; i++) {
        //alert(locations[i][1]); exit;
        marker = new google.maps.Marker({
          position: new google.maps.LatLng(locations[i][1], locations[i][2]),
          map: map,
          icon: 'http://alistgear.com/public/assets/images/map.png'
        })
       /*infowindow.setContent(locations[i][0])
       infowindow.open(map, marker)*/

       google.maps.event.addListener(
        marker,
        'click',
        (function(marker, i) {
          return function() {
            infowindow.setContent(locations[i][0])
            infowindow.open(map, marker)
          }
        })(marker, i)
        )
    }
  }
 </script>
 <?php
     }

     /*  ------------------ fetch selected topic  ---------------------*/ 

    public function fetch_selected_topic($selectedtopic){

      $author_details = tbl_author_details::where('area', 'like', '%' . $selectedtopic . '%')->limit(10)->get();

      $map_data = $this->geographic_network($author_details);
       return $map_data;
    }

 /*  ------------------ geographic network search  ---------------------*/

    public function search_geographic_network(Request $req){
         
         $name            = $req->name; 
         $geographic_data = tbl_author_details::where(['name' =>$name])->get();
        

         if(!empty($geographic_data[0]->pid)){ 

          $map_data = $this->geographic_network($geographic_data); ?>
          
          <script
          async
          defer
          src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC0dA1veZiTkpfneIDt-ikKOCbs9MBqCco&callback=initMap">
          </script>
     
          <script type="text/javascript">
           var map
           function initMap() {

            <?php 
                 $sum =0;
                 if(!empty($map_data[0])){
                 foreach ($map_data as $key => $value) { ?>

                   var broadway<?php echo $key; ?>= { 
                   info: '<strong><a href="<?php echo base_url; ?>author-details/<?php echo $value['pid']; ?>"><?php echo $value['name']; ?></a>,</strong><br><?php echo $value['address']; ?>',
                   lat:<?php echo $value['latitude']; ?>,
                   long:<?php echo $value['longitude'];?>,
             }
           <?php } }

               function location_details($id){

                for($i=0; $i<$id; $i++){
                 echo "[broadway$i.info, broadway$i.lat, broadway$i.long, $i],";
               }
              }?>

              var locations = [<?php location_details(count($map_data)); ?>]

              var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 13,
                center: new google.maps.LatLng(<?php echo $map_data[0]['latitude']; ?>, 
                <?php echo $map_data[0]['longitude']; ?>),
                mapTypeId: google.maps.MapTypeId.ROADMAP,
              })

              var infowindow = new google.maps.InfoWindow({})

              var marker, i

            for (i = 0; i < locations.length; i++) {
                  //alert(locations[i][1]); exit;
                  marker = new google.maps.Marker({
                    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
                    map: map,
                    icon: 'http://alistgear.com/public/assets/images/map.png'
                  })
                 /*infowindow.setContent(locations[i][0])
                 infowindow.open(map, marker)*/

                 google.maps.event.addListener(
                  marker,
                  'click',
                  (function(marker, i) {
                    return function() {
                      infowindow.setContent(locations[i][0])
                      infowindow.open(map, marker)
                    }
                  })(marker, i)
                  )
              }
            }
           </script>
       <?php }else{
            echo "<b style='color: #ff0000;'>Sorry, no record found!.</b>";
       }
    }

/*  ------------------ add video section ---------------------*/

    public function add_video(Request $req){

        if(!empty($req->get('video')['0'])){
            foreach($req->get('video') as $item){
                if(!empty(substr($item, 0, 32))){
                  if(!empty(substr($item, 0, 32) == "https://www.youtube.com/watch?v=")){
                     $data [] = $item;
                  }
                }
             }
          }

            foreach($data as $item){
                if(!empty(substr($item, 0, 32) !== "https://www.youtube.com/watch?v=")){
                   $message  = "not metch";
                }
             }
                  

           if (empty($message)) {

               if(!empty($req->get('video')['0'])){
                             
                            $video = implode(",", $data);
                            $video = rtrim($video,',');
                       }
                              
                   $record = tbl_profile_update::add_author_details($req->get('pid'), $video);
                       
                     if(isset($record)){
                         echo "<b style='color: #008000;'>Video Link has been successfully submit.</b>"; 

                     }else{
                            echo "<b style='color: #ff0000;'>Some Error Occurred!.</b>";
                     } 
                           
              }else{
                echo "<b style='color: #ff0000;'>Please enter valide Video Link Here!.</b>";
              }

      }

        // Profile Update for details page.
      public function editModal_profile(Request $req){

          if(!empty($req->file('profile-image'))){

                $image_name = $req->file('profile-image');
                $profile_image = time().'.'.$image_name->getClientOriginalExtension();
                $destinationPath = public_path('/assets/images');
                $image_name->move($destinationPath, $profile_image);

            }else{
                $profile_image = $req->get('profile-image1');

             }

             if(!empty($req->file('banner'))){
 
                $background_image = $req->file('banner');
                $banner = time().'.'.$background_image->getClientOriginalExtension();
                $destinationPath = public_path('/assets/banner');
                $background_image->move($destinationPath, $banner);

              }else{
                $banner = $req->get('background-image');

             }

          $data = [
                    'image_name'  => $profile_image,
                    'address'     => $req->get('txt-Search2'),
                    'area'  => $req->get('focus-area'),
                    'website_link'  => $req->get('pwebsite'),  
                ];      

           if(!empty($req->get('password'))){

              $personalRecourd = tbl_web_signin::where('pid', $req->get('pid'))->first();

              if($personalRecourd->password != $req->get('password')){

              $message = "<b style='color:#ff0000;'>Please enter valid credentials.<b>";

             }else{
                    if(!empty($req->get('new_password')) && !empty($req->get('conf_password'))){
                     if($req->get('new_password') != $req->get('conf_password')){
                         echo "first"; exit;
                      $message = "<b style='color:#ff0000;'>Your Confirm New Password don't match.<b>";

                    }else{
                         
                     tbl_web_signin::where('pid', $req->get('pid'))
                                  ->update(['password' =>$req->get('conf_password'), 'conf_password' =>$req->get('conf_password')]);

                     $response = tbl_author_details::where('pid', $req->get('pid'))->update($data);
                      
                    $personalRecourd = tbl_profile_update::where('pid', $req->get('pid'))->first();

                    if(!empty($personalRecourd->pid)){
                      
                      tbl_profile_update::where('pid', $req->get('pid'))->update(['cover_image' =>$banner]);

                    }else{  
                      
                      tbl_profile_update::insert(['pid' =>$req->get('pid'), 'cover_image' =>$banner]);
                    }
                    $message = "<b style='color: #008000;'>Update successfully!.</b>";
                  }
                   }else{
                    $message = "<b style='color:#ff0000;'>Please enter valid credentials.<b>";
                   }
                
              }

           }else{
                  $response = tbl_author_details::where('pid', $req->get('pid'))->update($data);
                        
                  $personalRecourd = tbl_profile_update::where('pid', $req->get('pid'))->first();

                  if(!empty($personalRecourd->pid)){
                    
                    tbl_profile_update::where('pid', $req->get('pid'))->update(['cover_image' =>$banner]);

                  }else{
                    
                    tbl_profile_update::insert(['pid' =>$req->get('pid'), 'cover_image' =>$banner]);
                  }
                  $message = "<b style='color: #008000;'>Update successfully!.</b>";
             }

          echo $message;
      }


      public function author_details_pid(Request $req){
        $pid = $req->pid;
        $req->session()->put('account_pid', $pid);
        return redirect('/profile-details-page');

      }

      /*    Add Parent Here. */
      public function add_parent_details(Request $req){


      if(!empty($req->get('parent_name')['0'])){
                 
          for($j=0; $j< count($req->get('parent_name')); $j++){

               $pid    = $req->get('pid');
               $newpid = substr(md5(rand()),0, 7);

              $record = [
                          'pid'     =>    $newpid,
                          'name'    =>    $req->get('parent_name')[$j],
                          'address' =>    $req->get('address')[$j],
                          'city'    =>    $req->get('city')[$j],
                          'state'   =>    $req->get('state')[$j],
                          'country' =>    $req->get('country')[$j],                          
                        ];
                 $record_details = tbl_author_details::where(['name' =>$req->get('parent_name')[$j], 
                  'address' =>$req->get('address')[$j]])->first();
                
            if(empty($record_details)){
                    $add_parent_id = tbl_parent_children_id::add_parent_id($pid, $newpid);
                if(!empty($add_parent_id)){

                    $parent_record = tbl_author_details::insert($record);
                if(!empty($parent_record)){
                    
                    $message = "<b style='color: #008000;'>Update successfully!.</b>";

                  }else{
                    
                    $message = "<b style='color: #008000;'>Some Error Occurred!.</b>";
                    break;
                  }

                }else{
                    $message = "<b style='color: #008000;'>Some Error Occurred!.</b>";
                    break;
                }
              }else{
                    $message = "<b style='color: #008000;'>".$req->get('parent_name')[$j]." Author records already exist!.</b>";
                    break;
                }
             }
          echo $message;
       }
    }

       /*  Add Children Here.  */
     public function add_children_details(Request $req){


      if(!empty($req->get('parent')['0'])){
                 
          for($i=0; $i< count($req->get('parent')); $i++){

               $pid    = $req->get('pid');
               $newpid = substr(md5(rand()),0, 7);

              $record = [
                          'pid'     =>    $newpid,
                          'name'    =>    $req->get('parent')[$i],
                          'address' =>    $req->get('location')[$i],
                          'city'    =>    $req->get('city_name')[$i],
                          'state'   =>    $req->get('state_name')[$i],
                          'country' =>    $req->get('country_name')[$i],                          
                        ];
                     
              $record_details = tbl_author_details::where(['name' =>$req->get('parent')[$i], 
                  'address' =>$req->get('location')[$i]])->first();
                
            if(empty($record_details)){
                $add_children_id = tbl_parent_children_id::add_children_id($pid, $newpid);
                if(!empty($add_children_id)){

                    $parent_record = tbl_author_details::insert($record);
                if(!empty($parent_record)){
                    
                    $message = "<b style='color: #008000;'>Update successfully!.</b>";

                  }else{
                    
                    $message = "<b style='color: #008000;'>Some Error Occurred!.</b>";
                    break;
                  }

                }else{
                    $message = "<b style='color: #008000;'>Some Error Occurred!.</b>";
                    break;
                }
              }else{
                    $message = "<b style='color: #008000;'>".$req->get('parent')[$i]." Author records already exist!.</b>";
                    break;
                }
            }
          echo $message;
       }
    }

    /*    Add Collaborators Here. */
      public function add_collaborators_details(Request $req){


      if(!empty($req->get('cols_parent')['0'])){
                 
          for($j=0; $j< count($req->get('cols_parent')); $j++){

               $pid    = $req->get('pid');
               $newpid = substr(md5(rand()),0, 7);

              $record = [
                          'pid'     =>    $newpid,
                          'name'    =>    $req->get('cols_parent')[$j],
                          'address' =>    $req->get('cols_address')[$j],
                          'city'    =>    $req->get('cols_city')[$j],
                          'state'   =>    $req->get('cols_state')[$j],
                          'country' =>    $req->get('cols_country')[$j],                          
                        ];

               $record_details = tbl_author_details::where(['name' =>$req->get('cols_parent')[$j], 
                  'address' =>$req->get('cols_address')[$j]])->first();
                
            if(empty($record_details)){
                $add_collaborators_id = tbl_parent_children_id::add_collaborators_id($pid, $newpid);
                if(!empty($add_collaborators_id)){

                    $collaborators_record = tbl_author_details::insert($record);
                if(!empty($collaborators_record)){
                    
                    $message = "<b style='color: #008000;'>Update successfully!.</b>";

                  }else{
                    
                    $message = "<b style='color: #008000;'>Some Error Occurred!.</b>"; break;
                  }

                }else{
                    $message = "<b style='color: #008000;'>Some Error Occurred!.</b>"; break;
                }
              }else{
                    $message = "<b style='color: #008000;'>".$req->get('cols_parent')[$j]." Author records already exist!.</b>";
                    break;
                }
             }
          echo $message;
       }
    }

     /*    Add Publications Here. */

      public function add_publications_details(Request $req){

        if(!empty($req->get('tittle')['0'])){
                 
          for($j=0; $j< count($req->get('tittle')); $j++){

               $pid    = $req->get('pid');

              $record = [
                          'pid'     => $pid,
                          'type_of_publication' => $req->get('publications')[$j],
                          'publication_name'    => $req->get('publication_name')[$j], 
                          'title'    => $req->get('tittle')[$j], 
                          'year'     => $req->get('year')[$j],
                          'links'    => $req->get('publication_link')[$j],
                          'cited_by' => $req->get('cited_by')[$j],
                        ];
               
               $record_details = tbl_citation_details::where($record)->first();
                
            if(empty($record_details)){
                     
                    $publication_record = tbl_citation_details::add_publications($record);
                if(!empty($publication_record)){
                    
                    $message = "<b style='color: #008000;'>The record has been successfully submitted!.</b>";

                  }else{
                    
                    $message = "<b style='color: #008000;'>Some Error Occurred!.</b>"; break;
                  }  
                }else{
                    $message = "<b style='color: #008000;'>".$req->get('publication_name')[$j]." publication records already exist!.</b>";
                    break;
                }            
             }
         echo $message;
       }
      
    }

    public function map_xml(){

         /*$all_author1 = tbl_author_details::where(['pid' =>3])->first();
          $all_author2 = tbl_author_details::union($all_author1)->limit(3)->get();*/


           /*$first = DB::table('tbl_author_details')->select('*')->where('pid', '3');
          $second = DB::table('tbl_author_details')->select('*')->union($first)->limit(3)->get();*/

          $second = tbl_author_details::limit(3);
          $first = tbl_author_details::union($second)->where('pid', '2')->get();

          echo "<pre>@@@second123"; print_r($first); exit;
    
    }
}

