package com.pandas.chat;

import java.io.IOException;
import java.util.*;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

// ws://localhost:8081/mavenboard/chat
// 웹 소켓 통신이기 때문에 http 대신 ws을 사용
// 서버로 연결하기 위한 주소 설정
@ServerEndpoint("/chat")
public class ChatServer {
	// 여러 개의 객체(데이터)를 한 번에 저장할 수 있는 자료구조
	//List(ArrayList) : 연속된 공간(메모리)에 데이터를 저장하는 구조(인덱스), 검색
	//Map(HashMap) : Key-Value Key -> Hash 함수 -> value
	//Set(HashSet) : value만 저장
	
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	// open : 연결, 새로운 클라이언트가 연결 시도
	@OnOpen
	public void onOpen(Session session) { //websocket의 Session 사용
		//실제로 클라이언트가 연결을 시도했을때 호출되는 메서드로 설정 : @OnOpen
		//클라이언트의 정보를 모안 자료구조에 새롭게 접속한 클라이언트의 정보를 추가로 저장
		clients.add(session);
		//현재 접속한 클라이언트들에게 새로운 클라이언트가 접속했다고 메세지 보내기!
		for (Session client : clients) {
			//remoteEndPoint 리턴
			try {
				client.getBasicRemote().sendText("새로운 클라이언트 접속");
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	// close : 연결 해제
	@OnClose //특정 클라이언트만 연결 해제
	public void onClose(Session session) {
		clients.remove(session);
		for (Session client : clients) {
			//remoteEndPoint 리턴
			try {
				client.getBasicRemote().sendText("다른 클라이언트 접속 해제");
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
		for (Session client : clients) {
			if (client == session)
				continue;
			
			try {
				client.getBasicRemote().sendText(message);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
