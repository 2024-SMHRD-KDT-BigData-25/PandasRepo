<%@page import="com.pandas.model.CommunityDAO"%>
<%@page import="com.pandas.model.Communities"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Study SPOT</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
	<jsp:include page="header.jsp" />
	<% 
	
	int idx = Integer.parseInt( request.getParameter("idx") );
	System.out.println("인덱스 번호는 " + idx);
	CommunityDAO dao = new CommunityDAO();
	Communities comm = dao.getCommunities(idx);
	%>

	<div class="content-container" data-aos="fade">
		<div class="post-container">
			
			<div>
				<form action="CommunityUpdate" method="post" enctype="multipart/form-data">
					<table class="post_table">
					<tr><td colspan="2" id="post_title_td"><h2 class="post-title">자유게시판</h2></td></tr>
					<tr><td><input class="hidden post_text_input" type="text" name="comm_idx"  value="<%=comm.getComm_idx() %>" required></td></tr>
						
						<tr>
							<td class="td_left">
							<label class="image_label" for="subject">제목</label></td>
							<td class="td_right"><input class="post_text_input" type="text" name="comm_title" value="<%=comm.getComm_title() %>" required></td>
							<!-- 원본 제목 삽입 -->
						</tr>
						<tr>
							<td class="td_left">
							<label class="image_label" for="post_textarea">내용</label></td>
							<td class="td_right"><textarea class="post_text_input" name="comm_content" id="post_textarea" cols="15" rows="13" class="post-input" placeholder="질문할 내용 입력" required><%=comm.getComm_content()%></textarea>
							<!-- 원본 내용 삽입 -->
							</td>
						</tr>
						<tr>
							<td class="td_left">
							<div class="post-display-block image_label">사진 첨부</div></td>
							<td class="td_right">
							<label> 
								<img src="${contextPath}/resources/icon/add (1).png" alt="이미지 추가하기" id="input-image" />
								<input type="file" id="mem_profile_img" name="comm_file" value=<%=comm.getComm_file() %>>
							</label>
							<!-- 원본 파일 삽입 -->
							</td>
						</tr>
						<tr>
						<td colspan='2' class="btns_td">
						<input type="submit" value="수정" class="post-input-btn" > 
						<input type="button" value="취소" class="post-input-btn" onclick="history.back();">
						</td>
						</tr>
					</table>
						
					<div class="post-display-block content_textarea_div" align="center">
							
						
					</div>
				</form>
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
