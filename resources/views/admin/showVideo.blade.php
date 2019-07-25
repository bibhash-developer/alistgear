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
    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">      
       <div class="box">
            <div class="box-header">
              <h3 class="box-title">Data Table With Full Features</h3>
            </div>
              <div class="col-md-5 col-md-offset-3">
                @if(session()->has('success'))
                   {!! session()->get('success') !!}
                   @else
                     {!! session()->get('error') !!}
                 @endif
              </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>Id</th>
                   <th>Pid</th>
                     <th>People Name</th>
                      <th>Title</th>
                    <th>Video Link</th>
                  <th>Action</th>
                </tr>
            </thead>
        <tbody>
              @if($video_link)
                      <?php $i=1; ?>
                    @foreach($video_link as $video_name)
                <tr>
                  <td>{!! $i!!}</td>
                  <td>{!! $video_name->pid !!}</td>
                  <td>{!! $video_name->people_name !!}</td>
                  <td>{!! $video_name->title !!}</td>
                  <td>{!! $video_name->video_name!!}</td>
                  <td>
                    <a href="{!! URL('/update-video') !!}/{!! $video_name->id !!}">Edit<a>
                    <a href="{!! URL('/delete-video') !!}/{!! $video_name->id !!}">Delete<a>
                  </td>
                </tr>
                    <?php $i++; ?>
                    @endforeach
                  @endif
                </tbody>
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
@endsection