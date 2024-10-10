package com.pandas.chat;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.*;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

// ws://localhost:8081/mavenboard/chat
// 웹 소켓 통신이기 때문에 http 대신 ws을 사용
// 서버로 연결하기 위한 주소 설정
@ServerEndpoint("/chat")
public class ChatServer {
	// 여러 개의 객체(데이터)를 한 번에 저장할 수 있는 자료구조
	// List(ArrayList) : 연속된 공간(메모리)에 데이터를 저장하는 구조(인덱스), 검색
	// Map(HashMap) : Key-Value Key -> Hash 함수 -> value
	// Set(HashSet) : value만 저장

	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private static Gson gson = new Gson();

	// open : 연결, 새로운 클라이언트가 연결 시도
	@OnOpen
	public void onOpen(Session session) { // websocket의 Session 사용
		// 실제로 클라이언트가 연결을 시도했을때 호출되는 메서드로 설정 : @OnOpen
		// 클라이언트의 정보를 모안 자료구조에 새롭게 접속한 클라이언트의 정보를 추가로 저장
		clients.add(session);
		String query = session.getQueryString(); // "nickname=라라핑"
		Map<String, String> params = parseQuery(query);
		String nickname = decodeURIComponent(params.get("nickname"));

		// 닉네임이 입장한 공지 메시지 생성
		JsonObject jsonResponse = new JsonObject();
		jsonResponse.addProperty("type", "enter");
		jsonResponse.addProperty("message", nickname + "님이 채팅에 입장했습니다.");

		// 모든 클라이언트에게 전송
		for (Session client : clients) {
			if (client == session)
				continue;

			try {
				client.getBasicRemote().sendText(gson.toJson(jsonResponse));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// close : 연결 해제
	@OnClose // 특정 클라이언트만 연결 해제
	public void onClose(Session session) {
		clients.remove(session);
		
		String query = session.getQueryString(); // "nickname=라라핑"
		Map<String, String> params = parseQuery(query);
		String nickname = decodeURIComponent(params.get("nickname"));

		System.out.println("Nickname: " + nickname);
		// 닉네임이 입장한 공지 메시지 생성
		JsonObject jsonResponse = new JsonObject();
		jsonResponse.addProperty("type", "quit");
		jsonResponse.addProperty("message", nickname + "님이 퇴장했습니다.");
		
		for (Session client : clients) {
			// remoteEndPoint 리턴
			try {
				client.getBasicRemote().sendText(gson.toJson(jsonResponse));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// message : 메세지를 받았을 때(클라이언트가 채팅 작성 했을 때)
	@OnMessage
	public void onMessage(String message, Session session) {
		// message : 클라이언트가 보낸 메세지
		// session : 메세지를 보낸 클라이언트 정보
		// 메세지를 보낸 클라이언트는 제외
        // JSON 메시지를 파싱하여 처리할 수 있음
        JsonObject receivedMessage = gson.fromJson(message, JsonObject.class);
		String nickname = decodeURIComponent(receivedMessage.get("nickname").getAsString());
        String chatMessage = receivedMessage.get("message").getAsString();

        // 클라이언트에게 보낼 메시지를 JSON으로 작성
        JsonObject jsonResponse = new JsonObject();
        jsonResponse.addProperty("type", "message");
        jsonResponse.addProperty("nickname", nickname);
        jsonResponse.addProperty("message", chatMessage);
        
		for (Session client : clients) {
			if (client == session)
				continue;

			try {
				client.getBasicRemote().sendText(gson.toJson(jsonResponse));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	// 간단한 쿼리 파라미터 파싱 함수
	private Map<String, String> parseQuery(String query) {
		Map<String, String> map = new HashMap<>();
		if (query != null) {
			String[] params = query.split("&");
			for (String param : params) {
				String[] keyValue = param.split("=");
				map.put(keyValue[0], keyValue[1]);
			}
		}
		return map;
	}

	private String decodeURIComponent(String s) {
		try {
			return java.net.URLDecoder.decode(s, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return s; // 실패 시 원래 문자열 반환
		}
	}
}
