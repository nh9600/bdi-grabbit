package com.grabit.bdi.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("menuCategory")
@Data
public class MenuCategoryVO {
	private Integer mcCode;
	private String mcName;
}
