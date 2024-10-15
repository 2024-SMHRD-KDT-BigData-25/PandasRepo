package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandas.model.QuestionDAO;
import com.pandas.model.StudyDAO;


@WebServlet("/StudyDelete")
public class StudyDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int study_idx = Integer.parseInt(request.getParameter("study_idx"));
		
		StudyDAO dao = new StudyDAO();
		int res = dao.StudyDelete(study_idx);
		System.out.println("삭제 완료!");
	}

}
