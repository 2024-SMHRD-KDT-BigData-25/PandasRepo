<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Study SPOT</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&family=Roboto+Mono:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">

<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/jquery-ui.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">

<link rel="stylesheet" href="css/lightgallery.min.css">

<link rel="stylesheet" href="css/bootstrap-datepicker.css">

<link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

<link rel="stylesheet" href="css/swiper.css">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/style.css">

</head>
<body>
<%@ include file="header.jsp" %>
	<div class="site-wrap">

		<div class="site-section" data-aos="fade">
			<div class="container">

				<div class="row justify-content-center">

					<div class="col-md-7">
						<div class="row mb-5">
							<div class="col-12 ">
								<h2 class="site-section-heading text-center">Login</h2>
							</div>
						</div>
					</div>

				</div>
				<!-- join : 은유 -->
				<div class="row justify-content-center">
					<div class="col-lg-8 mb-5">
						<form action="Login" method="post">

							<div class="row form-group">
								<div class="col-md-12">
									<label class="text-brown" for="mem_id">아이디</label> <input
										type="text" id="mem_id" name="mem_id" class="form-control">
								</div>
							</div>

							<div class="row form-group">

								<div class="col-md-12">
									<label class="text-white" for="mem_pw">비밀번호</label> <input
										type="password" id="mem_pw" name="mem_pw" class="form-control">
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12">
									<input type="submit" value="Login"
										class="btn btn-primary py-2 px-4 text-white">
								</div>
							</div>


						</form>
					</div>
				</div>
			</div>
		</div>

	</div>

	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/jquery-ui.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/jquery.countdown.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="js/swiper.min.js"></script>
	<script src="js/aos.js"></script>

	<script src="js/picturefill.min.js"></script>
	<script src="js/lightgallery-all.min.js"></script>
	<script src="js/jquery.mousewheel.min.js"></script>

	<script src="js/main.js"></script>



</body>
</html>