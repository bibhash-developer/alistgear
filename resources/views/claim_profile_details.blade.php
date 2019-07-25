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
    <h2>Claim You Profile</h2>
    <p style="color: white;">Check to see if you're in our database. 
    If you are, you will be able to claim you profile in order to edit it.
    </p>
 </div>
  <div class="tm-box col-md-5">
     {!! Form::open(['url'=>'add-claim-profile']) !!}
    <div class="profile_form1">
          <div class="form-group fnameForm1">
                {!! Form::email('email', '', ['class' => 'form-control',
                   'placeholder' => 'Enter Your Email Id', 'style' =>'width: 250px;']) !!}
                   <input type="hidden" name="pid" value="<?php echo session()->get('claim_pid'); ?>">
                             
          </div>
            <h5 style="color: red;">{{ $errors->first('email') }}</h5>                      
          <div class="searchBt1">
                {!! Form::submit('Submit', ['data-toggle' => 'modal', 'class' =>'btn btn-custom-3','id' => 'email-submit', 'value' => 'submit']) !!}   
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
<!-- <script type="text/javascript">
  $(document).ready (function(){                
                $("#success-alert").fadeTo(2000, 1500).slideUp(1000, function(){
               $("#success-alert").slideUp(500);
                });            
            });

</script> -->
@endsection

