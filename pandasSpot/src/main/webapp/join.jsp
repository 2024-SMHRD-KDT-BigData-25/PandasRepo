<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Spot</title>
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
								<li><a href="services.html">Services</a></li>
								<li><a href="about.html">About</a></li>
								<li class="active"><a href="join.jsp">Join</a></li>
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
							<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
								class="icon-menu h3"></span></a>
						</div>

					</div>

				</div>
			</div>

		</header>



		<div class="site-section" data-aos="fade">
			<div class="container">

				<div class="row justify-content-center">

					<div class="col-md-7">
						<div class="row mb-5">
							<div class="col-12 ">
								<h2 class="site-section-heading text-center">Join SPOT</h2>
							</div>
						</div>
					</div>

				</div>
				<!-- join : 은유 -->
				<div class="row justify-content-center">
					<div class="col-lg-8 mb-5">
						<form action="Join" method="post">

							<div class="row form-group">
								<div class="col-md-12">
									<label class="text-white" for="mem_name">이름</label> <input
										type="text" id="mem_name" name="mem_name" class="form-control">
								</div>
							</div>
							<div class="row form-group">
								<div class="col-md-12">
									<label class="text-white" for="mem_id">아이디</label> <input
										type="text" id="mem_id" name="mem_id" class="form-control">
								</div>
							</div>

							<div class="row form-group">

								<div class="col-md-12">
									<label class="text-white" for="mem_pw">비밀번호</label> <input
										type="password" id="mem_pw" name="mem_pw" class="form-control">
								</div>
								<div class="col-md-12">
									<label class="text-white" for="pw_confirm">비밀번호 확인</label> <input
										type="password" id="pw_confirm" name="pw_confirm" class="form-control"  oninput="validatePasswords()">
								</div>
								 <div id="message"></div>
							</div>

							<div class="row form-group">

								<div class="col-md-12">
									<label class="text-white" for="mem_nick">닉네임</label> <input
										type="text" id="mem_nick" name="mem_nick" class="form-control">
								</div>
							</div>
							
							<div class="row form-group">

								<div class="col-md-12">
									<label class="text-white" for="mem_birthdate">생년월일</label> <input
										type="date" id="mem_birthdate" name="mem_birthdate" class="form-control">
								</div>
							</div>
							
							<div class="row form-group">

								<div class="col-md-12">
									<label class="text-white" for="mem_school">학교</label> <input
										type="text" id="mem_school" name="mem_school" class="form-control">
										<button class="btn btn-primary py-2 px-4 text-white" onclick="openSchoolSearch()">학교 찾기</button>
								</div>
							</div>
							
							<div class="row form-group">

								<div class="col-md-12">
									<label class="text-white" for="mem_profile_img">프로필 사진</label> <input
										type="file" id="mem_profile_img" name="mem_profile_img" class="form-control">
								</div>
							</div>

							<div class="row form-group">
								<div class="col-md-12">
									<input type="submit" value="join"
										class="btn btn-primary py-2 px-4 text-white">
								</div>
							</div>


						</form>
					</div>
				</div>
			</div>
		</div>

		<div class="footer py-4">
			<div class="container-fluid text-center">
				<p>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					Copyright &copy;
					<script data-cfasync="false"
						src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script>
					<script>document.write(new Date().getFullYear());</script>
					All rights reserved | This template is made with <i
						class="icon-heart-o" aria-hidden="true"></i> by <a
						href="https://colorlib.com" target="_blank">Colorlib</a>
					<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
				</p>
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
    
    function openSchoolSearch() {
        // 팝업 창 열기 (새 창 크기 지정)
        window.open('schoolSearch.jsp', '학교 검색', 'width=600,height=400');
    }

    // 팝업에서 선택한 학교 정보 가져오기
    function setSchool(schoolName) {
        document.getElementById('school').value = schoolName;
    }
  </script>
  
   <script>
        function validatePasswords() {
            const password = document.getElementById("mem_pw").value;
            const confirmPassword = document.getElementById("confirm_pw").value;
            const message = document.getElementById("message");
            
            console.log(password);
            console.log(confirmPassword);
            // 비밀번호가 일치하는지 확인
            if (password === confirmPassword) {
                message.textContent = "비밀번호가 일치합니다.";
                message.style.color = "green";
                document.getElementById("confirmPassword").classList.add("match");
                document.getElementById("confirmPassword").classList.remove("no-match");
            } else {
                message.textContent = "비밀번호가 일치하지 않습니다.";
                message.style.color = "red";
                document.getElementById("confirmPassword").classList.add("no-match");
                document.getElementById("confirmPassword").classList.remove("match");
            }
        }
    </script>

</body>