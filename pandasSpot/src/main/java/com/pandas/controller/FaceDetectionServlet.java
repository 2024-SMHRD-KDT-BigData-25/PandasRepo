package com.pandas.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@WebServlet("/FaceDetectionServlet")
public class FaceDetectionServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private double totalTimeSpent = 0;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // JSON 데이터 받기
        StringBuilder jsonBuffer = new StringBuilder();
        String line;
        while ((line = request.getReader().readLine()) != null) {
            jsonBuffer.append(line);
        }

        // JSON 파싱
        JsonObject jsonObject = JsonParser.parseString(jsonBuffer.toString()).getAsJsonObject();
        double timeSpent = jsonObject.get("timeSpent").getAsDouble();
        double totalTime = jsonObject.get("totalTime").getAsDouble();

        // 서버의 총 시간 업데이트
        totalTimeSpent += timeSpent;

        System.out.println("이번 세션 동안 감지된 시간: " + timeSpent + "초");
        System.out.println("전체 감지 시간: " + totalTime + "초");

        // 응답
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        JsonObject responseJson = new JsonObject();
        responseJson.addProperty("totalTimeSpent", totalTimeSpent);
        response.getWriter().write(responseJson.toString());
    }
}
