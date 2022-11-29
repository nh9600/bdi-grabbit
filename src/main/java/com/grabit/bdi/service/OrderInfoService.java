package com.grabit.bdi.service;

import java.util.List;
import java.util.Map;

import com.grabit.bdi.vo.MenuInfoVO;
import com.grabit.bdi.vo.OrderInfoVO;

public interface OrderInfoService {
	public Map<String,String> insertOrderInfo(OrderInfoVO order) throws Exception;
	public Map<String,Object> selectOrderInfo(OrderInfoVO order);
	public Map<String,Object> checkOrderInfo(MenuInfoVO order);
	public List<OrderInfoVO> selectOrderInfoByOrderStatus();
	public Map<String,Object> updateOrderInfo(OrderInfoVO order);
}
