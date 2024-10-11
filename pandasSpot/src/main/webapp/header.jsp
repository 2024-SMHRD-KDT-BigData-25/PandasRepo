<%@page import="com.pandas.model.Members"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<head>
<link rel="stylesheet" href="${contextPath}/resources/css/nyStyle.css">
<link rel="stylesheet" href="${contextPath}/resources/css/aos.css">
<link rel="stylesheet" href="${contextPath}/resources/css/ecStyle.css">
<link rel="stylesheet" href="${contextPath}/resources/css/eyStyle.css">
<link rel="stylesheet" href="${contextPath}/resources/css/nyStyle.css">
<link rel="stylesheet" href="${contextPath}/resources/css/jwStyle.css">
</head>
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
			<li><a class="nav-li-a" href="RecordList.jsp">공부 기록</a></li>
			<li><a class="nav-li-a" href="DiaryList.jsp">Study Log</a></li>
			<li><a class="nav-li-a" href="CommList.jsp">자유게시판</a></li>
			<li><a class="nav-li-a" href="QuestionList.jsp">Q&A 게시판</a></li>
		</ul>
	</div>
</header>


