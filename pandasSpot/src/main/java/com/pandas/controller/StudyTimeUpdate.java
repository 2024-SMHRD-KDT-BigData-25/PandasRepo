package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.pandas.model.StudyTimeDAO;
import com.pandas.model.StudyTimes;

/**
 * Servlet implementation class StudyTimeUpdate
 */
@WebServlet("/StudyTimeUpdate")
public class StudyTimeUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String mem_id = request.getParameter("mem_id");
		String[] addTime = request.getParameter("study_time").split(":");
		System.out.println(mem_id + " " + addTime);
		StudyTimeDAO dao = new StudyTimeDAO();
		String[] time = dao.getStudyTime(mem_id).split(":");
		
		int old_time = Integer.parseInt(time[2]) + Integer.parseInt(time[1]) * 60  + Integer.parseInt(time[0]) * 60 * 60;
		int add_time = Integer.parseInt(addTime[2]) + Integer.parseInt(addTime[1]) * 60  + Integer.parseInt(addTime[0]) * 60 * 60;
		int new_time = old_time + add_time;
	    
		int hour = new_time / (60 * 60);
		new_time %= (60 * 60);
	    int min = new_time / 60;
	    new_time %= 60;
	    int sec = new_time;
		
		String study_time = hour + ":" + min + ":" + sec;
		
		dao.update(new StudyTimes(mem_id, study_time));
	}

}
