package com.pandas.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.pandas.model.Diaries;
import com.pandas.model.DiaryDAO;
import com.pandas.model.Members;

@WebServlet("/diaryupdate")
public class DiaryUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service( // ModelAndView라는 타입의 리턴값을 갖는 diaryupdate 함수명을 가진 함수 선언
			HttpServletRequest request,   
			HttpServletResponse response
			) throws ServletException, IOException { // 오류 시 시행할 곳
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		Members member = (Members)session.getAttribute("member"); // 세션에서 member 정보 가져오기
		String mem_id = member.getMem_id();
		
		// state라는 변수를 통해 연결 확인
		int state = 0;
		if( request.getParameter("state") != null && !request.getParameter("state").equals("") ) { // jsp파일에서 state는 항상 1, 폼태그가 잘 넘어왔는지 확인하는 구간
			state = Integer.parseInt( request.getParameter("state").toString() );
		}
		String resultStr = "";

		DiaryDAO dao = new DiaryDAO();
		if( state == 1 ) {             // 연결이 되었다면 수정 진행
			String diary_title = request.getParameter("diary_title");
			String diary_content = request.getParameter("diary_content");
			int diary_idx = Integer.parseInt(request.getParameter("diary_idx"));
		
			System.out.println(diary_title + diary_content +  diary_idx);
			Diaries updateDiary = new Diaries( diary_idx, diary_title, diary_content);
			
			resultStr = ( dao.DiaryUpdate(updateDiary) > 0) ? "Study Log 게시물 수정 완료" : "입력하지 않은 사항이 있습니다!";
			
			RequestDispatcher rd = request.getRequestDispatcher("diary_view.jsp?idx="+diary_idx);
	    	rd.forward(request, response);
		} else { // 연결이 안 되었다면 mav 객체 안에 diaries라는 이름으로 idx에 해당하는 정보 저장
//			Diaries diaries = dao.getDiary( idx ); // getDiary() : 인자로 받은 인덱스 번호에 해당되는 행의 모든 정보 select
//			if( diaries != null  ) {
//				;
//			}
//			request.setAttribute("diaries", diaries);
		}
		request.setAttribute("state", state );
		request.setAttribute("result",resultStr ); // 수정된 게시물 result에 저장 -> jsp파일의 스크립트 함수에서 사용
		
		RequestDispatcher rd = request.getRequestDispatcher("DiaryList.jsp");
    	rd.forward(request, response);
		
//		RequestDispatcher dispatcher = request.getRequestDispatcher("diaryupdate.jsp");
//        dispatcher.forward(request, response);
	}
	
}
