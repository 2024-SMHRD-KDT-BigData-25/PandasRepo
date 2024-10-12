<%@page import="com.pandas.model.Members"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<title>Study SPOT</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style type="text/css">
.my_name_container {
	display: block;
}

.my_info_container {
	display: block;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
	Members member = (Members) session.getAttribute("member");
	String temp = member.getMem_birthdate();
	String birth = temp.substring(0, 4) + "-" + temp.substring(4, 6) + "-" + temp.substring(6);
	%>
	<div class="content-container" data-aos="fade">
		
			<table class="info_table">
				<tr>
					<th colspan="4">
						<h2 class="join-title"><span id="member_nick"><%=member.getMem_nick()%></span>'s Page
						<button id="info_edit_btn" class="img-button">
						<img src="${contextPath}/resources/icon/edit.png"
							alt="Image Button">
					</button>
						</h2>
						
					</th>
				</tr>
				<tr>
				<td class="info_content_single">
					<div class="cropping">
						<img id="profile_img" alt="프로필 사진"
							src="${contextPath}/upload/<%= member.getMem_profile_img()%>">
					</div>
				</td>

				<td class="info_content_single">
					<p class="main_info"><img class="info_icon" src="${contextPath}/resources/icon/tag.png" /><%=member.getMem_name()%></p>
					<p class="main_info"><img class="info_icon" src="${contextPath}/resources/icon/campus.png" /><%=member.getMem_school_name()%></p>
					<p class="main_info"><img class="info_icon" src="${contextPath}/resources/icon/cake.png" /><%=birth%></p>
				</td>
				<td class="function_td">
					<button id="chat_btn" class="img-button"
						onclick="chatButtonClick()">
						<img id="chat_img" src="${contextPath}/resources/icon/chat.png"
							alt="Image Button">
					</button>
				</td>
				<td class="function_td">
					<button id="chat_btn" class="img-button" onclick="$">
						<img id="chat_img" src="${contextPath}/resources/icon/clock.png"
							alt="Image Button">
					</button>
				</td>
			</tr>
				<tr>
					<td colspan="4" class="follow_td">
					<table class="follow_table">
						<tr>
							<td>팔로우 목록
								<div class="follow_info" id="following"></div>
							</td>
							<td>팔로워 목록
								<div class="follow_info" id="follower"></div>
							</td>
						</tr>
					</table>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="follow_td">
					<table class="follow_table">
						<tr>
							<td>일정 관리
								<div class="follow_info" id="calendar"></div>
							</td>
							<td>내 게시글
								<div class="follow_info" id="mypost"></div>
							</td>
						</tr>
					</table>
					</td>
				</tr>
		</table>
		

	</div>
	
	<div id="chatModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h2 class="open_chat_title">오픈 채팅</h2>
				<span class="close" onclick="closeModal()">&times;</span>
				<!-- 닫기 버튼 -->
			</div>
			<div class="chat-box" id="chatBox">
				<!-- 채팅 메시지 표시 영역 -->
			</div>
			<div class="message_send_div">
				<input type="text" class="join-input" id="chatInput"
					placeholder="메세지를 입력해주세요 ;)" onkeydown="checkEnter(event)">
				<button onclick="send()" class="join-input btn join-input-btn"
					type="button" id="chat_send_btn">전송</button>
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
	$("#info_edit_btn").on("click", function(event) {
		location.href = "${contextPath}/infoUpdate.jsp";
	})
	
		const temp = document.getElementById("member_nick").innerText;
		const userNickname = encodeURIComponent(temp);
		var Member = "${errorMsg }"

		// 모달 열기 함수
		function chatButtonClick() {
			webSocket = new WebSocket(
					"ws://localhost:8081/pandasSpot/chat?nickname="
							+ userNickname)

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

		function onOpen() { //현재 클라이언트가 서버로 접속 시도할 때 호출
		}
		function onClose() {
			//webSocket.send(JSON.Stringify({"nick" : "라라핑"}))		//보내고 싶은 값을 json 형식으로 바꿔서 넣기 -> 무조건 문자열로보내기!
			const message = {
				type : "quit", // 메시지 유형을 명확히 구분
				nickname : userNickname,
			};

			webSocket.send(JSON.stringify(message)); // JSON 형식으로 전송
		}
		//(서버->클라이언트) 메세지를 받앗을때 호출

function onMessage(msg) {
    // 받은 메시지를 화면에 출력
    const msgData = JSON.parse(msg.data);
    var resultContainer = document.getElementById("chatBox");

    // 닉네임과 메시지를 함께 담을 div 생성
    var messageContainer = document.createElement("div");
    messageContainer.style.width = "100%";  
    messageContainer.style.display = "flex";  // 닉네임과 메시지를 나란히 배치
    messageContainer.style.flexDirection = "column";  // 수직으로 닉네임과 메시지를 배치
    messageContainer.style.alignItems = "flex-start";  // 왼쪽 정렬
    messageContainer.style.marginBottom = "10px";  // 메시지 간 간격 추가

    // 닉네임 표시
    if (msgData.type === "message") {
        var nickName = document.createElement("p");
        nickName.style.fontFamily = "교육새음";
        nickName.style.fontSize = "16px";
        nickName.style.color = "#3C3D37";
        nickName.style.marginBottom = "1px";  // 닉네임과 메시지 간 간격 추가
        nickName.textContent = msgData.nickname;
        messageContainer.appendChild(nickName);
    }

    // 상대방 메시지 표시
    var newMsg = document.createElement("p");
    newMsg.style.color = "#3C3D37";
    newMsg.style.fontFamily = "교육새음";
    newMsg.style.fontSize = "20px";
    newMsg.style.backgroundColor = "#D9EDBF";  // 수신 메시지 배경색
    newMsg.style.padding = "10px";
    newMsg.style.borderRadius = "5px";
    newMsg.style.margin = "0 0 3px 0";  // 위아래 간격
    newMsg.style.width = "fit-content";  // 메시지 길이에 맞는 너비
    newMsg.style.maxWidth = "60%";  
    newMsg.style.float = "left";  // 왼쪽 정렬
    newMsg.style.clear = "both";  // 한 줄씩 표시
    newMsg.textContent = msgData.message;
    
	if (msgData.type != "message") {
		newMsg.style.backgroundColor = "white";
		newMsg.style.textAlign = "center";
		newMsg.style.maxWidth = "100%"; 
		newMsg.style.width = "100%";
	} 

    messageContainer.appendChild(newMsg);  // messageContainer에 메시지 추가
    resultContainer.appendChild(messageContainer);  // 결과 영역에 추가

    // 자동 스크롤을 아래로 이동
    resultContainer.scrollTop = resultContainer.scrollHeight;
}



function send() {
    // id가 msg로 설정된 input 태그에서 값 가져오기
    var msg = $("#chatInput").val();
    $("#chatInput").val("");

    // 서버로 보낼 메시지 구조
    const message = {
        type: "message",  // 메시지 유형
        nickname: userNickname,  // 사용자의 닉네임
        message: msg  // 사용자가 입력한 메시지
    };

    // 사용자 메시지를 오른쪽에 표시할 p 태그 생성
    var newMsg = document.createElement("p");
    newMsg.style.color = "#3C3D37";
    newMsg.style.fontFamily = "교육새음";
    newMsg.style.fontSize = "20px";
    newMsg.style.backgroundColor = "#F6F7C4";  // 사용자 메시지 배경색
    newMsg.style.padding = "10px";
    newMsg.style.borderRadius = "5px";
    newMsg.style.margin = "0 0 3px 0";
    newMsg.style.width = "fit-content";  // 메시지 길이에 맞는 너비
    newMsg.style.maxWidth = "60%";  // 최대 너비 제한
    newMsg.style.float = "right";  // 오른쪽 정렬
    newMsg.style.clear = "both";  // 한 줄씩 표시
    newMsg.textContent = msg;

    // 메시지를 chatBox에 추가
    var resultContainer = document.getElementById("chatBox");
    resultContainer.appendChild(newMsg);

    // 자동 스크롤을 아래로 이동
    resultContainer.scrollTop = resultContainer.scrollHeight;

    // 서버로 메시지 전송
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