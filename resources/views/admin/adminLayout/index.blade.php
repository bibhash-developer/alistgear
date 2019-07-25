<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Admin</title>
<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
<!-- Bootstrap 3.3.7 -->
<link rel="stylesheet" href="{!! URL::to('/public/assets/admin/bower_components/bootstrap/dist/css/bootstrap.min.css') !!} ">
<!-- Font Awesome -->
<link rel="stylesheet" href="{!! URL::to('/public/assets/admin/bower_components/font-awesome/css/font-awesome.min.css') !!}">
<!-- Ionicons -->
<link rel="stylesheet" href="{!! URL::to('/public/assets/admin/bower_components/Ionicons/css/ionicons.min.css') !!}">
<!-- Theme style -->
<link rel="stylesheet" href="{!! URL::to('/public/assets/admin/dist/css/AdminLTE.min.css') !!}">
<link rel="stylesheet" href="{!! URL::to('/public/assets/admin/dist/css/skins/_all-skins.min.css') !!}">
<!-- Morris chart -->
<link rel="stylesheet" href="{!! URL::to('/public/assets/admin/bower_components/morris.js/morris.css') !!}">
<!-- jvectormap -->
<link rel="stylesheet" href="{!! URL::to('/assets/admin/bower_components/jvectormap/jquery-jvectormap.css') !!}">
<!-- Date Picker -->
<link rel="stylesheet" href="{!! URL::to('/public/assets/admin/bower_components/jvectormap/jquery-jvectormap.css') !!}bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css">
<!-- Daterange picker -->
<link rel="stylesheet" href="{!! URL::to('/public/assets/admin/bower_components/bootstrap-daterangepicker/daterangepicker.css') !!}">
<!-- bootstrap wysihtml5 - text editor -->
<link rel="stylesheet" href="{!! URL::to('/public/assets/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css') !!}">
  <!-- Google Font -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
  <header class="main-header">
    <!-- Logo -->
    <a href="{!! URL('/admin') !!}" class="logo">
       <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>A</b>LT</span>
         <!-- logo for regular state and mobile devices -->
       <span class="logo-lg"><b>Admin</b></span>
     </a>
   <!-- Header Navbar: style can be found in header.less -->
      <nav class="navbar navbar-static-top">
         <!-- Sidebar toggle button-->
           <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
              <span class="sr-only">Toggle navigation</span>
          </a>
       <div class="navbar-custom-menu">
          <ul class="nav navbar-nav">
             <!-- Messages: style can be found in dropdown.less-->
             <li class="dropdown messages-menu">
               <!--  <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <i class="fa fa-envelope-o"></i>
                    <span class="label label-success">4</span></a> -->
                      <li class="dropdown user user-menu">
                        <a href="{!! URL('/logout') !!}" >
                           <!-- <img src="{!! URL::to('/public/assets/admin/dist/img/user2-160x160.jpg') !!}" class="user-image" alt="User Image"> -->
                           <i class="fa fa-sign-out fa-lg" aria-hidden="true"></i>
                           <span class="hidden-xs">Logout</span></a>
                             <!-- <ul class="dropdown-menu" style="width: 0px;"> -->
                              <!-- Menu Body -->
                             <!--   <li class="user-body">
                                  <div class="row">
                                    <center><a href="#" class="btn btn-default btn-flat" 
                                       style="width: 140px">Setting</a>
                                    </center>
                                  </div> -->
                                  <!-- /.row -->
                             <!-- </li> -->
                                 <!-- Menu Footer-->
                            <!--  <li class="user-footer">
                               <div class="pull-right">
                                 <a href="{!! URL('/logout') !!}" class="btn btn-default btn-flat" 
                                    style="width: 140px">Sign out</a>
                               </div>
                             </li>
                           </ul> -->
                          </li>
                         <!-- <li>
                            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
                            </li> -->
                          </ul>
                        </div>
                      </nav>
                    </header>
                          <!-- Left side column. contains the logo and sidebar -->
                    <aside class="main-sidebar">
                        <!-- sidebar: style can be found in sidebar.less -->
                      <section class="sidebar">
                     
                    <ul class="sidebar-menu" data-widget="tree">
                      <li class="header">MAIN NAVIGATION</li>

                        <li class="active treeview">
                           <a href="#">
                            <i class="fa fa fa-edit"></i> <span>Videos</span>
                              <span class="pull-right-container">
                               <i class="fa fa-angle-left pull-right"></i>
                              </span>
                           </a>
                            <ul class="treeview-menu">
                              <li class="active">
                                <a href="{!! URL('/video')!!}">
                                <i class="fa fa-circle-o"></i> Add Video
                                </a>
                              </li>
                              <li>
                                <a href="{!! URL('/show-video') !!}">
                                  <i class="fa fa-circle-o"></i> Show Video
                                </a>
                             </li>
                          </ul>
                        </li>
                         <li class="active treeview">
                         <a href="#">
                          <i class="fa fa fa-edit"></i> <span>Join Us</span>
                            <span class="pull-right-container">
                             <i class="fa fa-angle-left pull-right"></i>
                            </span>
                         </a>
                      <ul class="treeview-menu">
                        <li class="active">
                          <a href="{!! URL('/show-joinus')!!}">
                          <i class="fa fa-circle-o"></i>Show Join Us
                          </a>
                        </li>
                        <li>
                          <a href="{!! URL('/show-profile-joinus') !!}">
                            <i class="fa fa-circle-o"></i> Profile Claim Us
                              </a>
                        </li>
                         <li>
                          <a href="{!! URL('/show-dispute-profile') !!}">
                            <i class="fa fa-circle-o"></i>Dispute Profile
                          </a> 
                        </li>
                       </ul>
                      </li>

                        <li>
                          <a href="{!! URL('/about') !!}">
                            <i class="fa fa fa-edit"></i> About Us
                          </a>
                       </li>
                       <li>
                          <a href="{!! URL('/episodes') !!}">
                            <i class="fa fa fa-edit"></i> Episodes
                          </a>
                       </li>
                       <li>
                          <a href="{!! URL('/event') !!}">
                            <i class="fa fa fa-edit"></i> Events
                          </a>
                       </li>

                    </ul>
                  </section>
            <!-- /.sidebar -->
           </aside>
                     @yield('content')
               
  <!-- /.control-sidebar -->
  <div class="control-sidebar-bg"></div>

</div>
<!-- jQuery 3 -->

<script src="{!! URL::to('/public/assets/admin/bower_components/jquery/dist/jquery.min.js') !!}"></script>

<!-- jQuery UI 1.11.4 -->

<script src="bower_components/jquery-ui/jquery-ui.min.js"></script>

<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->

<script>

  $.widget.bridge('uibutton', $.ui.button);

</script>

<!-- Bootstrap 3.3.7 -->

<script src="{!! URL::to('/public/assets/admin/bower_components/bootstrap/dist/js/bootstrap.min.js') !!}"></script>

<!-- Morris.js charts -->

<script src="{!! URL::to('/public/assets/admin/bower_components/raphael/raphael.min.js') !!}"></script>

<script src="{!! URL::to('/public/assets/admin/bower_components/morris.js/morris.min.js') !!}"></script>

<!-- Sparkline -->

<script src="{!! URL::to('/public/assets/admin/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js') !!}"></script>

<!-- jvectormap -->

<script src="{!! URL::to('/public/assets/admin/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js') !!}"></script>

<script src="{!! URL::to('/public/assets/admin/plugins/jvectormap/jquery-jvectormap-world-mill-en.js') !!}"></script>
<!-- jQuery Knob Chart -->
<script src="{!! URL::to('/public/assets/admin/bower_components/jquery-knob/dist/jquery.knob.min.js') !!}"></script>
<script src="{!! URL::to('/public/assets/admin/bower_components/moment/min/moment.min.js') !!}"></script>
<script src="{!! URL::to('/public/assets/admin/bower_components/bootstrap-daterangepicker/daterangepicker.js') !!}"></script>
<!-- datepicker -->
<script src="{!! URL::to('/public/assets/admin/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') !!}"></script>
<!-- Bootstrap WYSIHTML5 -->
<script src="{!! URL::to('/public/assets/admin/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js') !!}"></script>
<!-- Slimscroll -->
<script src="{!! URL::to('/public/assets/admin/bower_components/jquery-slimscroll/jquery.slimscroll.min.js') !!}"></script>
<!-- FastClick -->
<script src="{!! URL::to('/public/assets/admin/bower_components/fastclick/lib/fastclick.js') !!}"></script>
<!-- AdminLTE App -->
<script src="{!! URL::to('/public/assets/admin/dist/js/adminlte.min.js') !!}"></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src="{!! URL::to('/public/assets/admin/dist/js/pages/dashboard.js') !!}"></script>
<!-- AdminLTE for demo purposes -->
<script src="{!! URL::to('/public/assets/admin/dist/js/demo.js') !!}"></script>
<script src="{!! URL::to('/public/assets/admin/bower_components/datatables.net/js/jquery.dataTables.min.js') !!}"></script>
<script src="{!! URL::to('/public/assets/admin/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js') !!}"></script>
<!-- SlimScroll -->
<script src="{!! URL::to('/public/assets/admin/bower_components/jquery-slimscroll/jquery.slimscroll.min.js') !!}"></script>
<!-- FastClick -->
<script src="{!! URL::to('/public/assets/admin/bower_components/fastclick/lib/fastclick.js') !!}"></script>
<!-- AdminLTE App -->
<script src="{!! URL::to('/public/assets/admin/dist/js/adminlte.min.js') !!}"></script>
<!-- AdminLTE for demo purposes -->
<script src="{!! URL::to('/public/assets/admin/dist/js/demo.js') !!}"></script>
<!-- Select2 -->
<script src="{!! URL::to('/public/assets/admin/bower_components/select2/dist/js/select2.full.min.js') !!}"></script>
<!-- InputMask -->
<script src="{!! URL::to('/public/assets/admin/plugins/input-mask/jquery.inputmask.js') !!}"></script>
<script src="{!! URL::to('/public/assets/admin/plugins/input-mask/jquery.inputmask.date.extensions.js') !!}"></script>
<script src="{!! URL::to('/public/assets/admin/plugins/input-mask/jquery.inputmask.extensions.js') !!}"></script>
<script>

  $(function () {

    $('#example1').DataTable()

    $('#example2').DataTable({

      'paging'      : true,

      'lengthChange': false,

      'searching'   : false,

      'ordering'    : true,

      'info'        : true,

      'autoWidth'   : false

    })

  })
</script>
</body>
</html>

