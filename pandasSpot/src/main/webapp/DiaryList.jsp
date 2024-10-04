<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Photosen &mdash; Colorlib Website Template</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&family=Roboto+Mono:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">

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




		<header class="site-navbar py-3" role="banner">

			<div class="container-fluid">
				<div class="row align-items-center">

					<div class="col-6 col-xl-2" data-aos="fade-down">
						<h1 class="mb-0">
							<a href="index.html" class="text-white h2 mb-0">Photosen</a>
						</h1>
					</div>
					<div class="col-10 col-md-8 d-none d-xl-block" data-aos="fade-down">
						<nav
							class="site-navigation position-relative text-right text-lg-center"
							role="navigation">

							<ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
								<li><a href="index.html">Home</a></li>
								<li class="has-children"><a href="single.html">Gallery</a>
									<ul class="dropdown">
										<li><a href="#">Nature</a></li>
										<li><a href="#">Portrait</a></li>
										<li><a href="#">People</a></li>
										<li><a href="#">Architecture</a></li>
										<li><a href="#">Animals</a></li>
										<li><a href="#">Sports</a></li>
										<li><a href="#">Travel</a></li>
										<li class="has-children"><a href="#">Sub Menu</a>
											<ul class="dropdown">
												<li><a href="#">Menu One</a></li>
												<li><a href="#">Menu Two</a></li>
												<li><a href="#">Menu Three</a></li>
											</ul></li>
									</ul></li>
								<li class="active"><a href="services.html">Services</a></li>
								<li><a href="about.html">About</a></li>
								<li><a href="contact.html">Contact</a></li>
							</ul>
						</nav>
					</div>

					<div class="col-6 col-xl-2 text-right" data-aos="fade-down">
						<div class="d-none d-xl-inline-block">
							<ul
								class="site-menu js-clone-nav ml-auto list-unstyled d-flex text-right mb-0"
								data-class="social">
								<li><a href="#" class="pl-0 pr-3"><span
										class="icon-facebook"></span></a></li>
								<li><a href="#" class="pl-3 pr-3"><span
										class="icon-twitter"></span></a></li>
								<li><a href="#" class="pl-3 pr-3"><span
										class="icon-instagram"></span></a></li>
								<li><a href="#" class="pl-3 pr-3"><span
										class="icon-youtube-play"></span></a></li>
							</ul>
						</div>

						<div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3"
							style="position: relative; top: 3px;">
							<a href="#" class="site-menu-toggle js-menu-toggle text-black"><span
								class="icon-menu h3"></span></a>
						</div>

					</div>

				</div>
			</div>

		</header>



		<div class="site-section" data-aos="fade">
			<div class="container-fluid">

				<div class="row justify-content-center">

					<div class="col-md-7">
						<div class="row mb-5">
							<div class="col-12 ">
								<h2 class="site-section-heading text-center">게시판</h2>
							</div>
						</div>
					</div>

				</div>

				<div class="panel-body">
					<table class="table table-bordered text-white">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
							</tr>
						</thead>
						<tbody id="list">

						</tbody>
					</table>

				</div>
				<div class="panel-footer text-white">빅데이터 분석서비스 개발자과정 (담임 : 서대희)</div>

			</div>
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
		
		for(var board of data){
		
	      html += "<tr>"
	      html += "<td>"+board.diary_idx+"</td>"
	      html += "<td>"+board.diary_title+"</td>"
	      html += "<td>"+board.mem_id+"</td>"
	      html += "<td>"+board.created_at+"</td>"
	      html += "<td><button class='btn btn-sm btn-info' onclick='deleteBoard("+board.diary_idx+")'>삭제</button></td>"
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