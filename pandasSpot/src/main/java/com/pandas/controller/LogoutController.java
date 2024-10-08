package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/LogoutController")
public class LogoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// HttpSession에 저장되어있는 member값 삭제 or 전체 삭제
		HttpSession session = request.getSession();
		session.removeAttribute("member");
//		session.invalidate(); 모두 삭제
		response.sendRedirect("Login.jsp");
	}

}
