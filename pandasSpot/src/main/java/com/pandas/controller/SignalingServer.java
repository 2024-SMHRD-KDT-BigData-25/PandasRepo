package com.pandas.controller;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

@ServerEndpoint("/signaling")
public class SignalingServer {

    private static Set<Session> clients = new HashSet<>();

    @OnOpen
    public void onOpen(Session session) {
        // 새로운 클라이언트가 연결되면 세션을 저장
        clients.add(session);
        System.out.println("New connection: " + session.getId());
    }

    @OnMessage
    public void onMessage(String message, Session session) throws IOException {
        // 클라이언트로부터 메세지를 받으면 처리
        JsonObject jsonMessage = JsonParser.parseString(message).getAsJsonObject();

        // 받은 메세지를 모든 클라이언트에게 전달 (Broadcast)
        for (Session client : clients) {
            if (!client.equals(session) && client.isOpen()) {
                client.getBasicRemote().sendText(jsonMessage.toString());
            }
        }
    }

    @OnClose
    public void onClose(Session session) {
        // 클라이언트 연결이 종료되면 세션 삭제
        clients.remove(session);
        System.out.println("Connection closed: " + session.getId());
    }
}
