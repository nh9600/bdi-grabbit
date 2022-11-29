package com.grabit.bdi.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.grabit.bdi.service.OrderInfoService;
import com.grabit.bdi.vo.MenuInfoVO;
import com.grabit.bdi.vo.OrderInfoVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class OrderInfoController {
	
	@Resource
	private OrderInfoService ois;
	
	@GetMapping("/order")
	public Map<String,Object> orderCheck(@ModelAttribute MenuInfoVO order){	
		return ois.checkOrderInfo(order);
	}
	
	@PostMapping("/order")
	public Map<String,String> test(@RequestBody OrderInfoVO order) throws Exception{
		System.out.println("오더테스트! : " + order);
		return ois.insertOrderInfo(order);
	}
	
	@PostMapping("/loadNewOrder")
	public Map<String,Object> loadNewOrderByOiNum(@RequestBody OrderInfoVO order){
		return ois.selectOrderInfo(order);
	}
	
	@GetMapping("/loadOrders")
	public Map<String,Object> loadNewOrderByOiNum(){
		return null;
	}
	
	@PutMapping("/order")
	public Map<String,Object> updateOrderInfo(OrderInfoVO order){
		return ois.updateOrderInfo(order);
	}
	
}