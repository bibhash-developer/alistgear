<?php 

//echo "<pre>@@@"; print_r($data['educationalLineage']); exit;
?>
@include('header')
<!-- Start Profile Section -->
<section class="profile-page">
  <div class="container-profile">
    <div class="profile_sec">
      <div class="col-lg-8 col-sm-8 col-md-push-2 profile-top pad0">
        <div class="card hovercard">
           @if(!empty($data['personalRecourd']['record']->cover_image))
               <img src="{{ Url('/public/assets/banner/'.$data['personalRecourd']['record']->cover_image) }}">
           @else

               <img src="{{ Url('/public/assets/images/profile-bg.png') }}">
          @endif
          <!-- <div class="cardheader">
          </div> -->
          <div class="avatar">
            @if($data['personalRecourd']['record']->image_name)

            @if($data['personalRecourd']['record']->image_name == 'NULL')
            <img alt="abc" src="{!! URL::to('public/assets/images/picture-not.jpg') !!}">

            @elseif(strpos($data['personalRecourd']['record']->image_name, "photo/00"))

            <img alt="abc" src="{!! $data['personalRecourd']['record']->image_name !!}">

            @elseif(strpos($data['personalRecourd']['record']->image_name, "http://www.cns.nyu.edu") !== false)
            <img alt="abc" src="{!! $data['personalRecourd']['record']->image_name !!}">
            @elseif($data['personalRecourd']['record']->image_name != 'NULL')
            <img alt="abc" src="../public/assets/images/{!! $data['personalRecourd']['record']->image_name !!}">
            @else
            <img alt="abc" src="{!! URL::to('public/assets/images/picture-not.jpg') !!}">
            @endif
            @else
            <img alt="abc" src="{!! URL::to('public/assets/images/picture-not.jpg') !!}">
            @endif
          </div>
          <div class="card-info">
            <div class="col-md-2 pad0">
              <div class="header-social">
                <ul>

                  <li><a href="#"><img src="{!! URL::to('/public/assets/images/git.png') !!}"></a></li>
                </ul>
              </div>
            </div>
            <div class="col-md-8">
              <div class="card-info-title">
                <a target="_blank" href="#">{!! $data['personalRecourd']['record']->name !!}</a>
              </div>
              <div class="card-info-des">
                <!-- Machine Learning • Computer Science • University of Toronto -->
                <?php
                if($data['personalRecourd']['record']->address != 'NULL'){
                  echo $data['personalRecourd']['record']->address;
                }
                if($data['personalRecourd']['record']->city != 'NULL'){
                  echo $city    = ' •'.' '.$data['personalRecourd']['record']->city;
                }
                if($data['personalRecourd']['record']->state != 'NULL'){
                 echo  $state   = ' •'.' '.$data['personalRecourd']['record']->state;
               }
               if($data['personalRecourd']['record']->country != 'NULL'){
                echo $country = ' •'.' '.$data['personalRecourd']['record']->country;
              }
              ?>
            </div>
            <div class="card-info-link">
              <?php if($data['personalRecourd']['record']->website_link){ ?>
              <a href="{!! $data['personalRecourd']['record']->website_link; !!}">
                <?php echo $data['personalRecourd']['record']->website_link; ?>
              </a>
              <?php } ?>
            </div>
          </div>

          <!-- =============================== Update profile ====================================================== -->

          <div class="col-md-2">
            <div class="edit-button text-right">
                           
              @if(session()->get('account_pid') ==$data['personalRecourd']['record']->pid || session()->get('SignIn_pid') ==$data['personalRecourd']['record']->pid)
              <a href="#" class="button edit-btn" data-toggle="modal" data-target="#editModal">Edit</a>
              @else
              <a href="{!! URL('/') !!}/signIn" class="button edit-btn">Edit</a>
              @endif
              <!-- Modal -->


              <div class="modal fade" id="editModal" role="dialog">
                <div class="modal-dialog">

                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="col-md-8 col-md-push-2">
                      <div class="modal-header addSec">
                       <button type="button" class="close" data-dismiss="modal">&times;</button>
                       <h4 class="modal-title">
                        <small>Edit</small>
                        Profile
                      </h4>
                      <p>Update Your Profile Information</p>
                       <div id="error-message-update"></div>
                    </div>
                {!! Form::open(['name' => 'editModal-profile', 'role' => 'form', 'id' => 'editModal-profile',
                   'enctype' =>'multipart/form-data']) !!}  
                       
               <!--  <form id='editModal-profile' method="post" enctype="multipart/form-data"> -->
                    <div class="person_photo">

                      @if($data['personalRecourd']['record']->image_name)

                        @if($data['personalRecourd']['record']->image_name == 'NULL')
                        <img alt="abc" src="{!! URL::to('public/assets/images/picture-not.jpg') !!}">

                        @elseif(strpos($data['personalRecourd']['record']->image_name, "photo/00"))

                        <img alt="abc" src="{!! $data['personalRecourd']['record']->image_name !!}">

                        @elseif(strpos($data['personalRecourd']['record']->image_name, "http://www.cns.nyu.edu") !== false)
                        <img alt="abc" src="{!! $data['personalRecourd']['record']->image_name !!}">
                        @elseif($data['personalRecourd']['record']->image_name != 'NULL')
                        <img alt="abc" src="../public/assets/images/{!! $data['personalRecourd']['record']->image_name !!}">
                        @else
                        <img alt="abc" src="{!! URL::to('public/assets/images/picture-not.jpg') !!}">
                        @endif
                        @else
                        <img alt="abc" src="{!! URL::to('public/assets/images/picture-not.jpg') !!}">
                     @endif
                    </div>

                    <div class="update_photo_btn">
                      <label class="btn-bs-file btn btn-lg btn-primary">
                        Update Photo
                        {!! Form::file('profile-image',['class' => 'btn btn_bg', 'id' => 'profile-image']) !!}

                         {!! Form::hidden('profile-image1',$data['personalRecourd']['record']->image_name) !!} 
                         {!! Form::hidden('pid', $data['personalRecourd']['record']->pid) !!} 
                      </label>
                    </div>

              <div class="bnr_image_edit">
                
                 @if(!empty($data['personalRecourd']['record']->cover_image))
                    <img src="{{ Url('/public/assets/banner/'.$data['personalRecourd']['record']->cover_image) }}">
                 @else

                 <img src="{{ Url('/public/assets/images/profile-bg.png') }}">
                @endif
             </div>

              <div class="update_photo_btn">
                <label class="btn-bs-file btn btn-lg btn-primary"> 
                  Update Background
                   {!! Form::file('banner', ['class' => 'btn btn_bg', 'id' => 'background-image']) !!} 
                   
                 @if(!empty($data['personalRecourd']['record']->cover_image))
                   {!! Form::hidden('background-image', $data['personalRecourd']['record']->cover_image) !!} 
                 @else

                 {!! Form::hidden('background-image','profile-bg.png') !!} 
                @endif


                  
                </label>
              </div>

              <div class="aflliated_text">
                <p>Affiliation</p>
                <img src="{!! URL('/') !!}/public/assets/images/rule.png">
               <!--  <input name="_token" type="hidden" value="UBy3kAjStN3DF5WzDCV9y2kegakmbaK4uGLGXexZ"> -->
              </div>

              <div class="form-group top_1">
                <label for="email" class="level_left">University/Industry</label>

               {!! Form::text('txt-Search2', $data['personalRecourd']['record']->address, ['class' => 'form-control', 
               'id' => 'txt-Search2','onkeyup' => 'input_search_affiliation();', 'placeholder' =>'University of Toronto']) !!}
               <div id="suggest-alert2"> </div>
              </div>

              <div class="col-md-6 padd-l">
                <div class="form-group top_1">
                  <label for="sel1" class="level_left">Department</label>
                  <select class="form-control" id="sel1" name="department">
                    <option value="Computer Science">Computer Science</option>
                    <option value="Computer Science1">Computer Science_1</option>
                    <option value="Computer Science2">Computer Science_2</option>
                    <option value="Computer Science3">Computer Science_3</option>
                  </select>
                </div>
              </div>

              <div class="col-md-6 ">
                <div class="form-group top_1">
                  <label for="sel1" class="level_left">Focus Area</label>
                  <select class="form-control" id="sel1" name="focus-area">
                     <option value="{!! $data['personalRecourd']['record']->area; !!}">
                      {!! $data['personalRecourd']['record']->area; !!}</option>
                      @if($data['topic_options'][0])
                      @foreach($data['topic_options'] as $value)
                      {!! $value !!}
                      @endforeach
                      @endif
                  </select>
                </div>
              </div>


              <div class="aflliated_text marine_top_2">
                <p>External Link</p>
                <img src="{{ Url('public/assets/images/rule.png') }}">
              </div>


              <div class="col-md-6 padd-l">
                <div class="form-group top_1">
                  <label for="email" class="level_left">Personal Website</label>
                  
                  {!! Form::text('pwebsite', $data['personalRecourd']['record']->website_link, ['class' => 'form-control', 'id' => 'pwebsite', 'placeholder' =>'cs.toronto.edu/~hinton']) !!}
                </div>
              </div>

              <div class="col-md-6 ">
                <div class="form-group top_1">
                  <label for="email" class="level_left">Github Page</label>
                  {!! Form::text('giturl', '', ['class' => 'form-control', 'id' => 'giturl', 'placeholder' =>'github.com/page']) !!}
                </div>
              </div>

              <div class="aflliated_text marine_top_2">
                <p>Update Password</p>
                <img src="{{ Url('/public/assets/images/rule.png') }}">
              </div>

              <div class="form-group top_1">
                <label for="Password" class="level_left">Current Password:</label>
                {!! Form::password('password',['class' => 'form-control', 'id' => 'password']) !!}
              </div>

              <div class="form-group top_1">
                <label for="Password" class="level_left">New Password:</label>
                {!! Form::password('new_password',['class' => 'form-control', 'id' => 'new_password']) !!}
              </div>

              <div class="form-group top_1">
                <label for="ConfirmNewPassword" class="level_left">Confirm New Password:
                </label>
                 {!! Form::password('conf_password',['class' => 'form-control', 'id' => 'conf_password']) !!}
              </div>

              <div class="save_btn">
                {!! Form::submit('SAVE',['class' => 'btn save_bg']) !!}
              </div>
           {!! Form::close() !!}
               <!--  </form> -->
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
  <!-- =============================== End Update Profile ====================================================== -->

</div>

</div>



<div class="profile-tab">
              <!-- <div class="col-md-3">
                      <div class="progress-bar-main">60%</div>
                      <div class="progress"></div>
                    </div> -->
                    <div class="col-md-6 col-md-push-3 buttons">
                      <a href="#" class="btn watch">WATCH</a>
                      <!-- <a href="#" class="btn message">MESSAGE</a> -->
                    </div>
                    <div class="col-md-3 col-md-push-3 location">
                      <div class="location-text text-right">
                       @if($data['personalRecourd']['record']->country != 'NULL')
                       {!! $data['personalRecourd']['record']->country !!}   
                       @endif
                       <i class="fa-cust fa-map-location"></i>
                     </div>
                   </div>
                 </div>

               </div>
             </div>
           </div>
           <div class="diveIntoData">
            <div class="buttons">
              <a href="{!! Url('/signOut') !!}" class="btn explore_bt1">SIGN OUT</a>

            </div>
            <div class="diveIntoData_profile">
              <h4>DIVE INTO THE DATA</h4>
              <p>Get access to the explore
                the data throughour the
                entire community. Look for
                potential collaborators or
                find research papers you
                need to read.</p>

                <div class="buttons">
                  <a href="#" class="btn explore_bt">EXPLORE DATA</a>

                </div>
              </div>
            </div>
          </section> <!-- End Profile Section -->

          <!-- Academic & Professional Lineage Section Start -->

          <section class="education-box">
            <div class="container-profile">
              <div class="profile_sec">
                <div class="col-lg-8 col-sm-8 col-md-push-2 profile-edu pad0">
                  <div class="profile-tree">
                    ACADEMIC & PROFESSIONAL LINEAGE
                  </div>
                  @if(!$data['educationalLineage']['parent'])

                  <div class="col-md-4">
                    <div class="buttons parents_bt">
                     
          @if(session()->get('account_pid') ==$data['personalRecourd']['record']->pid || session()->get('SignIn_pid') ==$data['personalRecourd']['record']->pid)
              <a href="#" class="btn explore_bt" data-toggle="modal" data-target="#AddParents">ADD PARENTS</a>
              @else
              <a href="http://alistgear.com/signIn" class="btn explore_bt">ADD PARENTS</a>
              @endif
        <!-- Add Parents -->
                      <div class="modal fade" id="AddParents" role="dialog">
                      <div class="modal-dialog">
                      <div class="modal-content">
                 
                      <div class="addparrent_model">
                        <div class="col-md-8 col-md-push-2">
                          <div class="parrent_header add_text">
                            <h4 class="header_title"><small>Add</small> Parents </h4>
                               <p>University Professors or Industry Managers</p>
                               <div id="error-message-addParent"></div>
                          </div>
                             
                             {!! Form::open(array('id' => 'AddParent-profile')) !!} 
                      <!--   <form id='AddParent-profile' method="post" enctype="multipart/form-data"> -->
                          <div class="wrapper">   

                                  <div class="form-group text_top_margin">
                                    <input type="text" class="form-control display_input" id="parent_name[]" placeholder="Add Parents Name Here" name="parent_name[]" required/>
                                   <!--  <input name="_token" type="hidden" value="UBy3kAjStN3DF5WzDCV9y2kegakmbaK4uGLGXexZ"> -->
                                    {!! Form::hidden('pid', $data['personalRecourd']['record']->pid) !!} 
                                  </div>
                                  <div class="form-group text_top_margin">
                                    <input type="text" class="form-control display_input" id="affiliation" placeholder="Add Affiliation Here" name="address[]" onkeyup="add_affiliation('affiliation');" required/>
                                    <div id="affiliation-response"> </div>
                                  </div>
                                  <!-- <div class="form-group text_top_margin">
                                    <input type="text" class="form-control display_input" id="city[]" placeholder="Add City Here" name="city[]" required/>
                                  </div>
                                  <div class="form-group text_top_margin">
                                    <input type="text" class="form-control display_input" id="state[]" placeholder="Add State Here" name="state[]" required/>
                                  </div> -->
                                  <div class="row">
                                    <div class="col-md-6">
                                      <div class="form-group text_top_margin display_input">
                                    <input type="text" class="form-control display_input input_width" id="city[]" placeholder="Add City Here" name="city[]" required/>
                                  </div>
                                  </div>
                                    <div class="col-md-6">
                                      <div class="form-group text_top_margin display_input pad_r">
                                      
                                    <input type="text" class="form-control display_input" id="state[]" placeholder="Add State Here" name="state[]" required/>
                                   <!--  <select id="country" name="country" class="select_city  input_width">
                                    <option value="" selected="selected"></option>
                                    <option value="Afghanistan">Afghanistan</option>
                                    <option value="Albania">Albania</option>
                                  </select> -->
                                </div>
                                
                                    </div>
                                  </div>
                                  <div class="form-group text_top_margin">
                                    <input type="text" class="form-control display_input" id="country[]" placeholder="Add Country Here" name="country[]" required/>
                                   <!--  <select id="country" name="country" class="select_country display_input input_width">
                                    <option value="" selected="selected"></option>
                                    <option value="Afghanistan">Afghanistan</option>
                                    <option value="Albania">Albania</option>
                                  </select> -->
                                  </div>
                        
                            </div>
                                  <div class="add_circle">
                                    +
                                  </div>
                                  <div class="save_btn_parent">
                                   {!! Form::submit('SAVE',['class' => 'btn save_bg_parent', 'id' => 'addParent-details']) !!}
                                  </div>
                          <!--  </form> -->
                           {!! Form::close() !!}
                         </div>
                       </div>
                     </div>
                   </div>
               </div><!-- End Add Parents -->
            </div>
        </div>

                  <div class="col-md-4">
                    <div class="addPerantText">
                      We could not find
                      any data about your
                      academic lineage. 
                    </div>
                  </div>

                  <div class="col-md-4">
                    <div class="buttons parents_bt">
                    
                      @if(session()->get('account_pid') ==$data['personalRecourd']['record']->pid || session()->get('SignIn_pid') ==$data['personalRecourd']['record']->pid)
                      <a href="#" class="btn explore_bt" data-toggle="modal" data-target="#AddChildren">ADD CHILDREN</a>
                      @else
                      <a href="{!! URL('/') !!}/signIn" class="btn explore_bt">ADD CHILDREN</a>
                      @endif
                 <!-- Add children -->

                       <div class="modal fade" id="AddChildren" role="dialog">
                      <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="addchild_model">
                               <div class="col-md-8 col-md-push-2">
                                    <div class="child_header child_text">
                                        <h4 class="header_title_child"><small>Add</small> Children</h4>
                                           <p>University Students or Industry Direct Reports</p>
                                           <div id="error-message-AddChildren"></div>
                                    </div>

                           {!! Form::open(array('id' => 'AddChildren-profile')) !!}
                          <!--   <form id='AddChildren-profile' method="post" enctype="multipart/form-data"> -->
                               <div class="wrapper_child">          
                                  <div class="form-group text_top_margin_child">
                                    <input type="text" class="form-control display_input_child" id="parent[]" placeholder="Add Parents Name Here" name="parent[]" required/>
                                   <!--  <input name="_token" type="hidden" value="UBy3kAjStN3DF5WzDCV9y2kegakmbaK4uGLGXex"> -->
                                    {!! Form::hidden('pid', $data['personalRecourd']['record']->pid) !!} 
                                  </div>
                                  <div class="form-group text_top_margin">
                      <input type="text" class="form-control display_input_child" id="child_affiliation" placeholder="Add Affiliation Here" name="location[]" onkeyup="add_affiliation('child_affiliation');" required/>
                                    <div id="child_affiliation_response"> </div>
                                  </div>
                                 <!--  <div class="form-group text_top_margin">
                                    <input type="text" class="form-control display_input_child" id="city_name[]" placeholder="Add City Here" name="city_name[]" required/>
                                  </div>
                                  <div class="form-group text_top_margin">
                                    <input type="text" class="form-control display_input_child" id="state_name[]" placeholder="Add State Here" name="state_name[]" required/>
                                  </div>
                                  <div class="form-group text_top_margin">
                                    <input type="text" class="form-control display_input_child" id="country_name[]" placeholder="Add Country Here" name="country_name[]" required/>
                                  </div> -->
                                       <div class="row">
                                    <div class="col-md-6">
                                      <div class="form-group text_top_margin display_input pad_r">
                                    <input type="text" class="form-control display_input input_width" id="city[]" placeholder="Add City Here" name="city[]" required/>
                                  </div>
                                  </div>
                                    <div class="col-md-6">
                                      <div class="form-group text_top_margin display_input pad_r">
                                      
                                    <input type="text" class="form-control display_input" id="state[]" placeholder="Add State Here" name="state[]" required/>
                                    <!-- <select id="country" name="country" class="select_city  input_width">
                                    <option value="" selected="selected"></option>
                                    <option value="Afghanistan">Afghanistan</option>
                                    <option value="Albania">Albania</option>
                                  </select> -->
                                </div>
                                
                                    </div>
                                  </div>
                                  <div class="form-group text_top_margin">
                                    <input type="text" class="form-control display_input" id="country[]" placeholder="Add Country Here" name="country[]" required/>
                                    <!-- <select id="country" name="country" class="select_country display_input input_width">
                                    <option value="" selected="selected"></option>
                                    <option value="Afghanistan">Afghanistan</option>
                                    <option value="Albania">Albania</option>
                                  </select> -->
                                  </div>
                              </div>
                                <div class="add_circle_child">
                                  +
                                </div>
                                <div class="save_btn_child">
                                {!! Form::submit('SAVE',['class' => 'btn save_bg_child']) !!}
                               </div>
                            <!--  </form> -->
                            {!! Form::close() !!}
                            </div>
                          </div>
                       </div>
                     </div>
                   </div>
                </div>
             </div> <!-- End Add Children -->
           @else
  <!-- ============================   start here ============================================ -->

    @if(isset($data['educationalLineage']))
      <?php 
      if(isset($data['educationalLineage']['parent'])){
        $count_parent = count($data['educationalLineage']['parent']); 
      }else{
        $count_parent = 0;
      }

      if(isset($data['educationalLineage']['children'])){
        $count_children = count($data['educationalLineage']['children']);
      }else{
       $count_children = 0;
     }

     ?>

  <!-- <div class="container">
  <div class="row1"> -->
    <div class="next" id="maindiv-slider">

      <div class="angle" id="grand_parent_slider" style="display: none;">
          <span class="angle_left" onclick="grand_parent_slider()">
         <i class="fa fa-angle-left" aria-hidden="true"></i></span>
      </div>

      <div class="angle" id="parent_child">
        
          <span class="angle_left" id="parent_slider" onclick="parent_slider_one('left-1')">
            <i class="fa fa-angle-left" aria-hidden="true"></i></span>

          <span class="angle_right" id="children_slider" onclick="children_slider('rightside-1')">
         <i class="fa fa-angle-right" aria-hidden="true"></i></span>

         <span class="angle_right" id="parent_slider_back" onclick="parent_slider_one('rightside-1')" style="display: none;">
         <i class="fa fa-angle-right" aria-hidden="true"></i></span>
      </div>

       <div class="angle" id="child_grandchild" style="display: none;">
          <span class="angle_right" onclick="grandchild_slider()">
         <i class="fa fa-angle-right" aria-hidden="true"></i></span>
      </div>

 <!-- greate parent details for three div -->

<div class="tab8" id="tab8"> 
    <div class="col-md-4" id="loader_lineage_great_grand_parent" style="display: none;">
       <div class="load">
         <div class="loader_greate_grand"></div>
      </div>
    </div>
    <div class="text" id="great_grand_parent_records"></div>
 </div>

      <!-- parent details for three div -->

      <div class="tab7" id="tab7"> 
         <div class="col-md-4" id="parent_loader_thired" style="display: none;">
             <div class="load">
               <div class="loader_lineage"></div>
            </div>
        </div>
        <div class="text" id="parent_thired">

        </div>
     </div>

           <!-- parent details for two div -->

   <div class="tab6" id="tab6"> 
       <div class="col-md-4" id="parent_loader_second" style="display: none;">  
           <div class="load">
             <div class="loader_lineage"></div>
          </div>
      </div>
        <div class="text" id="parent_second"></div>
   </div>


      <div class="col-md-8" id="parent_loader_first" style="display: none;">
        <div class="load">
          <div class="loader_lineage"></div>
        </div>
      </div>

   <div class="tab1 active" id="tab1">
    <div class="col-md-4 slide-edu tab1_first" >
      
         <div class="title_child"><?php echo $count_parent; echo "&nbsp";?> PARENT</div>

            <div class="scroll_up_parent" style="display: none;">
                <ul class="pagination">
                  <li><i class="fa fa-angle-up" aria-hidden="true"></i></li>
                </ul>
             </div>

         <div class="test">
         @if(isset($data['educationalLineage']['parent'][0]))
           @foreach($data['educationalLineage']['parent'] as $key=>$parent)
               <?php $key = $key +1; ?>
               @if($key < 6)
                 <div class="nmain_box1" id="{{$parent->pid}}">
                      <div class="nname_box">
                     <a href="JavaScript:void(0)" class="part1" onclick="children_lock('<?php echo $parent->pid; ?>')"
                          id="locks{{$parent->pid}}">
                          <i class="fa fa-unlock-alt" aria-hidden="true"></i></a>
                        <div class="npart2">
                          <a href="{!! URL('/') !!}/author-details/<?php echo $parent->pid; ?>">
                            <?php echo substr($parent->name,0,15); ?></a>
                        </div>
                        <div class="npart3"></div>
                      </div>
                  </div> 
               @endif

               @if($key >6) 
                 <div class="nmain_box1" id="{{$parent->pid}}" style="display: none;">
                    <div class="nname_box">
                      <a href="JavaScript:void(0)" class="part1" onclick="children_lock('<?php echo $parent->pid; ?>')"
                          id="locks{{$parent->pid}}">
                        <i class="fa fa-unlock-alt" aria-hidden="true"></i></a>
                      <div class="npart2">
                        <a href="{!! URL('/') !!}/author-details/<?php echo $parent->pid; ?>">
                          <?php echo substr($parent->name,0,15); ?></a>
                      </div>
                      <div class="npart3"></div>
                    </div>
                </div> 
                @endif
             @endforeach
          @endif 
        </div>
        @if($count_parent >=6)
           <div class="scroll_down_parent">
              <ul class="pagination">
                <li><i class="fa fa-angle-down" aria-hidden="true"></i></li>
              </ul>
            </div>
        @endif

    </div>
</div>

      <div class="tab2 active" id="tab2">
        <div class="col-md-4 slide-image active">
          <div class="mid_section">
            <div class="nround_img">
               @if($data['personalRecourd']['record']->image_name)

              @if($data['personalRecourd']['record']->image_name == 'NULL')
              <img alt="abc" src="{!! URL::to('public/assets/images/picture-not.jpg') !!}">

              @elseif(strpos($data['personalRecourd']['record']->image_name, "photo/00"))

              <img alt="abc" src="{!! $data['personalRecourd']['record']->image_name !!}">

              @elseif(strpos($data['personalRecourd']['record']->image_name, "http://www.cns.nyu.edu") !== false)
              <img alt="abc" src="{!! $data['personalRecourd']['record']->image_name !!}">
              @elseif($data['personalRecourd']['record']->image_name != 'NULL')
              <img alt="abc" src="../public/assets/images/{!! $data['personalRecourd']['record']->image_name !!}">
              @else
              <img alt="abc" src="{!! URL::to('public/assets/images/picture-not.jpg') !!}">
              @endif
              @else
              <img alt="abc" src="{!! URL::to('public/assets/images/picture-not.jpg') !!}">
              @endif
            </div>
            <div class="nname_plate">{!! $data['personalRecourd']['record']->name !!}</div>
            </div>
        </div>
      </div>

      <div class="col-md-8" id="loader_lineage" style="display: none;">
        <div class="load">
          <div class="loader_lineage"></div>
        </div>
      </div>

    <div class="tab3 active" id="tab3">
     <div class="col-md-4 slide-edu tab3_third">
      
      <div class="title_child"><?php echo $count_children; echo "&nbsp"; ?> CHILDREN</div>

            <div class="scroll-up" style="display: none;">
                <ul class="pagination">
                  <li><i class="fa fa-angle-up" aria-hidden="true"></i></li>
                </ul>
              </div>
         <!--  <div class="test1"></div> -->
          <div class="test">
           @if(isset($data['educationalLineage']['children'][0]))
            @foreach($data['educationalLineage']['children'] as $key=>$children)
             <?php $key = $key +1; ?>
             @if($key < 6)
             
               <div class="nmain_box1 active" id="{{$children->pid}}">
                    <div class="nname_box">
                <a href="JavaScript:void(0)" class="part1" onclick="children_lock('<?php echo $children->pid; ?>')"
                  id="locks{{$children->pid}}">
                        <i class="fa fa-unlock-alt" aria-hidden="true"></i>
                      </a>
                      <div class="npart2">
                        <a href="<?php echo base_url; ?>author-details/<?php echo $children->pid; ?>">
                        <?php echo substr($children->name,0,15); ?></a></div>
                      <div class="npart3"></div>
                    </div>
                </div>
             @endif

             @if($key >=6)
               <div class="nmain_box1" id="{{$children->pid}}" style="display: none;">
                    <div class="nname_box">
                 <a href="JavaScript:void(0)" onclick="children_lock('<?php echo $children->pid; ?>')"
                  id="locks{{$children->pid}}" class="part1">
                    <i class="fa fa-unlock-alt" aria-hidden="true"></i></a>
                      <div class="npart2">
                        <a href="<?php echo base_url; ?>author-details/<?php echo $children->pid; ?>">
                        <?php echo substr($children->name,0,15); ?></a></div>
                      <div class="npart3"></div>
                    </div>
                </div>
             @endif
            @endforeach 
           @endif
           </div>

            @if($count_children >=6)
              <div class="scroll_down">
                <ul class="pagination">
                  <li><i class="fa fa-angle-down" aria-hidden="true"></i></li>
                </ul>
              </div>
            @endif
     </div>
   </div>
 
 <div class="tab4" id="tab4"> 
     <div class="col-md-4" id="loader_lineage_grand1" style="display: none;">
         <div class="load">
           <div class="loader_lineage"></div>
        </div>
    </div>
      <div class="text" id="tabnew"></div>
 </div>
 <div class="tab5" id="tab5"> 
    <div class="col-md-4" id="loader_lineage_great_grand" style="display: none;">
       <div class="load">
         <div class="loader_greate_grand"></div>
      </div>
    </div>
    <div class="text" id="grand_new_records"></div>
 </div>
  
    </div>
 @endif
   <!-- end here ============================================================================================= -->               
     @endif


</div>
</div>
</div>
</section><!-- End Academic & Professional Lineage Section Start -->

      <!-- Top Collaborators Section Start -->

      <section class="education-box">
        <div class="container-profile">
          <div class="profile_sec">
            <div class="col-lg-8 col-sm-8 col-md-push-2 profile-edu pad0">
              <div class="profile-tree">
                TOP COLLABORATORS
              </div>
              @if(! $data['collaborators'][0])

              <div class="col-md-4"> </div>
              <div class="col-md-4">
                <div class="addPerantText">
                  We could not find any data about your top collaborators.
                </div>
                <div class="buttons parents_bt margin_btn">
                  
                  @if(session()->get('account_pid') ==$data['personalRecourd']['record']->pid || session()->get('SignIn_pid') ==$data['personalRecourd']['record']->pid)
                <a href="#" class="btn explore_bt" data-toggle="modal" data-target="#AddCollaborators">ADD COLLABORATORS</a>
                @else
                <a href="http://alistgear.com/signIn" class="btn explore_bt">ADD COLLABORATORS</a>
                @endif

          <!-- Add Collaborators  -->

                 <div class="modal fade" id="AddCollaborators" role="dialog">
                   <div class="modal-dialog">
                     <div class="modal-content"> 
                     <div class="addCollaborators_model">
                     <div class="col-md-8 col-md-push-2">
                       <div class="Collaborators_header Collaborators_text">
                           <h4 class="header_title_Collaborators">
                            <small>Add</small> Collaborators
                          </h4>
                          <p>People you’ve collaborated with</p>
                          <div id="error-message-collaborators"></div>
                      </div>
                        {!! Form::open(array('id' => 'AddCollaborators-profile')) !!} 
                    <!--   <form id='AddCollaborators-profile' method="post" enctype="multipart/form-data"> -->
                        <div class="wrapper_Collaborators">          
                          <div class="form-group text_top_margin">
                              <input type="text" class="form-control display_input" placeholder="Add Parents Name Here" 
                              name="cols_parent[]" required/>
                              <!-- <input name="_token" type="hidden" value="UBy3kAjStN3DF5WzDCV9y2kegakmbaK4uGLGXex"> -->
                              {!! Form::hidden('pid', $data['personalRecourd']['record']->pid) !!} 
                          </div>
                          <div class="form-group text_top_margin">
                   <input type="text" class="form-control display_input" placeholder="Add Affiliation Here" 
                   name="cols_address[]" id="collaborators_Affiliation" onkeyup="add_affiliation('collaborators_Affiliation');" required/>
                              <div id="coll-affiliation-response"> </div>
                          </div>
                          <!-- <div class="form-group text_top_margin">
                            <input type="text" class="form-control display_input" placeholder="Add City Here" 
                            name="cols_city[]" id="cols_city[]" required/>
                          </div>
                          <div class="form-group text_top_margin">
                            <input type="text" class="form-control display_input" placeholder="Add State Here" 
                            name="cols_state[]" id="cols_state[]" required/>
                          </div>
                          <div class="form-group text_top_margin">
                            <input type="text" class="form-control display_input" placeholder="Add Country Here" 
                            name="cols_country[]" id="cols_country[]" required/>
                          </div> -->
                          <div class="row">
                                    <div class="col-md-6">
                                      <div class="form-group text_top_margin display_input pad_r">
                                    <input type="text" class="form-control display_input input_width" id="cols_city[]" placeholder="Add City Here" name="cols_city[]" required/>
                                  </div>
                                  </div>
                                    <div class="col-md-6">
                                      <div class="form-group text_top_margin display_input pad_r">
                                      
                                    <input type="text" class="form-control display_input" id="cols_state[]" placeholder="Add State Here" name="cols_state[]" required/>
                                    <!-- <select id="country" name="country" class="select_city  input_width">
                                    <option value="" selected="selected"></option>
                                    <option value="Afghanistan">Afghanistan</option>
                                    <option value="Albania">Albania</option>
                                  </select> -->
                                </div>
                                
                                    </div>
                                  </div>
                                  <div class="form-group text_top_margin">
                                    <input type="text" class="form-control display_input" id="cols_country[]" placeholder="Add Country Here" name="cols_country[]" required/>
                                   <!--  <select id="country" name="country" class="select_country display_input input_width">
                                    <option value="" selected="selected"></option>
                                    <option value="Afghanistan">Afghanistan</option>
                                    <option value="Albania">Albania</option>
                                  </select> -->
                                  </div>
                      </div>
                      <div class="add_circle_Collaborators">
                        +
                      </div>
                      <div class="save_btn_Collaborators">
                         {!! Form::submit('SAVE',['class' => 'btn save_bg_Collaborators']) !!}
                      </div>
                     <!--  </form> -->
                      {!! Form::close() !!}
                    </div>
                  </div>
                </div>
              </div>
            </div> <!-- End Add Collaborators  -->
          </div>
        </div>
              <div class="col-md-12"> </div>
              @else
              <div class="tm-top-box">
                @if(isset($data['collaborators'][0]))
                @foreach($data['collaborators'] as $key =>$allcoll)
                @if($key <=4)
                <div class="col-md-2 col-md-push-1 tm-top-box-profile">
                  <div class="tm-top-box-img_avtar">
                   <!--  <img src="{!! URL::to('/public/assets/images/v3.png') !!}"> -->
                   @if($allcoll->image_name != "NULL" && $allcoll->image_name = "")
                   @if((strpos($allcoll->image_name,"https://neurotree.org") !== false) || strpos($allcoll->image_name,"http://www.cns.nyu.edu") !== false)

                   <img alt="" src="{!! $allcoll->image_name !!}"> 
                   @else
                   <img alt="" src="../public/assets/images/{!! $allcoll->image_name !!}">
                   @endif
                   @else
                   <img src="{!! URL::to('/public/assets/images/picture-not.jpg') !!}">
                   @endif

                 </div>
                 <div class="tm-top-box-des">
                  <h4>{!! $allcoll->name !!}</h4>
                  <p>{!! $allcoll->address !!}</p>
                </div>
              </div>
              @endif
              @endforeach
              @endif
            </div>
            @endif

          </div>
        </div>
      </div>
    </section><!-- End Top Collaborators Section -->

    <!-- Videos Section Start -->

    <section class="education-box">
      <div class="container-profile">
        <div class="profile_sec">
          <div class="col-lg-8 col-sm-8 col-md-push-2 profile-edu pad0">
            <div class="profile-tree">
              VIDEOS
            </div>
            <div class="tm-top-box-video">
              @if(! $data['videos'])

              <div class="col-md-4"></div>
              <div class="col-md-4">
                <div class="buttons parents_bt">                   
                  
           @if(session()->get('account_pid') ==$data['personalRecourd']['record']->pid || session()->get('SignIn_pid') ==$data['personalRecourd']['record']->pid)
            <a href="#" class="btn explore_bt ADD_video_btn" data-toggle="modal" data-target="#addVideo">ADD VIDEOS</a>
            @else
            <a href="http://alistgear.com/signIn" class="btn explore_bt ADD_video_btn">ADD VIDEOS</a>
            @endif
                  <!-- Modal -->
                  <div class="modal fade" id="addVideo" role="dialog">
                    <div class="modal-dialog">

                      <!-- Modal content-->
                      <div class="modal-content">
                        <div class="modal-header addSec">
                          <button type="button" class="close" data-dismiss="modal">&times;</button>
                          <h4 class="modal-title">
                            <small>Add</small>
                            Videos
                          </h4>
                          <p>Add videos that you’re interested in</p>
                         <div id="error-message-video"></div>
                        </div>

                        <div class="modal-body body-popup">
                          <div class="col-md-8 col-md-push-2">                            
                                 {!! Form::open(array('id' => 'registration')) !!} 
                         <!--  <form id='registration' method="post" enctype="multipart/form-data"> -->
                            <div class="form-group">
                              {!! Form::text('video[]', '', ['class' => 'form-control', 'id' => 'video1', 
                              'placeholder' => 'Add Video Link Here', 'required' => 'required']) !!} 
                                <!--  <input name="_token" type="hidden" value="UBy3kAjStN3DF5WzDCV9y2kegakmbaK4uGLGXexZ"> -->
                            </div>

                            <div class="form-group">
                              {!! Form::text('video[]', '', ['class' => 'form-control', 'id' => 'video2', 
                              'placeholder' => 'Add Video Link Here']) !!}
                            </div>

                            <div class="form-group">
                              {!! Form::text('video[]', '', ['class' => 'form-control', 'id' => 'video3', 
                              'placeholder' => 'Add Video Link Here']) !!}
                            </div>

                            <div class="form-group">
                             {!! Form::text('video[]', '', ['class' => 'form-control', 'id' => 'video4', 
                             'placeholder' => 'Add Video Link Here']) !!}

                             {!! Form::hidden('pid',$data['personalRecourd']['record']->pid) !!}
                            
                           </div>

                           <div class="copy hide">
                            <div class="showInputNew input-group" style="margin-top:10px">
                              <input type="text" class="form-control" 
                              placeholder="Add Video Link Here" name="video[]">
                              <div class="input-group-btn"> 
                                <button class="btn btn-danger remove" type="button">
                                  <i class="glyphicon glyphicon-remove"></i>
                                </button>

                              </div>                                  
                            </div>
                          </div>

                          <div class="after-add-more">
                            <div class="plus_icon add-more" id="addButton">
                              <img src="{{ Url('/public/assets/images/add-plus.png') }}">
                            </div>
                          </div>                              

                          <div class="addSubmitBt">
                            {!! Form::submit('SAVE',['class' => 'btn btn_get-add', 'id' => 'addvideo-details']) !!}
                          </div>
                         <!--  </form> -->
                           {!! Form::close() !!}
                        </div>  
                      </div>                         
                    </div>

                  </div>
                </div>
              </div>
            </div>

            <div class="col-md-4"></div>
            @else

            @if($data['videos'][0])
            @if($data['videos'][0] != 'NULL')

            <div class="all-videos " id="all-videos">
              <ul>
                @foreach($data['videos'] as $key1 =>$allVideo)
                <li>
                  <div class="tm-top-box-img">                                  
                   <iframe id="cartoonVideo" style="width:100%; border:0;"  
                   src='{!! str_replace("watch?v=","embed/", $allVideo)  !!}' allowfullscreen=""> </iframe>
                 </div>
                     <!-- <div class="tm-top-box-des">
                      <h4>Geoffrey Hinton: The Foundations of Deep Learning</h4>
                    </div> -->
                  </li>
                  @endforeach
                </ul>
              </div>

              @endif
              @endif
              @endif

            </div>
          </div>
        </div>
      </div>
    </section> <!-- End Videos Section Start -->

    <section class="education-box">
      <div class="container-profile">
        <div class="profile_sec">
          <div class="col-lg-8 col-sm-8 col-md-push-2 profile-edu pad0">
            <div class="profile-tree">
              PUBLICATIONS
            </div>
            <div class="tm-top-box">
             @if(!$data['publications'])
             <div class="col-md-4"></div>
             <div class="col-md-4">
               <div class="addPerantText">
                We could not find any publication you've written.
              </div>
              <div class="buttons parents_bt">
  
              @if(session()->get('account_pid') ==$data['personalRecourd']['record']->pid || session()->get('SignIn_pid') ==$data['personalRecourd']['record']->pid)
                 <a href="#" class="btn explore_bt margin_btn_1" data-toggle="modal" data-target="#addpublication">
                ADD PUBLICATIONS</a>
             @else
                <a href="http://alistgear.com/signIn" class="btn explore_bt margin_btn_">ADD PUBLICATIONS</a>
             @endif



            <div id="addpublication"role="dialog" class="modal fade">
              <div class="addPublications_model col-md-6 col-md-push-3">
                <div class="col-md-8 col-md-push-2">
                  <div class="Publications_header Publications_text">
                    <h4 class="header_title_Publications">
                        <small>Add</small>
                            Publications 
                    </h4>
                      <p>Add publications of your work and/or research.</p>
                      <div id="error-message-publications"></div>
                  </div>

                  {!! Form::open(array('id' => 'Addpublications_profile')) !!}   
 
               <!--  <form id='Addpublications_profile' method="post" enctype="multipart/form-data"> -->
                  <div class="wrapper_Publications">  
                          <div class="form-group text_top_margin_Publications">
                            <label for="sel1" class="label_left">Type of publication</label>
                              <select class="form-control display_input_Publications" id="publications" name="publications[]">
                                <option value="Paper">Paper</option>
                                <option value="Book">Book</option>
                                <option value="Blog post">Blog post</option>
                              </select>
                          </div>
                          <!-- <meta name="csrf-token" content="{{ csrf_token() }}"> -->
                          
                           {!! Form::hidden('pid', $data['personalRecourd']['record']->pid) !!} 
                          <div class="form-group display_input_Publications">
                            <label class="label_left" for="Publications">Title</label>
                            <input type="text" class="form-control display_input_Publications_1" id="title" placeholder="Title" name="tittle[]" required/>
                          </div>
                          <div class="row"></div>
                          <div class="col-md-6 padd-l">
                          <div class="form-group top_1">
                            <label for="sel1" class="label_left">Publication Name</label>
                              <input type="text" class="form-control display_input_Publications_1" id="title" 
                              placeholder="Publication" name="publication_name[]" required/>
                          </div>
                         </div>
                          <div class="col-md-6 padd-r">
                           <div class="form-group top_1">
                            <label for="sel1" class="label_left">Year Publication</label>
                              <select class="form-control" id="year" name="year[]">
                                <option value="2019">2019</option>
                                <option value="2018">2018</option>
                                <option value="2017">2017</option>
                                <option value="2016">2016</option>
                              </select>
                              </div>
                          </div>

                          <div class="form-group">
                            <label class="label_left" for="Publications">Link to Article or Paper</label>
                            <input type="text" class="form-control display_input_Publications" id="link" placeholder="Add Link Here" name="publication_link[]" required/>
                          </div>

                           <div class="form-group">
                            <label class="label_left" for="Publications">Cited By</label>
                            <input type="text" class="form-control display_input_Publications" id="cited_by" placeholder="Cited By" name="cited_by[]" required/>
                          </div>
                  </div>
                          <div class="add_circle_Publications">
                            +
                          </div>
                          <div class="save_btn_Publications">
                          {!! Form::submit('SAVE',['class' => 'btn save_bg_Publications']) !!}
                          </div>
                   <!--  </form> -->
                   {!! Form::close() !!}
                </div>
              </div>
          </div>
                
              </div>

            </div>
            <div class="col-md-4"></div>
            @else
            <div class="tm-top-box-pub">
              <table class="table">
                <thead>
                  <tr>
                    <th>YEAR</th>
                    <th>TITLE</th>
                    <th>PUBLICATION</th>
                    <th>CITED by</th>
                    <th>C0ST</th>
                    <th>LINK</th>
                  </tr>
                </thead>
                <tbody id="body">
                 @if(!empty($data['publications'][0]))
                 @foreach($data['publications'] as $key=>$publication)
                 @if($key <=5)
                 <tr class="<?php if($key % 2 ==0){ echo "even"; }else{ echo "odd"; }?>">
                  <td>{{ $publication->year}}</td>
                  <td>{{ $publication->title}}</td>
                  <td>{{ $publication->publication_name}}</td>
                  <td>{{ $publication->cited_by}}</td>
                  <td><a href="#"><img src="{!! URL::to('/public/assets/images/cost-icon.png') !!}"></a></td>
                  <td><a href="{{ $publication->links}}">
                    <img src="{!! URL::to('/public/assets/images/link-icon.png') !!}">
                  </a>
                </td>
              </tr>
              @endif
              @endforeach
              @endif 
            </tbody>
            <div class="table-responsive" id="second-pub"></div>
          </table>
        </div>
        <div class="tm-pub-footer">
          <div class="col-md-9"> 
            {!! Session::put('publication_id', $data['personalRecourd']['record']->pid); !!}
            <a href="{!! Url('publication') !!}" class="btn seeAll">
              SEE ALL</a>
            </div>
            <div class="col-md-3">
              <div id="pub-search">
                <div class="input-group stylish-input-group">

                 {!! Form::text('search_title', '',['class' =>'form-control', 'id'=>'txtSearchs', 'placeholder'=>'Search', 
                 'autocomplete' =>'off']) !!} 

                 {!! Form::hidden('search_title', $data['personalRecourd']['record']->pid,['class' =>'form-control', 'id'=>'txtSearchs1',]) !!}

                 <span class="input-group-addon">
                  <button type="button" id="txtSearchsBTns">
                    <span class="glyphicon glyphicon-search"></span>
                  </button>
                </span>
              </div>
            </div>
          </div>
        </div>
        @endif
      </div>
    </div>
  </div>
</div>
</section>

<section class="mapSec-bootom">
  <div class="map-sec">
    <div class="col-md-8 col-md-push-2 pad0">

      <div class="profile-tree">
        GEOGRAPHIC NETWORK
      </div>
      <div class="map-card">
        <div class="googleMap">
          <div class="loader" id="loader" style="display: none;">
           <img src="http://alistgear.com/public/assets/banner/loader.gif">
         </div>
         <div id="map" style="height: 500px;">
         </div>
         <div class="col-md-12 serchMap pad0">
          <div class="col-md-6">
            <div class="col-md-5 pad_margin_1">
           <label class="selectArea" for="sel1">FOCUS AREA</label>
         </div>
         <div class="col-md-7 pad_margin_2">
           <select class="form-control" id="sel1">
            <option>LIST OF TOPIC OPTIONS</option>
            @if($data['topic_options'][0])
            @foreach($data['topic_options'] as $value)
            {!! $value !!}
            @endforeach
            @endif
          </select>
        </div>
        </div>
        <div class="col-md-4">
          <div class="mySearch" id="mySeach">
             <form id="theForm">
            <div id="custom-search-input">
              <div class="input-group col-md-12">
                {!! Form::text('search_title', '',['class' =>'form-control','id'=>'network-search', 'placeholder'=>'Search for individual','autocomplete' =>'off']) !!} 
                <span class="input-group-btn" id="input-group-btn">
                  <button class="btn btn-danger" id="individual-search" type="button">
                    <span class=" glyphicon glyphicon-search"></span>
                  </button>
                </span>
              </div>
            </div>
            <div class="searchAutosearch" id="suggesstion-network">

            </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</div>
</section>

<script src="script.js"></script>
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
  if(!empty($data['geographic_network'][0]['name'])){
   foreach ($data['geographic_network'] as $key => $value) { ?>

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
 }

 ?>
 var locations = [<?php location_details(count($data['geographic_network'])); ?>]

 var map = new google.maps.Map(document.getElementById('map'), {
  zoom: 14,
  center: new google.maps.LatLng(<?php echo $data['geographic_network'][0]['latitude']; ?>, 
    <?php echo $data['geographic_network'][0]['longitude']; ?>),
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

   <!--    Add Collaborators -->
<script type="text/javascript">
  $(document).ready(function() {
    var max_fields_limit      = 10; //set limit for maximum input fields
    var x = 1; //initialize counter for text box
    $('.add_circle_Collaborators').click(function(e){ //click event on add more fields button having class add_more_button
        e.preventDefault();
        if(x < max_fields_limit){ //check conditions
            x++; //counter increment
             var class_one = "collaborators_Affiliation"+x; var class_two = "coll-affiliation-response"+x; 
              var fun_metode = "add_affiliation('"+class_one+"');";
            $('.wrapper_Collaborators').append('<div class="add_parent"><input type="text" placeholder="Add Parents Name Here" name="cols_parent[]" class="form-control display_input_Collaborators" required/><a href="#" class="minus_circle_Collaborators">-</a><input type="text" placeholder="Add Affiliation Here" name="cols_address[]" id="'+class_one+'" onkeyup="'+fun_metode+'" class="form-control display_input_Collaborators" required/><div id="'+class_two+'"> </div><div class="row"><div class="col-md-6"><div class="form-group display_input pad_r"><input type="text" class="form-control display_input input_width" id="cols_city[]" placeholder="Add City Here" name="cols_city[]" required/></div></div><div class="col-md-6"><div class="form-group display_input pad_r"><input type="text" class="form-control display_input" id="cols_state[]" placeholder="Add State Here" name="cols_state[]" required/></div></div></div><input type="text" placeholder="Add Country Here" name="cols_country[]" class="form-control display_input_Collaborators" required/></div>'); //add input field
        }
    });  
    $('.wrapper_Collaborators').on("click",".minus_circle_Collaborators", function(e){ //user click on remove text links
        e.preventDefault(); $(this).parent('div').remove(); x--;
    })
});
</script>

<script type="text/javascript">

        function children_slider(class_id){  /* start hear to slider for children*/
            var cid = class_id;
            var pid = <?php echo $data['personalRecourd']['record']->pid; ?>;


            var allclass = []; 
             i = 0;

            $( "#maindiv-slider" ).find(".active").each(function( index ) {

                if (isNaN($( this ).attr('id'))) {
                    if($( this ).attr('id')){
                         allclass[i++] = $( this ).attr('id'); 
                     }
                  }   
             });

            if(allclass[0] == 'tab7' && allclass[1] == 'tab6' && allclass[2] == 'tab2'){

              /* $(".mid_section").show();
               $("#tabnew").show();

               $(".tab6").removeClass("active");
               $(".tab7").removeClass("active");
               
               $("#tab6").hide();
               $("#tab7").hide();
               
               $("#tab1").show();
               $("#tab3").show();*/
               location.reload();
                
            }else{

            $(".tab1").removeClass("active");
            $(".tab3").removeClass("active");
            $('#maindiv-slider').find('.slide-edu:visible').css('display','none');             
             $("#loader_lineage").show();
             $("#tab4").show();

             $("#tab6").hide();
             $("#tab7").hide();

             $.ajax({ 
                  type : "GET",
                  url  : "grand-children",
                  data : { pid: pid},
                  success: function(data){
                       $(".loader_lineage").hide();
                       $("#tabnew").show();
                       $("#tabnew").html(data);
                       $("#col-md-4 slide-edu active").hide();
                       $("#children_slider").hide();
                       $("#child_grandchild").show();
                       $("#tab4").addClass("active");   

                       $("#parent_second").hide();
                       $("#parent_thired").hide();

                       $("#tab6").removeClass("active");
                       $("#tab7").removeClass("active");

                       $(".angle_left").show();

                   }
              });
            }

    } /* End hear to slider for children*/

         function parent_slider_one(class_id){  /* start hear to slider for children*/
            var cid = class_id;
            var pid = <?php echo $data['personalRecourd']['record']->pid; ?>;

             var allclass = []; 
             i = 0;

            $( "#maindiv-slider" ).find(".active").each(function( index ) {

                if (isNaN($( this ).attr('id'))) {
                    if($( this ).attr('id')){
                         allclass[i++] = $( this ).attr('id'); 
                     }
                  }   
             });
             
             if(allclass[0] == 'tab4' && allclass[1] == 'tab5'){

               $(".mid_section").show();
               $("#tabnew").show();

               $(".tab5").removeClass("active");
               $("#tab2").addClass("active");

               $("#tab5").hide();
               $("#loader_lineage").hide();
                
            }
            if(allclass[0] == 'tab8' && allclass[1] == 'tab7' && allclass[2] == 'tab6'){

               $("#great_grand_parent_records").hide();

               $(".mid_section").show();
               
               $("#tab8").removeClass("active");
               $("#tab2").addClass("active");

               $("#tab8").hide();

               $("#children_slider").show();
               $("#parent_slider_back").hide(); 

               $("#grand_parent_slider").show();               
                
            }

            if(allclass[0] == 'tab2' && allclass[1] == 'tab4'){

               $(".tab1_first").show(); 
               $(".tab3_third").show(); 

                // boder for next function.
               $("#children_slider").show();
               $("#child_grandchild").hide();

               $("#tab1").addClass("active");
               $("#tab3").addClass("active");

               $(".tab4").removeClass("active");

               $("#tab4").hide();
               $("#loader_lineage").hide();
               
            }

            if(allclass[0] == 'tab1' && allclass[1] == 'tab2' && allclass[2] == 'tab3'){

               $("#tab2").show();

               $("#tab1").hide();
               $("#tab3").hide();

               $("#tab6").show();
               $("#tab7").show();

               $("#tab1").removeClass("active");
               $("#tab3").removeClass("active");

               $("#parent_loader_first").show();
              
             $.ajax({ 
                  type : "GET",
                  url  : "first-parent-record",
                  data : { pid: pid},
                  success: function(data){
                    $("#parent_loader_first").hide();
                     $('#parent_second').html(data);
                     $("#parent_loader_thired").show();  
                     $("#tab6").addClass("active"); 

                     //$("#grand_parent_slider").hide();

                      $("#parent_second").show();
                       $("#parent_thired").show();                     
                  }
              });
            }

    } /* End hear to slider for children*/

    //second parent methode.
function second_parent_methode(clas_position){

      var second_parent_pid = [];
          i = 0;
      $( "#tab6 .lagre_div1" ).find(".active").each(function( index ) {
          second_parent_pid[i++] = $( this ).attr('id'); 
       }); 
      if(!second_parent_pid[1]){
          second_parent_pid[1] = 'aaa';
      }
          $("#parent_loader_thired").show();
          $(".loader_lineage").show();
          $("#grand_parent").hide();
          $("#parent_slider").hide();
          
       $.ajax({ 
                type : "GET",
                url  : "second-parent-record",
                data : { pid: second_parent_pid, divposition :clas_position},
                success: function(data){
                  $("#parent_loader_thired").hide();
                   $("#grand_parent_slider").show()

                   $('#parent_thired').html(data);  
                   $("#tab7").addClass("active");
               }
         });
      }
</script>
@include('footer')
