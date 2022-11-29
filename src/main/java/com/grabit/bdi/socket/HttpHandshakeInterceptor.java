package com.grabit.bdi.socket;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import com.grabit.bdi.vo.UserInfoVO;
import com.grabit.bdi.vo.VenueInfoVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class HttpHandshakeInterceptor extends HttpSessionHandshakeInterceptor{
	
	private VenueInfoVO venue;
	private UserInfoVO user;
	
	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		if(request instanceof ServletServerHttpRequest) {
			 ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
	            HttpSession session = servletRequest.getServletRequest().getSession();
	            //attributes에 저장되는 sessionName은 httpSession에 담겨있는 venue:viNum/user:uiNum
	            if(session.getAttribute("venue")!=null) {
		            venue = (VenueInfoVO)session.getAttribute("venue");
		            attributes.put("sessionName","venue"+venue.getViNum());
		            log.debug("sessionName==>{}",attributes.get("sessionName"));
		            
	            }else {
	            	user = (UserInfoVO)session.getAttribute("user");
	            	attributes.put("sessionName","user"+user.getUiNum());
		            log.debug("sessionName==>{}",attributes.get("sessionName"));
	            }
		}
		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception exception) {
		//do nothing
		super.afterHandshake(request, response, wsHandler, exception);
	}

}