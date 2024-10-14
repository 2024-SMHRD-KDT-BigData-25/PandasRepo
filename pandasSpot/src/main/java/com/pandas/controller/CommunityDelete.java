package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandas.model.CommunityDAO;

@WebServlet("/CommunityDelete")
public class CommunityDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		int comm_idx = Integer.parseInt(request.getParameter("comm_idx"));
		
		CommunityDAO dao = new CommunityDAO();
		int res = dao.CommunityDelete(comm_idx);
		
		response.sendRedirect("CommList.jsp");
	}

}
