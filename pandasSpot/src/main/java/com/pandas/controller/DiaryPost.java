package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandas.model.Diaries;
import com.pandas.model.DiaryDAO;
import com.pandas.model.QuestionDAO;
import com.pandas.model.Questions;

@WebServlet("/DiaryPost")
public class DiaryPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String q_title = request.getParameter("diary_title");
		String q_content = request.getParameter("diary_content");
		String mem_id = request.getParameter("mem_id");
		
		Diaries postDiary = new Diaries(q_title, q_content, mem_id);
		
		DiaryDAO dao = new DiaryDAO();
		int res = dao.DiaryPost(postDiary);
		
		if (res != 1) {
			System.out.println("Study Log 게시물 등록!");
			HttpSession session = request.getSession();
			session.setAttribute("postComm", res);
			response.sendRedirect("DiaryList.jsp");
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<html><head><title>게시물 등록 실패</title>");
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('입력하지 않은 사항이 있습니다!');"); // 팝업창
            response.getWriter().println("window.history.back();"); // 이전 페이지로 돌아가기
            response.getWriter().println("</script></head><body></body></html>");
		}
	}

}
