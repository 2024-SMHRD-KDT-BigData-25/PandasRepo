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
</head>
<body>

	<%@ include file="header.jsp"%>
	<div data-aos="fade">
		<h2 class="join-title before-table">자유게시판</h2>
	</div>

	<div class="content-container" data-aos="fade">

		<table class="content-list-table">
			<thead class="table-content">
				<tr class="table-header">
					<th class="cell_padding">번호</th>
					<th class="cell_padding">제목</th>
					<th class="cell_padding">작성자</th>
					<th class="cell_padding">작성일</th>
					<th class="cell_padding">첨부파일</th>
					<th class="red-color cell_padding">♥</th>
					<th class="cell_padding">조회수</th>
				</tr>
			</thead>
			<tbody id="list">

			</tbody>
		</table>

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
		getList()
	})
	
	//비동기 통신 시 사용하는 데이터 형식 : json {key:value,key:value} / xml
		function getList(){
			$.ajax({
			url : "communityList", //요청경로
			type : "get", //요청방식(http 요청 메서드)
			success : printList,
			error : function(){
				alert("통신 실패!")
			}
			
		})
	}
	
	function printList(data){
		var data = JSON.parse(data)
		
		var html = "" //id=>list 곳에 추가가 될 html 코드
		
		for(var board of data){
		
	      html += "<tr>"
	      html += "<td class='cell_padding'>"+board.comm_idx+"</td>"
	      html += "<td class='cell_padding'>"+board.comm_title+"</td>"
	      html += "<td class='cell_padding'>"+board.mem_id+"</td>"
	      html += "<td class='cell_padding'>"+board.created_at+"</td>"
	      html += "<td class='cell_padding'>"+board.comm_file+"</td>"
	      html += "<td class='cell_padding'>"+board.comm_likes+"</td>"
	      html += "<td class='cell_padding'>"+board.comm_views+"</td>"
	      //html += "<td><button class='btn btn-primary py-2 px-4 text-white' onclick='deleteBoard("+board.comm_idx+")'>삭제</button></td>"
	      html += "</tr>"
	    }
		//html() : 특정 태그 사이에 html 코드를 바꾸고 싶을때
		//text() : text바꾸고 싶을때
		//append() : 특정 태그 사이에 값을 추가 (뒤쪽에) => 누적
		//prepend() : 앞쪽에 추가 => 누적
		$("#list").html(html)
	}
</script>
</body>
</html>