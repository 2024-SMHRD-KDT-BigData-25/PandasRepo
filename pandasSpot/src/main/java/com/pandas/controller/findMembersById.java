package com.pandas.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pandas.model.MemberDAO;
import com.pandas.model.Members;
import com.pandas.model.SchoolDAO;

/**
 * Servlet implementation class findMembersById
 */
@WebServlet("/findMembersById")
public class findMembersById extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		MemberDAO dao = new MemberDAO();
		String mem_id = request.getParameter("mem_id");
		SchoolDAO sDAO = new SchoolDAO();
		List<Members> list = dao.findMembersById(mem_id);
		//JavaObject => JSONObject(json 형식의 객체구조) => GSON
		for (Members m : list) {
			System.out.println(m.getMem_id());
			m.setMem_school_name(sDAO.findSchoolName(m.getMem_school()));
		}
		
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		response.setCharacterEncoding("UTF-8");
		//response.setContentType("text/html; charset=UTF-8");
		//텍스트 출력(out /Server -> Client) 스트림 => PrintWriter
		
		PrintWriter out = response.getWriter();
		out.print(json);
	}

}
