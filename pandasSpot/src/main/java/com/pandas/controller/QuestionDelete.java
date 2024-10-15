package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandas.model.DiaryDAO;
import com.pandas.model.QuestionDAO;

@WebServlet("/QuestionDelete")
public class QuestionDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int q_idx = Integer.parseInt(request.getParameter("q_idx"));
		
		QuestionDAO dao = new QuestionDAO();
		int res = dao.QuestionDelete(q_idx);	
	}

}
