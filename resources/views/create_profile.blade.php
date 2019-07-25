
<?php

/*echo "<pre>";
print_r($data[1]); exit;*/

?>

@extends ('layouts.app') 
@section ('content')

 <div class="overlay"></div>
  <div class="alistgear_wrapper">
   <div class="container">
     <div class="alistgear_main_wrapper">
      <header>   
        <div class="header">
          <div class="logo">
            <a href="{!! Url('/') !!}"><img src="{!! URL::to('/public/assets/images/logo.png') !!}"></a>
          </div>  
        </div>   
      </header>
       
      <div class="alistgear_main_create">

        <div class="alistgear_section_main ">
          <div class="alistgear_section">
            <div class="col-md-6 col-md-push-3 alistgear_section-card_claim crete_profile">
              <div class="alistgear_section_card card_claim_profile">
                <span>
                  <h1>Create your <small>Profile</small>                    
                  </h1>
                   <div class="mainError" id="error-message">
                    @if(session()->has('success'))
                        <?php echo session()->get('success'); ?>       
                    @elseif(session()->has('error'))
                       <?php echo session()->get('error'); ?>            
                   @endif
                  </div>
                </span>
                <div class="line_border"></div>
                <div class="slider_claim_profile-Body_one" id="first-slide"> 
                  <?php $name = explode(" ",$data[0]->name); ?>
                  <p>Hey {{ $name[0] }}, thanks for joining us!<br>
                    Let’s get your profile created. We just need some more<br>
                    information to get to know you better</p>
                    <div class="joinUs_create">Are you currently studying or working at a {{ $data[0]->address }} </div>
             <!--    {!! Form::open(['url' => 'create-profile1111']) !!} -->
              
                    <div class="create_redio_bt">
                     <div class="radio">
                      <label><input type="radio" name="optradio" value="Yes" checked>Yes</label>
                    </div>
                    <div class="radio">
                      <label><input type="radio" name="optradio" value="No">No</label>
                    </div>
                  </div>
                  <div class="card-body_claim">
                   
                   
                      <div class="form-group row">                        
                        <div class="col-md-12">
                          <label>University</label>
                          <input type="text" id="university" class="form-control" name="university">
                           <div class="error" id="univ" style="display: none;"><b> Please Enter University. </b> </div>
                        </div>
                      </div> 

                      <div class="form-group row">                        
                        <div class="col-md-12">
                          <label>Department</label>
                          <input type="text" id="department" class="form-control" name="department">
                          <div class="error" id="dept" style="display: none;"><b> Please Enter Department. </b> </div>
                        </div>
                      </div>

                      <div class="form-group row">                        
                        <div class="col-md-12">
                          <label>Topic Area</label>
                          <input type="text" id="topicArea" class="form-control" name="topicArea">
                          <div class="error" id="topa" style="display: none;"><b> Please Enter Topic Area. </b> </div>
                        </div>
                      </div>   


                      <div class="login_card_footer">
                       <div class="alistgear_bt login_bt">
                        <button class="btn btn_get-strated create_profile_bt" onclick='check_univ_first();'><a href="#">NEXT</a></button>

                      </div>

                      <div class="redio_slider">
                        <ol class="carousel-indicators creat_slider_dot">
                          <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                          <li data-target="#myCarousel" data-slide-to="1"></li>
                          <li data-target="#myCarousel" data-slide-to="2"></li>
                        </ol>
                      </div>

                    </div>
                </div>
              </div>

              <!-- 2nd Slide start -->
              <div class="slider_claim_profile-Body_two" style="display: none;" id="second-slide">
                <p>You’re almost there. Just a few more questions...</p>
                <div class="joinUs_create">Are you currently working in AIML at a company?</div>
                 <div class="create_redio_bt">
                 <div class="radio">
                  <label><input type="radio" name="aiml" value="Yes" checked>Yes</label>
                </div>
                <div class="radio">
                  <label><input type="radio" name="aiml" value="No">No</label>
                </div>
              </div>
              <div class="card-body_claim">
                  <div class="form-group row">                        
                    <div class="col-md-12">
                      <label>Company</label>
                      <input type="text" id="company" class="form-control" name="company" >
                       <div class="error" id="comp" style="display: none;"><b> Please Enter Company. </b> </div>
                    </div>
                  </div>

                  <div class="form-group row">                        
                    <div class="col-md-12">
                      <label>Department</label>
                      <input type="text" id="com-department" class="form-control" name="com-department" >
                      <div class="error" id="com-dept" style="display: none;"><b> Please Enter Department. </b> </div>
                    </div>
                  </div>
                  
                  <div class="form-group row">                        
                    <div class="col-md-12">
                      <label>Job Title</label>
                      <input type="text" id="jobtitle" class="form-control" name="jobtitle" >
                       <div class="error" id="jobt" style="display: none;"><b> Please Enter Job Title. </b> </div>
                    </div>
                  </div>  

                  <div class="login_card_footer">
                   <div class="alistgear_bt login_bt">
                    <button class="btn btn_get-strated create_profile_bt" onclick='check_comp_second();'><a href="#">NEXT</a></button>
                  </div>
                  <div class="redio_slider">
                    <ol class="carousel-indicators creat_slider_dot">
                      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                      <li data-target="#myCarousel" data-slide-to="1"  class="active"></li>
                      <li data-target="#myCarousel" data-slide-to="2"></li>
                    </ol>
                  </div>

                </div>
            </div>
          </div>
          <!-- 2nd slide end -->

          <!-- 3rd Slide start -->
          <div class="slider_claim_profile-Body_three" style="display: none;" id="third-slide">
            <p>Okay. Just a few more things and we’ll be done.</p>
            <div class="joinUs_create">Where are you located?</div>

            <div class="card-body_claim">
              
                <div class="form-group row">                        
                  <div class="col-md-6">
                    <label>City</label>
                    <input type="text" id="city" placeholder="Boston" class="form-control" name="city">
                    <div class="error" id="city-error" style="display: none;"><b> Please Enter City. </b> </div>
                  </div>

                   <div class="col-md-3">
                    <label>Country</label>
                     <select class="form-control" id="country" onclick="select_state_name()">
                        <option> Select Country Name</option>
                      @foreach($data[1] as $countryName)
                        <option value="{!! $countryName->id !!}&&{!! $countryName->name !!}">{!! $countryName->name !!}</option>
                      @endforeach
                    </select>
                     <div class="error" id="country-error" style="display: none;"><b> Please Select Country Name. </b> </div>
                  </div>

                  <div class="col-md-3">
                    <label>State</label>
                    <select class="form-control" id="state">
                      
                    </select>
                  </div>
                 
                </div>
                
                <div class="option_new"> Would you like to share any addtional link? (optional)</div>
                <div class="form-group row">                        
                  <div class="col-md-12">
                    <label>Website Url</label>
                    <input type="text" id="weburl" class="form-control" name="weburl" placeholder="www.yourwebsitehere.com">
                  </div>
                </div>

                <div class="form-group row">                        
                  <div class="col-md-12">
                    <label>Github Url</label>
                    <input type="text" id="giturl" class="form-control" name="giturl" placeholder="www.github.com">
                  </div>
                </div>

                <div class="login_card_footer">
                 <div class="alistgear_bt login_bt">
                  <button class="btn btn_get-strated create_profile_bt" onclick='check_city_third();'>All Set</button>
                </div>
                <div class="redio_slider">
                  <ol class="carousel-indicators creat_slider_dot">
                    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="1" class="active"></li>
                    <li data-target="#myCarousel" data-slide-to="2" class="active"></li>
                  </ol>
                </div>

              </div>
          <!-- {!! Form::close() !!} -->
          </div>
        </div>
        <!-- 3rd slide end -->

      </div>
    </div>
  </div>
</div>        
</div>
</div>
</div>
</div>
   
@endsection

