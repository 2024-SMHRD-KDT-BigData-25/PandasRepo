package com.pandas.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.pandas.model.StudyDAO;
import com.pandas.model.Studies;



@WebServlet("/StudyPost")
public class StudyPost extends HttpServlet {
	private static final long serialVersionUID = 1L;


    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 업로드할 파일의 경로 설정
        ServletContext context = request.getServletContext();
        String uploadPath = context.getRealPath("uploads");
        int maxSize = 500 * 1024 * 1024;

        // 디렉토리가 없으면 생성
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }
        

        MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

        String tag = multi.getParameter("study_content");
        if (tag == null || tag.trim().isEmpty()) {
            tag = " ";
        }

        String img = multi.getFilesystemName("study_photo");
        if (img == null) {
            img = " ";
        } else {
            // 파일이 정상적으로 업로드되었을 경우 경로를 포함한 파일명으로 설정
            img = "uploads/" + img;  // 실제 이미지 파일이 저장된 경로와 파일명
        }


        String mem_id = multi.getParameter("mem_id");
        
        // 현재 날짜는 SYSDATE로 처리
        System.out.println(tag + " " + img + " " + mem_id);
        
        
        
        Studies record = new Studies(tag, img, mem_id);
        StudyDAO rdao = new StudyDAO();
        int res = rdao.Studing(record);

        if (res > 0) {
            response.sendRedirect("RecordList.jsp");
        }
    }
}