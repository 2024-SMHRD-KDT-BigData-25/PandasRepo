<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

  <title>Study SPOT</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


  <link rel="stylesheet" href="css/aos.css">

  <link rel="stylesheet" href="css/style.css">
  
  <style>
  
     #preview {
            margin-top: 20px;
            max-width: 100%;
            max-height: 400px;
     }
     
     body {
            font-family: Arial, sans-serif;
            margin: 100px;
        }
     .tag {
            display: inline;
            background-color: #e0e0e0;
            border-radius: 5px;
            padding: 5px 10px;
            margin: 5px;
            color: #333;
     }
     .delete-btn {
            margin-left: 5px;
            cursor: pointer;
            color: red;
     }
     #tagInput {
            width: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
     }
     .author {
            text-align: right;
            margin-top: 10px;
     }
   </style>
</head>
<body>

<%@ include file="header.jsp"%>

    <div class="site-section"  data-aos="fade" >
      <div class="container">

        <div class="row justify-content-center">

          <div class="col-md-7">
            <div class="row mb-5">
              <div class="col-12 ">
                <h2 class="join-title">공부 기록</h2>
                <div class="author text-right">
                  <span><i class="glyphicon glyphicon-user"></i> 작성자 이름</span>
                </div>
              </div>
            </div>
          </div>

        </div>
        
        <div class="row justify-content-center">
          <div class="col-lg-8 mb-5">
            <form action="StudyPost" method="post" enctype="multipart/form-data">

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="image_label" for="subject">태그</label> 
                  <input type="text" id="study_content" name="study_content" class="join-input" placeholder="#새 태그 추가">
                  <input type="hidden" name="mem_id" value="<%=member.getMem_id() %>">
                  <div id="tagContainer"></div>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                        <div class="image_label">파일 업로드</div>
						<label>
						    <img src= "icon/add (1).png" alt="이미지 추가하기" id="input-image"/>
							<input type="file" id="study_photo" name="study_photo"  accept="image/*" style="display: none;" onchange="previewImage(event)">
                  			<img id="preview" src="" alt="미리보기 이미지" style="display: none;">
						</label>
                </div>
              </div>
              
              <br>
              <div class="row form-group" align="center">
                <div class="col-md-12">
                  <input type="submit" value="등록" class="join-input post-input-btn btn">
                  <input type="submit" value="취소" class="join-input post-input-btn btn">
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
          Copyright &copy;<script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
        </p>
      </div>
    </div>


  
   <script>
   
   
        const imageInput = document.getElementById('study_photo');
        const preview = document.getElementById('preview');

        imageInput.addEventListener('change', function() {
            const file = this.files[0];
            if (file) {
                const reader = new FileReader();
                reader.onload = function(event) {
                    preview.src = event.target.result;
                    preview.style.display = 'block';
                }
                reader.readAsDataURL(file);
            } else {
                preview.style.display = 'none';
            }
        });
    </script>

    
    <script>
        const tagInput = document.getElementById('study_content');
        const tagContainer = document.getElementById('tagContainer');

        tagInput.addEventListener('keypress', function(event) {
            if (event.key === 'Enter' && tagInput.value.trim() !== '') {
                const tagValue = tagInput.value.trim();
                if (tagValue.startsWith('#')) {
                    const tag = document.createElement('span');
                    tag.className = 'tag';
                    tag.textContent = tagValue;

                    // 삭제 버튼 생성
                    const deleteBtn = document.createElement('span');
                    deleteBtn.className = 'delete-btn';
                    deleteBtn.textContent = 'X';
                    deleteBtn.onclick = function() {
                        tagContainer.removeChild(tag);
                    };

                    tag.appendChild(deleteBtn);
                    tagContainer.appendChild(tag);
                    tagInput.value = ''; // 입력 필드 초기화
                } else {
                    alert('해시태그는 #로 시작해야 합니다.');
                }
            }
        });
    </script>

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
