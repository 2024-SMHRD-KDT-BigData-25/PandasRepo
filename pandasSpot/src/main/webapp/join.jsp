<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Study SPOT</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/eyStyle.css">
<link rel="stylesheet" href="css/aos.css">
<style>
#find_school_result {
	color: #776B5D;
	font-size: 20px;
	margin-right: 20px;
	text-decoration: none;
	font-family: 교육새음;
	font-size: 20px;
}
</style>
</head>
<body>

	<%@ include file="header.jsp"%>

	<div class="content-container" data-aos="fade">
		<div>
			<h2 class="join-title">Join SPOT!</h2>
			<!-- join : 은유 -->
			<div>
				<div>
					<form action="Join" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
						<input class="join-input" type="text" id="mem_name" name="mem_name" placeholder="이름을 입력하세요">
						<div class="message" id="name_message"></div> 
						<input class="join-input" type="text" id="mem_id" name="mem_id" placeholder="아이디를 입력하세요"> 
						<input class="join-input join-input-btn btn" id="id_check_btn" type="button" value="중복 체크" onclick="idCheck()">
						<div class="message" id="id_check_message"></div>
						<input class="join-input" type="password" id="mem_pw" name="mem_pw" placeholder="비밀번호를 입력하세요" oninput="changeFontFamily()"> 
						<input class="join-input" type="password" id="pw_confirm" name="pw_confirm" placeholder="비밀번호 확인" oninput="validatePasswords()">
						<div class="join-input message" id="pw_message"></div>
						<input class="join-input" type="text" id="mem_nick" name="mem_nick" placeholder="닉네임을 입력하세요"> 
						<div class="message" id="nick_message"></div>
						<input class="join-input" type="date" id="mem_birthdate" name="mem_birthdate"> 
						<div class="message" id="birth_message"></div>
						<input class="join-input" type="text" id="mem_school" name="mem_school" placeholder="학교명을 입력하세요(예: 한국고등학교 -> 한국)"> 
						<input class="join-input join-input-btn search_btn btn" id="school_search_btn" type="button" value="학교 검색" onclick="findSchool()">
						<div id="find_school_result"></div>
						<div class="message" id="school_message"></div>
						<div class="image_label">프로필 사진</div>
						<label>
						    <img src= "icon/add (1).png" alt="이미지 추가하기" id="input-image"/>
							<input type="file" id="mem_profile_img" name="mem_profile_img"> 
						</label>
						<div class="join-input" id="join_confirm"></div>
						<input class="join-input join-input-btn btn" type="submit" value="Join to SPOT!">
					</form>
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
	<script src="js/join.js"></script>

</body>