package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandas.model.CommCommentDAO;import com.pandas.model.CommComments;

/**
 * Servlet implementation class CommCommentAdd
 */
@WebServlet("/CommCommentAdd")
public class CommCommentAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		int comm_idx = Integer.parseInt(request.getParameter("comm_idx"));
		String cmt_content = request.getParameter("cmt_content");
		String mem_id = request.getParameter("mem_id");
		
		CommCommentDAO dao = new CommCommentDAO();
		int res = dao.insertComment(new CommComments(comm_idx, cmt_content, mem_id));
		System.out.println("댓글 등록 성공");
	}
	

}
