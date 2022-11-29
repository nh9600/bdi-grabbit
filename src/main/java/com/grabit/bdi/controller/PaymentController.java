package com.grabit.bdi.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RestController;

import com.grabit.bdi.bootpay.Bootpay;
import com.grabit.bdi.vo.PaymentVO;
 
@RestController
public class PaymentController {

	@GetMapping("/pay")
	public String pay(@ModelAttribute PaymentVO pm) {
		Bootpay payTest = new Bootpay();
		payTest.goGetToken();
		payTest.goVerfity(pm.getPmReceipt());
		
		return null;
	}
	
	@DeleteMapping("/pay")
	public String payDelete(@ModelAttribute PaymentVO pm) {
		Bootpay payTest = new Bootpay();
		payTest.goGetToken(); 
		payTest.goCancel(pm.getPmReceipt()); 
		
		return null;
	}
	
}
