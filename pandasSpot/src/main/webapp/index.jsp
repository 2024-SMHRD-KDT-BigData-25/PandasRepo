<%@page import="com.pandas.model.Schools"%>
<%@page import="java.util.List"%>
<%@page import="com.pandas.model.SchoolDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<body>
	<%
	SchoolDAO dao = new SchoolDAO();
	List<Schools> list = dao.getList();
	%>
	<%
	for (int i = 0; i < 5; i++) {
	%>
	<h3><%=list.get(i).getSchool_name()%></h3>
	<%
	}
	%>

</body>
</html>
