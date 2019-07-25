@extends ('../admin.adminLayout.index') 
@section ('content')
  <div class="content-wrapper">
     <!-- Content Header (Page header) -->
     <section class="content-header">
      <h1>Dashboard<small>Control panel</small></h1>
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
                   <h3 class="box-title">Show Join Us</h3>
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
                              <th>Name</th>
                                <th>Address</th>
                                  <th>City</th>
                                    <th>state</th>
                                      <th>country</th>
                                      <th>Email</th>
                                    <th>Affiliation</th>
                                  
                             <th>Action</th>
                          </tr>
                        </thead>
                     <tbody>
                       @if(isset($joinus))
                           <?php $i=1; ?>
                          @foreach($joinus as $joinus_recourd)
                        <tr>
                         <td>{!! $i!!}</td>
                           <td>{!! $joinus_recourd->name !!}</td>
                             <td>{!! $joinus_recourd->address !!}</td>
                               <td>{!! $joinus_recourd->city !!}</td>
                                 <td>{!! $joinus_recourd->state!!}</td>
                                   <td>{!! $joinus_recourd->country !!}</td>

                                 <td>{!! $joinus_recourd->email !!}</td>
                                 <td>{!! $joinus_recourd->address !!}</td>
                            
                           
                        <td>
                          <a href="{!! URL('/delete-joinus') !!}/{!! $joinus_recourd->id !!}">Delete<a>
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
@endsection