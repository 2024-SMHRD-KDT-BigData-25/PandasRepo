<%@page import="com.pandas.model.Studies"%>
<%@page import="com.pandas.model.StudyDAO"%>
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
<!-- String idxString = request.getParameter("idx"); -->
	<%
			String idxString = request.getParameter("idx");

			int idx = Integer.parseInt(idxString);
			StudyDAO dao = new StudyDAO();
				
			Studies study = dao.getStudies(idx);
			  	
			String tag = study.getStudy_content();
			    
			String[] tagArray = tag.split(",");
	%>


	<!-- 게시글 부분 -->
	<div class="hidden" id="r_idx"><%= idx %></div>
	<div data-aos="fade">
		<h2 class="join-title before-table">공부 기록</h2>
	</div>
	
	<div class="content-container">
		<div class="board_container">
			<table class="content-list-table" >
				<thead class="table-content">
					<tr class="table-header">
						<th class="cell_padding post_th_1" style="white-space: nowrap; width: 20%;"><%=study.getCreated_at() %></th>
						<th class="cell_padding post_th_2" style="width: 60%; text-align: center;"></th>
						<th class="cell_padding post_th_3" style="width: 20%; text-align: center;"><%=study.getMem_id() %></th>
					</tr>
				</thead>
			</table>
		</div>
	</div>
	<div style="width: 80%; max-width: 800px; display: flex; justify-content: space-between; margin: 0 auto; margin-bottom: 10px; margin-top : -15px">
		<button class="jwbutton" onclick="location.href='RecordList.jsp'">목록</button>
			<div></div>
			<div></div>	
		</div>
			<div class="form-group" style = "display: flex; justify-content: center; align-items: center;">
				<div class="sub">
					<img src="upload/<%=study.getStudy_photo()%>" alt="Uploaded Image">
				</div>
			</div>
			<!-- 태그 부분 -->
	<div class="content-container">
		<div class="board_container">
			<table class="content-list-table">
				<tr class="record">
					<td class="post_th_1"><div style="white-space: nowrap; width: 60%; max-width: 800px; justify-content: space-between; margin: 0 auto; margin-bottom: 10px; margin-top : 10px">
					<div style="margin-top: 8px">
					<% for (String tags : tagArray) { %>
					<span><%=tags %></span>
					<%} %></div>
					</div>
					<%if (member.getMem_id().equals(study.getMem_id())) {%>
					<button class="jwbutton" id="to_update_btn">수정</button>
					<% } %>
					</td>
					<td class="post_th_2"></td>
					<td class="post_th_3" style="white-space: nowrap;"><button id="like-button" style=" background: transparent; border: none; cursor: pointer;">
    				❤️ <span id="like-count" class="like" ><%=study.getStudy_likes() %>
    				</span></button></td>
    			</tr>
   			 </table>
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
  
	function updateLikes(data){
		$.ajax({
		url : "StudyLikes", //요청경로
		type : "get", //요청방식(http 요청 메서드)
		data : {"study_idx" : data},
		success : changeLikes,
		error : function(){
			alert("통신 실패!")
		}
		
	})
}
    // 좋아요 버튼 클릭 시 AJAX 요청을 통해 서버로 데이터 전송
    $("#like-button").on("click", function () {
    	var r_idx = document.getElementById("r_idx").innerText;
    	updateLikes(r_idx);
    });
    
    function changeLikes(data) {
    	var likes = document.getElementById("like-count");
    	likes.innerText = data;
    }
	// 좋아요 기능 끝
  
  
  
    $(document).ready(function(){
      $('#lightgallery').lightGallery();
    });
  </script>

</body>
</html>