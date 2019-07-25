@extends ('layouts.app') 
@section ('content')
<style>
body{
    margin:0;
    padding:0;
}
 .error{
   border-color:#ff0000;
 }
.text-input-box img {
  margin-left: -39px;
  position: relative;
  top: -2px;
  right: -4px;
}
</style>
<?php 
/*echo "<pre>1111";
print_r($author_details); exit;*/
?>
<div class="maindiv">
  <div class="col-md-12">
     @if(session()->has('success'))
          <?php echo session()->get('success'); ?>        
       
     @elseif(session()->has('error'))
          <?php echo session()->get('error'); ?>          
       
    @endif
       <center> <h2>Profile Update</h2> </center>
     <div class="col-md-6 col-md-offset-5">
        <div class="text-input-box">

          @if($author_details[0]->image_name)

           @if($author_details[0]->image_name == 'NULL')

              <img alt="abc" src="{!! URL::to('public/assets/images/picture-not.jpg') !!}" class="twPc-avatarImg">

              @elseif(strpos($author_details[0]->image_name, "/photo/000/cache") !== false)

              <img alt="abc" src="{!! $author_details[0]->image_name !!}" class="twPc-avatarImg">

              @elseif(strpos($author_details[0]->image_name, "http://www.cns.nyu.edu") !== false)

              <img alt="abc" src="{!! $author_details[0]->image_name !!}" class="twPc-avatarImg">  

              @elseif($author_details[0]->image_name != 'NULL')
              <img alt="abc" src="../public/assets/images/{!! $author_details[0]->image_name !!}" class="twPc-avatarImg">
                
                @else
                 <img alt="abc" src="{!! URL::to('public/assets/images/picture-not.jpg') !!}" class="twPc-avatarImg">
             @endif
          @endif
        
        </div>
         <span style="font-weight: bold;">{!! $author_details[0]->name !!}</span>
      </div>
   {!! Form::open(['url'=>'update_profile', 'enctype'=>'multipart/form-data']) !!} 
   
      @if(!empty($author_details[0]->city))
        <div class="text-input-box">
           <label style="margin-right: 370px;">City</label>
           @if($author_details[0]->city == 'NULL')
             {!! Form::text('city', '', ['placeholder' => 'City', 'class' => 'input-box-title']) !!}
           @else
             {!! Form::text('city', $author_details[0]->city, ['placeholder' => 'City', 'class' => 'input-box-title']) !!}
           @endif
          <input type="hidden" name="pid" value="<?php echo session()->get('login_pid'); ?>">
        </div>
        @else
        <div class="text-input-box">
           <label style="margin-right: 370px;">City</label>
          {!! Form::text('city', '', ['placeholder' => 'City', 'class' => 'input-box-title']) !!}
          <input type="hidden" name="pid" value="<?php echo session()->get('login_pid'); ?>">
        </div>
       @endif

    @if(!empty($author_details[0]->state))
        <div class="text-input-box">
           <label style="margin-right: 370px;">State</label>
            @if($author_details[0]->state == 'NULL')
               {!! Form::text('state', '', ['placeholder' => 'State', 'class' => 'input-box-title']) !!}
            @else
              {!! Form::text('state', $author_details[0]->state, ['placeholder' => 'State', 'class' => 'input-box-title']) !!}
            @endif
        </div>
    @else
        <div class="text-input-box">
           <label style="margin-right: 370px;">State</label>
           {!! Form::text('state', '', ['placeholder' => 'State', 'class' => 'input-box-title']) !!}
        </div>
     @endif


    @if(!empty($author_details[0]->country))
        <div class="text-input-box">
           <label style="margin-right: 350px;">Country</label>
           @if($author_details[0]->country == 'NULL')
             {!! Form::text('country','', ['placeholder' => 'Country', 'class' => 'input-box-title']) !!} 
          @else
             {!! Form::text('country',$author_details[0]->country, ['placeholder' => 'Country', 'class' => 'input-box-title']) !!} 
          @endif
        </div>
    @else
        <div class="text-input-box">
           <label style="margin-right: 350px;">Country</label>
           {!! Form::text('country','', ['placeholder' => 'Country', 'class' => 'input-box-title']) !!} 
        </div>
    @endif

    @if(!empty($author_details[0]->introduction))
        <div class="text-input-box">
           <label style="margin-right: 320px;">Introduction</label>
            @if($author_details[0]->introduction == 'NULL')
           
              {!! Form::textarea('introduction', '', array('class' => 'input-box-title', 'placeholder' => 'Introduction',  
                 'style' => 'height: 70px;')) !!} 
            @else
            
             {!! Form::textarea('introduction', $author_details[0]->introduction, array('class' => 'input-box-title', 
                'placeholder' => 'Introduction', 'style' => 'height: 70px; color: #171414;')) !!} 
            @endif
        </div>
    @else
         <div class="text-input-box">
           <label style="margin-right: 320px;">Introduction</label>
          <!--  {!! Form::text('introduction', '', ['placeholder' => 'Introduction',  'class' => 'input-box-title']) !!}  --> 
             {!! Form::textarea('introduction', '', array('class' => 'input-box-title','placeholder' => 'Introduction',  
                 'style' => 'height: 70px;')) !!}               
        </div>
    @endif

        @if(!empty($author_details[0]->video))
           <?php $videodata = explode(",", $author_details[0]->video); ?>
           <div class="text-input-box" >
            <label>Youtube Url</label>
              @if($videodata[0] == 'NULL')
                {!! Form::text('video_url[]', '', ['placeholder' => 'Videos Url', 'class' => 'input-box-title']) !!}
              @else
                {!! Form::text('video_url[]', $videodata[0], ['placeholder' => 'Videos Url', 'class' => 'input-box-title']) !!}
              @endif
            <img src="{!! URL::to('public/assets/images/btn.png') !!}" class="add_field_top" id="add_field_video"/> 
          </div>
             <?php unset($videodata[0]); $k=0; ?>
           @foreach($videodata as $video_url)
              <?php $k++; ?>
            <div class="text-input-box" id="text-remove-box{{$k}}"> 
              {!! Form::text("video_url[]", $video_url, ["placeholder" => "Videos Url", "class" => "input-box-title"]) !!}
              <a href="JavaScript:Void(0)" class="remove_field"> 
                <img src="{!! URL::to("/public/assets/images/minus.png") !!}" class="add_field_top" onclick="remove_div{{$k}}();"/>
              </a>
            </div>

              <script>
                function remove_div{{$k}}(){
                  $("#text-remove-box{{$k}}").remove();
                }
              </script>
           @endforeach
          <div class="text-input-box1" id="input-box-video"> </div>

        @else
          <div class="text-input-box" id="input-box-video">
            <label>Video Url</label>
              {!! Form::text('video_url[]', '', ['placeholder' => 'Videos Url', 'class' => 'input-box-title']) !!}
            <img src="{!! URL::to('public/assets/images/btn.png') !!}" class="add_field_top" id="add_field_video"/> 
          </div>
       @endif
       @if(!empty($author_details[0]->cover_image))
              {!! Form::hidden('cover_image1', $author_details[0]->cover_image) !!}
        @endif

          <div class="text-input-box">
              <label>Cover Photo</label>
              {!! Form::file('cover_image', ['class' => 'input-box-title' ]) !!} 
          <!--    <input type="file" class="input-box-title" name="cover_image" style="margin-left: 40px;" /> -->
          </div>

        @if(!empty($author_details[0]->image_name))
          {!! Form::hidden('profile_image1', $author_details[0]->image_name) !!}
        @endif

           <div class="text-input-box">
              <label>Profile Photo</label>
               {!! Form::file('profile_image', ['class' => 'input-box-title' ]) !!}  
           </div>

            <div class="col-md-6">
             <div class="create-page" style="width: 60%;">
                <button type="submit" class="submit" style="font-size: 16px; color:#337ab7; padding: 5px;">Submit</button>
            </div>
            </div>
            
            <div class="col-md-6">
             {!! Form::close() !!} 
             <div class="create-page" style="font-size: 10px; width: 60%;">
               <a href="{!! URL('/explore-details') !!}">
                <button type="button" class="submit" style="font-size: 16px; padding: 5px;">Next</button></a>
            </div>
            </div>
         

    <div class="clear"></div>
  </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script type="text/javascript">
    $(document).ready(function() {
        var max_fields      = 10; //maximum input boxes allowed
        var wrapper         = $("#input-box-video"); //Fields wrapper
        var add_button      = $("#add_field_video"); //Add button ID
        
        var x = 1; //initlal text box count
        $(add_button).click(function(e){ //on add input button click
          e.preventDefault();
          if(x < max_fields){ //max input box allowed
            x++; //text box increment
            $(wrapper).append('<div class="text-input-box"> {!! Form::text("video_url[]", '', ["placeholder" => "Videos Url", "class" => "input-box-title"]) !!}<a href="#" class="remove_field"> <img src="{!! URL::to("/public/assets/images/minus.png") !!}" class="add_field_top"/></a></div>'); //add input box
          }
        });
        
        $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
          e.preventDefault(); $(this).parent('div').remove(); x--;
        })
      });
</script>
@endsection