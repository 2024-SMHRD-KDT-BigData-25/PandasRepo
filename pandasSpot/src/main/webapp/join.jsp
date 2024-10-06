<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Study SPOT</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/eyStyle.css">
<link rel="stylesheet" href="css/aos.css">
</head>
<body>

	<%@ include file="header.jsp"%>

	<div class="content-container" data-aos="fade">
		<div>
			<h2 class="join-title">Join SPOT!</h2>
			<!-- join : 은유 -->
			<div>
				<div>
					<form action="Join" method="post" enctype="multipart/form-data">
						<input class="join-input" type="text" id="mem_name" name="mem_name" placeholder="이름을 입력하세요"> 
						<input class="join-input" type="text" id="mem_id" name="mem_id" placeholder="아이디를 입력하세요"> 
						<input class="join-input" type="password" id="mem_pw" name="mem_pw" placeholder="비밀번호를 입력하세요" oninput="changeFontFamily()"> 
						<input class="join-input" type="password" id="pw_confirm" name="pw_confirm" placeholder="비밀번호 확인" oninput="validatePasswords()">
						<div id="message"></div>
						<input class="join-input" type="text" id="mem_nick" name="mem_nick" placeholder="닉네임을 입력하세요"> 
						<input class="join-input" type="date" id="mem_birthdate" name="mem_birthdate"> <input class="join-input" type="text" id="mem_school" name="mem_school" placeholder="학교명을 입력하세요(예: 한국고등학교 -> 한국)"> 
						<input class="join-input join-input-btn btn" id="school_search_btn" type="button" value="학교 검색" onclick="findSchool()">
						<div id="find_school_result"></div>
						<div class="image_label">프로필 사진</div>
						<label>
						    <img src= "icon/add (1).png" alt="이미지 추가하기" id="input-image"/>
							<input type="file" id="mem_profile_img" name="mem_profile_img"> 
						</label>
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

	<script>
		function findSchool() {
			// 입력된 학교명을 가져옴
			var schoolName = document.getElementById("mem_school").value;

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
					
					
					if (data.length == 0) {
					    alert("학교 이름을 정확히 입력해주세요!");
					    document.getElementById("mem_school").value = "";
					    return;
					}
					else {
						alert("학교 이름을 입력해주세요!");
						return;
					}
					
					data.forEach(function(item) {
						var schoolLink = document.createElement("a");
						schoolLink.className = "find_school_result"
						schoolLink.href = "#"
						schoolLink.onclick = function(event) {
		                    console.log(event.target.innerText); // item.school_name 값을 넘김
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
		
		function select_school(event) {
			console.log(event.target.value);
		}


		// 팝업에서 선택한 학교 정보 가져오기
		function setSchool(schoolName) {
			document.getElementById('school').value = schoolName;
		}
	</script>

	<script>
	
		function changeFontFamily() {
			const password = document.getElementById("mem_pw");
			password.style.fontFamily = "arial";
			
			if (password.value =="") {
				password.style.fontFamily = "교육새음";
			}
		}
		
		function validatePasswords() {
			const confirmPassword = document.getElementById("pw_confirm");
			const password = document.getElementById("mem_pw");
			
			const passwordval = password.value;	
			const confirmPasswordval = confirmPassword.value;
			const message = document.getElementById("message");
			
			if (confirmPasswordval =="") {
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
			} else {
				message.textContent = "비밀번호가 일치하지 않습니다.";
				message.style.color = "red";
			}
		}
	</script>
	
	<script>
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
		    document.getElementById('input-image').src = "icon/add (1).png"; // 파일이 없으면 이미지 초기화
		    document.getElementById('input-image').style.width = '30px'; // 파일이 없으면 이미지 초기화
		  }
		}

	</script>

</body>