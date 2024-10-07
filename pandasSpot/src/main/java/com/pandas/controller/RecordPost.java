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
import com.pandas.model.RecordDAO;
import com.pandas.model.Records;



@WebServlet("/RecordPost")
public class RecordPost extends HttpServlet {
	private static final long serialVersionUID = 1L;


    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 업로드할 파일의 경로 설정
        ServletContext context = request.getServletContext();
        String uploadPath = context.getRealPath("upload");
        int maxSize = 500 * 1024 * 1024;

        // 디렉토리가 없으면 생성
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();  // 폴더가 없으면 생성
        }

        // MultipartRequest를 사용해 파일 업로드 및 폼 데이터 처리
        MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());


        // 폼 데이터 가져오기
        String tag = multi.getParameter("tag");
        if (tag == null || tag.trim().isEmpty()) {
            tag = "Nottag";
        }

        String img = multi.getFilesystemName("record_img");
        if (img == null) {
            img = "Normal_image.jpg";
        }

        String likes = "0";

        String mem_id = multi.getParameter("mem_id");
        if (mem_id == null || mem_id.trim().isEmpty()) {
            mem_id = "guest";
        }
        
        // 현재 날짜는 SYSDATE로 처리


        Records record = new Records();
        record.setRecord_tag(tag);
        record.setRecord_files(img);
        record.setRecord_likes(likes);
        record.setMem_id(mem_id);

        // RecordDAO를 통해 데이터베이스에 전송
        RecordDAO rdao = new RecordDAO();
        int res = rdao.Recording(record);

        // 처리 결과에 따라 리다이렉트
        if (res > 0) {
            response.sendRedirect("record_view.jsp");
        }
    }
}