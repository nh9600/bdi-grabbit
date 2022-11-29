package com.grabit.bdi.controller;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.grabit.bdi.service.MenuInfoService;
import com.grabit.bdi.vo.MenuInfoVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class MenuInfoController {
	
	@Resource
	MenuInfoService miService;
	
	//리스트
	@GetMapping("/menus")
	public Map<String,Object> selectMenuInfoList(MenuInfoVO menu){
		log.info("menu=>{}",menu);
		return miService.selectMenuInfoList(menu);
	}
	
	//뷰
	@GetMapping("/menu")
	public MenuInfoVO selectMenuInfo(MenuInfoVO menu){
		log.info("menu=>{}",menu);
		return miService.selectMenuInfo(menu);
	}
	
	//삭제
	@DeleteMapping("/menu/*")
	public Map<String,Object> deleteMenu(@RequestBody MenuInfoVO menu){
		log.info("menu=>{}",menu);
		return miService.deleteMenuInfo(menu);
	}
	
	//추가
	@PostMapping("/menu/*")
	public Map<String,Object> insertMenuInfo(@ModelAttribute MenuInfoVO menu) {
		log.debug("Insert menu=>{}",menu);
		return miService.insertMenuInfo(menu);
	}
	
	//수정
	@PutMapping("/menu/*")
	public Map<String,Object> updateMenuInfo(@ModelAttribute MenuInfoVO menu) {
		log.debug("menu=>{}",menu);
		return miService.updateMenuInfo(menu);
	}
}
