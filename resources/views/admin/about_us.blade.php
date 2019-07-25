@extends ('../admin.adminLayout.index') 
@section ('content')

<div class="content-wrapper">
    <section class="content-header">
     <h1>
       Dashboard
        <small>About Us</small>
     </h1>
     <ol class="breadcrumb">
       <li><a href="{!! URL::to('/admin') !!}">
           <i class="fa fa-dashboard"></i> Home</a></li>
       <li class="active">Dashboard</li>
     </ol>
    </section>
       <div class="col-md-5 col-md-offset-3">
            @if(session()->has('success'))
                   <div class="col-md-5 col-md-offset-2" style="width: 400px;"> 
                              <?php echo session()->get('success'); ?>        
                   </div>
              @elseif(session()->has('error'))
                   <div class="col-md-5 col-md-offset-2" style="width: 400px;"> 
                            <?php echo session()->get('error'); ?>          
                   </div>    
           @endif
        </div>
    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-md-6 col-md-offset-3">
          <!-- general form elements -->

          <div class="box box-primary">

            <div class="box-header with-border">

              <h3 class="box-title">About Us</h3>

            </div>

            <!-- /.box-header --> 

            <!-- form start -->

            {!! Form::open(['url' => '/edit-about', 'methode' => 'post']) !!}
              <div class="box-body">

                <div class="form-group">

                  <label for="exampleInputFile">Title</label>

                   {!! Form::text('title', $data->title,['class' => 'form-control', 'placeholder' => 'Enter Your Title',
                   'data-validation' => 'length alphanumeric', 
                    'data-validation-error-msg' => 'Please enter your title'])!!}
                  <p class="help-block"></p> 
                </div>
                <div class="form-group">

                  <label for="exampleInputFile">Description</label>
                   <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"  name="address" 'data-validation'='required', 
                   'data-validation-error-msg' ='Please enter your description'><?= $data->address; ?> 
                   </textarea>
                   
                  <p class="help-block"></p> 
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                {!! Form::submit('Submit', ['class' =>'btn btn-primary']) !!}
              </div>
            {!! Form::close() !!}
          </div>
          <!-- /.box -->
        </div>
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 <!--  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.3.26/jquery.form-validator.min.js"></script>
<script>
  $.validate({
    modules : 'location, date, security, file',
    onModulesLoaded : function() {
      $('#country').suggestCountry();
    }
  });
</script> -->
@endsection