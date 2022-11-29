package com.grabit.bdi.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.grabit.bdi.service.AdminInfoService;
import com.grabit.bdi.service.UserInfoService;
import com.grabit.bdi.service.VenueInfoService;
import com.grabit.bdi.vo.AdminInfoVO;
import com.grabit.bdi.vo.PageVO;
import com.grabit.bdi.vo.UserInfoVO;
import com.grabit.bdi.vo.VenueInfoVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class AdminInfoController {

	@Resource
	private AdminInfoService ais;
	@Resource
	private VenueInfoService vis;
	@Resource
	private UserInfoService uis;

	// login
	@PostMapping("/admin")
	public Map<String, Object> adminLogin(AdminInfoVO admin, HttpSession session) {
		log.info("admin==>{}", admin);
		return ais.adminLogin(admin, session);
	}

	// logout
	@GetMapping("/logout")
	public Map<String, Object> adminLogout(HttpSession session) {
		session.invalidate();
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("msg", "로그아웃 되었습니다.");
		return rMap;
	}

	// menu목록 가져오기
	@GetMapping("/getMenu")
	public List<UserInfoVO> getMenuList(UserInfoVO user) {
		return null;
	}
}
