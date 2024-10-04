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

  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&family=Roboto+Mono:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="fonts/icomoon/style.css">
  <!-- bootstrap 스타일시트 추가 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link rel="stylesheet" href="css/magnific-popup.css">
  <link rel="stylesheet" href="css/jquery-ui.css">
  <link rel="stylesheet" href="css/owl.carousel.min.css">
  <link rel="stylesheet" href="css/owl.theme.default.min.css">

  <link rel="stylesheet" href="css/lightgallery.min.css">    

  <link rel="stylesheet" href="css/bootstrap-datepicker.css">

  <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

  <link rel="stylesheet" href="css/swiper.css">

  <link rel="stylesheet" href="css/aos.css">

  <link rel="stylesheet" href="css/style.css">

</head>
<body>

  <div class="site-wrap">

    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
  </div>


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
<div class="container">
  <div class="panel panel-default">
    <div class="panel-heading" align="center"><h3>STUDY LOG</h3></div>
    <div class="panel-body">
    	<div class="form-horizontal">	
    	  	<div class="form-group" style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #000; padding-bottom: 10px; padding-right: 15px;">
    			<span class="date"><%=diary.getCreated_at() %></span>
    			<span class="title"><%=diary.getDiary_title() %></span>
    			<span class="author"><i class="glyphicon glyphicon-user"></i> <%=diary.getMem_id() %></span>
    	  	</div>
    	  	<div style="width: 80%; max-width: 500px; display: flex; justify-content: space-between; margin: 0 auto; margin-bottom: 10px;">
	    			<button class="btn btn-secondary">목록</button>
	    			<div>
	    			좋아요(int)
	    			</div>   
		    </div>
		    <div class="form-group">
		      <div style="width: 80%; max-width: 500px; min-height: 200px; margin: 0 auto; background-color: lightgrey; padding: 20px;">
 				<span>
 				스터디로그는 사진 따윈 없어 공부나 하렴
 				<%=diary.getDiary_content() %>
 				</span>
				</div>
		      </div>
		    </div>
		    <!-- 댓글 부분 -->
			<div class="form-group">
  				<form action="" method="post">
   				 <div style="width: 80%; max-width: 500px; min-height: 100px; margin: 0 auto; background-color: white; border: 1px solid #000; display: flex; flex-direction: column; justify-content: space-between; padding: 10px;">
      
   			   <!-- 댓글 개수 표시 -->
     		 <div style="display: flex; justify-content: flex-start;">
      		  <span>댓글수 : 5</span>
      			</div>
      				<span>댓글 내용 공간</span>
     				 <div style="display: flex; gap: 10px; align-items: center;">
       				  <input type="text" class="form-control" name="dat" id="dat" style="max-width: 80%; height: 20px;">
      				  <input type="submit" value="등록" style="height: 22px;">
      				</div>
    			  </div>
  				</form>
			</div>    
		    <div class="form-group" style="display: flex; justify-content: center; align-items: center;">
		   </div>
    
    </div>
    <div class="panel-footer">완료</div>
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