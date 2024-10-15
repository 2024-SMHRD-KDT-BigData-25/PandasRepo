<%@page import="com.pandas.model.Studies"%>
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
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

  
  <style>
  
     #preview {
            margin-top: 20px;
            max-width: 100%;
            max-height: 400px;
     }
     
     body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
     .tag {
            display: inline-block;
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
            margin-top: 10px; /* Optional: add some space above the author name */
     }
   </style>
</head>
<body>

 <%@ include file="header.jsp"%>
 <% 
	
	int idx = Integer.parseInt( request.getParameter("idx") );
	System.out.println("인덱스 번호는 " + idx);
	StudyDAO dao = new StudyDAO();
	Studies study = dao.getStudies(idx);
	%>

    <div class="site-section"  data-aos="fade">
      <div class="container">

        <div class="row justify-content-center">

          <div class="col-md-7">
            <div class="row mb-5">
              <div class="col-12 ">
                <h2 class="site-section-heading text-center">공부 기록</h2>
                <div class="author text-right">
                  <span><i class="glyphicon glyphicon-user"></i> <%=study.getMem_id()%></span>
                </div>
              </div>
            </div>
          </div>

        </div>
        
        <div class="row justify-content-center" >
          <div class="col-lg-8 mb-5">
            <form action="StudyUpdate" method="post" enctype="multipart/form-data">

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-white" for="tagInput">Tag</label> 
                  <input type="text" id="tagInput" class="form-control" name="study_content"  value="<%=study.getStudy_content() %>" required>
                  <div id="tagContainer"></div>
                </div>
              </div>

              <div class="row form-group">
                <div class="col-md-12">
                  <label class="text-white" for="message">파일 첨부 : </label> 
                  <input type="file" id="file-upload" name="study_photo" value=<%=study.getStudy_photo() %> accept="image/*" style="border: none; border-bottom:1px solid #fff; outline: none;">
                  <img id="preview" src="" alt="미리보기 이미지" style="display: none;">
                </div>
              </div>
              
              <br>
              <div class="row form-group" align="center">
                <div class="col-md-12">
                  <input type="submit" value="수정" class="post-input-btn">
                  <input type="submit" value="취소" class="post-input-btn" onclick="history.back();">
                </div>
              </div>

            </form>
          </div>

        </div>
      </div>
    </div>

  </div>
  
   <script>
        const imageInput = document.getElementById('file-upload');
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
        const tagInput = document.getElementById('tagInput');
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

</body>
</html>

</body>
</html>