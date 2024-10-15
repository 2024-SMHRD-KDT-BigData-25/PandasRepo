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

<link rel="stylesheet" href="${contextPath}/resources/css/aos.css">
<link rel="stylesheet" href="${contextPath}/resources/css/eyStyle.css">
<link rel="stylesheet" href="${contextPath}/resources/css/jwStyle.css">

</head>
<body>

<%@ include file="header.jsp" %>

	<%
		int idx = Integer.parseInt(request.getParameter("idx"));
		System.out.println("뷰 idx 번호는 " + idx);
		QuestionDAO dao = new QuestionDAO();
	  	Questions question = dao.getQuestion(idx);
	%> 

	<!-- 게시글 부분 -->
	<div class="hidden" id="q_idx"><%=idx%></div>
	<div data-aos="fade">
		<h2 class="join-title before-table">Q & A</h2>
	</div>
	
	<div class="content-container">
		<div class="board_container">
		<table class="content-list-table">
			<thead class="table-content">
				<tr class="table-header">
					<th class="cell_padding post_th_1" style="white-space: nowrap; width: 20%;"><%=question.getCreated_at()%></th>
					<th class="cell_padding post_th_2" style="width: 60%; text-align: center;"><%=question.getQ_title()%></th>
					<th class="cell_padding post_th_3" style="width: 20%; text-align: center;"><%=question.getMem_id()%></th>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="content-container">
		<div class="board_container">
			<table class="content-list-table">
				<tr>
					<td class="post_th_1"><button class="jwbutton" id="to_list_btn">목록</button>
					<%if (member.getMem_id().equals(question.getMem_id())) {%>
					<button class="jwbutton" id="to_update_btn">수정</button>
					<% } %>
					</td>
					<td class="post_th_2"><span class="like"><%=question.getQ_workbook()%></span></td>
					<td class="post_th_3"></td>
    			</tr>
   			 </table>
   		</div>
   	</div>
	<div class="form-group">
					<div class="main">
						<span>질문하세요
						<%=question.getQ_content() %>
						</span>
					<div><img class="board_img_content" alt="게시물 이미지"
								src="${contextPath}/upload/<%=question.getQ_file() %>">
					</div>
					</div>
				</div>
			<!-- 댓글 부분 -->
			<div class="form-group">
				<form action="" method="post" enctype="multipart/form-data">
					<div class="dat" >

					<!-- 댓글 개수 표시 -->
					<div style="display: flex; justify-content: flex-start;">
						<span>댓글수 : 5</span>
					</div>
					<span>댓글 내용 공간</span>
					<div style="display: flex; gap: 10px; align-items: center;">
						<input type="text" name="dat" id="dat" class="join-input-dat"> 
								<input class="join-input-btn-min" type="submit" value="등록" style="margin-bottom:-15px;">
					</div>
					</div>
				</form>
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
    
    $("#to_list_btn").on( "click", function( event ) {
		location.href = "${contextPath}/QuestionList.jsp";
	});

    $("#to_update_btn").on( "click", function( event ) {
    	var diary_idx = document.getElementById("q_idx").innerText;
		location.href = "${contextPath}/questionupdate.jsp?idx="+diary_idx;
	});
  </script>

</body>
</html>