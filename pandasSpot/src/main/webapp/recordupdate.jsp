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
	StudyDAO dao = new StudyDAO();
	Studies study = dao.getStudies(idx);
	%>

    <div class="site-section"  data-aos="fade" >
      <div class="container">
            
            
            <form action="StudyUpdate" method="post" enctype="multipart/form-data">
					<table class="study_post_table">
					<tr><td colspan="2" id="post_title_td"><h2 class="post-title">공부 기록</h2></td></tr>
						<tr>
							<td class="study_td"><label class="image_label" for="subject">태그</label></td>
							<td class="study_td">
							<input type="hidden" name="study_idx" value="<%= study.getStudy_idx() %>">
							<input type="text" id="study_content" name="study_content" class="join-input" value="<%=study.getStudy_content() %>" placeholder="#새 태그 추가" required></td>
						</tr>
						<tr>
							<td class="study_td">
							<div class="post-display-block image_label">사진 첨부</div></td>
							<td class="study_td">
							<label> 
								<img src="${contextPath}/uploads/<%=study.getStudy_photo() %>" alt="이미지 추가하기" id="input-image" />
								<input type="file" id="study_photo" name="study_photo"  accept="image/*" style="display: none;">
							</label>
							</td>
						</tr>
						<tr>
						<td colspan='2' class="btns_td">
						<input type="submit" id="study_submit" value="수정" class="post-input-btn" > 
						<input type="button" value="취소" class="post-input-btn" onclick="history.back();">
						</td>
						</tr>
					</table>
				</form>
          </div>

        </div>

  
   <script>
   const imageInput = document.getElementById('study_photo');
   const preview = document.getElementById('preview');
   var mem_id = document.getElementById('mem_id');
   
   document.getElementById('study_photo').addEventListener('change', handleImageChange);

	function handleImageChange(event) {
		const file = event.target.files[0]; // 파일 선택

		if (file) {
			const reader = new FileReader(); // FileReader 생성

			// 파일을 읽은 후 호출되는 함수
			reader.onload = function(e) {
				const imageUrl = e.target.result; // Base64로 인코딩된 이미지 데이터
				const image_preview = document.getElementById('input-image');
				image_preview.src = imageUrl; // 이미지의 src 속성 변경
				image_preview.style.width = 'auto';
			};

			reader.readAsDataURL(file); // 파일을 Base64 데이터 URL로 읽음
		} else {
			document.getElementById('input-image').src = "${contextPath}/resources/icon/add (1).png"; // 파일이 없으면 이미지 초기화
			document.getElementById('input-image').style.width = '30px'; // 파일이 없으면 이미지 초기화
		}
	}
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