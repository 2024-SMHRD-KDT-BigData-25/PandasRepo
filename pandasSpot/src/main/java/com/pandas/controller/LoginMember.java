package com.pandas.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandas.model.MemberDAO;
import com.pandas.model.Members;
import com.pandas.model.SchoolDAO;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 * Servlet implementation class LoginMember
 */
@WebServlet("/Login")
public class LoginMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String errorMsg = "";
		int successState = 0;
		if( mem_id != null && mem_pw != null ) {
			Members loginMember = new Members(mem_id, mem_pw);
			
			MemberDAO dao = new MemberDAO();
			Members res = dao.login(loginMember);
			
			if (res != null) {
				SchoolDAO sDao = new SchoolDAO();
				res.setMem_school_name(sDao.findSchoolName(res.getMem_school()));
				HttpSession session = request.getSession();
				session.setAttribute("member", res);
				response.sendRedirect("main.jsp");
			} else {
				errorMsg = "아이디 비밀번호를 확인해주세요!";
				
				request.setAttribute("errorMsg", errorMsg );
				request.setAttribute("state", successState );
				
				
				RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
		    	rd.forward(request, response);
			}
		}
	}
	
//	public ModelAndView login(HttpServletRequest request, HttpServletResponse response) 
//			throws ServletException, IOException {
//		
//		ModelAndView mav = new ModelAndView("Login");
//		
//		
//		request.setCharacterEncoding("UTF-8");
//		String mem_id = request.getParameter("mem_id");
//		String mem_pw = request.getParameter("mem_pw");
//		
//		Members loginMember = new Members(mem_id, mem_pw);
//		
//		MemberDAO dao = new MemberDAO();
//		Members res = dao.login(loginMember);
//		String errorMsg = "";
//		int successState = 0;
//		if (res != null) {
//			SchoolDAO sDao = new SchoolDAO();
//			res.setMem_school_name(sDao.findSchoolName(res.getMem_school()));
//			HttpSession session = request.getSession();
//			mav.addObject("member", res);
//			successState = 1;
//		}
//		else {
//			errorMsg = "아이디 비밀번호를 확인해주세요!";
//		}
//		mav.addObject("member", res);
//		mav.addObject("errorMsg", errorMsg );
//		mav.addObject("state", successState );
//		return mav;
//	}

}
