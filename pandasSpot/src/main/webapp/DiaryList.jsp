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
<link rel="stylesheet" href="css/ecStyle.css">
<style type="text/css">
.board_btn {
	background-color: #C0C78C;
	color: black;
	display: flex;
	padding : 5px;
	margin: 10px auto 10px auto;
	font-size: 100px;
	height: 40px;
}
.board_container {
width: 80%;
}

#table_footer {
	text-align:center;
}

.text-black {
	font-family:"받아쓰기";
	text-align: center;
}

.table_a_tags {
	text-decoration: none;
	color: black;
}
</style>
</head>
<body>
	<%@ include file="header.jsp"%>
	<div class="content-container" data-aos="fade">
		<h2 class="join-title before-table">Study Log</h2>
	</div>
	<div class="content-container" data-aos="fade">
	<div class="board_container" id="board_container">
		<table class="content-list-table">
			<thead class="table-content">
				<tr class="table-header">
					<th class="cell_padding">번호</th>
					<th class="cell_padding">제목</th>
					<th class="cell_padding">작성자</th>
					<th class="cell_padding">작성일</th>
				</tr>
			</thead>
			<tbody id="list">
			  
			</tbody>
		</table>
		<div id="table_footer"><button class="btn board_btn" id="to_write_btn" onclick="location.href='diarypost.jsp'">글작성</button></div>
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
			url : "diaryList", //요청경로
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
		const itemsPerPage = 15;
		var dlength = data.length;
		const pages = Math.floor(dlength / itemsPerPage) + (dlength % itemsPerPage != 0 ? 1 : 0); 
		console.log(pages);
		
		let paginatedData = [];

		// 페이지 나누기
		for (let i = 0; i < pages; i++) {
		    // 각 페이지에 해당하는 데이터를 슬라이싱하여 배열에 추가
		    const pageData = data.slice(i * itemsPerPage, (i + 1) * itemsPerPage);
		    paginatedData.push(pageData); // 각 페이지 데이터를 배열에 저장
		}

		var a_tags = document.createElement('div');
		// 페이지 링크 생성 및 콘솔 출력
		for (let i = 0; i < pages; i++) {
		    // 각 페이지에 해당하는 링크(a 태그)를 생성
		    const a = document.createElement('a');
		    a.innerText = i+1;
		    a.href = '#'; // 클릭 시 페이지 이동 방지
		    a.style.marginRight = '10px'; // 링크 간 간격 추가
		    a.style.textDecoration = 'none';
		    a.style.color = '#776B5D';
		    a.style.fontFamily = '받아쓰기';
		    a.style.fontSize = '20px';
		    
		    // 클릭 시 콘솔에 해당 페이지 데이터 출력
		    a.addEventListener('click', (e) => {
		        e.preventDefault(); // 링크 기본 동작 방지
		        console.log(i+1, paginatedData[i]);
		    });

		    // 링크를 HTML 문서의 body에 추가

		    a_tags.appendChild(a);
		}
	    document.getElementById('table_footer').prepend(a_tags);
		
		for(var board of data){
		
	      html += "<tr class='board_line'>"
	      html += "<td class='text-black'>"+board.diary_idx+"</td>"
	      html += "<td class='text-black'><a class='table_a_tags' href='study_view.jsp?idx="+board.diary_idx+"'>"+board.diary_title+"</a></td>"
	      html += "<td class='text-black'><a>"+board.mem_id+"</a></td>"
	      html += "<td class='text-black'>"+board.created_at+"</td>"
	      //html += "<td><button class='btn btn-primary py-2 px-4 text-white' onclick='deleteBoard("+board.diary_idx+")'>삭제</button></td>"
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