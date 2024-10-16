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

</head>
<body>
	<jsp:include page="header.jsp" />
<% 
	CommunityDAO dao = new CommunityDAO();
	int length = dao.getCommLength();
%>
		<div class="pages_info" id="pages_info"><%= length %></div>
	<div class="content-container" data-aos="fade">
		<h2 class="join-title before-table">자유게시판</h2>
	</div>
	<div class="content-container" data-aos="fade">
	<div class="board_container" id="board_container">
		<table class="content-list-table">
			<thead class="table-content">
				<tr class="table-header">
					<th class="cell_padding table_idx">번호</th>
					<th class="cell_padding table_idx">제목</th>
					<th class="cell_padding table_writer">작성자</th>
					<th class="cell_padding table_date">작성일</th>
					<th class="red-color cell_padding table_likes">♥</th>
					<th class="cell_padding table_views">조회수</th>
				</tr>
			</thead>
			<tbody id="list">
			  
			</tbody>
			
		</table>
	<div id="table_footer"><div id="page_list"></div><button class="btn board_btn" id="to_write_btn" onclick="location.href='communitypost.jsp'" style="float: right">글작성</button></div>
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
	<script src="${contextPath}/resources/js/moment.js"></script>

	<script src="${contextPath}/resources/js/picturefill.min.js"></script>
	<script src="${contextPath}/resources/js/lightgallery-all.min.js"></script>
	<script src="${contextPath}/resources/js/jquery.mousewheel.min.js"></script>

	<script src="${contextPath}/resources/js/main.js"></script>

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
		var total_length = document.getElementById("pages_info").innerText;
		 
		const itemsPerPage = 15;
		const pages = Math.floor(total_length / itemsPerPage) + (total_length % itemsPerPage != 0 ? 1 : 0); 
		getList(1);
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
		        getList(e.target.innerText);
		    });

		    // 링크를 HTML 문서의 body에 추가

		    $("#page_list").append(a);
		}
	    
	})

	//비동기 통신 시 사용하는 데이터 형식 : json {key:value,key:value} / xml
		function getList(data){
			$.ajax({
			url : "communityList", //요청경로
			type : "get", //요청방식(http 요청 메서드)
			data : {"page" : data},
			success : printList,
			error : function(){
				alert("통신 실패!")
			}
			
		})
	}
	
		function printList(data){
			var data = JSON.parse(data),
				html = "", //id=>list 곳에 추가가 될 html 코드
				dlength = data.length;
			
				
		for(var board of data){
		
		  html += "<tr class='board_line'>"
	      html += "<td class='text-black board_content_line'>"+board.comm_idx+"</td>"
	      html += "<td class='text-black board_content_line td_title'><a class='table_a_tags' href='community_view.jsp?idx="+board.comm_idx+"'>"+board.comm_title+"</a></td>"
	      html += "<td class='text-black board_content_line'><a>"+board.mem_id+"</a></td>"
	      html += "<td class='text-black board_content_line'>"+board.created_at+"</td>"
	      html += "<td class='text-black board_content_line'>"+board.comm_likes+"</td>"
	      html += "<td class='text-black board_content_line'>"+board.comm_views+"</td>"
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