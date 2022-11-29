package com.grabit.bdi.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("orderDetails")
@Data
public class OrderDetailsVO {

	private Integer oiNum; 
	private Integer miNum;
	private Integer miPrice;
	private Integer odQuantity;
}
