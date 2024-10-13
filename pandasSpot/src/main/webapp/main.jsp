<%@page import="com.pandas.model.Members"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<title>Study SPOT</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<style type="text/css">
.my_name_container {
	display: block;
}

.my_info_container {
	display: block;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
	Members member = (Members) session.getAttribute("member");
	String temp = member.getMem_birthdate();
	String birth = temp.substring(0, 4) + "-" + temp.substring(4, 6) + "-" + temp.substring(6);
	%>
	<div class="pages_info" id="main_mem_id"><%= member.getMem_id() %></div>
	<div class="content-container" data-aos="fade">
		
			<table class="info_table">
				<tr>
					<th colspan="4">
						<h2 class="join-title"><span id="member_nick"><%=member.getMem_nick()%></span>'s Page
						<button id="info_edit_btn" class="img-button">
						<img src="${contextPath}/resources/icon/edit.png"
							alt="Image Button">
					</button>
						</h2>
						
					</th>
				</tr>
				<tr>
				<td class="info_content_single">
					<div class="cropping">
						<img id="profile_img" alt="프로필 사진"
							src="${contextPath}/upload/<%= member.getMem_profile_img()%>">
					</div>
				</td>

				<td class="info_content_single">
					<p class="main_info"><img class="info_icon" src="${contextPath}/resources/icon/tag.png" /><span><%=member.getMem_name()%></span></p>
					<p class="main_info"><img class="info_icon" src="${contextPath}/resources/icon/campus.png" /><span><%=member.getMem_school_name()%></span></p>
					<p class="main_info"><img class="info_icon" src="${contextPath}/resources/icon/cake.png" /><span><%=birth%></span></p>
				</td>
				<td class="function_td">
					
				</td>
				<td class="function_td">
					
				</td>
			</tr>
				<tr>
					<td colspan="4" class="follow_td">
					<table class="follow_table">
						<tr>
							<td class="info_td_title">팔로우 목록
							</td>
							<td class="info_td_title">팔로워 목록
							</td>
						</tr>
						<tr>
							<td class="info_content_single">
								<div class="follow_info" id="following">
									<div id="following_list">
										팔로우 목록이 없습니다.
									</div>
								</div>
							</td>
							<td class="info_content_single">
								<div class="follow_info" id="follower">
									<div id="following_list">
										팔로워 목록이 없습니다.
									</div>
								</div>
							</td>
						</tr>
					</table>
					</td>
				</tr>
				<tr>
					<td colspan="4" class="follow_td">
					<table class="follow_table">
						<tr>
							<td class="info_td_title">일정 관리
							</td>
							<td class="info_td_title">Study Log
							<button id="more_post">&plus;</button>
							</td>
						</tr>
						<tr>
							<td class="info_content_single">
								<div class="follow_info" id="calendar"></div>
							</td>
							<td class="info_content_single">
								<div class="follow_info" id="mypost"></div>
							</td>
						</tr>
					</table>
					</td>
				</tr>
		</table>
		

	</div>
	
	<script>
	$("#info_edit_btn").on("click", function(event) {
		location.href = "${contextPath}/infoUpdate.jsp";
	})
	var mem_id = document.getElementById("main_mem_id").innerText;
	$(document).ready(function(){

		$.ajax({
			url : "MemberListLoad", //요청경로
			type : "post", //요청방식(http 요청 메서드)
			data : {"mem_id" : mem_id},
		    success: function(response) {
		    	console.log(response);
		        // response는 JSON 형식의 응답
		        const diaries = response.diaries;       // 다이어리 목록
		        const followers = response.followers;   // 팔로워 목록
		        const followees = response.followees;   // 팔로위 목록

		        printPostList(diaries);
		        printFollowerList(followers);
		        printFolloweeList(followees);
		    },
			error : function(){
				alert("통신 실패!")
			}
    	})
	})
	
	function printList(data){
/* 		var data = JSON.parse(data),
			html = "", //id=>list 곳에 추가가 될 html 코드
			dlength = data.length; */
		console.log(data);
	}
	
	
		function printPostList(data) {
			var html = "", //id=>list 곳에 추가가 될 html 코드
			dlength = data.length;
			var len = data.length >= 5 ? 5 : data.length;
			for (var i = 0; i < len; i++) {
				var date = data[i].created_at.substr(2, 8);
				html += "<div>"
				html += "<div class='my_post_list'>" + (i + 1) + "</div>"
				html += "<div class='my_post_list my_post_title'><a class='table_a_tags' href='study_view.jsp?idx="
						+ data[i].diary_idx
						+ "'>"
						+ data[i].diary_title
						+ "</a></div>"
				html += "<div class='my_post_list'>" + date + "</div>"
				//html += "<td><button class='btn btn-primary py-2 px-4 text-white' onclick='deleteBoard("+board.diary_idx+")'>삭제</button></td>"
				html += "</div>"
			}
			//html() : 특정 태그 사이에 html 코드를 바꾸고 싶을때
			//text() : text바꾸고 싶을때
			//append() : 특정 태그 사이에 값을 추가 (뒤쪽에) => 누적
			//prepend() : 앞쪽에 추가 => 누적
			$("#mypost").html(html)
		}
		function printFollowerList(data) {
			var html = "", //id=>list 곳에 추가가 될 html 코드
			dlength = data.length;
			var len = data.length >= 5 ? 5 : data.length;
			for (var i = 0; i < len; i++) {

				html += "<div>"
				html += "<div class='my_post_list my_post_title'><a class='table_a_tags' href='memberPage.jsp?mem_id="
						+ data[i].follower_id
						+ "'>"
						+ data[i].follower_id
						+ "</a></div>"
				//html += "<td><button class='btn btn-primary py-2 px-4 text-white' onclick='deleteBoard("+board.diary_idx+")'>삭제</button></td>"
				html += "</div>"
			}
			//html() : 특정 태그 사이에 html 코드를 바꾸고 싶을때
			//text() : text바꾸고 싶을때
			//append() : 특정 태그 사이에 값을 추가 (뒤쪽에) => 누적
			//prepend() : 앞쪽에 추가 => 누적
			$("#following").html(html)
		}
		function printFolloweeList(data) {
			var html = "", //id=>list 곳에 추가가 될 html 코드
			dlength = data.length;
			var len = data.length >= 5 ? 5 : data.length;
			for (var i = 0; i < len; i++) {

				html += "<div>"
				html += "<div class='my_post_list my_post_title'><a class='table_a_tags' href='memberPage.jsp?mem_id="
						+ data[i].followee_id
						+ "'>"
						+ data[i].followee_id
						+ "</a></div>"
				//html += "<td><button class='btn btn-primary py-2 px-4 text-white' onclick='deleteBoard("+board.diary_idx+")'>삭제</button></td>"
				html += "</div>"
			}
			//html() : 특정 태그 사이에 html 코드를 바꾸고 싶을때
			//text() : text바꾸고 싶을때
			//append() : 특정 태그 사이에 값을 추가 (뒤쪽에) => 누적
			//prepend() : 앞쪽에 추가 => 누적
			$("#follower").html(html)
		}
	</script>

</body>
</html>