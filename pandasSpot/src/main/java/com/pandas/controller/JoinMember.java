package com.pandas.controller;

import java.io.IOException;
import java.lang.reflect.Member;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandas.model.MemberDAO;
import com.pandas.model.Members;


@WebServlet("/Join")
public class JoinMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String mem_nick = request.getParameter("mem_nick");
		String mem_birthdate = request.getParameter("mem_birthdate").replace("-", "");
		double mem_school = Double.parseDouble(request.getParameter("mem_school"));
		String mem_profile_img = request.getParameter("mem_profile_img");
		
		System.out.println(mem_birthdate);
		Members joinMember = new Members(mem_id, mem_pw, mem_nick, mem_nick, mem_birthdate, mem_school, mem_profile_img);
		
		MemberDAO dao = new MemberDAO();
		int res = dao.join(joinMember);
		System.out.println(res);
	
	}

}
