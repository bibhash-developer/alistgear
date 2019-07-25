@extends ('layouts.app') 
@section ('content')
<style>
body{
    margin:0;
    padding:0;
}
 .text-input-box-add img {
    top: -2px;
    right: -8px;
}
 .text-input-box img {
    top: -2px;
    right: -8px;
}
.text-input-box-cpny img {
    top: -2px;
    right: -8px;
}
.radio2{
  float: right; 
  display: inline-block; 
  list-style: none; 
  font-size: 12px; 
  margin-right: 69px;
}
.radio2 li{
  display: inline-block;
  padding-left: 10px;
  float: right;

}
.radio2 p{
  float: left;
    padding-right: 22px;
}
.radio2 input[type=radio]{
  height: 20px;
  width: 20px;

}
label {
    margin-right: 0px !important;
}

.radio3{
  float: right; 
  display: inline-block; 
  list-style: none; 
  font-size: 12px; 
  margin-right: 69px;
}
.radio3 li{
  display: inline-block;
  padding-left: 3px;
  float: right;
}
.radio3 p{
  float: left;
    padding-right: 50px;
    color: #333 !important;
}
.radio3 input[type=radio]{
  height: 20px;
  width: 20px;
}
.redio-box ul li .check::before{
  height: 10px;
width: 10px;
top: 3px;
left: 3px;
}
ul#country-list{
  margin-left: 58px;
  width: 390px;
}
</style>  

<?php /*echo "<pre>1111";

print_r($getUserName->name); exit;*/
 ?>
<div class="maindiv">
     @if(session()->has('success'))
       
                  <?php echo session()->get('success'); ?>        
      
    @elseif(session()->has('error'))
      
                  <?php echo session()->get('error'); ?>          
      
    @endif
 
       <center> <h2>WELCOME < {{ $getUserName->name }}> !</h2> </center>
        <hr />
        <div class="form-text" style="margin-left: 20px;">
          We couldn't find any of your information in our system. please help us get to know you better.
        </div>
        {!! Form::open(['url'=>'create-new-user', 'class' => 'form-class']) !!}
       <div class="redio-box">
        <p class="redio-text">We couldn't find any of your information in our system. please help us get to know you better.</p>

      <ul class="radiobox-first">
          <li>
            {!! Form::radio('selector', 'Yes', true, ['id' => 'f-option']) !!}
            <label for="f-option">Yes</label>
            
            <div class="check"></div>
          </li>
      
          <li>
            {!! Form::radio('selector', 'No', false, ['id' => 's-option']) !!}
            <label for="s-option">No</label>
            
            <div class="check"><div class="inside"></div></div>
          </li>
    </ul>
   </div>

      <div class="clear"></div>
      <div class="redio-box">
            <ul class="radio3">
               <p style="color: #b3b0b0;font-size: 14px;">Are you currenlty working in an University?</p>
              <li>
                 {!! Form::radio('unv_record', 'Yes', true, ['id' => 'unv_record1']) !!}
                 <label for="unv_record1">Yes</label>
                 <div class="check">
                 </div>
             </li>
              <li>
                  {!! Form::radio('unv_record', 'No', false, ['id' => 'unv_record']) !!}

                  <label for="unv_record">No</label>
                  <div class="check"></div>
              </li>
            </ul>
     </div>
      
        <div class="text-input-box-add">
            <label style="margin-right: 340px;">University</label>

             {!! Form::text('university', '', ['class' => 'input-box-title', 'placeholder' => 'University', 
             'id'=>'txt-Search2', 'onkeyup'=>'input_search_affiliation();']) !!}
           <!--  <img src="{!! URL::to('public/assets/images/btn.png') !!}" class="add_field_top"/> -->
        </div>
         <div id="suggest-alert2"> </div> 
        <span style="color: red; ">  
               @if($errors->has('university'))
                   <b> Please enter University. </b>
                @endif
        </span>

        <div class="text-input-box">
             <label style="margin-right: 340px;">Department</label>

              {!! Form::text('uni_department', old('uni_department'), ['class' => 'input-box-title',
                 'placeholder' => 'Department']) !!}
        </div>

         <span style="color: red; "> 
                @if($errors->has('uni_department'))
                   <b> Please enter Department.</b>
                @endif
        </span>

        <div class="text-input-box">
             <label style="margin-right: 340px;">Topic Area</label>

             {!! Form::text('topicarea', old('topicarea'), ['class' => 'input-box-title', 'placeholder' => 'Topic Area']) !!}
        </div>
         <span style="color: red; "> 
                @if($errors->has('topicarea'))
                   <b> Please enter Topic Area. </b>
                @endif
        </span>

        <div class="form-text-chek-box">
            <p>
                Are you currenlty working in an AIML role?   
            </p>
          <div class="redio-box">
              <ul class="radio-two bbb_1">
                  <li>
                     {!! Form::radio('aiml', 'Yes', true, ['id' => 'c-option']) !!}

                    <label for="c-option">Yes</label>
                    <div class="check"></div>
                  </li>
                  <li>
                     {!! Form::radio('aiml', 'No', false, ['id' => 'd-option']) !!}

                    <label for="d-option">No</label>
                    <div class="check">
                    <div class="inside"></div></div>
                  </li>
            </ul>
          </div>
     </div> 
            <div class="clear"></div>
            <div class="redio-box">
              <ul class="radio3">
               <p style="color: #b3b0b0;font-size: 14px;">Are you currenlty working in an Company?</p>
              <li>
                  {!! Form::radio('company_record', 'Yes', true, ['id' => 'company_record1']) !!}

                  <label for="company_record1">Yes</label>
                  <div class="check"></div> 
             </li>
              <li>
                   {!! Form::radio('company_record', 'No', false, ['id' => 'company_record']) !!}

                 <label for="company_record">No</label>
                 <div class="check">
              </li>
            </ul>
        </div>
            <div class="text-input-box-cpny">
                  <label style="margin-right: 340px;">Company</label>
                    {!! Form::text('company', old('company'), ['class' => 'input-box-title', 'placeholder' => 'Company']) !!}

                 <!--  <img src="{!! URL::to('public/assets/images/btn.png') !!}" class="add_field_button"/>  --> 
            </div>

             <span style="color: red; ">
               @if($errors->has('company'))
                   <b>  Please enter Company.</b>
                @endif
             </span>

            <div class="text-input-box">
                 <label style="margin-right: 340px;">Job Title</label>

                  {!! Form::text('jobtitle', old('jobtitle'), ['class' => 'input-box-title', 'placeholder' => 'Job Title']) !!}
            </div>

             <span style="color: red; "> 
               @if($errors->has('jobtitle'))
                   <b>  Please enter Job Title. </b>
                @endif
             </span>

            <div class="text-input-box">
                <label style="margin-right: 340px;">Department</label>
                  {!! Form::text('com_department', old('com_department'), ['class' => 'input-box-title', 'placeholder' => 'Department']) !!}

                <input type="hidden" name="pid" value="<?php echo $getUserName->pid; ?>" />
            </div>
              <span style="color: red;"> 
               @if($errors->has('com_department'))
                   <b> Please enter Department.</b>
                @endif
              </span>

            <div class="form-text-chek-box">
                <p>
                    Where are you primarily Located?
                </p>
            </div> 
            <div class="text-input-box">  
                <label style="margin-right: 390px;">City</label>
                {!! Form::text('city', old('city'), ['class' => 'input-box-title', 'placeholder' => 'City']) !!}

            </div>
             <span style="color: red; "> 
                @if($errors->has('city'))
                   <b> Please enter City. </b>
                @endif
            </span>

            <div class="text-input-box">
                <label style="margin-right: 390px;">State</label>
                 {!! Form::text('state', old('state'), ['class' => 'input-box-title', 'placeholder' => 'State']) !!}

            </div>
             <span style="color: red; "> 
               @if($errors->has('state'))
                   <b> Please enter State. </b>
                @endif
             </span>

            <div class="text-input-box">
                <label style="margin-right: 360px;">Country</label>
                 {!! Form::text('country', old('country'), ['class' => 'input-box-title', 'placeholder' => 'Country']) !!}

            </div>
            <span style="color: red; "> 
                @if($errors->has('country'))
                   <b> Please enter Country. </b>
                @endif
           </span>
            <div class="form-text-chek-box">
                <p>
                Do you have a personal website?
                </p>
            </div>
            <div class="text-input-box">
                <label style="margin-right: 340px;">Website Url</label>
                 {!! Form::text('per_web', old('per_web'), ['class' => 'input-box-title', 'placeholder' => 'wwww.yourwebsitehere.com']) !!}

            </div>
             <span style="color: red; "> 
                @if($errors->has('per_web'))
                   <b> Please enter Website Url. </b>
                @endif
            </span>

            <div class="form-text-chek-box">
                <p>
                    Do you have a github page?
                </p>
            </div>
            <div class="text-input-box">
                <label style="margin-right: 340px;">Github Url</label>
                 {!! Form::text('github', old('github'), ['class' => 'input-box-title', 'placeholder' => 'www.github.com']) !!}

            </div>
             <span style="color: red; "> 
                @if($errors->has('github'))
                   <b> Please enter Github Url. </b>
                @endif
            </span>

       <div class="clear"></div>
            <div class="create-page">
                {!! Form::submit('Create Page', ['class' => 'submit'])!!}
            </div>
             {!! Form::close() !!} 
    </div>

    <div class="clear"></div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">

$(document).ready(function() {
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper       = $(".text-input-box-add"); //Fields wrapper
    var add_button      = $(".add_field_top"); //Add button ID
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
      e.preventDefault();
      if(x < max_fields){ //max input box allowed
        x++; //text box increment
        $(wrapper).append('<div class="text-input-box"><input type="text" class="input-box" name="university[]"placeholder="University" /><a href="#" class="remove_field"> <img src="{!! URL::to('/public/assets/images/minus.png') !!}" class="add_field_top"/></a></div>'); //add input box
      }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
      e.preventDefault(); $(this).parent('div').remove(); x--;
    })
  });

    $(document).ready(function() {
    var max_fields      = 10; //maximum input boxes allowed
    var wrapper       = $(".text-input-box-cpny"); //Fields wrapper
    var add_button      = $(".add_field_button"); //Add button ID
    
    var x = 1; //initlal text box count
    $(add_button).click(function(e){ //on add input button click
      e.preventDefault();
      if(x < max_fields){ //max input box allowed
        x++; //text box increment
        $(wrapper).append('<div class="text-input-box"><input type="text" class="input-box" name="company[]"placeholder="Company" /><a href="#" class="remove_field"> <img src="{!! URL::to('/public/assets/images/minus.png') !!}" class="add_field_top"/></a></div>'); //add input box
      }
    });
    
    $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
      e.preventDefault(); $(this).parent('div').remove(); x--;
    })
  });
</script>
@endsection