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
import com.pandas.model.MemberDAO;
import com.pandas.model.Members;
import com.pandas.model.SchoolDAO;
import com.pandas.model.Schools;

/**
 * Servlet implementation class UpdateMember
 */
@WebServlet("/Update")
public class UpdateMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// MultipartRequest => COS
		Members oldMember = (Members) request.getSession().getAttribute("member");
		ServletContext context = request.getServletContext();
//		String uploadPath = "C:\\Users\\smhrd\\git\\repository\\pandasSpot\\src\\main\\webapp\\uploads";
		String uploadPath = context.getRealPath("uploads");
		int maxSize = 500 * 1024 * 1024; // 5MB

		// (request, 파일 저장 경로, 최대 파일 크기(용량), 인코딩 타입 지정, 파일 이름 생성 규칙)
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8",
				new DefaultFileRenamePolicy());

		// 이미지는 이미 저정이 되어있음
		String img = multi.getFilesystemName("mem_profile_img");
		if (img==null) {
			System.out.println("비었음");
			img = oldMember.getMem_profile_img();
		}

		String mem_id = multi.getParameter("mem_id");
		String mem_pw = multi.getParameter("mem_pw");
		String mem_name = multi.getParameter("mem_name");
		String mem_nick = multi.getParameter("mem_nick");
		String mem_birthdate = multi.getParameter("mem_birthdate").replace("-", "");
		String mem_school = multi.getParameter("mem_school");
		String mem_school_name = mem_school.split("-")[0];
		String mem_school_region = mem_school.split("-")[1];

		Schools m_school = new Schools(mem_school_name, mem_school_region);
		SchoolDAO sdao = new SchoolDAO();
		double mem_school_num = sdao.findSchool(m_school);
		System.out.println(img);
		Members joinMember = new Members(mem_id, mem_pw, mem_name, mem_nick, mem_birthdate, mem_school_num, img);

		MemberDAO dao = new MemberDAO();
		int res = dao.update(joinMember);
		if (res > 0) {
			System.out.println(mem_id + " 수정 완료");
			HttpSession session = request.getSession();
			joinMember.setMem_school_name(mem_school_name);
			session.setAttribute("member", joinMember);
			response.sendRedirect("main.jsp");
		} else {
			System.out.println("수정 실패");
			response.sendRedirect("main.jsp");
		}
	}

}
