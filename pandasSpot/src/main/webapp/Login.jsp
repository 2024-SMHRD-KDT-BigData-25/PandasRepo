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
	<div class="content-container" data-aos="fade">
		<form action="${contextPath }/Login" id="loginForm" method="post">
			<table>
				<tr>
					<td colspan="2">
						<h2 class="join-title">Login</h2>
					</td>
				</tr>
				<!-- login : 은유 -->
				<tr>
					<td colspan="2"><input type="text" id="login_id" name="mem_id"
						class="join-input" placeholder="아이디를 입력하세요" /></td>
				</tr>
				<tr>
					<td colspan="2"><input type="password" id="login_pw"
						name="mem_pw" class="join-input" placeholder="비밀번호를 입력하세요" oninput="changeFontFamily()" /></td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="message" id="login_message"></div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<div class="login_join_message">
							<h4>
								가입이 필요하신가요? <a class="" href="join.jsp">SPOT 가입하기</a>
							</h4>
						</div>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<button type="button" id="loginSubmitBtn" class="loginBtn">Login</button>
					</td>
				</tr>
			</table>
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
	<script type="text/javascript">
		var errorMsg = "${errorMsg }",
			state = "${state }";
		
		if( errorMsg != "" ) {
			alert( errorMsg );  
		}
		
		function changeFontFamily() {
			const password = document.getElementById("mem_pw");
			password.style.fontFamily = "arial";

			if (password.value == "") {
				password.style.fontFamily = "교육새음";
			}
		}
		
		$("#loginSubmitBtn").on( "click", function( event ) {
			loginCheck();
		});
		
		
		function loginCheck() {
			var text = "", state = 0;

			if ($("#login_id").val() == "") {
				text = "아이디를 입력해주세요!";
			} else if ($("#login_pw").val() == "") {
				text = "비밀번호를 입력해주세요!";
			} else {
				state = 1;
			}

			if (state == 1) {
				$("#loginForm").submit();
			} else {
				var $target = $("#login_message");

				$target.css("display", "block");
				$target.css("color", "red");
				$target.css("margin-top", "10px");
				$target.text(text);
				return false;
			}
			
		}
		
		
	</script>

</body>
</html>