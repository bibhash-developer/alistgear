@extends ('layouts.app') 
@section ('content')
  <style type="text/css">
  ul#country-list { 
    list-style: none;
    padding: 0;
    position: absolute;
    top: auto;
    left: auto;
    width: 100%;
    max-height: 139px;
    overflow: auto;
    z-index: 9999;
    border: 1px solid #eeeeee;
    border-radius: 4px;
    background-color: #fff;
    box-shadow: 0px 1px 6px 1px rgba(0, 0, 0, 0.4);
}

div#suggest-alert2 {
    background: #fff;
    margin-top: 0px;
    width: 65%;
    position: relative;
}
div#tm-user {
    background: rgba(0, 0, 0, 0.8);
}
</style>

<section id="tm-profile" style="background-image: url({!! URL::to('/public/assets/images/bg-home.png') !!})">
 <div class="container">
 <div class="tm-box col-md-10">
  @if(session()->has('success'))
     <div class="alert-error"> 
         <?php echo session()->get('success'); ?>        
     </div>
   @elseif(session()->has('error'))
    <div class="alert-error">
        <?php echo session()->get('error'); ?>           
    </div>   
 @endif
 <div class="tm-box-group-profile">
    <div class="col-md-5">
        <h2>Invite Profile</h2>
        <p>Check to see if you're in our database. 
        If you are, you will be able to claim you profile in order to edit it.
        </p>
    </div>
<div class="col-md-5">
   {!! Form::open(['url'=>'add-invite']) !!}
    <div class="profile_form">
              <div class="form-group fnameForm">
                  {!! Form::text('fname', '',['class' =>'form-control', 'id' =>'fname', 'aria-describedby' =>'First Name', 'placeholder' =>'First Name']) !!}                
              </div>
             <h5 style="color:red;" id="lastname">{{ $errors->first('fname') }}</h5>                     
              <div class="form-group">
                  {!! Form::text('lname', '',['class' =>'form-control', 'id' =>'lname', 'aria-describedby' =>'Last Name', 'placeholder' =>'Last Name']) !!}
              </div>
              <h5 style="color:red;" id="lastname">{{ $errors->first('lname') }}</h5> 

              <div class="form-group">
                  {!! Form::email('email', '',['class' =>'form-control', 'id' =>'email', 'aria-describedby' =>'Last Name', 'placeholder' =>'Email Id']) !!}
              </div>
             <h5 style="color:red;" id="lastname">{{ $errors->first('email') }}</h5>                 
              <div class="searchBt1">
               {!! Form::submit('Submit', ['data-toggle' =>'modal', 'class'=> 
                'btn btn-custom-3', 'id' =>'profileme']) !!}
              </div>
              <div class="tm-profile-model" id="popup">
              </div>
              </div>
              {!! Form::close() !!}
          </div>
         </div>
       </div>
     </div>
   </div>
</div>
</section>
           <!-- section class="profile-search">
            <div class="container">
            <div class="col-md-8 col-md-push-2">
                <div class="col-md-6">
                    <div class="submit-box-form">                          
                           {!! Form::open(['url'=>'search-profile-details', 'id' => 'register-newsletter', 'autocomplete' =>'off']) !!}

                                <h3>Claim Your Profile</h3>
                                {!! Form::text('search', '',['class'=>'sub-name', 'id'=>'txt-Search1', 'onkeyup'=>'input_search_profile();', 'placeholder' => 'Enter Your Name']) !!}

                                {!! Form::submit('SUBMIT', ['class'=>'btn btn-custom-3']) !!}
                                <span style="color: red;">{{ $errors->first('search') }}
                                </span>

                                <div id="suggest-alert" style="position: 
                                relative;"> </div>
                      {!! Form::close() !!}
                  </div>
                </div>
                <div class="col-md-6">
                    <div class="submit-box-form">
                       {!! Form::open(['url'=>'search-network-details','id' => 'register-newsletter', 'autocomplete' =>'off']) !!}
                         
                                <h3>Search The Network</h3>
                                {!! Form::text('search1', '',['class'=>'sub-name', 'id'=>'txt-Search2', 'onkeyup'=>'input_search_network();', 'placeholder' => 'Who are You looking For?']) !!}

                            {!! Form::submit('SUBMIT', ['class'=>'btn btn-custom-3', 'value' =>'Search']) !!}
                              <span style="color: red;">
                                {{ $errors->first('search1') }}
                              </span>
                            <div id="suggest-alert2"> </div>
                          {!! Form::close() !!}
                    </div>
                </div>
          </div> 
   </div>
  </section> -->
@endsection