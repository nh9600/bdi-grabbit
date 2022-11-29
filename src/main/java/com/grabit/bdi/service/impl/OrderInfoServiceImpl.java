package com.grabit.bdi.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.grabit.bdi.mapper.OrderDetailsMapper;
import com.grabit.bdi.mapper.OrderInfoMapper;
import com.grabit.bdi.service.OrderInfoService;
import com.grabit.bdi.socket.WebSocketHandler;
import com.grabit.bdi.vo.MenuInfoVO;
import com.grabit.bdi.vo.OrderDetailsVO;
import com.grabit.bdi.vo.OrderInfoVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class OrderInfoServiceImpl implements OrderInfoService {

	@Resource
	private OrderInfoMapper oim;
	@Resource
	private OrderDetailsMapper odm;
	@Resource
	private WebSocketHandler wsh;

	private OrderDetailsVO od = new OrderDetailsVO();

	@Override
	public Map<String, String> insertOrderInfo(OrderInfoVO order) throws Exception{
		Map<String, String> rMap = new HashMap<>();
		rMap.put("result", "false");
		// 주문 총액 구하는 로직
		int oiSum = 0;

		for (int i = 0; i < order.getOdList().size(); i++) {

			if (order.getOdList().get(i) != null) {
				int price = order.getOdList().get(i).getMiPrice();
				int qty = order.getOdList().get(i).getOdQuantity();
				oiSum += price * qty;
			}
		}
		order.setOiSum(oiSum);
		// List 형태의 oiMessage에서 값을 가져와 oiMsg에 String으로 저장해주는 로직
		// 뒤에 붙은 /는 구분자 역할
		String oiMsg = "";
		for (int i = 0; i < order.getOiMessage().size(); i++) {
			oiMsg += order.getOiMessage().get(i).get(0) + "/ ";
		}
		oiMsg = oiMsg.substring(0, oiMsg.lastIndexOf("/"));
		order.setOiMsg(oiMsg);
		oim.insertOrderInfo(order);
		for (int i = 0; i < order.getOdList().size(); i++) {
			if (order.getOdList().get(i) != null) {
				od = order.getOdList().get(i);
				od.setOiNum(order.getOiNum());
				odm.insertOrderDetails(od);
			}
		}
		wsh.sendNotificatonToVenue(order.getViNum(), order.getOiNum());
		//가맹점이 웹소켓세션에 연결되어있지 않을때 여기서 에러발생 =>이때 위의 order_info/ order_details에 insert된 데이터도 rollback 되야 하기때문에 
		//sendNotificatonToVenue 에서 에러발생하면 exception을 throw해준다
		rMap.put("result", "true");
		return rMap;
	}

	@Override
	public Map<String, Object> selectOrderInfo(OrderInfoVO order) {
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("result", "false");
		OrderInfoVO orderDetails = oim.selectOrderInfo(order);
		if (orderDetails != null) {
			rMap.put("result", "true");
			rMap.put("orderDetails", orderDetails);
		}
		return rMap;
	}

	@Override
	public Map<String, Object> checkOrderInfo(MenuInfoVO order) {
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("result", "true");
		int ckNum_Before = order.getMiNum();
		int ckPrice_Before = order.getMiPrice();

		MenuInfoVO ckMenu = oim.checkOrderInfo(order);
		int ckNum_After = ckMenu.getMiNum();
		int ckPrice_After = ckMenu.getMiPrice();

		if (ckNum_Before != ckNum_After || ckPrice_Before != ckPrice_After) {
			System.out.println("데이터베이스의 금액과 결제금액이 일치하지 않음!!!!!!!!");
			rMap.put("result", "false");
		}
		return rMap;
	}

	@Override
	public List<OrderInfoVO> selectOrderInfoByOrderStatus() {
		return oim.selectOrderInfoByOrderStatus();
	}

	@Override
	public Map<String, Object> updateOrderInfo(OrderInfoVO order) {
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("result", "false");
		if (order.getOiStatus().equals("pending")) {
			order.setOiStatus("accepted");
		}else if (order.getOiStatus().equals("accepted")) {
			order.setOiStatus("finished");
		}else if (order.getOiStatus().equals("finished")) {
			order.setOiStatus("done");
		}else {
			order.setOiStatus("canceled");
		}
		if(oim.updateOrderInfo(order)==1) {
			rMap.put("result", "true");
		}
		return rMap;
	}

}
