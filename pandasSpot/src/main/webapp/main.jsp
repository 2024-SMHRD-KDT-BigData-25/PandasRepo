<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
	
<!DOCTYPE html>
<html>
<head>
<title>Study SPOT</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="${contextPath}/resources/css/aos.css">
<link rel="stylesheet" href="${contextPath}/resources/css/eyStyle.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<section id="main_my_info">
		<div class="info_container">
			<div class="cropping info_content">
				<img id="profile_img" alt="프로필 사진"
					src="upload/<%=member.getMem_profile_img()%>">
			</div>
			<div class="info_content">
				<h3 class="info_content_single inline_block" id="member_nick"><%=member.getMem_nick()%>
				</h3>
				<button id="edit_btn" class="img-button"
					onclick="mypageButtonClick()">
					<img src="icon/edit.png" alt="Image Button">
				</button>
			</div>
			<div class="info_content">
				<h3 class="info_content_single"><%=member.getMem_school_name()%>
				</h3>
				<h3 class="info_content_single"><%=member.getMem_birthdate()%>
				</h3>
			</div>
		</div>
	</section>
	<section>
		<div>일정</div>
	</section>
	<section>
		<div class="info_content">
			<h3 class="info_content_single inline_block">채팅방 입장하기</h3>
		</div>
		<div class="info_content">
			<button id="chat_btn" class="img-button" onclick="chatButtonClick()">
				<img id="chat_img" src="icon/chat.png" alt="Image Button">
			</button>
		</div>
	</section>
	
	<div id="chatModal" class="modal">
        <div class="modal-content">
            <div class="modal-header">
                <h2 class="open_chat_title">오픈 채팅</h2>
                <span class="close" onclick="closeModal()">&times;</span> <!-- 닫기 버튼 -->
            </div>
            <div class="chat-box" id="chatBox">
                <!-- 채팅 메시지 표시 영역 -->
            </div>
            <div class="message_send_div">
                <input type="text" class="join-input" id="chatInput" placeholder="메세지를 입력해주세요 ;)" onkeydown="checkEnter(event)">
                <button onclick="send()" class="join-input btn join-input-btn" type="button" id="chat_send_btn">전송</button>
            </div>
        </div>
    </div>
	
	<script>
	const temp = document.getElementById("member_nick").innerText;
	const userNickname = encodeURIComponent(temp);
	var Member = "${errorMsg }"
	
	// 모달 열기 함수
	function chatButtonClick() {
		webSocket = new WebSocket("ws://localhost:8081/pandasSpot/chat?nickname="+userNickname)

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
		console.log("onMessage 호출")
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
		
		resultContainer.scrollTop = resultContainer.scrollHeight

		webSocket.send(JSON.stringify(message));
	}
	  function checkEnter(event) {
		    if (event.key === "Enter") {
		      send(); // 엔터를 누르면 send() 함수 호출
		    }
		  }
	</script>
</body>

</html>
