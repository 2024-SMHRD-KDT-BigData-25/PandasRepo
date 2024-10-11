package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.pandas.model.Diaries;
import com.pandas.model.DiaryDAO;
import com.pandas.model.Members;

public class DiaryUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@RequestMapping("/diaryupdate")
	public ModelAndView diaryupdate(
			HttpServletRequest request, 
			HttpServletResponse response,
			@RequestParam( value ="idx" ) int idx
			) throws ServletException, IOException {
		ModelAndView mav = new ModelAndView("/diaryupdate");
		HttpSession session = request.getSession();
		Members member = (Members)session.getAttribute("member");
		String mem_id = member.getMem_id();
		
		int state = 0;
		if( request.getParameter("state") != null && !request.getParameter("state").equals("") ) {
			state = Integer.parseInt( request.getParameter("state").toString() );
		}
		String resultStr = "";
		DiaryDAO dao = new DiaryDAO();
		if( state == 1 ) {
			String diary_title = request.getParameter("diary_title");
			String diary_content = request.getParameter("diary_content");
		
			System.out.println(diary_title + diary_content +  mem_id);
			Diaries updateDiary = new Diaries(diary_title, diary_content, mem_id);
			
			resultStr = ( dao.DiaryUpdate(updateDiary) > 0) ? "Study Log 게시물 수정 완료" : "입력하지 않은 사항이 있습니다!";
		} else {
			Diaries diaries = dao.getDiary(idx);
			if( diaries != null  ) {
				mav.addObject("diaries", diaries);
			}
		}
		request.setCharacterEncoding("UTF-8");
		
		mav.addObject("state", state );
		mav.addObject("result",resultStr );
		return mav;
	}
}
