package com.grabit.bdi.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("menuOptions")
@Data
public class MenuOptionsVO {
	private Integer miNum;
	private String moName;
	private Integer moValue;
}
