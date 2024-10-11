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
			System.out.println("idx 번호는 " + idxString);	

			int idx = Integer.parseInt(idxString);
			StudyDAO dao = new StudyDAO();
			Studies study = dao.getStudies(idx);
			  	
			String tag = study.getStudy_content();
			    
			String[] tagArray = tag.split(",");
	%>


	<!-- 게시글 부분 -->
	<div class="content-container" data-aos="fade">
			<div data-aos="fade">
		<h2 class="join-title before-table">공부 기록</h2>
	</div>
		<table class="content-list-table" >
			<thead class="table-content">
				<tr class="table-header">
					<th class="cell_padding"><%=study.getCreated_at() %></th>
					<th class="cell_padding"><%=study.getMem_id() %></th>
				</tr>
			</thead>
			<tbody id="list">

			</tbody>
		</table>
	</div>
		<div style="width: 80%; max-width: 800px; display: flex; justify-content: space-between; margin: 0 auto; margin-bottom: 10px; margin-top : -15px">
			<button class="jwbtn" onclick="location.href='RecordList.jsp'">목록</button>
			<div></div>
			<div></div>	
		</div>
			<div class="form-group">
				<div class="main">
					<img src="upload/<%=study.getStudy_photo()%>" alt="Uploaded Image" style="max-width: 100%; height: auto;">
				</div>
			</div>
			<!-- 댓글 부분 -->
			<div class="form-group">
				<div style="width: 80%; max-width: 800px; display: flex; justify-content: space-between; margin: 0 auto; margin-bottom: 10px; margin-top : 10px">

			<div style="margin-top: 8px">
			<% for (String tags : tagArray) { %>
			<span><%=tags %></span>
			<%} %>	</div>
			<div style="margin-top: 8px"><%=study.getStudy_likes() %></div>	
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
    $(document).ready(function(){
      $('#lightgallery').lightGallery();
    });
  </script>

</body>
</html>