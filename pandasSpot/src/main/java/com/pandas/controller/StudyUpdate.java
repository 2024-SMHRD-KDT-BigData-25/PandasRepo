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
import com.pandas.model.Studies;
import com.pandas.model.StudyDAO;

@WebServlet("/StudyUpdate")
public class StudyUpdate extends HttpServlet {
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

		String study_file = multi.getParameter("study_photo");
		
		int study_idx = Integer.parseInt(multi.getParameter("study_idx"));
		String study_content = multi.getParameter("study_content");
		
		System.out.println(study_idx + study_content + study_file);
		Studies updateStudy = new Studies(study_idx, study_content, study_file);
		
		StudyDAO dao = new StudyDAO();
		int res = dao.StudyUpdate(updateStudy);	
		if (res > 0 ) {
			System.out.println("Q & A 게시물 수정 완료!");
			response.sendRedirect("StudyList.jsp");
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
