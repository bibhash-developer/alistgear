@extends ('layouts.app') 
@section ('content')

    @if(session()->has('error'))
         
      <?php echo session()->get('error'); ?>          
        
   @endif
    <div class="maindiv">
       <center> <h3>Change Password</h3> </center>
        
           
      {!! Form::open(['url' =>'resetPassword']) !!}
        <div class="text-input-box col-md-12">
          <label class="label_text">Change Password</label>
            {!! Form::password('password','', ['class'=>'input-box-title', 'placeholder' => 'password']) !!}           
        </div>
        <span>  
          @if($errors->has('Password'))
             <b> {{ $errors->first('Password') }} </b>
          @endif
         </span>

        <div class="text-input-box col-md-12">
          
          <label class="label_text">Confirm Password</label>
            {!! Form::password('Password', ['class'=>'input-box-title','placeholder' => 'Confirm Password']) !!}  
        </div>
         <span>
                  @if($errors->has('conform'))
                   <b> {{ $errors->first('conform') }} </b>
                @endif
         </span>
        <div class="clear"></div>  
        <div class="create-page">

           {!! Form::submit('Submit',['class'=>'submit']) !!} 
        </div>

        
         <div>
        <span style="float: right; margin: 0 14px 0px 0px; color: blue;"><a href="{{ Url('forgetPassword') }}">Forget Password</a></span>
          
        </div>


      {!! Form::close() !!}
    </div>
    <div class="clear"></div>

@endsection
