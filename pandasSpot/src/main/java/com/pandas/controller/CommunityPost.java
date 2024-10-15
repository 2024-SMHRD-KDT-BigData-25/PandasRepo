package com.pandas.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pandas.model.Communities;
import com.pandas.model.CommunityDAO;
import com.pandas.model.Members;


@WebServlet("/CommunityPost")
public class CommunityPost extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uploadPath = "C:\\Users\\smhrd\\git\\repository\\pandasSpot\\src\\main\\webapp\\uploads";
		int maxSize = 500 * 1024 * 1024; // 5MB
		
		HttpSession session = request.getSession();
		Members member = (Members)session.getAttribute("member");
		String mem_id = member.getMem_id();
		
		// (request, 파일 저장 경로, 최대 파일 크기(용량), 인코딩 타입 지정, 파일 이름 생성 규칙)
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

		String comm_file = multi.getFile("comm_file").getName();

		String comm_title = multi.getParameter("comm_title");
		String comm_content = multi.getParameter("comm_content");
	
		System.out.println(comm_title + comm_content + comm_file + mem_id);
		Communities postComm = new Communities(comm_title, comm_content, comm_file, mem_id);
		
		CommunityDAO dao = new CommunityDAO();
		int res = dao.CommunityPost(postComm);
		
		if (res > 0) {
			System.out.println("자유게시판 게시물 등록!");
			response.sendRedirect("CommList.jsp");
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
