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
<link rel="stylesheet" href="css/eyStyle.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

<style type="text/css">

#main_my_info {
	margin-top: 30px;
}

.cropping {
	width: 200px; /* 원하는 크기로 설정 */
	height: 200px; /* 원하는 크기로 설정 */
	overflow: hidden; /* div 영역을 넘는 부분은 숨김 */
	border-radius: 50%; /* 원형으로 잘라내기 */
	display: flex; /* 이미지를 중앙 정렬하기 위해 flex 사용 */
	justify-content: center;
	align-items: center;
}

.cropping img {
	width: 100%; /* 부모의 너비에 맞춤 */
	height: 100%; /* 부모의 높이에 맞춤 */
	object-fit: cover; /* 비율을 유지하면서 잘라서 채우기 */
}

.info_container {
	display: flex; /* Flexbox로 컨테이너 설정 */
	height: auto;
	align-items: center; /* 수직 중앙 정렬 */
}

.info_content {
	margin-left: 30px;
}

.img-button {
	background-color: transparent;
	border: none;
	cursor: pointer;
	outline: none;
}

/* 이미지를 버튼처럼 보여주는 스타일 */
.img-button img {
	width: 15px; /* 원하는 크기 */
	height: auto;
	transition: transform 0.2s ease; /* 버튼 효과 추가 */
}

/* 버튼에 마우스를 올렸을 때 효과 */
.img-button img:hover {
	transform: scale(1.1); /* 살짝 확대 */
}

.info_content_single {
	font-family: 받아쓰기;
	font-size: 20px;
}

.inline_block {
	display: inline-block;
}

#chat_img {
	width: 50px;
}

/* 모달 배경 (반투명) */
.modal {
	display: none; /* 기본적으로 숨김 */
	position: fixed;
	z-index: 1;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	background-color: rgba(0, 0, 0, 0.5); /* 배경 어둡게 처리 */
	justify-content: center;
	align-items: center;
}

/* 모달 창 스타일 */
.modal-content {
	background-color: #FBF9F1;
	padding: 20px;
	border-radius: 10px;
	width: 400px;
	max-height: 600px;
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
	display: flex;
	flex-direction: column;
}

/* 모달 헤더 */
.modal-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin: 5px 5px 20px 5px;
}

/* 제목 스타일 */
.open_chat_title {
	color: #776B5D;
	font-family: 둥근미소;
	display: inline-block;
	margin: 0;
	width: fit-content;
	font-size: 24px;
}

/* 닫기 버튼 */
.close {
	color: #aaa;
	font-size: 28px;
	font-weight: bold;
	cursor: pointer;
}

.close:hover, .close:focus {
	color: #603F26;
	text-decoration: none;
	cursor: pointer;
}

/* 버튼 스타일 */
.chat-button {
	background-color: #4CAF50;
	color: white;
	border: none;
	padding: 10px 20px;
	text-align: center;
	font-size: 16px;
	cursor: pointer;
	border-radius: 5px;
}

.chat-button:hover {
	background-color: #45a049;
}

/* 채팅창 스타일 */
.chat-box {
	background-color: white;
	width: 95%;
	height: 400px;
	border: none;
	overflow-y: scroll;
	margin-bottom: 10px;
	padding: 10px;
	/* 스크롤바 숨기기 */
    scrollbar-width: none; /* 파이어폭스 */
    -ms-overflow-style: none; /* IE */
}

.chat-box::-webkit-scrollbar {
    display: none; /* 크롬, 사파리 */
}

.input-box {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
}

#chat_send_btn {
	display: inline-block;
	width : fit-content;
}
#chatInput {
	display: inline-block;
	width: 80%;
}

.message_send_div {
	display: flex;
	justify-content: center;
	align-items: baseline; /* 수직 중앙 정렬 */
}

.chat_messages_send {
	color: #3C3D37;
	font-size:20px;
	font-family: 교육새음;
	text-align: center;
}

.chat_messages_recieve {
	color: #3C3D37;
	font-size:20px;
	font-family: 교육새음;
	text-align: center;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>

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
                <input type="text" class="join-input" id="chatInput" placeholder="메세지를 입력해주세요 ;)">
                <button onclick="send()" class="join-input btn join-input-btn" type="button" id="chat_send_btn">전송</button>
            </div>
        </div>
    </div>
	<script src="js/mainpage.js"></script>
</body>

</html>
