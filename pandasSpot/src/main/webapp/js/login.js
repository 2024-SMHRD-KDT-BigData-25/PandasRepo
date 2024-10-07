function changeFontFamily() {
	const password = document.getElementById("login_pw");
	password.style.fontFamily = "arial";

	if (password.value == "") {
		password.style.fontFamily = "교육새음";
	}
}
function loginFromVal() {
	const message = document.getElementById("login_message");

	const id = document.getElementById("login_id").value;
	const pw = document.getElementById("login_pw").value;

	if (id === "") {
		message.style.display = "block";
		message.innerText = "아이디를 입력해주세요!";
		message.style.color = "red";
		message.style.marginTop = "10px";
		return false;
	}
	else if (pw === "") {
		message.style.display = "block";
		message.innerText = "비밀번호를 입력해주세요!";
		message.style.color = "red";
		message.style.marginTop = "10px";
		return false;
	}
	else {
		return true; // 모든 검증을 통과한 경우 로그인 진행
	}
}
