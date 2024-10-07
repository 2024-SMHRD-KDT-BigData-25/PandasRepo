package com.pandas.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandas.model.MemberDAO;
import com.pandas.model.Members;

@WebServlet("/FindMemberById")
public class FindMemberById extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		System.out.println("FindMemberById 호출");
		
		String id = request.getParameter("mem_id");
		MemberDAO dao = new MemberDAO();
		Members res = dao.findMemberById(id);
		//JavaObject => JSON Object(json 형식의 객체 구조) -> GSON

		response.setCharacterEncoding("UTF-8");		// 
		response.setContentType("application/json; charset=UTF-8");			// 응답하는 content의 타입 지정해서 브라우저에 알려주는 방식
		//텍스트를 출력(out/Server -> Client) 해줄 수 있는 스트링 -> PrintWriter
		PrintWriter out = response.getWriter();
		if (res == null) {			
			out.print("True");
		}
		else {
			out.print("False");
		}
		out.flush();
	}

}
