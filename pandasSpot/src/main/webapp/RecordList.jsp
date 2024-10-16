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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
<link rel="stylesheet" href="${contextPath}/resources/css/aos.css">
<link rel="stylesheet" href="${contextPath}/resources/css/eyStyle.css">
<link rel="stylesheet" href="${contextPath}/resources/css/jwStyle.css">

</head>
<body>

	<%@ include file="header.jsp"%>
	
	<% 
	StudyDAO dao = new StudyDAO();
	int length = dao.getStudyLength();
	%>
		<div class="pages_info" id="pages_info"><%= length %></div>
	<div class="content-container" data-aos="fade" >
		<h2 class="join-title before-table">공부 기록</h2>
	</div>
	<div class="content-container" data-aos="fade" style="display: grid; grid-template-rows: repeat(3, auto); justify-items: center; margin-top: 50px;">
		<table class="content-list-table" style="width: 90%; text-align: center;" >
			<tbody id="list">
			</tbody>
		</table>
		<div id="page_list"></div>
		<div>
		<button class="btn board_btn" id="to_write_btn" onclick="location.href='recordpost.jsp'">글쓰기</button>
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
    $(document).ready(function(){
      $('#lightgallery').lightGallery();
    });
  </script>

	<script>
	//게시물 전체 정보 불러오기(비동기통신-ajax)
	//http://localhost:8081/mavenboard1/boardlist.jsp
	//http://localhost:8081/mavenboard1/board
	$(document).ready(function(){
		var total_length = document.getElementById("pages_info").innerText;
		const itemsPerPage = 15	;
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
			url : "StudyList", //요청경로
			type : "get", //요청방식(http 요청 메서드)
			data : {"page" : data},
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
		  html += "<a href='record_view.jsp?idx="+board.Study_idx+"'>"
		  html += "<div style= 'display: inline-block; width: 350px; height:350px; margin: 10px; text-align: center; border: 1px solid black; padding: 10px; flex-direction: column; justify-content: center; align-items: center;'>"
	      html += "<p style= 'font-family: 교육새음; font-size: 20px; font-weight: 400; color: #333;'>"+board.Mem_id+"</p>"
	   	  // 이미지 경로를 img 태그로 출력
	      html += "<img src='${contextPath}/uploads/" + board.Study_photo + "' alt='Uploaded Image' style='width: 250px; height: 250px;'>";
	      //html += "<td><button class='btn btn-primary py-2 px-4 text-white' onclick='deleteBoard("+board.q_idx+")'>삭제</button></td>"
	      html += "</div>"
	      html += "</a>"
	    }
		$("#list").html(html)
	}
</script>
</body>
</html>