package com.grabit.bdi.socket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
public class WebSocketHandler extends TextWebSocketHandler {
	
	private static Map<String, WebSocketSession> NameAndSessions = Collections.synchronizedMap(new HashMap<String, WebSocketSession>());
	//만든 키값 (예:venue1) + session으로 저장하는 맵
	@Transactional
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) {
		try {
			session.sendMessage(message);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	 
	
	public void sendNotificatonToVenue(int viNum, int oiNum) {
		//log.debug("Current NameAndSessions==>{}", NameAndSessions);
		try{
			WebSocketSession ws = NameAndSessions.get("venue"+viNum);
			TextMessage msg = new TextMessage(oiNum+"");
			handleTextMessage(ws, msg);
			//return 1;
		}catch(Exception e) {
			//log.debug("error while processing sendNotification method...");
			throw e;
		}
		//return 0;
	}
	
	public void sendNotificatonToUser(int uiNum, String oiStatus) {
		WebSocketSession ws = NameAndSessions.get("user"+uiNum);
		if(oiStatus=="pending") {
			TextMessage msg = new TextMessage("주문이 정상적으로 접수되었습니다.");
			handleTextMessage(ws, msg);
		}else if(oiStatus=="accepted") {
			TextMessage msg = new TextMessage("주문하신 음료가 준비되었습니다.");
			handleTextMessage(ws, msg);
		}else {
			TextMessage msg = new TextMessage("error");
			//주문완료 말고 환불처리 및 주문취소등에 대한 메세지처리 할거면 여기에
			handleTextMessage(ws, msg);
		}
	}
	// 세션이 생성될때 시작되는 함수
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		Map<String,Object> attrMap = session.getAttributes();
		//log.debug("attrMap==>{}",attrMap);
		
		NameAndSessions.put((String)attrMap.get("sessionName"), session);
		//log.debug("session in NameAndSessions==>{}", NameAndSessions);
		//interceptor에서 attributes에 sessionName이라는 키값으로 user/venue + pk num으로 저장해준 값을 가져와서 
		//그 값을 key로하는 WebSocketSession Map에 저장해줌
	}

	// 세션이 끝날때 실행되는 함수
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		//NameAndSessions.remove(session.getAttributes().get("sessionName").toString());
		//log.debug("session closed..{}", NameAndSessions);
		//super.afterConnectionClosed(session, status);
	}
}
