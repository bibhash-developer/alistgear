<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Talking Machines</title>
	<!-- Bootstrap -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="{!! URL::to('/public/assets/css/style.css') !!}">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="alistgear_wrapper">
		<div class="container">
			<div class="alistgear_main_wrapper">

				<div class="navbar navbar-inverse navbar-static-top hedaerCust">

					<div class="container-fluid">
						<div class="row">
							<div class="col-md-3 header-logo">
								<a href="{!! Url('/') !!}" class="navbar-brand logo-profile">
									<img src="{!! URL::to('/public/assets/images/logo-profile.png') !!}" style="width: 100%"> </a>
								<button class="navbar-toggle" data-toggle="collapse" data-target=".navHeaderCollapse"></button>
							</div>

							<div class="col-md-7 header-menu">
								<div class="collapse navbar-collapse navHeaderCollapse">
									<ul class="nav navbar-nav navbar-right">
										<li class="active"><a href="http://thetalkingmachines.com/about-talking-machines">About </a></li>
										<li><a href="http://thetalkingmachines.com/episodes">Episodes </a> </li>

										<li><a href="http://thetalkingmachines.com/event">Events </a></li>
										<li><a href="http://thetalkingmachines.com/job">Job Board </a></li>
										<li><a href="http://thetalkingmachines.com/submit">Submit </a></li>
										<li><a href="http://thetalkingmachines.com/contact-us">Contact </a></li>
										
									</ul>
								</div>
							</div>
							<div class="col-md-2 header-search">
								<div id="imaginary_container">
							  {!! Form::open(['url' =>'search-details']) !!}
									<div class="input-group stylish-input-group">
								  {!! Form::text('author_search', '',['class' =>'form-control', 'id'=>'author_search', 'placeholder'=>'Search', 
								     'autocomplete' =>'off']) !!}

										<span class="input-group-addon">
											<button type="submit">
												<span class="glyphicon glyphicon-search"></span>
											</button>
										</span>
									</div>
								{!! Form::close() !!}
								   <div id="suggesstion-box" style="position: relative; margin-top: 2px;"></div>
								   <div class="errors">
                                      {{ $errors->first('author_search') }}
                                 </div>
							</div>
						</div>
					</div>
				</div>
			</div>
			
 