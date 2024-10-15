package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandas.model.QuestionCommentDAO;
import com.pandas.model.QuestionComments;

/**
 * Servlet implementation class QuestionCommentAdd
 */
@WebServlet("/QuestionCommentAdd")
public class QuestionCommentAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		double q_idx = Integer.parseInt(request.getParameter("q_idx"));
		String cmt_content = request.getParameter("cmt_content");
		String mem_id = request.getParameter("mem_id");
		
		QuestionCommentDAO dao = new QuestionCommentDAO();
		int res = dao.insertComment(new QuestionComments(q_idx, cmt_content, mem_id));
		System.out.println("댓글 등록 성공");
	}

}
