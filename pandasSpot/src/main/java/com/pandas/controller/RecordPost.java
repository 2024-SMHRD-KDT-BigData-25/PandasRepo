package com.pandas.controller;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


@WebServlet("/RecordPost")
public class RecordPost extends HttpServlet {
	private static final long serialVersionUID = 1L;


protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 태그 가져오기
		String tag = request.getParameter("tag");
		// 이미지 가져오기
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("upload");
		int maxSize = 500 * 1024 * 1024; // 500MB
		
		MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
		
		String img = multi.getFilesystemName("mem_profile_img");
		String likes = "0";


        response.sendRedirect("success.jsp");
    }
}
