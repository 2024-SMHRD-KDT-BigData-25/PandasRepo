package com.pandas.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandas.model.CommunityDAO;

/**
 * Servlet implementation class CommViews
 */
@WebServlet("/CommViews")
public class CommViews extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int commIdx = Integer.parseInt(request.getParameter("comm_idx"));
		String memId = request.getParameter("mem_id");
		
		CommunityDAO dao = new CommunityDAO();
		// 좋아요 수 증가 처리
		int res = dao.updateViews(commIdx).getComm_views();

		// 응답: 성공 상태 반환
		System.out.println(res);
		response.setContentType("text/plain");
		PrintWriter out = response.getWriter();
		out.print(res);
		out.flush();
		
	}

}
