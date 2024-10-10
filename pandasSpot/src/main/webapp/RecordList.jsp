<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Study SPOT</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/eyStyle.css">
<link rel="stylesheet" href="css/jwStyle.css">

</head>
<body>

	<%@ include file="header.jsp"%>
	<div class="content-container" data-aos="fade">
		<h2 class="join-title before-table">공부 기록</h2>
	</div>
	<div class="content-container" data-aos="fade">

		<table class="content-list-table" style="width: 90%; text-align: center;" >
			<tbody id="list">
			</tbody>
		</table>
	</div>
	<div style="padding-bottom: 100px; display: flex; flex-wrap: wrap; justify-content: center; gap: 10px;">
		<button class="btn board_btn" id="to_write_btn"
			onclick="location.href='recordpost.jsp'">글작성</button>
		<button class="btn chat_btn board_btn"
			onclick="window.open('chat.jsp','채팅방','width=500, height=700, top=50, left=500')'">채팅하기</button>
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

	<script>
	//게시물 전체 정보 불러오기(비동기통신-ajax)
	//http://localhost:8081/mavenboard1/boardlist.jsp
	//http://localhost:8081/mavenboard1/board
	
	//현재 html 문서가 브라우저 상에서 로드가 완료되고 나면 getList() 호출
	$(document).ready(function(){
		console.log("document호출")
		getList()
	})
	
	//비동기 통신 시 사용하는 데이터 형식 : json {key:value,key:value} / xml
	function getList(){
			$.ajax({
			url : "StudyList", //요청경로
			type : "get", //요청방식(http 요청 메서드)
			success : printList, // 데이터가 제대로 전송되었는지 확인
			error : function(){
				alert("통신 실패!")
			}
		})
	}
	
	function printList(data){
		var data = JSON.parse(data)
		var html = "" //id=>list 곳에 추가가 될 html 코드
		
		for(var board of data){
		  html += "<a href='record_view2.jsp?idx="+board.Study_idx+"'>"
		  html += "<div style= 'display: inline-block; width: 350px; height:350px; margin: 10px; text-align: center; border: 1px solid black; padding: 10px; flex-direction: column; justify-content: center; align-items: center;'>"
	      html += "<p>"+board.Mem_id+"</p>"
	   	  // 이미지 경로를 img 태그로 출력
	      html += "<img src='upload/" + board.Study_photo + "' alt='Uploaded Image' style='width: 250px; height: 250px;'>";
	      //html += "<td><button class='btn btn-primary py-2 px-4 text-white' onclick='deleteBoard("+board.q_idx+")'>삭제</button></td>"
	      html += "</div>"
	      html += "</a>"
	    }
		$("#list").html(html)
	}
</script>
</body>
</html>