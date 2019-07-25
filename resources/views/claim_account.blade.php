@extends ('layouts.app') 
@section ('content')

<div class="overlay"></div>
  <div class="alistgear_wrapper">
   <div class="container">
     <div class="alistgear_main_wrapper">
      <header>   
        <div class="header">
          <div class="logo">
            <a href="Url('/')"><img src="{!! URL::to('/public/assets/images/logo.png') !!}"></a>
          </div>  
        </div>   
      </header>
       
      <div class="alistgear_main">

        <div class="alistgear_section_main ">
          <div class="alistgear_section">
            <div class="col-md-6 col-md-push-3 alistgear_section-card_claim">
              <div class="alistgear_section_card card_claim_profile">
                <span>
                  <h1>Claim your <small>Profile</small>                    
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
                <?php $name = explode(" ",$data->name); ?>
                <p>Hey {{ $name[0] }}, thanks for joining us!<br>
                Great news, it looks like you’re already in our system</p>
                  <div class="joinUs">Are you {{ $data->name }} from {{ $data->address }}</div>
                  <div class="alistgear_bt">
                    <button class="btn btn_get-strated"><a href="{!! Url('/profile-details-page') !!}">Yes - Claim this profile.</a></button>
                     <button class="btn btn_get-strated_profile"><a href="{!! Url('/check-profile') !!}">No - Create a new profile.</a>
                     </button>
                    
                  </div>
                </div>
                <div class="sign-up mb-4 mt-4">Already have an account? <a href="#"> Sign In </a></div>
              </div>
            </div>
          </div>        
        </div>
      </div>
    </div>
  </div>

@endsection