<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<title>Study SPOT</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
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
						    <img src= "${contextPath}/resources/icon/add (1).png" alt="이미지 추가하기" id="input-image"/>
							<input type="file" id="mem_profile_img" name="mem_profile_img"> 
						</label>
						<div class="join-input" id="join_confirm"></div>
						<input class="join-input join-input-btn btn" type="submit" value="Join to SPOT!">
					</form>
				</div>
			</div>
		</div>
	</div>

	<script src="${contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	<script src="${contextPath}/resources/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="${contextPath}/resources/js/jquery-ui.js"></script>
	<script src="${contextPath}/resources/js/popper.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${contextPath}/resources/js/owl.carousel.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.stellar.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.countdown.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.magnific-popup.min.js"></script>
	<script src="${contextPath}/resources/js/bootstrap-datepicker.min.js"></script>
	<script src="${contextPath}/resources/js/swiper.min.js"></script>
	<script src="${contextPath}/resources/js/aos.js"></script>

	<script src="${contextPath}/resources/js/picturefill.min.js"></script>
	<script src="${contextPath}/resources/js/lightgallery-all.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.mousewheel.min.js"></script>

	<script src="${contextPath}/resources/js/main.js"></script>
	<script>
	var id_checked = false;

	function findSchool() {
		// 입력된 학교명을 가져옴
		var schoolName = document.getElementById("mem_school").value;


		if (schoolName == "") {
			alert("학교 이름을 입력해주세요!");
			document.getElementById("mem_school").value = "";
			return;
		}
		
		// AJAX 요청을 보냄
		var xhr = new XMLHttpRequest();
		xhr.open("POST", "FindSchool", true); // 서블릿 경로 설정
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

		// 서버 응답 처리
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				// 응답을 받아 처리 (예: 결과를 콘솔에 출력)
				var data = JSON.parse(xhr.responseText);
				var resultContainer = document.getElementById("find_school_result");
				resultContainer.innerHTML = ""; // 이전 결과 초기화

				data.forEach(function(item) {
					var schoolLink = document.createElement("a");
					schoolLink.className = "find_school_result"
					schoolLink.style.textDecoration = "none";
					schoolLink.style.color = "#776B5D";
					schoolLink.style.marginRight = "10px";
					schoolLink.style.fontSize = "20px";
					schoolLink.style.fontFamily = "교육새음";
					schoolLink.href = "#"
					schoolLink.onclick = function(event) {
						document.getElementById("mem_school").value = event.target.innerText;
						return false; // 링크 이동을 막기 위해 false 반환
					};

					schoolLink.textContent = item.school_name + "-"
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


	function changeFontFamily() {
		const password = document.getElementById("mem_pw");
		password.style.fontFamily = "arial";

		if (password.value == "") {
			password.style.fontFamily = "교육새음";
		}
	}

	function validatePasswords() {
		const confirmPassword = document.getElementById("pw_confirm");
		const password = document.getElementById("mem_pw");

		const passwordval = password.value;
		const confirmPasswordval = confirmPassword.value;
		const message = document.getElementById("pw_message");

		if (confirmPasswordval == "") {
			message.style.display = "none";
			confirmPassword.style.fontFamily = "교육새음";
		} else {
			confirmPassword.style.fontFamily = "arial";
			message.style.display = "block";
		}

		console.log(passwordval);
		console.log(confirmPasswordval);
		// 비밀번호가 일치하는지 확인
		if (passwordval === confirmPasswordval) {
			message.textContent = "비밀번호가 일치합니다.";
			message.style.color = "green";
			pw_checked = true;
		} else {
			message.textContent = "비밀번호가 일치하지 않습니다.";
			message.style.color = "red";
		}
	}



	document.getElementById('mem_profile_img').addEventListener('change', handleImageChange);

	function handleImageChange(event) {
		const file = event.target.files[0]; // 파일 선택

		if (file) {
			const reader = new FileReader(); // FileReader 생성

			// 파일을 읽은 후 호출되는 함수
			reader.onload = function(e) {
				const imageUrl = e.target.result; // Base64로 인코딩된 이미지 데이터
				const image_preview = document.getElementById('input-image');
				image_preview.src = imageUrl; // 이미지의 src 속성 변경
				image_preview.style.width = 'auto';
			};

			reader.readAsDataURL(file); // 파일을 Base64 데이터 URL로 읽음
		} else {
			document.getElementById('input-image').src = "${contextPath}/resources/icon/add (1).png"; // 파일이 없으면 이미지 초기화
			document.getElementById('input-image').style.width = '30px'; // 파일이 없으면 이미지 초기화
		}
	}

	function idCheck() {
		const mem_id = document.getElementById("mem_id").value;
		id_checked = false;

		if (mem_id == "") {
			alert("id를 입력해주세요!");
			return;
		}

		var xhr = new XMLHttpRequest();
		xhr.open("POST", "FindMemberById", true); // 서블릿 경로 설정
		xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

		// 서버 응답 처리
		xhr.onreadystatechange = function() {
			if (xhr.readyState === 4 && xhr.status === 200) {
				// 응답을 받아 처리 (예: 결과를 콘솔에 출력)
				var data = xhr.responseText;
				var resultContainer = document.getElementById("id_check_message");
				resultContainer.style.display = "block";
				if (data == "True") {
					resultContainer.innerText = "사용가능한 아이디입니다.";
					resultContainer.style.color = "green";
					id_checked = true;
				}
				else {
					resultContainer.innerText = "중복된 아이디입니다.";
					resultContainer.style.color = "red";
				}
			}
		};

		// 서버로 데이터 전송 (school_name을 파라미터로)
		xhr.send("mem_id=" + encodeURIComponent(mem_id));
	}

	function validateForm() {
		// 각 입력 필드를 변수에 저장
		const name = document.getElementById("mem_name").value;
		const id = document.getElementById("mem_id").value;
		const nick = document.getElementById("mem_nick").value;
		const birth = document.getElementById("mem_birthdate").value;
		const password = document.getElementById("mem_pw").value;
		const password_cofirm = document.getElementById("pw_confirm").value;
		const school = document.getElementById("mem_school").value;

		//id 중복확인 했는지 확인
		if (id_checked == false) {
			alert("id 중복 확인을 진행해주세요!");
			return false;
		}

		//pw 일치 확인 했는지 확인
		if (password != password_cofirm) {
			alert("pw가 일치하지 않습니다!");
			return false;
		}
		// 이름 검증 (빈칸 체크)
		if (name === "") {
			const errorMessage = document.getElementById("name_message");
			errorMessage.style.display = "block";
			errorMessage.innerHTML = "이름을 입력하세요.";
			errorMessage.style.color = "red";
			return false;  // 검증 실패 시 제출 중단
		}

		// 아이디 검증 (빈칸 체크)
		if (id === "") {
			const errorMessage = document.getElementById("id_check_message");
			errorMessage.style.display = "block";
			errorMessage.innerHTML = "아이디를 입력하세요.";
			errorMessage.style.color = "red";
			return false;
		}



		// 비밀번호 검증 (빈칸 체크 및 길이 확인)
		if (password === "") {
			const errorMessage = document.getElementById("pw_message");
			errorMessage.style.display = "block";
			errorMessage.innerHTML = "비밀번호를 입력하세요.";
			errorMessage.style.color = "red";
			return false;
		} else if (password.length < 8) {
			const errorMessage = document.getElementById("pw_message");
			errorMessage.style.display = "block";
			errorMessage.innerHTML = "비밀번호는 최소 8자 이상이어야 합니다.";
			errorMessage.style.color = "red";
			return false;
		}


		if (nick === "") {
			const errorMessage = document.getElementById("nick_message");
			errorMessage.style.display = "block";
			errorMessage.innerHTML = "닉네임을 입력하세요.";
			errorMessage.style.color = "red";
			return false;
		}

		if (birth == "") {
			const errorMessage = document.getElementById("birth_message");
			errorMessage.style.display = "block";
			errorMessage.innerHTML = "생년월일을 입력하세요.";
			errorMessage.style.color = "red";
			return false;
		}
		


		if (birth == "") {
			const errorMessage = document.getElementById("birth_message");
			errorMessage.style.display = "block";
			errorMessage.innerHTML = "생년월일을 입력하세요.";
			errorMessage.style.color = "red";
			return false;
		}
		else if (birth.length != 10){
			const errorMessage = document.getElementById("birth_message");
			errorMessage.style.display = "block";
			errorMessage.innerHTML = "생년월일을 8자로 입력하세요.(예 : 2024-10-10)";
			errorMessage.style.color = "red";
			return false;
		}

		if (school == "") {
			const errorMessage = document.getElementById("school_message");
			errorMessage.style.display = "block";
			errorMessage.innerHTML = "학교를 입력하세요.";
			errorMessage.style.color = "red";
			return false;
		}
		else if (school.split("-").length < 2) {
			const errorMessage = document.getElementById("school_message");
			errorMessage.style.display = "block";
			errorMessage.innerHTML = "학교 이름을 검색해주세요.";
			errorMessage.style.color = "red";
			return false;
		}

		// 모든 검증 통과 시 true를 반환하여 제출 허용
		return true;
	}
	</script>
</body>