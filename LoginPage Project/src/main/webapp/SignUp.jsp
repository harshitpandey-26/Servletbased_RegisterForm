<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Sign Up</title>
<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
</head>

<body
	style="background: url(bg.jpg); background-size: cover; background-attachment: fixed;">
	<div class="container">
		<div class="row">
			<div class="col m6 offset-m3">
				<div class="card"
					style="opacity: 0.8; background-color: light-blue darken-4;">
					<!-- Changed background color to a light gray -->
					<div class="card-content"
						style="background-color: light-blue darken-4;">
						<!-- Changed background color to a light gray -->
						<h3 style="margin-top: 10px;" class="center-align">Register
							here !!</h3>
						<h5 id="msg" class="center-align"></h5>

						<div class="form center-align">

							<form action="Register" method="post" id="myform">
								<input type="text" name="user_name"
									placeholder="Enter user name"> <input type="password"
									name="user_password" placeholder="Enter password"> <input
									type="email" name="user_email" placeholder="Enter email">

								<button type="submit" class="btn light-blue darken-4">Submit</button>

							</form>
						</div>
						<div class="loader center-align"
							style="margin-top: 10px; display: none;">

							<div class="preloader-wrapper big active">
								<div class="spinner-layer spinner-blue">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>

								<div class="spinner-layer spinner-red">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>

								<div class="spinner-layer spinner-yellow">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>

								<div class="spinner-layer spinner-green">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>
							</div>
							<h5>Please Wait...</h5>
						</div>



					</div>
				</div>
			</div>
		</div>

	</div>
	<script src="https://code.jquery.com/jquery-3.7.1.min.js"
		integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
		crossorigin="anonymous">
		
	</script>

	<script>
		$(document).ready(function() {
			console.log("Page is ready");

			var $form = $("#myform");
			var $loader = $(".loader");
			var $formContainer = $(".form");

			$form.on('submit', function(event) {
				event.preventDefault();

				var f = $(this).serialize();

				console.log(f);

				$loader.show();
				$formContainer.hide();

				$.ajax({
					url : "Register",
					data : f,
					type : 'POST',
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						console.log("success...");
						$loader.hide();
						$formContainer.show();
						if(data.trim()==='Done'){
							$('#msg').html("Successfully Registered!!")
							$('#msg').addClass('green-text')
						}else{
							$('#msg').html("Something went wrong on Server!!")
							$('#msg').addClass('red-text')
						}
					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(jqXHR.responseText);
						console.log("error.....");
						$loader.hide();
						$formContainer.show();
						$('#msg').html("Something went wrong on Server!!")
					}
				});
			});
		});
	</script>
</body>

</html>