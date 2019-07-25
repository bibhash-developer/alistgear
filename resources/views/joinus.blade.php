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
 #email-submit
 {
  background-color: #1f36ba;
  color: #ffffff;
  padding: 10px 20px 10px 20px;
  font-size: 16px;
 }
</style>
<div class="container">  
   @if(session()->has('success'))
   <div class="col-md-5 col-md-offset-2" style="margin-top:10px; margin-bottom:-90px"> 
              <?php echo session()->get('success'); ?>        
   </div>
   @elseif(session()->has('error'))
   <div class="col-md-5 col-md-offset-2" style="margin-top:10px; margin-bottom:-90px;"> 
              <?php echo session()->get('error'); ?>          
   </div>
 @endif
 <div class="tm-box col-md-10">
 <div class="tm-box-group-profile1">
<div class="col-md-10">
     {!! Form::open(['url'=>'addjoinus']) !!}
    <div class="profile_form">
      <div class="form-group fnameForm">
        <input class="form-control" id="address" placeholder="Enter your address" name="address"
        type="text">    
        <h5 style="color: #555;"></h5>   
      </div>

       <h5 style="color: #555;">Country</h5>
       <!-- <select class="form-control <?php //if($errors->first('country')){ echo "error";  } ?>" name ="country" id="country" 
         onchange ="countryName();">
         <option value="">Select Country Name</option>
         @if(isset($country))
           @foreach($country as $country1)
           <option value="{!! $country1->id; !!}">{!! $country1->name; !!}</option>
           @endforeach
         @endif
       </select> -->
       <div class="form-group fnameForm">
        <input class="form-control" id="country" name="country" type="text">    
        <h5 style="color: #555;"></h5>   
      </div>


       <h5 style="color: #555;">State</h5>
       <!-- <select class="form-control <?php //if($errors->first('state')){ echo "error";  } ?>" name="state" id="state">
       </select> -->
        <div class="form-group fnameForm">
        <input class="form-control" id="state" name="state" type="text">    
        <h5 style="color: #555;"></h5>   
      </div>
        <h5 style="color: #555;">City</h5>
          <div class="form-group fnameForm">
              <input class="form-control <?php if($errors->first('city')){ echo "error";  } ?>" id="city" name="city" type="text">    
              <h5 style="color: #555;"></h5>   
          </div>
           <h5 style="color: #555;">Name</h5>
            <div class="form-group fnameForm">
                <input class="form-control <?php if($errors->first('name')){ echo "error";  } ?>" id="name" name="name" 
                 type="text">    
                <h5 style="color: #555;">Full name as it appears on your articles</h5>  
            </div>
           <h5 style="color: #555;">Email for verification</h5>
            <div class="form-group fnameForm">
                <input class="form-control <?php if($errors->first('email')){ echo "error";  } ?>" id="email" name="email" type="text">    
                <h5 style="color: #555;">E.g., einstein@princeton.edu</h5>   
            </div>
            <h5 style="color: #555;">Affiliation</h5>
            <div class="form-group fnameForm"> 
          <input class="form-control <?php if($errors->first('affiliation')){ echo "error";  } ?>" id="affiliation" name="affiliation" 
                type="text">  
              <h5 style="color: #555;">E.g., Professor of Physics, Princeton University</h5>
            </div>
           <h5 style="color: #555;">Company affiliation</h5>
            <div class="form-group fnameForm">
                <input class="form-control <?php if($errors->first('company')){ echo "error";  } ?>" id="company" name="company" 
                type="text">    
                <h5 style="color: #555;"></h5>   
            </div>
            <h5 style="color: #555;">Areas of interest</h5>
            <div class="form-group fnameForm">
                <input class="form-control <?php if($errors->first('areaOi')){ echo "error";  } ?>" id="areaOi" name="areaOi" type="text">    
                <h5 style="color: #555;">E.g., general relativity, unified field theory</h5>   
            </div>
            <h5 style="color: #555;">Homepage (optional)</h5>
            <div class="form-group fnameForm">
                <input class="form-control" id="homepage" name="homepage" type="text">    
                <h5 style="color: #555;">E.g., http://www.princeton.edu/~einstein</h5>   
            </div>
            <div class="searchBt1">
             <input data-toggle="modal" class="btn btn-custom-3" id="email-submit" type="submit" 
               value="Submit">
            </div>
             <div class="tm-profile-model" id="popup">
             </div>
            </div>
          {!! Form::close() !!} 
        </div>
       </div>
     </div>
   </div>
<script type="text/javascript">
  function(b) {
  function c() {
    g.detach().trigger("closed.bs.alert").remove()
  }
  var e = a(this),
    f = e.attr("data-target");
  f || (f = e.attr("href"), f = f && f.replace(/.*(?=#[^\s]*$)/, ""));
  var g = a("#" === f ? [] : f);
  b && b.preventDefault(), g.length || (g = e.closest(".alert")), g.trigger(b = a.Event("close.bs.alert")), b.isDefaultPrevented() || (g.removeClass("in"), a.support.transition && g.hasClass("fade") ? g.one("bsTransitionEnd", c).emulateTransitionEnd(d.TRANSITION_DURATION) : c())
}
</script>
@endsection

