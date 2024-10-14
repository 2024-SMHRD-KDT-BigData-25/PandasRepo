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
import com.pandas.model.Diaries;
import com.pandas.model.DiaryDAO;
import com.pandas.model.Followings;
import com.pandas.model.FollowingsDAO;

/**
 * Servlet implementation class MemberListLoad
 */
@WebServlet("/MemberListLoad")
public class MemberListLoad extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // DAO에서 데이터 가져오기
        DiaryDAO dao = new DiaryDAO();
        String mem_id = request.getParameter("mem_id");

        List<Diaries> list = dao.getMyPostList(mem_id);
        FollowingsDAO fDAO = new FollowingsDAO();
        List<String> followerList = fDAO.getMyfollowers(mem_id);
        List<String> followingList = fDAO.getMyfollowings(mem_id);

        // 데이터를 담을 Map 생성
        Map<String, Object> dataMap = new HashMap<>();
        dataMap.put("diaries", list);
        dataMap.put("followers", followerList);
        dataMap.put("followings", followingList);

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


