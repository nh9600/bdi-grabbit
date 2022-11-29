package com.grabit.bdi.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class FileTestVO {
	private String pbTitle;
	private String pbContent;
	private MultipartFile pbImg;
	private String pbImgName;
	private Integer creusr;
}
