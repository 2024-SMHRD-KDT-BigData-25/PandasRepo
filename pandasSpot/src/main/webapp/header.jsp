<%@page import="com.pandas.model.Members"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>

<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/eyStyle.css">
<header role="banner">
	<% 
		Members member = (Members)session.getAttribute("member");  
		String homeHref = "";
		if (member == null) {
			homeHref = "Login.jsp";
		}
		else {
			homeHref = "main.jsp";
		}
	%>
	<div class="header-container header-title-cotainer">
		<a class="header-title" href="<%= homeHref%>">SPOT</a>
	</div>
	<div class="header-container">
		<ul class="nav-ul">
		<% if (member == null) {%>
			<li><a class="nav-li-a" href="Login.jsp">Login</a></li>
			<li><a class="nav-li-a" href="join.jsp">Join</a></li>
		<% } else { %>
			<li><a class="nav-li-a" href="LogoutController">Logout</a></li>
		<% } %>		
			<li><a class="nav-li-a" href="record_view2.jsp">공부 기록</a></li>
			<li><a class="nav-li-a" href="DiaryList.jsp">Study Log</a></li>
			<li><a class="nav-li-a" href="CommList.jsp">자유게시판</a></li>
			<li><a class="nav-li-a" href="QuestionList.jsp">Q&A 게시판</a></li>
		</ul>
	</div>
</header>


