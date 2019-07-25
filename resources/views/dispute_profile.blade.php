@extends ('layouts.app') 
@section ('content')
<style type="text/css">
 .tm-box-group-profile1{
    padding: 10px 0;
 }
 #joinid{
  background-color: #4d90fe;
 }
 .error{
   border-color:red;
 }
 .form-error
 {
  display: none;
 }
 #email-submit
 {
  background-color: #ffcc01;
  padding: 10px 20px 10px 20px;
  color: #000000;
  font-size: 18px;
 }
 .alert-error {
    font-size: 14px;
    width: 57%;
    margin: 0 auto;
}
.custem-success1 {
    color: #ffffff;
    background-color: #00a65a;
    border-color: #d6e9c6;
    margin: 0;
    font-size: 14px;
    margin: 0 auto;
}
.custem-error1 {
    color: #721c24;
    background-color: #f8d7da;
    border-color: #ebccd1;
    margin: 0;
    font-size: 14px;
    margin: 0 auto;
}

</style>
<div class="container1">  
  <section id="tm-profile" style="background-image: url(http://mage2web.in/laravel/public/assets/images/bg-home.png)">
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
    <h2>Dispute Profile</h2>
    <p>Check to see if you're in our database. 
    If you are, you will be able to dispute you profile in order to edit it.
    </p>
 </div>
 <div class="col-md-5">
         {!! Form::open(['url'=>'add-dispute-profile']) !!}
    <div class="profile_form">
              <div class="form-group fnameForm">
                  {!! Form::email('email', '', ['class' => 'form-control','placeholder' => 
                'Enter Your Email Id']) !!}               
              </div>
                <h5 style="color: red;">{{ $errors->first('email') }}</h5>                       
              <div class="form-group fnameForm">
                 {!! Form::text('desc', '', ['class' => 'form-control','placeholder' => 
                    'Enter Your Description', 'style' =>'height: 50px;']) !!}
                    {!! Form::hidden('pid', $pid) !!}
            </div>
              <h5 style="color: red;">{{ $errors->first('desc') }}</h5>                        
              <div class="searchBt1">
                 {!! Form::submit('Submit', ['data-toggle' => 'modal', 'class' =>'btn btn-custom-3', 
                   'id' => 'email-submit', 'value' => 'Submit']) !!}          
              </div>
              <div class="tm-profile-model" id="popup">
              </div>
              </div>
                {!! Form::close() !!}
  </div>
   </div>
  </div>
  </div>
 </section>
</div>

<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>
$.validate({
  modules : 'location, date, security, file',
  onModulesLoaded : function() {
       $('#country').suggestCountry();
    }
});
</script>
@endsection

