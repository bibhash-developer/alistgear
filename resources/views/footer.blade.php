</div>
					</div>
				</div>
				<footer id="footer" class="clearfix text-center-xs">
					<div class="col-md-8 col-xs-12">
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
					<div class="col-md-4 col-xs-12">
						<div class="footer-brand">
							<a href="#">A COLLECTIVE NEXT PRODUCTION</a>
						</div>
					</div>
				</footer>
				<!-- jQuery -->
				<script>
					$(document).ready(function(){
						$('[data-toggle="popover"]').popover();
					});
				</script>
				<!-- Bootstrap -->
				<script src="{!! URL::to('/public/assets/js/bootstrap.min.js') !!}"></script>
				<script src="{!! URL::to('/public/assets/js/jquery.js') !!}"></script>
				<!-- Inview -->
			</body>
			</html>