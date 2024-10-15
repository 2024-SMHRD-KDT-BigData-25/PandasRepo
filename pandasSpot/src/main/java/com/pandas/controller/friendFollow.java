package com.pandas.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pandas.model.Followings;
import com.pandas.model.FollowingsDAO;

/**
 * Servlet implementation class friendFollow
 */
@WebServlet("/friendFollow")
public class friendFollow extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String following_id = request.getParameter("following_id");
		String follower_id = request.getParameter("follower_id");
		
		FollowingsDAO dao = new FollowingsDAO();
	
		List<String> res = dao.friendFollow(new Followings(follower_id, following_id));
		Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("followers", res);

        // GSON으로 Map을 JSON으로 변환
        Gson gson = new Gson();
        String jsonResponse = gson.toJson(dataMap);

        // 응답 설정
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");

        // 응답 전송
        PrintWriter out = response.getWriter();
        out.print(jsonResponse);

		
	}

}
