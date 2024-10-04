<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Study SPOT</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&family=Roboto+Mono:wght@400;700&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="fonts/icomoon/style.css">
<!-- bootstrap 스타일시트 추가 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

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
	<div>
		<h2>글 작성</h2>
		<div>
			<div>게시판</div>
			<div>


				<form action="write" method="post">
					<div>
						<label for="title">제목:</label>
						<div>
							<input type="text" name="title" id="title"
								placeholder="Enter title">
						</div>
					</div>
					<div>
						<label for="content">내용:</label>
						<div>
							<textarea rows="10" name="content"></textarea>
						</div>
					</div>
					<div>
						<label for="writer">작성자:</label>
						<div>
							<input type="text" name="writer">
						</div>
					</div>
					<div>
						<label for="photo">이미지:</label>
						<div>
							<input type="file" name="img">
						</div>
					</div>
					<div>
						<div>
							<button type="submit">작성</button>
							<button type="reset">메뉴</button>
						</div>
					</div>
				</form>
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

</body>
</html>