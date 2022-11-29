package com.grabit.bdi.mapper;

import java.util.List;

import com.grabit.bdi.vo.MenuInfoVO;
import com.grabit.bdi.vo.OrderInfoVO;

public interface OrderInfoMapper {
	
	public int insertOrderInfo(OrderInfoVO order);
	public OrderInfoVO selectOrderInfo(OrderInfoVO order);
	public MenuInfoVO checkOrderInfo(MenuInfoVO order);
	public List<OrderInfoVO> selectOrderInfoByOrderStatus();
	public int updateOrderInfo(OrderInfoVO order);
}
