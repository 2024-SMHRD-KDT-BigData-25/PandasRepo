package com.pandas.controller;

import java.io.File;
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
//		String uploadPath = "C:\\Users\\smhrd\\git\\repository\\pandasSpot\\src\\main\\webapp\\uploads";
		ServletContext context = request.getServletContext();
		String uploadPath = context.getRealPath("uploads");

        int maxSize = 5 * 1024 * 1024; // 최대 파일 크기: 5MB

        // 파일 업로드 객체 생성
        MultipartRequest multi = new MultipartRequest(request, uploadPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());

        // 파일명 추출 (이미 저장된 상태)
        String img = multi.getFilesystemName("study_photo");

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
        
		int study_idx = Integer.parseInt(multi.getParameter("study_idx"));
		String study_content = multi.getParameter("study_content");
		
		System.out.println(study_idx + "," + study_content + "," +  img);
		Studies updateStudy = new Studies(study_idx, study_content, img);
		
		StudyDAO dao = new StudyDAO();
		int res = dao.StudyUpdate(updateStudy);	
		if (res > 0 ) {
			System.out.println("공부기록 게시물 수정 완료!");
			response.sendRedirect("RecordList.jsp");
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
	  private String getFileExtension(String fileName) {
	        int dotIndex = fileName.lastIndexOf(".");
	        if (dotIndex > 0 && dotIndex < fileName.length() - 1) {
	            return fileName.substring(dotIndex).toLowerCase();
	        }
	        return "";
	    }

}
