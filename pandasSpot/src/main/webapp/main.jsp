<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Study SPOT</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="css/aos.css">
<link rel="stylesheet" href="css/eyStyle.css">

</head>
<body>
	<%@ include file="header.jsp"%>

	<section id="main_my_info">
		<div>
		<img alt="프로필 사진" src="<%= member.getMem_profile_img()%>">
		</div>
	</section>
	<section>
		<div>일정</div>
	</section>
	<section>
		<div>채팅</div>
	</section>
</body>
</html>

