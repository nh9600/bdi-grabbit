package com.grabit.bdi.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.grabit.bdi.mapper.AdminInfoMapper;
import com.grabit.bdi.service.AdminInfoService;
import com.grabit.bdi.vo.AdminInfoVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class AdminInfoServiceImpl implements AdminInfoService {

	@Resource
	private AdminInfoMapper aim;

	@Override
	public Map<String, Object> adminLogin(AdminInfoVO admin, HttpSession session) {
		Map<String,Object> rMap = new HashMap<>();
		admin = aim.selectAdminInfo(admin);
		log.debug("admin==========login==========>",admin);
		rMap.put("result", "false");
		if(admin!=null) {
			rMap.put("result", "true");
			rMap.put("admin", admin);
			session.setAttribute("admin", admin);
		}
		return rMap;
	}

}
