@extends ('layouts.app') 
@section ('content')

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
       
      <div class="alistgear_main">

        <div class="alistgear_section_main">
          <div class="alistgear_section_forgetPass">
            <div class="col-md-4 col-md-push-4 alistgear_section-card-login">
              <div class="alistgear_section_card_forgetPass">
                <span>
                  <h1> Forgot <small>Password</small></h1>
                    <div class="mainError" id="error-message">
                        @if(session()->has('success'))
                            <?php echo session()->get('success'); ?>       
                        @elseif(session()->has('error'))
                           <?php echo session()->get('error'); ?>            
                       @endif
                  </div>
                </span>
                <div class="line_border"></div>
               
                  <div class="card-body">
                    {!! Form::open(['url' =>'sendLink', 'autocomplete' => 'off']) !!}
                      <div class="form-group row">                        
                        <div class="col-md-12">
                          {!! Form::text('email', '', ['class' => 'form-control', 'id' => 'email_address', 'placeholder' => 'Email']) !!} 
                        </div>
                         <div class="error" id="error-left">
                           @if($errors->has('email'))
                              <b> {{ $errors->first('email') }} </b>
                           @endif                          
                        </div>
                      </div>
                                             
                      <div class="login_card_footer">
                       <div class="alistgear_bt login_bt">
                         {!! Form::submit('Submit',['class'=>'btn btn_get-strated']) !!} 
                      </div>
                     
                    </div>
                  {!! Form::close() !!}
                </div>

              </div>
             
            </div>

          </div>
        </div>        
      </div>    
    </div>
  </div>
</div>
@endsection
