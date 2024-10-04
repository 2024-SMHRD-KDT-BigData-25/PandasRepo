package com.pandas.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.pandas.model.SchoolDAO;
import com.pandas.model.Schools;

@WebServlet("/FindSchool")
public class FindSchool extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		System.out.println("FindSchool 호출");
		
		String name = request.getParameter("school_name");
		SchoolDAO dao = new SchoolDAO();
		List<Schools> res = dao.findSchool(name);
		for (Schools s : res) {
			System.out.println(s.getSchool_name());
		}
		//JavaObject => JSON Object(json 형식의 객체 구조) -> GSON
		Gson gson = new Gson();
		// toJson  : 안쪽에 넣은 데이터를 json형식으로 반환해줌
		String json = gson.toJson(res);
		response.setCharacterEncoding("UTF-8");		// 
//		response.setContentType("text/html; charset=UTF-8");			// 응답하는 content의 타입 지정해서 브라우저에 알려주는 방식
		//텍스트를 출력(out/Server -> Client) 해줄 수 있는 스트링 -> PrintWriter
		PrintWriter out = response.getWriter();
		out.print(json);
	}

}
