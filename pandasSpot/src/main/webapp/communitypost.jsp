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
	
	<div class="site-section" data-aos="fade">
			<div class="container">

				<div class="row justify-content-center">

					<div class="col-md-7">
						<div class="row mb-5">
							<div class="col-12 ">
								<h2 class="join-title">자유게시판</h2>
								<div class="author text-right">
                                   <span><i class="glyphicon glyphicon-user"></i> 작성자 이름</span>
                                </div>
							</div>
						</div>
					</div>

				</div>

				<div class="row justify-content-center">
					<div class="col-lg-8 mb-5">
						<form action="CommunityPost">

							<div class="row form-group">

								<div class="col-md-12">
									<label class="image_label" for="subject">제목</label> <input
										type="subject" id="subject" class="form-control"
										style="border: none; border-bottom: 1px solid; outline: none;">
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12">
									<label class="image_label" for="message">내용</label>
									<textarea name="message" id="message" cols="30" rows="13"
										class="form-control" placeholder="오늘의 공부 일기"></textarea>
								</div>
							</div>

							<div class="row form-group">
								<div class="image_label">프로필 사진</div>
									<label>
									    <img src= "icon/add (1).png" alt="이미지 추가하기" id="input-image"/>
										<input type="file" id="mem_profile_img" name="mem_profile_img"> 
									</label>
								</div>

							<div class="row form-group" align="center">
								<div class="col-md-12">
									<input type="submit" value="등록"
										class="join-input post-input-btn btn"> <input
										type="submit" value="취소"
										class="join-input post-input-btn btn">
								</div>
							</div>


						</form>
					</div>


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


</body>
</html>