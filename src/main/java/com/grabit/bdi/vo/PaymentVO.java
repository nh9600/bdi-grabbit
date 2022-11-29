package com.grabit.bdi.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("pay")
@Data
public class PaymentVO {
	private String pmReceipt;
}
