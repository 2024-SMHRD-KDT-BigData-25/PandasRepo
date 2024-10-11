<%@page import="com.pandas.model.Communities"%>
<%@page import="com.pandas.model.CommunityDAO"%>
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
		String idxString = request.getParameter("idx");
	
		System.out.println("idx 번호는 " + idxString);	

	 	int idx = Integer.parseInt(idxString);
		CommunityDAO dao = new CommunityDAO();
	  	Communities community = dao.getCommunities(idx);
	%> 

	<!-- 게시글 부분 -->
	<div data-aos="fade">
		<h2 class="join-title before-table">자유게시판</h2>
	</div>
	
	<div class="content-container">
		
		<table class="content-list-table" >
			<thead class="table-content">
				<tr class="table-header">
					<th class="cell_padding"><%=community.getCreated_at() %></th>
					<th class="cell_padding"><%=community.getComm_title() %></th>
					<th class="cell_padding"><%=community.getMem_id() %></th>
				</tr>
			</thead>
			<tbody id="list">

			</tbody>
		</table>
	</div>
		<div style="width: 80%; max-width: 800px; display: flex; justify-content: space-between; margin: 0 auto; margin-bottom: 10px; margin-top : -15px">
			<button class="btn" onclick="location.href='CommList.jsp'">목록</button>
				<button id="like-button" style="margin-top: 8px; background: transparent; border: none; cursor: pointer;">
    			❤️ <span id="like-count"><%=community.getComm_likes() %></span>
				</button>
			</div>
				<div class="form-group">
					<div class="main">
						<span>자게는 하루 최대 3번만 쓸수 있습니다.
						<%=community.getComm_content() %>
						</span>
					</div>
				</div>
			<!-- 댓글 부분 -->
			<div class="form-group">
				<form action="" method="post">
					<div class="dat">

					<!-- 댓글 개수 표시 -->
					<div style="display: flex; justify-content: flex-start;">
						<span>댓글수 : 5</span>
					</div>
					<span>댓글 내용 공간</span>
					<div style="display: flex; gap: 10px; align-items: center;">
						<input type="text" name="dat" id="dat" class="join-input-dat"> 
								<input class="join-input-btn-min" type="submit" value="등록" style="margin-bottom:-15px;">
					</div>
					</div>
				</form>
			</div>


	<script>
    $(document).ready(function(){
      $('#lightgallery').lightGallery();
    });
    
    <script>
    function Likes(communityId) {
        // AJAX 요청을 보내서 숫자를 증가시킴
        fetch('increaseLikes', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ id: communityId }),
        })
        .then(response => response.json())
        .then(data => {
            // 성공적으로 처리된 후, 화면에 갱신된 좋아요 수를 표시
            document.getElementById('like-count').textContent = data.likes;
        })
        .catch(error => {
            console.error('Error:', error);
        });
    }
    
  </script>

</body>
</html>