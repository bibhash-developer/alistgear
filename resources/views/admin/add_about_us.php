@extends ('../admin.adminLayout.index') 
@section ('content')

<div class="content-wrapper">
    <section class="content-header">
     <h1>
       Dashboard
        <small>Control panel</small>
     </h1>
     <ol class="breadcrumb">
       <li><a href="{!! URL::to('/admin') !!}">
           <i class="fa fa-dashboard"></i> Home</a></li>
       <li class="active">Dashboard</li>
     </ol>
    </section>
       <div class="col-md-5 col-md-offset-3">
            @if(session()->has('error'))
               {!! session()->get('error') !!}
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

            {!! Form::open(['url' => '/add-about', 'methode' => 'post']) !!}
              <div class="box-body">

                <div class="form-group">

                  <label for="exampleInputFile">Video Upload</label>

                   {!! Form::text('video_link', '',['class' => 'form-control', 'placeholder' => 'Enter Video video_link','data-validation' => 'length alphanumeric',

                    'data-validation-length'=> '3-16', 'data-validation-error-msg' => 'Please enter video link'])!!}
                  <p class="help-block"></p> 
                </div>
                <div class="form-group">

                  <label for="exampleInputFile">Title</label>

                   {!! Form::text('title', '',['class' => 'form-control', 'placeholder' => 'Enter Video Title', 'data-validation'=> 'required', 'data-validation-error-msg' => 'Please enter video title'])!!}
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
@endsection