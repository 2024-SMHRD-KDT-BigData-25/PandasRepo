<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Photosen &mdash; Colorlib Website Template</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:wght@400;700&family=Roboto+Mono:wght@400;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="fonts/icomoon/style.css">
  <!-- bootstrap 스타일시트 추가 -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

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



    <header class="site-navbar py-3" role="banner">

      <div class="container-fluid">
        <div class="row align-items-center">

          <div class="col-6 col-xl-2" data-aos="fade-down">
            <h1 class="mb-0"><a href="index.html" class="text-white h2 mb-0">Photosen</a></h1>
          </div>
          <div class="col-10 col-md-8 d-none d-xl-block" data-aos="fade-down">
            <nav class="site-navigation position-relative text-right text-lg-center" role="navigation">

              <ul class="site-menu js-clone-nav mx-auto d-none d-lg-block">
                <li class="active"><a href="index.html">Home</a></li>
                <li class="has-children">
                  <a href="single.html">Gallery</a>
                  <ul class="dropdown">
                    <li><a href="#">Nature</a></li>
                    <li><a href="#">Portrait</a></li>
                    <li><a href="#">People</a></li>
                    <li><a href="#">Architecture</a></li>
                    <li><a href="#">Animals</a></li>
                    <li><a href="#">Sports</a></li>
                    <li><a href="#">Travel</a></li>
                    <li class="has-children">
                      <a href="#">Sub Menu</a>
                      <ul class="dropdown">
                        <li><a href="#">Menu One</a></li>
                        <li><a href="#">Menu Two</a></li>
                        <li><a href="#">Menu Three</a></li>
                      </ul>
                    </li>
                  </ul>
                </li>
                <li><a href="services.html">Services</a></li>
                <li><a href="about.html">About</a></li>
                <li><a href="contact.html">Contact</a></li>
              </ul>
            </nav>
          </div>

          <div class="col-6 col-xl-2 text-right" data-aos="fade-down">
            <div class="d-none d-xl-inline-block">
              <ul class="sitexx-menu js-clone-nav ml-auto list-unstyled d-flex text-right mb-0" data-class="social">
                <li>
                  <a href="#" class="pl-0 pr-3"><span class="icon-facebook"></span></a>
                </li>
                <li>
                  <a href="#" class="pl-3 pr-3"><span class="icon-twitter"></span></a>
                </li>
                <li>
                  <a href="#" class="pl-3 pr-3"><span class="icon-instagram"></span></a>
                </li>
                <li>
                  <a href="#" class="pl-3 pr-3"><span class="icon-youtube-play"></span></a>
                </li>
              </ul>
            </div>

            <div class="d-inline-block d-xl-none ml-md-0 mr-auto py-3" style="position: relative; top: 3px;"><a href="#" class="site-menu-toggle js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

          </div>

        </div>
      </div>
      
    </header>

<!-- 게시글 부분 -->
<body>
<div class="container">
  <div class="panel panel-default">
    <div class="panel-heading" align="center"><h3>자유 게시판</h3></div>
    <div class="panel-body">
    	<div class="form-horizontal">	
    	  	<div class="form-group" style="display: flex; justify-content: space-between; align-items: center; border-bottom: 1px solid #000; padding-bottom: 10px; padding-right: 15px;">
    			<span class="date">날짜(2024/10/04)</span>
    			<span class="title">글 제목</span>
    			<span class="author"><i class="glyphicon glyphicon-user"></i> 작성자 이름</span>
    	  	</div>
    	  	<div style="width: 80%; max-width: 500px; display: flex; justify-content: space-between; margin: 0 auto; margin-bottom: 10px;">
	    			<button class="btn btn-secondary">목록</button>
	    			<div>
	    			좋아요(int)
	    			</div>   
		    </div>
		    <div class="form-group">
		      <div style="width: 80%; max-width: 500px; min-height: 200px; margin: 0 auto; background-color: lightgrey; padding: 20px;">
 				<span>자유게시판 글 내용 들어갈 공간</span>
				</div>
		      </div>
		    </div>
		    <!-- 댓글 부분 -->
			<div class="form-group">
  				<form action="" method="post">
   				 <div style="width: 80%; max-width: 500px; min-height: 100px; margin: 0 auto; background-color: white; border: 1px solid #000; display: flex; flex-direction: column; justify-content: space-between; padding: 10px;">
      
   			   <!-- 댓글 개수 표시 -->
     		 <div style="display: flex; justify-content: flex-start;">
      		  <span>댓글수 : 5</span>
      			</div>
      				<span>댓글 내용 공간</span>
     				 <div style="display: flex; gap: 10px; align-items: center;">
       				  <input type="text" class="form-control" name="dat" id="dat" style="max-width: 80%; height: 20px;">
      				  <input type="submit" value="등록" style="height: 22px;">
      				</div>
    			  </div>
  				</form>
			</div>    
		    <div class="form-group" style="display: flex; justify-content: center; align-items: center;">
		    </div>
    
    </div>
    <div class="panel-footer">완료</div>
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