package edu.kh.mind.member.websocket;

import com.fasterxml.jackson.databind.ObjectMapper;
import edu.kh.mind.member.model.service.ChatService;
import edu.kh.mind.member.model.vo.ChatMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.text.SimpleDateFormat;
import java.util.*;

public class ChatWebsocketHandler extends TextWebSocketHandler {

    @Autowired
    private ChatService service;

    private Set<WebSocketSession> sessions = Collections.synchronizedSet(new HashSet<WebSocketSession>());

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessions.add(session);

        System.out.println(session.getId() + " 연결");
    }

    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        System.out.println("전달 받은 내용 : " + message.getPayload());

        ObjectMapper objectMapper = new ObjectMapper();
        ChatMessage cm = objectMapper.readValue(message.getPayload(), ChatMessage.class);

//        String timeStamp = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss").format(Calendar.getInstance().getTime());
//        cm.setCreateDate(timeStamp);

        System.out.println("변경된 cm : " + cm);

        int result = service.insertMessage(cm);

        if (result > 0) {
            for (WebSocketSession wss : sessions) {

                // int chattingNo = (Integer)wss.getAttributes().get("chattingNo");
                int chattingNo = 3;

                if (chattingNo == cm.getChattingNo()) {
                    wss.sendMessage(new TextMessage(message.getPayload()));
                }
            }
        }
    }



}
