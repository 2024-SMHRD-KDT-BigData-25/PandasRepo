package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandas.model.MemberDAO;
import com.pandas.model.Members;
import com.pandas.model.SchoolDAO;

/**
 * Servlet implementation class LoginMember
 */
@WebServlet("/Login")
public class LoginMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		
		Members loginMember = new Members(mem_id, mem_pw);
		
		MemberDAO dao = new MemberDAO();
		Members res = dao.login(loginMember);
		if (res != null) {
			SchoolDAO sDao = new SchoolDAO();
			res.setMem_school_name(sDao.findSchoolName(res.getMem_school()));
			System.out.println("로그인 성공!");
			HttpSession session = request.getSession();
			session.setAttribute("member", res);
			response.sendRedirect("main.jsp");
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<html><head><title>로그인 실패</title>");
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('아이디 비밀번호를 확인해주세요!');"); // 팝업창
            response.getWriter().println("window.history.back();"); // 이전 페이지로 돌아가기
            response.getWriter().println("</script></head><body></body></html>");
		}
	}

}
