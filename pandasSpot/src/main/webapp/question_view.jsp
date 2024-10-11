<%@page import="com.pandas.model.Questions"%>
<%@page import="com.pandas.model.QuestionDAO"%>
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


</head>
<body>

<%@ include file="header.jsp" %>

	<%
		int idx = Integer.parseInt(request.getParameter("idx"));
		System.out.println("뷰 idx 번호는 " + idx);
		QuestionDAO dao = new QuestionDAO();
	  	Questions question = dao.getQuestion(idx);
	%> 

	<!-- 게시글 부분 -->
	<div class="hidden" id="q_idx"><%=idx%></div>
	<div data-aos="fade">
		<h2 class="join-title before-table">Q & A</h2>
	</div>

	<div class="content-container" data-aos="fade">

		<table class="table-content">
			<thead>
				<tr class="table-header">
					<th class="cell_padding post_th_1"><%=question.getCreated_at()%></th>
					<th class="cell_padding post_th_2"><%=question.getQ_title()%></th>
					<th class="cell_padding post_th_3"><%=question.getMem_id()%></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="post_th_1">
						<button class="btn display_inline" id="to_list_btn">목록</button>
					</td>
					<td class="post_th_2">
							문제집: <%=question.getQ_workbook()%>
					</td>
					<td class="post_th_3">
						<%
						if (member.getMem_id().equals(question.getMem_id())) {
						%>
						<button class="btn display_inline" id="to_update_btn">수정</button>
						<%
						}
						%>
					</td>

				</tr>
				<tr>
					<td colspan="3">
						<div class="post_content display_flex">
							<div class="board_text_content">
								<%=question.getQ_content()%>
							</div>

							<img class="board_img_content" alt="게시물 이미지"
								src="${contextPath}/upload/<%=question.getQ_file() %>">

						</div>
					</td>
				</tr>
				<tr>
					<td colspan="3">
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
										<input class="join-input-btn-min" type="submit" value="등록"
											style="margin-bottom: -15px;">
									</div>
								</div>
							</form>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</div>

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
    
    $("#to_list_btn").on( "click", function( event ) {
		location.href = "${contextPath}/QuestionList.jsp";
	});

    $("#to_update_btn").on( "click", function( event ) {
    	var diary_idx = document.getElementById("q_idx").innerText;
		location.href = "${contextPath}/questionupdate.jsp?idx="+diary_idx;
	});
  </script>

</body>
</html>