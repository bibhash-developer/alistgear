@extends ('layouts.app') 
@section ('content')

  <div class="alistgear_wrapper">
     <div class="container">
       <div class="alistgear_main_wrapper">
        <header>   
          <div class="header">
            <div class="logo">
              <img src="{!! URL::to('/public/assets/images/logo.png') !!}">
            </div>  
          </div>   
        </header>
        <div class="alistgear_main">

          <div class="alistgear_section_main">
            <div class="alistgear_section">
              <div class="col-md-6 col-md-push-3 col-sm-6 col-sm-push-3 alistgear_section-card">
                <div class="alistgear_section_card">
                  <span>
                    <h1><small>YOUR WINDOW INTO THE</small><br>
                      WORLD OF MACHINE LEARNING
                    </h1>
                  </span>
                  <div class="line_border"></div>
                  <p>We’re building a network of AIML professionals 
                    and developing a suite of tools and information
                    to help the community connect & collaborate</p>
                    <div class="joinUs">We’d love for you to join us!</div>
                    <div class="alistgear_bt">
                      <button class="btn btn_get-strated"><a href="{!! Url('create-account') !!}">Get Started</a></button>
                      
                    </div>
                  </div>
                  <div class="sign-up mb-4 mt-4">Already have an account? <a href="{!! URL('/signIn') !!}"> Sign In </a></div>
                </div>
              </div>
            </div>        
          </div>
        </div>
      </div>
    </div>
 
@endsection

