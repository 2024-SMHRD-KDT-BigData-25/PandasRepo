<%@page import="com.pandas.model.Diaries"%>
<%@page import="com.pandas.model.DiaryDAO"%>
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


 <%@ include file="header.jsp"%>

<!-- 게시글 부분 -->
<body>
	<%
		String idxString = request.getParameter("idx");
	
		System.out.println("idx 번호는 " + idxString);	

	 	int idx = Integer.parseInt(idxString);
		DiaryDAO dao = new DiaryDAO();
	  	Diaries diary = dao.getDiary(idx);
	%> 
	
	
		<!-- 게시글 부분 -->
<body>
	<div data-aos="fade">
		<h2 class="join-title before-table">STUDY LOG</h2>
	</div>
	
	<div class="content-container" data-aos="fade">
		
		<table class="content-list-table" >
			<thead class="table-content">
				<tr class="table-header">
					<th class="cell_padding"><%=diary.getCreated_at() %></th>
					<th class="cell_padding"><%=diary.getDiary_title() %></th>
					<th class="cell_padding"><%=diary.getMem_id() %></th>
				</tr>
			</thead>
			<tbody id="list">

			</tbody>
		</table>
	</div>
		<div style="width: 80%; max-width: 800px; display: flex; justify-content: space-between; margin: 0 auto; margin-bottom: 10px; margin-top : -15px">
			<button class="btn">목록</button>
				<div style="margin-top: 8px">좋아요(int)</div>	
			</div>
				<div class="form-group">
					<div class="main">
						<span>스터디로그는 사진 따윈 없어 공부나 하렴
 						<%=diary.getDiary_content() %></span>
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