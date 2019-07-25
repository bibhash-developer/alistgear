@extends ('layouts.app') 
@section ('content')
<div class="container" style="margin-bottom: 110px;">    
			<div class="row">
			   <div class="col-md-10 col-md-offset-1">
				<div class="col-xs-12 col-sm-12 col-md-12">
					<div class="about-heading" >          
						<h2 style="color:#d45738; text-align:center; "><?= $data->title; ?></h2>
						<p style="margin-top:40px; color: #8e8e8e; text-align: justify;"  style="margin-top:30px;"> 
							<?= $data->address; ?>
                        </p>					
					</div> 
				</div> 
                </div>				
			</div><div class="clearfix" style="margin-bottom: 60px;"> </div>
		</div>
@endsection