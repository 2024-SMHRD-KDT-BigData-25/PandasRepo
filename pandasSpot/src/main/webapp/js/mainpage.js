const temp = document.getElementById("member_nick").innerText;
const userNickname = encodeURIComponent(temp);

function mypageButtonClick() {
	alert('Image button clicked!');
	// 버튼 클릭 시 실행할 함수
}
// 모달 열기 함수
function chatButtonClick() {
	webSocket = new WebSocket("ws://172.30.1.44:8081/pandasSpot/chat?nickname="+userNickname)

	webSocket.onopen = onOpen
	webSocket.onclose = onClose
	webSocket.onmessage = onMessage

	var modal = document.getElementById("chatModal");
	modal.style.display = "flex"; // 모달을 화면에 표시
}

// 모달 닫기 함수
function closeModal() {
	var modal = document.getElementById("chatModal");
	modal.style.display = "none"; // 모달을 숨김
}

// 모달 외부를 클릭하면 닫기
window.onclick = function(event) {
	var modal = document.getElementById("chatModal");
	if (event.target === modal) {
		modal.style.display = "none";
	}
};

//소켓 서버에 연결(WebSocket)


function onOpen() {	//현재 클라이언트가 서버로 접속 시도할 때 호출

}
function onClose() {
	//webSocket.send(JSON.Stringify({"nick" : "라라핑"}))		//보내고 싶은 값을 json 형식으로 바꿔서 넣기 -> 무조건 문자열로보내기!
	const message = {
	    type: "quit", // 메시지 유형을 명확히 구분
	    nickname: userNickname,
	};

	webSocket.send(JSON.stringify(message)); // JSON 형식으로 전송
}
//(서버->클라이언트) 메세지를 받앗을때 호출


function onMessage(msg) {
	// 받은 메세지를 화면에 출력!
	const msgData = JSON.parse(msg.data);
	var resultContainer = document.getElementById("chatBox");
	console.log(msgData.type);
	if (msgData.type == "message") {
		var nickName = document.createElement("div");
		nickName.style.color = "#3C3D37";
		nickName.style.fontFamily = "교육새음";
		nickName.style.fontSize = "20px";
		nickName.style.textAlign = "left";
		nickName.style.paddingBottom = "2px";
		nickName.textContent = msgData.nickname;
		resultContainer.appendChild(nickName);
	}

	var newMsg = document.createElement("div");
	newMsg.style.color = "#3C3D37";
	newMsg.style.fontFamily = "교육새음";
	newMsg.style.padding = "2px";
	newMsg.style.borderRadius = "3px";
	newMsg.style.fontSize = "20px";

	newMsg.textContent = msgData.message;
	
	if (msgData.type == "message") {
		newMsg.style.textAlign = "left";
		newMsg.style.backgroundColor = "#D9EDBF";
	}
	else {
		newMsg.style.textAlign = "center";
	}

	resultContainer.appendChild(newMsg);

	let area = document.getElementById('chatInput')
	area.scrollTop = area.scrollHeight
}

function send() {
	//id가 msg로 설정되어있는 input 태그 가져와서 socket 서버로 전송
	var msg = $("#chatInput").val();
	$("#chatInput").val("");
	
	// 서버로 보낼 메시지에 닉네임과 메시지 내용 포함
	const message = {
	    type: "message", // 메시지 유형을 명확히 구분
	    nickname: userNickname, // 사용자의 닉네임
	    message: msg // 사용자가 입력한 메시지
	};
	
	var newMsg = document.createElement("div");
	newMsg.style.color = "#3C3D37";
	newMsg.style.fontFamily = "교육새음";
	newMsg.style.fontSize = "20px";
	newMsg.style.textAlign = "right";
	newMsg.style.backgroundColor = "#F6F7C4";
	newMsg.style.padding = "2px";
	newMsg.style.borderRadius = "3px";
	newMsg.style.width = "auto";


	newMsg.textContent = msg;

	var resultContainer = document.getElementById("chatBox");
	resultContainer.appendChild(newMsg);

	let area = document.getElementById('chatBox')
	area.scrollTop = area.scrollHeight

	webSocket.send(JSON.stringify(message));
}