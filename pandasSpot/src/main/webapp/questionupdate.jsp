	<%@page import="com.pandas.model.Questions"%>
<%@page import="com.pandas.model.QuestionDAO"%>
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

</head>
<body>
	<jsp:include page="header.jsp" />

	<% 
	
	int idx = Integer.parseInt( request.getParameter("idx") );
	System.out.println("인덱스 번호는 " + idx);
	QuestionDAO dao= new QuestionDAO();
	Questions q = dao.getQuestion(idx);
	%>
	<div class="content-container" data-aos="fade">
		<div class="post-container">
			
			<div>
				<form action="QuestionUpdate" method="post" enctype="multipart/form-data">
					<table class="post_table">
					<tr><td colspan="2" id="post_title_td"><h2 class="post-title">Q & A</h2></td></tr>
					<tr><td><input type="hidden" name="q_idx"  value="<%=idx%>" required></td></tr>
	
						<tr>
							<td class="td_left">
							<label class="image_label" for="subject">제목</label> </td>
							<td class="td_right"><input class="post_text_input" type="text" name="q_title" value="<%=q.getQ_title() %>" required></td>
							<!-- 원본 제목 삽입 -->
						</tr>
						<tr>
							<td class="td_left">
							<label class="image_label" for="workbook">문제집</label> </td>
							<td class="td_right"><input type="text" id="workbook" class="post_text_input" name="q_workbook" value="<%=q.getQ_workbook() %>" required></td>
							<!-- 원본 문제집 삽입 -->
						</tr>
						<tr>
							<td class="td_left">
							<label class="image_label" for="post_textarea">내용</label></td>
							<td class="td_right"><textarea class="post_text_input" name="q_content" id="post_textarea" cols="15" rows="13" class="post-input" placeholder="질문할 내용 입력" required><%=q.getQ_content() %></textarea></td>
							<!-- 원본 내용 삽입 -->
						</tr>
						<tr>
							<td class="td_left">
							<div class="post-display-block image_label">사진 첨부</div></td>
							<td class="td_right">
							<label> 
								<img src="${contextPath}/resources/icon/add (1).png" alt="이미지 추가하기" id="input-image" />
								<input type="file" id="mem_profile_img" name="q_file" value="<%=q.getQ_file() %>">
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
