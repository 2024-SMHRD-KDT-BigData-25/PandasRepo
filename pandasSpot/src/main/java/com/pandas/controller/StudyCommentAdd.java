package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandas.model.StudyComments;
import com.pandas.model.StudyCommentsDAO;


/**
 * Servlet implementation class StudyCommentAdd
 */
@WebServlet("/StudyCommentAdd")
public class StudyCommentAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		double study_idx = Integer.parseInt(request.getParameter("study_idx"));
		String cmt_content = request.getParameter("cmt_content");
		String mem_id = request.getParameter("mem_id");
		
		StudyCommentsDAO dao = new StudyCommentsDAO();
		int res = dao.insertComment(new StudyComments(study_idx, cmt_content, mem_id));
		System.out.println("댓글 등록 성공");
	}

}
