package com.grabit.bdi.vo;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Alias("menuInfo")
@Data
public class MenuInfoVO {
	private Integer viNum;
	private Integer viCode;
	private Integer miNum;
	private String miName;
	private Integer miPrice;
	private String miImg;
	private String miIntro;
	private Integer[] miNums;
	private MultipartFile miImgFile;

	private Integer mcCode;
	private Integer moCode;
	
	// 검색옵션
	private String searchOpt;
	private String searchVal;

	// 페이징
	private PageVO page = new PageVO();
}
