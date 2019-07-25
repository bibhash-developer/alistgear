<!DOCTYPE html>
<html lang="en">
<head>
  <title>Talking Machines</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <link href="{{ URL::to('/public/assets/css/bootstrap.min.css') }}" rel="stylesheet">
  <link href="{!! URL::to('/public/assets/css/style.css') !!}" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 
</head>
<body>
    @yield('content')

  <footer id="footer" class="clearfix text-center-xs text-center-sm">
    <div class="col-md-8 col-sm-12 col-xs-12">
      <ul class="nav nav-pills">
        <li>
          <a href="http://thetalkingmachines.com/submit">Submit</a>
        </li>
        <li>
          <a href="http://thetalkingmachines.com/about-talking-machines">About</a>
        </li>
        <li>
          <a href="{!! URL('/podcast') !!}">Podcast</a>
        </li>
        <li>
          <a href="{!! URL('/conference') !!}">Conference</a>
        </li>
        <li>
          <a href="http://thetalkingmachines.com/job">Jobs</a>
        </li>
         <li>
          <a href="http://thetalkingmachines.com/contact-us">Contact</a>
        </li>
      </ul>
    </div>
    <div class="col-md-4 col-sm-12 col-xs-12">
       <div class="footer-brand">
        <b style="color: #fefe02;">A COLLECTIVE NEXT PRODUCTION</b>
       </div>
    </div>
  </footer>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/sp-pnp-js/2.0.0/pnp.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="{!! URL::to('/public/assets/js/jquery.min.js') !!}"></script>
        <!-- Bootstrap -->
  <script src="{!! URL::to('/public/assets/js/bootstrap.min.js') !!}"></script>
  <!-- Inview -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="{!! URL::to('/public/assets/js/jquery.js') !!}"></script>
  <script src="https://www.google.com/recaptcha/api.js" async defer></script>
</body>
</html>


       