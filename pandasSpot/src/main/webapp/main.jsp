<%@page import="com.pandas.model.StudyTimeDAO"%>
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
</head>
<body>
	<jsp:include page="header.jsp" />
	<%
	Members member = (Members) session.getAttribute("member");
	String temp = member.getMem_birthdate();
	String birth = temp.substring(0, 4) + "-" + temp.substring(4, 6) + "-" + temp.substring(6);
	StudyTimeDAO sDao = new StudyTimeDAO();
	String mem_id = member.getMem_id();
	String stime = sDao.getStudyTime(mem_id);
	%>
	<div class="pages_info" id="main_mem_id"><%= mem_id %></div>
	<div class="content-container" data-aos="fade">

		<table class="info_table">
			<tr>
				<th colspan="5">
					<h2 id="main_member_nick" class="join-title"><%=member.getMem_nick()%></h2>
					<button id="info_edit_btn" class="img-button">
					<i class="fa-solid fa-pen info_edit_btn"></i>
				</button>
				</th>
			</tr>
			<tr>
				<td rowspan='2' class="member_info_td_1">
					<div class="cropping">
						<img id="profile_img" alt="프로필 사진"
							src="${contextPath}/uploads/<%= member.getMem_profile_img()%>">
					</div>
				</td>

				<td rowspan='2' class="member_info_td_1">
					<table>
						<tr>
							<td class="main_info_td">
								<p class="main_info">
									<i class="fa-solid fa-tag info_icon"></i><span><%=member.getMem_name()%></span>
								</p>

							</td>
						</tr>
						<tr>
							<td class="main_info_td">
								<p class="main_info">
								<i class="fa-solid fa-school-flag info_icon"></i><span><%=member.getMem_school_name()%></span>
								</p>
							</td>
						</tr>
						<tr>
							<td class="main_info_td">
								<p class="main_info">
									<i class="fa-solid fa-cake-candles info_icon"></i><span><%=birth%></span>
								</p>
							</td>
						</tr>
					</table>
				</td>

				<td class="member_info_td_1">팔로워</td>

				<td class="member_info_td_1">팔로잉</td>

				<td class="member_info_td_1">오늘 공부 시간</td>
			</tr>
			<tr>

				<td class="member_info_td_1" id="follower_cnt">팔로워</td>

				<td class="member_info_td_1" id="following_cnt">팔로잉</td>

				<td class="member_info_td_1" id="study_time_cnt"><%= stime %></td>
			</tr>

			<tr>
				<td colspan="5" class="follow_td">
					<table class="follow_table">
						<tr>
							<td class="info_td_title">팔로우 목록</td>
							<td class="info_td_title">팔로워 목록</td>
						</tr>
						<tr>
							<td class="info_content_single">
								<div class="follow_info" id="following">
									<div id="following_list">팔로우 목록이 없습니다.</div>
								</div>
							</td>
							<td class="info_content_single">
								<div class="follow_info" id="follower">
									<div id="following_list">팔로워 목록이 없습니다.</div>
								</div>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td colspan="5" class="follow_td">
					<table class="follow_table">
						<tr>
							<td class="info_td_title">일정 관리</td>
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
	<script src='https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js'></script>

	<script>
		$("#info_edit_btn").on("click", function(event) {
			location.href = "${contextPath}/infoUpdate.jsp";
		})
		var mem_id = document.getElementById("main_mem_id").innerText;
		$(document).ready(function() {

			$.ajax({
				url : "MemberListLoad", //요청경로
				type : "post", //요청방식(http 요청 메서드)
				data : {
					"mem_id" : mem_id
				},
				success : function(response) {
					// response는 JSON 형식의 응답
					const diaries = response.diaries; // 다이어리 목록
					const followers = response.followers; // 팔로워 목록
					const followings = response.followings; // 팔로위 목록

					printPostList(diaries);
					printFollowerList(followers);
					printFollowingList(followings);
				},
				error : function() {
					alert("통신 실패!")
				}
			})
		})

		function printList(data) {
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
			
			$('#follower_cnt').text(dlength);
			var len = data.length >= 5 ? 5 : data.length;
			for (var i = 0; i < len; i++) {

				html += "<div>"
				html += "<div class='my_post_list my_post_title'><a class='table_a_tags' href='memberMain.jsp?mem_id="
						+ data[i]
						+ "'>"
						+ data[i]
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
		function printFollowingList(data) {
			var html = "", //id=>list 곳에 추가가 될 html 코드
			dlength = data.length;
			$('#following_cnt').text(dlength);
			var len = data.length >= 5 ? 5 : data.length;
			for (var i = 0; i < len; i++) {

				html += "<div>"
				html += "<div class='my_post_list my_post_title'><a class='table_a_tags' href='memberMain.jsp?mem_id="
						+ data[i]
						+ "'>"
						+ data[i]
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
		
	      document.addEventListener('DOMContentLoaded', function() {
	          var calendarEl = document.getElementById('calendar');
	          var calendar = new FullCalendar.Calendar(calendarEl, {
	            initialView: 'dayGridMonth'
	          });
	          calendar.render();
	        });

	</script>

</body>
</html>