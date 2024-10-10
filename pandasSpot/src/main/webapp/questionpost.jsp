<%@page import="com.pandas.model.Communities"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Study SPOT</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
        justify-content: flex-start; /* 왼쪽 정렬 */
        align-items: flex-start; /* 상단 정렬 */
    }

    .post_text_input {
        margin: 10px;
        width: 300px;
        border: none;
        font-family: 의연체;
        font-size: 20px;
        padding: 10px;
    }

    .form-group {
        display: flex;
        flex-direction: column; /* 세로 방향 정렬 */
        align-items: flex-start; /* 왼쪽 정렬 */
        margin-bottom: 15px; /* 요소 간 간격 */
    }

    .image_label {
        margin-bottom: 5px; /* 레이블과 입력 필드 간 간격 */
    }
    
 .post-input-btn {
 	border: none;
 	border-radius: 5px;
 	width: fit-contents;
 	height: fit-contents;
	background: #C0C78C;
	color: white;
	display: flex;
	padding: 8px 20px 8px 20px;
	margin-left: 10px;
	font-family: 교육새음;
	font-size: 20px;
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
					<table>
						<tr>
							<td>
							<label class="image_label" for="subject">제목</label> </td>
							<td><input class="post_text_input post-input" type="text" id="subject" name="q_title" required></td>
						</tr>
						<tr>
							<td>
							<label class="image_label" for="workbook">문제집</label> </td>
							<td><input type="text" id="workbook" class="post_text_input post-input" name="q_workbook" required></td>
						</tr>
						<tr>
							<td>
							<label class="image_label" for="post_textarea">내용</label></td>
							<td><textarea class="post_text_input" name="q_content" id="post_textarea" cols="30" rows="13" class="post-input" placeholder="질문할 내용 입력" required></textarea>
							</td>
						</tr>
						<tr>
							<td>
							<div class="post-display-block image_label">사진 첨부</div></td>
							<td>
							<label> 
								<img src="icon/add (1).png" alt="이미지 추가하기" id="input-image" />
								<input type="file" id="mem_profile_img" name="q_file">
							</label>
							</td>
						<div class="join-input" id="join_confirm"></div>
						</tr>
					</table>
						
					<div class="post-display-block content_textarea_div" align="center">
							
						<input type="submit" value="등록" class="post-input-btn"> 
						<input type="button" value="취소" class="post-input-btn" onclick="history.back();">
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
</html>
