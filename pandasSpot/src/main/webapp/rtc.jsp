<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
    
<!DOCTYPE html>

<html>

<head>
    <meta charset="utf-8" />
    <title>WebRtc tutorial</title>
</head>

<body>
    <div>
        <video id="localVideo" autoplay width="480px"></video>
        <video id="remoteVideo" width="480px" autoplay></video>
    </div>

    <script src="/socket.io/socket.io.js"></script>
    <script src="https://webrtc.github.io/adapter/adapter-latest.js"></script>
    <script src="${contextPath}/resources/js/rtc.js"></script>
</body>

</html>