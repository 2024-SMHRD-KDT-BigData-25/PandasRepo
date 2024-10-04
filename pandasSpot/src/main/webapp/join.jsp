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
<link rel="stylesheet" href="css/newStyle.css">
<style>
.content-container {
	display: flex; /* Flexbox로 컨테이너 설정 */
	justify-content: center; /* 수평 중앙 정렬 */
	align-items: center; /* 수직 중앙 정렬 */
	background-color: #EBE3D5;
	padding-bottom: 30px;
}

.join-title {
	font-family: 둥근미소;
	text-align: center;
	color: #776B5D;
}

.join-input {
	display: block;
	width: 300px;
	padding: 10px;
	margin-top: 15px;
	font-family : 교육새음;
	font-size : 20px;
}

.no-match, .match {
	font-family : 교육새음;
}

.no-match {
	font-size: 10px;
}
.join-input-btn {

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
					<form action="Join" method="post">
						<input class="join-input" type="text" id="mem_name"
							name="mem_name" placeholder="이름을 입력하세요"> <input
							class="join-input" type="text" id="mem_id" name="mem_id"
							placeholder="아이디를 입력하세요"> <input class="join-input"
							type="password" id="mem_pw" name="mem_pw"
							placeholder="비밀번호를 입력하세요"> 
							<input class="join-input" type="password" id="pw_confirm" name="pw_confirm" placeholder="비밀번호 확인" oninput="validatePasswords()">
						<div id="message"></div>
						<input class="join-input" type="text" id="mem_nick"
							name="mem_nick" placeholder="닉네임을 입력하세요"> <input
							class="join-input" type="date" id="mem_birthdate"
							name="mem_birthdate"> <input class="join-input"
							type="text" id="mem_school" name="mem_school"
							placeholder="학교명을 입력하세요(예: 능주고등학교 -> 능주)"> 
							<input class="join-input join-input-btn" type="button" value="학교 검색"
							onclick="findSchool()">
						<div id="find_school_result"></div>
						<input class="join-input" type="file" id="mem_profile_img"
							name="mem_profile_img" placeholder="프로필 사진"> <input
							class="join-input join-input-btn" type="submit" value="join">
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

	<script>
		$(document).ready(function() {
			$('#lightgallery').lightGallery();
		});

		function findSchool() {
			// 입력된 학교명을 가져옴
			var schoolName = document.getElementById("mem_school").value;

			// AJAX 요청을 보냄
			var xhr = new XMLHttpRequest();
			xhr.open("POST", "FindSchool", true); // 서블릿 경로 설정
			xhr.setRequestHeader("Content-Type",
					"application/x-www-form-urlencoded");

			// 서버 응답 처리
			xhr.onreadystatechange = function() {
				if (xhr.readyState === 4 && xhr.status === 200) {
					// 응답을 받아 처리 (예: 결과를 콘솔에 출력)
					var data = JSON.parse(xhr.responseText);
					var resultContainer = document
							.getElementById("find_school_result");
					resultContainer.innerHTML = ""; // 이전 결과 초기화

					data.forEach(function(item) {
						var schoolLink = document.createElement("a");
						schoolLink.className = "find_school_result"
						schoolLink.href = "#"; // 실제 링크 URL로 변경
						schoolLink.textContent = item.school_name + " "
								+ item.school_region; // 예시 필드
						resultContainer.appendChild(schoolLink); // 결과 요소에 추가
					});

				}
			};

			// 서버로 데이터 전송 (school_name을 파라미터로)
			xhr.send("school_name=" + encodeURIComponent(schoolName));
		}

		// 팝업에서 선택한 학교 정보 가져오기
		function setSchool(schoolName) {
			document.getElementById('school').value = schoolName;
		}
	</script>

	<script>
		function validatePasswords() {
			const password = document.getElementById("mem_pw").value;
			const confirmPassword = document.getElementById("pw_confirm").value;
			const message = document.getElementById("message");

			console.log(password);
			console.log(confirmPassword);
			// 비밀번호가 일치하는지 확인
			if (password === confirmPassword) {
				message.textContent = "비밀번호가 일치합니다.";
				message.style.color = "green";
				document.getElementById("pw_confirm").classList.add("match");
				document.getElementById("pw_confirm").classList
						.remove("no-match");
			} else {
				message.textContent = "비밀번호가 일치하지 않습니다.";
				message.style.color = "red";
				document.getElementById("pw_confirm").classList.add("no-match");
				document.getElementById("pw_confirm").classList.remove("match");
			}
		}
	</script>

</body>