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
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/eyStyle.css">
<style type="text/css">
.login_join_message {
	margin : 0 auto 0 auto;
	text-align: center;
	font-family: 교육새음;
	font-size: 20px;
	color: #3C3D37;
}
.login_join_message h4 a {
	text-decoration: none;
	color: #3C3D37;
}

.login_join_message h4 a:hover{
	color: #EE4E4E;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>

	<div class="content-container" data-aos="fade"
		onsubmit="return loginFromVal()">
		<form action="Login" method="post">
			<h2 class="join-title">Login</h2>

			<!-- login : 은유 -->
			<input type="text" id="login_id" name="mem_id" class="join-input"
				placeholder="아이디를 입력하세요"> <input type="password"
				id="login_pw" name="mem_pw" class="join-input"
				oninput="changeFontFamily()" placeholder="비밀번호를 입력하세요">
			<div class="message" id="login_message"></div>
			<div class="login_join_message">
				<h4>
					가입이 필요하신가요? 
					<a class="" href="join.jsp">SPOT 가입하기</a>
				</h4>
			</div>
			<input type="submit" value="Login"
				class="join-input join-input-btn btn">
		</form>
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
	<script src="js/login.js"></script>


</body>
</html>