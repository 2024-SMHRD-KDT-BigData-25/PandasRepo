package com.pandas.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSessionFactory;

import com.pandas.database.SqlSessionManager;
import com.pandas.model.CommLikesDAO;


@WebServlet("/CommLikes")
public class CommLikes extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private CommLikesDAO commLikesDAO;

    
    @Override
    public void init() throws ServletException {
        // 서블릿 초기화 시 CommLikesDAO를 생성
        SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSessionFactory();
        commLikesDAO = new CommLikesDAO(sqlSessionFactory);
    }
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 // 요청으로부터 게시물 ID(comm_idx)와 사용자 ID(mem_id) 받기
        int commIdx = Integer.parseInt(request.getParameter("comm_idx"));
        System.out.println(commIdx);
        String memId = request.getParameter("mem_id");

        // 좋아요 수 증가 처리
        int likes = commLikesDAO.upCommLikes(commIdx);

        // 응답: 성공 상태 반환
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.print(likes);
        out.flush();
    }
}