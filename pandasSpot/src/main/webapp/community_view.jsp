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
		int idx = Integer.parseInt(request.getParameter("idx"));
	 	System.out.println("뷰 idx 번호는 " + idx);
		CommunityDAO dao = new CommunityDAO();
	  	Communities community = dao.getCommunities(idx);
	%> 

	<!-- 게시글 부분 -->
	<div class="hidden" id="comm_idx"><%= idx %></div>
	<div class="hidden" id="login_member_id"><%= member.getMem_id() %></div>
	
	<div data-aos="fade">
		<h2 class="join-title before-table">자유게시판</h2>
	</div>
	
	<div class="content-container">
		<div class="board_container">
		<table class="content-list-table">
			<thead class="table-content">
				<tr class="table-header">
					<th class="cell_padding post_th_1" style="white-space: nowrap; width: 20%;"><%=community.getCreated_at() %></th>
					<th class="cell_padding post_th_2" style="width: 60%; text-align: center;"><%=community.getComm_title() %></th>
					<th class="cell_padding post_th_3" style="width: 20%; text-align: center;"><%=community.getMem_id() %></th>
				</tr>
			</table>
		</div>
	</div>
	<div class="content-container">
		<div class="board_container">
			<table class="content-list-table">
				<tr>
					<td class="post_th_1">
					<table>
					<tr>
					<td>
					<button class="jwbutton" id="to_list_btn">목록</button>
					</td>
					<%if (member.getMem_id().equals(community.getMem_id()) || member.getMem_id().equals("admin")) {%>
					<td>
					<button class="jwbutton" id="to_update_btn">수정</button>
					</td>
					<td>
					<button class="jwbutton" id="to_delete_btn">삭제</button>
					</td>
					<% } %>
					</tr>
					</table>
					
					</td>
					<td class="post_th_2">
					<button id="like-button" style=" background: transparent; border: none; cursor: pointer;">
    				❤️ <span id="like-count" class="like" ><%=community.getComm_likes() %>
    				</span></button>
    				<i class="fa-solid fa-eye view_icons"></i>
    				<span id="view-count" class="like" ></span>
    				</td>
    				
    			</tr>
   			 </table>
   		</div>
   	</div>
			
				<div class="form-group">
					<div class="main">
						<span>
						<%=community.getComm_content() %>
						</span>
					<div><img class="board_img_content" alt="게시물 이미지"
								src="${contextPath}/uploads/<%=community.getComm_file() %>">
					</div>
					</div>
				</div>
			<!-- 댓글 부분 -->
			<div class="form-group">
				<form method="post">
					<div class="dat" >

					<!-- 댓글 개수 표시 -->
					<div style="display: flex; justify-content: flex-start;">
						<span>댓글수 :<span id="comm_cnt"></span></span>
					</div>
					<table id="dat_content"></table>
					<div style="display: flex; gap: 10px; align-items: center;">
						<input type="text" name="dat" id="dat" class="join-input-dat"> 
						<input id="comment_add" class="join-input-btn-min" type="button" value="등록" style="margin-bottom:-15px;">
					</div>
					</div>
				</form>
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
    var login_member_id = $("#login_member_id").text();
    var c_idx = document.getElementById("comm_idx").innerText;

    // 문서가 준비되면 실행
    $(document).ready(function () {
    	getCommentList();
    	 $.ajax({
             url: "CommViews", // 요청 경로
             type: "post", // 요청 방식
             data: { "comm_idx": c_idx },
             success: setViews,
             error: function () {
                 alert("통신 실패!");
             }
         });
    });
    
    function setViews(data) {
    	console.log(data);
    	$("#view-count").text(data);
    }
        // 댓글 리스트 가져오기
 
       function getCommentList() {
            $.ajax({
                url: "CommCommentLIst", // 요청 경로
                type: "post", // 요청 방식
                data: { "comm_idx": c_idx },
                success: printComments,
                error: function () {
                    alert("통신 실패!");
                }
            });
        }; 
        
        // 좋아요 버튼 클릭 이벤트
        $("#like-button").on("click", function () {
            updateLikes(c_idx);
        });

        // 댓글 추가 버튼 클릭 이벤트
        $("#comment_add").on("click", function () {
            var cmt_content = $("#dat").val(); // 'val()' 메서드 사용
            $.ajax({
                url: "CommCommentAdd", // 요청 경로
                type: "post", // 요청 방식
                data: {
                    "comm_idx": c_idx,
                    "cmt_content": cmt_content,
                    "mem_id": login_member_id
                },
                success: getCommentList,
                error: function () {
                    alert("통신 실패!");
                }
            });
        });


        // 목록으로 돌아가기 버튼
        $("#to_list_btn").on("click", function (event) {
            location.href = "${contextPath}/CommList.jsp";
        });

        // 게시글 수정 버튼
        $("#to_update_btn").on("click", function (event) {
            location.href = "${contextPath}/communityupdate.jsp?idx=" + c_idx;7
        });


    // 댓글 리스트 출력 함수
    function printComments(data) {
        var data = JSON.parse(data),
            html = "",
            dlength = data.length;

        $("#comm_cnt").text(dlength);

        for (var comment of data) {
            html += "<tr class='board_comment'>";
            html += "<td class='comment_writer'><a>" + comment.mem_id + "</a></td>";
            html += "<td class='comment_content'>" + comment.cmt_content + "</td>";
            html += "<td class='comment_date'>" + comment.created_at.substr(2,9) + "</td>";
            html += "</tr>";
        }

        $("#dat_content").html(html);
    }
    
    $("#to_delete_btn").on("click", function() {
    	$.ajax({
			url : "CommunityDelete", //요청경로
			type : "get", //요청방식(http 요청 메서드)
			data : {"comm_idx" : c_idx},
			success : function(){
				location.href = "${contextPath}/CommList.jsp";
			},
			error : function(){
				alert("통신 실패!")
			}
			
		})
    });

    // 좋아요 업데이트 함수
    function updateLikes(data) {
        $.ajax({
            url: "CommLikes", // 요청 경로
            type: "get", // 요청 방식
            data: { "comm_idx": data },
            success: changeLikes,
            error: function () {
                alert("통신 실패!");
            }
        });
    }

    // 좋아요 수 변경 함수
    function changeLikes(data) {
        var likes = document.getElementById("like-count");
        likes.innerText = data;
    }
</script>


</body>
</html>