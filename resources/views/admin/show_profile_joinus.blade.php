@extends ('../admin.adminLayout.index') 
@section ('content')

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
              <h3 class="box-title">Show Profile Join Us</h3>
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
                     <th>Name</th>
                     <th>Email Id</th>
                      <th>Description</th>
                      <th>Status</th>
                     <th>Action</th>
                 </tr>
               </thead>
            <tbody>
                  @if(isset($joinus))
                     <?php $i=1; ?>
                    @foreach($joinus as $joinus_recourd)
                    <tr>
                      <td>{!! $i!!}</td>
                       <td>{!! $joinus_recourd->pid !!}</td>
                        <td>{!! $joinus_recourd->name !!}</td>
                       <td>{!! $joinus_recourd->email !!}</td>
                       <td>{!! $joinus_recourd->description !!}</td>
                       <td>
                        <a href="{!! Url('/status-profile-joinus/'.$joinus_recourd->id) !!}">
                          @if($joinus_recourd->status == 0)
                           <button type="button" class="btn btn-danger" style="width: 95px;">Approve</button>
                          @elseif($joinus_recourd->status == 1)
                           <button type="button" class="btn btn-success">Disapprove
                           </button>
                          @endif
                        </a>
                         </td>
                         <td>
                            <a href="{!! URL('/delete-profile-joinus') !!}/{!! $joinus_recourd->id !!}">Delete<a>
                        </td>
                      </tr>
                          <?php $i++; ?>
                       @endforeach
                     @else
                         <center><h4 style="color: red;">Not Recourds Found!</h4></center>
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

<!-- <script type="text/javascript">
     jQuery(document).ready (function(){
      jQuery("#success-alert").hide();
      jQuery("#myWish").click(function showAlert() {
          jQuery("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
         jQuery("#success-alert").slideUp(500);
          });   
      });
   });
</script> -->
@endsection