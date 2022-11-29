package com.grabit.bdi.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("admin")
@Data
public class AdminInfoVO {

	private Integer aiNum;
	private String aiId;
	private String aiPwd;
}
