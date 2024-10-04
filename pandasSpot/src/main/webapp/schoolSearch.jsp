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
<div class="site-section" data-aos="fade">
			<div class="container">

				<div class="row justify-content-center">

					<div class="col-md-7">
						<div class="row mb-5">
							<div class="col-12 ">
								<h2 class="site-section-heading text-center">학교 찾기</h2>
							</div>
						</div>
					</div>

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
	
	 <script>
        // 임의의 학교 데이터 (백엔드와 연동하는 경우 이 부분은 서버에서 처리)
        const schoolData = ["서울대학교", "연세대학교", "고려대학교", "한양대학교", "중앙대학교"];

        // 학교 검색 기능
        function searchSchool() {
            const searchTerm = document.getElementById('schoolSearch').value;
            const resultList = document.getElementById('resultList');
            resultList.innerHTML = ''; // 검색 결과 초기화

            // 검색어와 일치하는 학교 목록 필터링
            const results = schoolData.filter(school => school.includes(searchTerm));

            // 결과를 목록으로 표시
            results.forEach(school => {
                const li = document.createElement('li');
                li.textContent = school;
                li.onclick = () => selectSchool(school); // 학교 선택 시 함수 호출
                resultList.appendChild(li);
            });
        }

        // 학교 선택 시 부모 창에 값 전달
        function selectSchool(schoolName) {
            // 부모 창의 setSchool 함수 호출
            window.opener.setSchool(schoolName);
            window.close(); // 선택 후 팝업 창 닫기
        }
    </script>
</body>