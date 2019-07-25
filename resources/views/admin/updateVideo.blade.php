@extends ('../admin.adminLayout.index') 
@section ('content')

<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper">
    <!-- Content Header (Page header) -->
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
             @if(session()->has('error'))
            
               {!! session()->get('error') !!}
             @endif
    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        
       <div class="col-md-6 col-md-offset-3">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Update Video</h3>
            </div>
            <!-- /.box-header --> 
            <!-- form start -->
            {!! Form::open(['url' => '/edit-video/'.$data['videoupdate'][0]->id, 'methode' => 'post', 'role' => 'form', 'enctype' => 'multipart/form-data']) !!}
            
              <div class="box-body">
                <div class="form-group">
                 <div class="form-group">
                    {!! Form::Label('item', 'All People') !!}
                   <select class="form-control" name="person">
                    <option value="{!! $data['videoupdate'][0]->pid.'$'.
                      $data['videoupdate'][0]->people_name !!}">
                      {!! $data['videoupdate'][0]->people_name !!}</option>
                    
                      @foreach($data as $key=>$people)
                         @if($key == "video")
                         @foreach($people[0] as $allpeople)
                    <option value="{!! $allpeople->pid.'$'.$allpeople->name !!}">
                      {!! $allpeople->name !!}
                    </option>
                        @endforeach
                        @endif
                       @endforeach
                   
                 </select>
                     
               </div>
                </div>
                
                <div class="form-group">
                  <label for="exampleInputFile">Video Upload</label>
                   {!! Form::text('video_link', $data['videoupdate'][0]->video_name,

                   ['class' => 'form-control', 'placeholder' => 'Enter Video video_link', 'value' =>$data['videoupdate'][0]->video_name])!!}
                   
                  <p class="help-block"></p> 
                </div>
               
                <div class="form-group">
                  <label for="exampleInputFile">Title</label>
                   {!! Form::text('title', $data['videoupdate'][0]->title, ['class' => 'form-control', 'placeholder' => 'Enter Video Title'])!!}
                   
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