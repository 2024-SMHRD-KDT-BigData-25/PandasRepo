package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandas.model.CommunityDAO;
import com.pandas.model.DiaryDAO;

@WebServlet("/DiaryDelete")
public class DiaryDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int diary_idx = Integer.parseInt(request.getParameter("diary_idx"));
		
		DiaryDAO dao = new DiaryDAO();
		int res = dao.DiaryDelete(diary_idx);
		
		response.sendRedirect("DiaryList.jsp");
	}

}
