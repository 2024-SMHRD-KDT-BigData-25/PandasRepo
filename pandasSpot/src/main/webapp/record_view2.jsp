<%@page import="com.pandas.model.Records"%>
<%@page import="com.pandas.model.RecordDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Study SPOT</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link rel="stylesheet" href="css/aos.css">
  <link rel="stylesheet" href="css/jwStyle.css">
  <link rel="stylesheet" href="css/eyStyle.css">

</head>
<body>

<%@ include file="header.jsp" %>
<!-- String idxString = request.getParameter("idx"); -->
	<%
		String idxString = "0";
		System.out.println("idx 번호는 " + idxString);	

	 	int idx = Integer.parseInt(idxString);
		RecordDAO dao = new RecordDAO();
	  	Records record = dao.getRecords(idx);
	  	
	  	String tags = record.getRecord_tag();
	    
	  	String[] tagArray = tags.split(", ");
	%>


	<!-- 게시글 부분 -->
	<div data-aos="fade">
		<h2 class="join-title before-table">공부 기록</h2>
	</div>
	
	<div class="content-container" data-aos="fade">
		
		<table class="content-list-table" >
			<thead class="table-content">
				<tr class="table-header">
					<th class="cell_padding"><%=record.getCreate_at() %></th>
					<th class="cell_padding">작성자 이름</th>
				</tr>
			</thead>
			<tbody id="list">

			</tbody>
		</table>
	</div>
		<div style="width: 80%; max-width: 800px; display: flex; justify-content: space-between; margin: 0 auto; margin-bottom: 10px; margin-top : -15px">
			<button class="btn">목록</button>
			<div></div>
			<div style="margin-top: 8px">좋아요(int)</div>	
		</div>
			<div class="form-group">
				<div class="main">
					<img src="upload/<%=record.getRecord_files()%>" alt="Uploaded Image" style="max-width: 100%; height: auto;">
				</div>
			</div>
			<!-- 댓글 부분 -->
			<div class="form-group">
				<div style="width: 80%; max-width: 800px; display: flex; justify-content: space-between; margin: 0 auto; margin-bottom: 10px; margin-top : 10px">

			<div style="margin-top: 8px">
			<% for (String tag : tagArray) { %>
			<span><%=tag %></span>
			<%} %>	</div>
			<div style="margin-top: 8px">좋아요(int)</div>	
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