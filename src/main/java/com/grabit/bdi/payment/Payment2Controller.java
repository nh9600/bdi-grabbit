package com.grabit.bdi.payment;

import java.util.Map;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Payment2Controller {

	private static final String HOST = "https://kapi.kakao.com";
	@PostMapping("/kakao/payment")
	public Map<String,Object> kakaoPay(){
		return null;
	}
}
