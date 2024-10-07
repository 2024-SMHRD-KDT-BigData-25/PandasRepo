var id_checked = false;
var pw_checked = false;

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
				alert("학교 이름을 입력해주세요!");
				document.getElementById("mem_school").value = "";
				return;
			}
			else {
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


function changeFontFamily() {
	const password = document.getElementById("mem_pw");
	password.style.fontFamily = "arial";

	if (password.value == "") {
		password.style.fontFamily = "교육새음";
	}
}

function validatePasswords() {
	pw_checked = false;
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
		document.getElementById('input-image').src = "icon/add (1).png"; // 파일이 없으면 이미지 초기화
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
	console.log("validateForm 호출");
	return false;
	const name = document.getElementById("mem_name").value;
	const id = document.getElementById("mem_id").value;
	const nick = document.getElementById("mem_nick").value;
	const birth = document.getElementById("mem_birthdate").value;
	const password = document.getElementById("mem_pw").value;
	const passwordConfirm = document.getElementById("pw_confirm").value;

	// 오류 메시지 초기화
	errorMessage.innerHTML = "";

	// 이름 검증 (빈칸 체크)
	if (name === "") {
		const errorMessage = document.getElementById("id_check_message");
		errorMessage.style.display = "block";
		errorMessage.innerHTML = "이름을 입력하세요.";
		return false;  // 검증 실패 시 제출 중단
	}
	
	if (birth == "") {
		errorMessage.innerHTML = "생년월일을 입력하세요.";
		return false;
	}
	
	if (nick === "") {
		errorMessage.innerHTML = "닉네임을 입력하세요.";
		return false;
	}

	// 아이디 검증 (빈칸 체크)
	if (id === "") {
		errorMessage.innerHTML = "아이디를 입력하세요.";
		return false;
	}

	// 비밀번호 검증 (빈칸 체크 및 길이 확인)
	if (password === "") {
		errorMessage.innerHTML = "비밀번호를 입력하세요.";
		return false;
	} else if (password.length < 8) {
		errorMessage.innerHTML = "비밀번호는 최소 8자 이상이어야 합니다.";
		return false;
	}

	// 비밀번호 확인 검증 (비밀번호와 일치하는지 확인)
	if (password !== passwordConfirm) {
		errorMessage.innerHTML = "비밀번호가 일치하지 않습니다.";
		return false;
	}

	// 모든 검증 통과 시 true를 반환하여 제출 허용
	return true;
}
