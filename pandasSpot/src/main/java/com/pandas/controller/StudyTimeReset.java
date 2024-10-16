package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandas.model.StudyTimeDAO;
import com.pandas.model.StudyTimes;

/**
 * Servlet implementation class StudyTimeReset
 */
@WebServlet("/StudyTimeReset")
public class StudyTimeReset extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String mem_id = request.getParameter("mem_id");
		
		StudyTimeDAO dao = new StudyTimeDAO();
		dao.update(new StudyTimes(mem_id));
	}

}
