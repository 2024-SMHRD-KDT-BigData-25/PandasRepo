<%@page import="com.pandas.model.Communities"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Study SPOT</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="css/aos.css">

<link rel="stylesheet" href="css/style.css">

<link rel="stylesheet" href="css/nystyle.css">

<link rel="stylesheet" href="css/eystyle.css">

<style type="text/css">
.post-display-block {
	display: block;
	width: 100%;
	margin: auto;
}

.post-title {
	display: block;
	font-family: 둥근미소;
	text-align: center;
	color: #776B5D;
	padding-top: 20px;
}

.content_textarea_div {
	display: flex;
	justify-content: center; /* 수평 중앙 정렬 */
	align-items: flex-start; /* 수직 중앙 정렬 */
}

.post_text_input {
	margin: 10px;
	width: 300px;
	border : none;
	font-family: 의연체;
	font-size: 20px;
	padding: 10px;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>

		<div class="content-container" data-aos="fade">
		<div>
			<h2 class="post-title">Q & A</h2>
			<div>
				<form action="QuestionPost">
				<div class="post-display-block">
					<label class="image_label" for="subject">제목</label> 
					<input class="post_text_input post-input" type="subject" id="subject" name="q_title">
				</div>
				<div class="col-md-12">
					<label class="image_label" for="workbook">문제집</label> 
					<input type="subject" id="workbook" class="post_text_input post-input"
							name="q_workbook">
				</div>
				
				<div class="content_textarea_div">
					<label class="image_label" for="post_textarea">내용</label>
					<textarea class="post_text_input" name="q_content" id="post_textarea" cols="30"
						rows="13" class="post-input" placeholder="질문할 내용 입력"></textarea>
				</div>
				<div class="post-display-block image_label">사진 첨부</div>
				<label> <img src="icon/add (1).png" alt="이미지 추가하기"
					id="input-image" /> <br> <input type="file"
					id="mem_profile_img" name="q_file">
				</label>
					<div class="post-display-block content_textarea_div" align="center">
						<input type="submit" value="등록"
							class="join-input post-input-btn btn"> <input
							type="submit" value="취소" class="join-input post-input-btn btn">

					</div>


				</form>
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


</body>
</html>