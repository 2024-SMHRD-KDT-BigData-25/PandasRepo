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

		String diary_title = request.getParameter("diary_title");
		String diary_content = request.getParameter("diary_content");
		int diary_idx = Integer.parseInt(request.getParameter("diary_idx"));
		System.out.println(diary_title + diary_content + diary_idx);
	
		System.out.println(diary_title + diary_content +  diary_idx);
		Diaries updateDiary = new Diaries( diary_idx, diary_title, diary_content);
		
		DiaryDAO dao = new DiaryDAO();
		int res = dao.DiaryUpdate(updateDiary);
		if ( res > 0) {
			RequestDispatcher rd = request.getRequestDispatcher("diary_view.jsp?idx="+diary_idx);
	    	rd.forward(request, response);
		}
	}
	
}
