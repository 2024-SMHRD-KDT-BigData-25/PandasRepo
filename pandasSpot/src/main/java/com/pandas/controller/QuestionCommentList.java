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
import com.pandas.model.QuestionCommentDAO;
import com.pandas.model.QuestionComments;


/**
 * Servlet implementation class QuestionCommentList
 */
@WebServlet("/QuestionCommentList")
public class QuestionCommentList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		QuestionCommentDAO dao = new QuestionCommentDAO();
		int q_idx  = Integer.parseInt(request.getParameter("q_idx"));
		List<QuestionComments> list = dao.getCommentList(q_idx);
		//JavaObject => JSONObject(json 형식의 객체구조) => GSON
		Gson gson = new Gson();
		String json = gson.toJson(list);
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.print(json);
	}

}
