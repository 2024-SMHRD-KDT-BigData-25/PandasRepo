<%@page import="com.pandas.model.Members"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/nyStyle.css">
<link rel="stylesheet" href="${contextPath}/resources/css/aos.css">
<link rel="stylesheet" href="${contextPath}/resources/css/ecStyle.css">
<link rel="stylesheet" href="${contextPath}/resources/css/eyStyle.css">
<link rel="stylesheet" href="${contextPath}/resources/css/nyStyle.css">
<link rel="stylesheet" href="${contextPath}/resources/css/jwStyle.css">
</head>
<header role="banner">
	<% 
		
		Members member = (Members)session.getAttribute("member");  
		String homeHref = "";
		if (member == null) {
			homeHref = "Login.jsp";
		}
		else {
			homeHref = "main.jsp";
		}
	%>
	<% if (member != null) {%>
			<div class="pages_info" id="member_nick"><%= member.getMem_nick() %></div>
	<% } %>
	<div class="header-container header-title-cotainer">
		<a class="header-title" href="<%= homeHref%>">SPOT</a>
	</div>
	<div class="header-container">
		<ul class="nav-ul">
		<% if (member == null) {%>
			<li><a class="nav-li-a" href="Login.jsp">Login</a></li>
			<li><a class="nav-li-a" href="join.jsp">Join</a></li>
		<% } else { %>
			<li><a class="nav-li-a" href="LogoutController">Logout</a></li>
		<% } %>		
			<li><a class="nav-li-a" href="RecordList.jsp">공부 기록</a></li>
			<li><a class="nav-li-a" href="DiaryList.jsp">Study Log</a></li>
			<li><a class="nav-li-a" href="CommList.jsp">자유게시판</a></li>
			<li><a class="nav-li-a" href="QuestionList.jsp">Q&A 게시판</a></li>
		</ul>
	</div>
	
	<div class="floating-menu">
		<ul>
			<li>
					<button id="chat_btn" class="img-button"
						onclick="chatButtonClick()">
						<img id="chat_img" src="${contextPath}/resources/icon/chat.png"
							alt="Image Button">
					</button></li>
			<li>
				<button id="study_time_btn" class="img-button">
						<img src="${contextPath}/resources/icon/clock.png"
							alt="Image Button">
				</button>
			</li>
			<li>
				<button id="search_btn" class="img-button">
						<img src="${contextPath}/resources/icon/magnifying-glass.png"
							alt="Image Button">
				</button>
			</li>
		</ul>
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

	<div id="friendModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h2 class="open_chat_title">친구 찾기</h2>
				<span class="close" id="find_modal_close">&times;</span>
			</div>
			<!-- 검색 입력창 -->
			<div class="friend_search">
				<input class="join-input" type="text" id="friend_id" name="mem_id"
					placeholder="아이디를 입력하세요"> <input
					class="join-input join-input-btn btn" id="friend_find_btn"
					type="button" value="친구 검색">
			</div>
			<!-- 친구 목록 (여기에 검색 결과가 표시됨) -->
			<div style="display: none;" id="friendList" class="friendList">

			</div>
		</div>
	</div>
	<div id="studyTimeModal" class="modal">
		<div class="modal-content">
			<div class="modal-header">
				<h2 class="open_chat_title">공부 시간 측정</h2>
				<span class="close" id="time_modal_close">&times;</span>
			</div>
			<video id="webcamVideo" autoplay playsinline></video>
		</div>
	</div>
</header>

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
	<script defer src="https://cdn.jsdelivr.net/npm/face-api.js"></script>
	

<script>
var studyTimeModal = document.getElementById("studyTimeModal");
var videoElement = document.getElementById("webcamVideo");
var friendModal = document.getElementById("friendModal");
var chatModal = document.getElementById("chatModal");

// 공부 시간 측정 버튼 클릭 시 모달 열기
$("#study_time_btn").on("click", function() {
	console.log(studyTimeModal)
	var study = $("#studyTimeModal");
	study.css("display", "flex");
    startWebcam();  // 웹캠 시작
});

// 공부 시간 측정 모달 닫기
$("#time_modal_close").on("click", function() {
    studyTimeModal.style.display = "none";
    stopWebcam();  // 웹캠 종료
});
	
// 모달 바깥 클릭 시 닫기
window.onclick = function(event) {
    if (event.target == studyTimeModal) {
        studyTimeModal.style.display = "none";
        stopWebcam();  // 웹캠 종료
    } else if (event.target == friendModal) {
        friendModal.style.display = "none";
    }
    else if (event.target == chatModal) {
        friendModal.style.display = "none";
    }
}
    
    // 웹캠 스트림 시작
    function startWebcam() {
        navigator.mediaDevices.getUserMedia({ video: true })
        .then(function(stream) {
            videoElement.srcObject = stream;
            sendFaceDetectionData(10, 50);
        })
        .catch(function(err) {
            console.log("Error accessing webcam: " + err);
        });
    }
    
 // AJAX 요청으로 서블릿에 데이터 전송
    function sendFaceDetectionData(timeSpent, totalTime) {
        var data = {
            timeSpent: timeSpent,     // 예: 이번 세션 동안 감지된 시간 (초)
            totalTime: totalTime      // 예: 전체 감지된 시간 (초)
        };

        $.ajax({
            url: "FaceDetectionServlet", // 서블릿 URL
            type: "POST",
            contentType: "application/json", // JSON 형식으로 보냄
            data: JSON.stringify(data),      // 데이터를 JSON 문자열로 변환
            success: function(response) {
                console.log("서버로부터 받은 응답: ", response);
                // 서버에서 받은 데이터를 처리하는 부분
                // response.totalTimeSpent 등의 값 사용 가능
            },
            error: function(xhr, status, error) {
                console.error("서블릿 호출 중 오류 발생: ", error);
            }
        });
    }

 	// 웹캠 스트림 종료
    function stopWebcam() {
        if (videoElement.srcObject) {
            let stream = videoElement.srcObject;
            let tracks = stream.getTracks();

            tracks.forEach(function(track) {
                track.stop(); // 모든 트랙(즉, 비디오 트랙)을 중단
            });

            videoElement.srcObject = null;

            // 서블릿에 종료 요청을 보냄
            sendStopRequest();
        }
    }

 	// AJAX 요청으로 서블릿에 종료 명령 전송
    function sendStopRequest() {
        $.ajax({
            url: "FaceDetectionServlet", // 종료를 처리할 서블릿 URL
            type: "POST",
            contentType: "application/json",
            data: JSON.stringify({ action: "stop" }), // 종료 명령을 포함한 데이터 전송
            success: function(response) {
                console.log("서버로부터 종료 응답: ", response);
            },
            error: function(xhr, status, error) {
                console.error("서블릿 호출 중 오류 발생: ", error);
            }
        });
    }

    // 친구 찾기 버튼 클릭 시 모달 열기
    $("#search_btn").on("click", function() {
        friendModal.style.display = "flex";
    });

    // 친구 찾기 모달 닫기
    $("#find_modal_close").on("click", function() {
        friendModal.style.display = "none";
    });
	
	function printFriendList(data) {
		var data = JSON.parse(data), dlength = data.length;
		if (dlength == 0) {
			var $target = $("#friendList");

			$target.css("display", "block");
			$target.css("text-align", "center");
			$target.css("color", "red");
			$target.css("font-size", "20px");
			$target.css("margin-top", "10px");
			$target.text("그런 친구는 없어요.");
			return;
		}
		
		var resultContainer = document.getElementById("friendList");
		resultContainer.innerHTML = ""; // 이전 결과 초기화
		data.forEach(function(item) {
			console.log(item);
			var friendlink = document.createElement("a");
			friendlink.className = "find_school_result"
			friendlink.style.display = "block";
			friendlink.style.textDecoration = "none";
			friendlink.style.color = "#776B5D";
			friendlink.style.margin = "10px 10px 0 0";
			friendlink.style.fontSize = "20px";
			friendlink.style.fontFamily = "교육새음";
			friendlink.href = "#"

			friendlink.textContent = item.mem_id + "(" + item.mem_school_name + ")"; // 예시 필드
			resultContainer.appendChild(friendlink); // 결과 요소에 추가
		});
		resultContainer.style.display = "block";
	}

	const temp = document.getElementById("member_nick").innerText;
	const userNickname = encodeURIComponent(temp);
	var Member = "${errorMsg }"

	//모달 열기 함수
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

