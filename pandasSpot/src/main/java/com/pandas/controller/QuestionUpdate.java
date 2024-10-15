package com.pandas.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pandas.model.Members;
import com.pandas.model.QuestionDAO;
import com.pandas.model.Questions;

@WebServlet("/QuestionUpdate")
public class QuestionUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("upload");
		int maxSize = 500 * 1024 * 1024; // 5MB
		
		HttpSession session = request.getSession();
		Members member = (Members)session.getAttribute("member");
		String mem_id = member.getMem_id();
		
		// (request, 파일 저장 경로, 최대 파일 크기(용량), 인코딩 타입 지정, 파일 이름 생성 규칙)
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

		String q_file = multi.getParameter("q_file");
		
		int q_idx = Integer.parseInt(request.getParameter("q_idx"));
		String q_title = multi.getParameter("q_title");
		String q_content = multi.getParameter("q_content");
		String q_workbook = multi.getParameter("q_workbook");
		
		Questions postQues = new Questions(q_idx, q_title, q_content, q_file, q_workbook);
		
		QuestionDAO dao = new QuestionDAO();
		int res = dao.QuestionUpdate(postQues);
		
		if (res > 0) {
			System.out.println("Q & A 게시물 수정 완료!");
			response.sendRedirect("QuestionList.jsp");
		}
		else {
			response.setContentType("text/html;charset=UTF-8");
            response.getWriter().println("<html><head><title>게시물 수정 실패</title>");
            response.getWriter().println("<script type='text/javascript'>");
            response.getWriter().println("alert('입력하지 않은 사항이 있습니다!');"); // 팝업창
            response.getWriter().println("window.history.back();"); // 이전 페이지로 돌아가기
            response.getWriter().println("</script></head><body></body></html>");
		}
	}

}
