package com.pandas.controller;

import java.io.IOException;
import java.lang.reflect.Member;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pandas.model.MemberDAO;
import com.pandas.model.SchoolDAO;
import com.pandas.model.Members;
import com.pandas.model.Schools;

@WebServlet("/Join")
public class JoinMember extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// MultipartRequest => COS
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("upload");
		int maxSize = 500 * 1024 * 1024; // 5MB

		// (request, 파일 저장 경로, 최대 파일 크기(용량), 인코딩 타입 지정, 파일 이름 생성 규칙)
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

		// 이미지는 이미 저정이 되어있음
		String img = multi.getFilesystemName("mem_profile_img");

		String mem_id = multi.getParameter("mem_id");
		String mem_pw = multi.getParameter("mem_pw");
		String mem_name = multi.getParameter("mem_name");
		String mem_nick = multi.getParameter("mem_nick");
		String mem_birthdate = multi.getParameter("mem_birthdate").replace("-", "");
		String mem_school = multi.getParameter("mem_school");
		System.out.println(mem_school);
		String mem_school_name = mem_school.split("-")[0];
		String mem_school_region = mem_school.split("-")[1];

		Schools m_school = new Schools(mem_school_name, mem_school_region);
		SchoolDAO sdao = new SchoolDAO();
		double mem_school_num = sdao.findSchool(m_school);

		Members joinMember = new Members(mem_id, mem_pw, mem_name, mem_nick, mem_birthdate, mem_school_num, img);
		
		MemberDAO dao = new MemberDAO();
		int res = dao.join(joinMember);
		System.out.println(res);
	
	}

}
