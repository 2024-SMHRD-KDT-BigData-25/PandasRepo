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
import com.pandas.model.MemberDAO;
import com.pandas.model.SchoolDAO;
import com.pandas.model.Members;
import com.pandas.model.Schools;
import com.pandas.model.StudyTimeDAO;
import com.pandas.model.StudyTimes;

@WebServlet("/Join")
public class JoinMember extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // MultipartRequest => COS 라이브러리를 사용하여 파일 업로드 처리
    	// 업로드 경로 설정
//    	String uploadPath = "C:\\Users\\smhrd\\git\\repository\\pandasSpot\\src\\main\\webapp\\uploads";
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("uploads");

        int maxSize = 5 * 1024 * 1024; // 최대 파일 크기: 5MB

        // 파일 업로드 객체 생성
        MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

        // 파일명 추출 (이미 저장된 상태)
        String img = multi.getFilesystemName("mem_profile_img");

        // 이미지 파일 MIME 타입 검사
        if (img != null) {
            String filePath = uploadPath + File.separator + img;
            File file = new File(filePath);

            // 파일 확장자 체크 (JPG, PNG, GIF 등 허용)
            String[] allowedExtensions = { ".jpg", ".jpeg", ".png", ".gif" };
            String fileExtension = getFileExtension(img);

            boolean isValidExtension = false;
            for (String ext : allowedExtensions) {
                if (fileExtension.equalsIgnoreCase(ext)) {
                    isValidExtension = true;
                    break;
                }
            }

            if (!isValidExtension) {
                file.delete(); // 이미지 형식이 아닌 경우 파일 삭제
                response.getWriter().println("허용되지 않은 파일 형식입니다.");
                return;
            }

            // MIME 타입 확인 (이미지 타입만 허용)
            String mimeType = getServletContext().getMimeType(file.getAbsolutePath());
            if (mimeType == null || !mimeType.startsWith("image")) {
                file.delete(); // 이미지가 아닌 파일이면 삭제
                response.getWriter().println("이미지 파일만 업로드 가능합니다.");
                return;
            }
        } else {
            response.getWriter().println("파일을 선택하지 않았습니다.");
            return;
        }

        // 회원 가입 처리 로직
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

        Members joinMember = new Members(mem_id, mem_pw, mem_name, mem_nick, mem_birthdate, mem_school_num, img);
        
        MemberDAO dao = new MemberDAO();
        int res = dao.join(joinMember);
        if (res > 0) {
            System.out.println(mem_id + " 가입 완료");
            response.sendRedirect("Login.jsp");
            StudyTimeDAO stDAO = new StudyTimeDAO();
            stDAO.insertStudyTime(mem_id);
        } else {
            System.out.println("가입 실패");
            response.sendRedirect("join.jsp");
        }
    }

    // 파일 확장자 추출
    private String getFileExtension(String fileName) {
        int dotIndex = fileName.lastIndexOf(".");
        if (dotIndex > 0 && dotIndex < fileName.length() - 1) {
            return fileName.substring(dotIndex).toLowerCase();
        }
        return "";
    }
}
