<%@page import="com.pandas.model.Communities"%>
<%@page import="com.pandas.model.CommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Study SPOT</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="${contextPath}/resources/css/aos.css">
<link rel="stylesheet" href="${contextPath}/resources/css/eyStyle.css">
<link rel="stylesheet" href="${contextPath}/resources/css/jwStyle.css">


</head>
<body>

	<%@ include file="header.jsp"%>
	
	<%
		int idx = Integer.parseInt(request.getParameter("idx"));
	 	System.out.println("뷰 idx 번호는 " + idx);
		CommunityDAO dao = new CommunityDAO();
	  	Communities community = dao.getCommunities(idx);
	%> 

	<!-- 게시글 부분 -->
	<div class="hidden" id="q_idx"><%= idx %></div>
	<div data-aos="fade">
		<h2 class="join-title before-table">자유게시판</h2>
	</div>
	
	<div class="content-container">
		
		<table class="content-list-table" >
			<thead class="table-content">
				<tr class="table-header">
					<th class="cell_padding"><%=community.getCreated_at() %></th>
					<th class="cell_padding"><%=community.getComm_title() %></th>
					<th class="cell_padding"><%=community.getMem_id() %></th>
				</tr>
			</thead>
			<tbody id="list">

			</tbody>
		</table>
	</div>
		<div style="width: 80%; max-width: 800px; display: flex; justify-content: space-between; margin: 0 auto; margin-bottom: 10px; margin-top : -15px">
			<button class="btn" id="to_list_btn">목록</button>
			<%if (member.getMem_id().equals(community.getMem_id())) {%>
				<button class="btn" id="to_update_btn">수정</button>
			<% } %>
				<button id="like-button" style="margin-top: 8px; background: transparent; border: none; cursor: pointer;">
    			❤️ <span id="like-count"><%=community.getComm_likes() %>
    			</span></button>	
			</div>
				<div class="form-group">
					<div class="main">
						<span>
						<%=community.getComm_content() %>
						</span>
					</div>
				</div>
			<!-- 댓글 부분 -->
			<div class="form-group">
				<form action="" method="post">
					<div class="dat">

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
	
	function updateLikes(data){
		$.ajax({
		url : "CommLikes", //요청경로
		type : "get", //요청방식(http 요청 메서드)
		data : {"comm_idx" : data},
		success : changeLikes,
		error : function(){
			alert("통신 실패!")
		}
		
	})
}
    // 좋아요 버튼 클릭 시 AJAX 요청을 통해 서버로 데이터 전송
    $("#like-button").on("click", function () {
    	var c_idx = document.getElementById("q_idx").innerText;
    	updateLikes(c_idx);
    });
    
    function changeLikes(data) {
    	var likes = document.getElementById("like-count");
    	likes.innerText = data;
    }
	// 좋아요 기능 끝
	
    $(document).ready(function(){
      $('#lightgallery').lightGallery();
    });
    
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