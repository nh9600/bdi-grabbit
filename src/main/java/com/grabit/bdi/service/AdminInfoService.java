package com.grabit.bdi.service;

import java.util.Map;

import javax.servlet.http.HttpSession;

import com.grabit.bdi.vo.AdminInfoVO;

public interface AdminInfoService {

	public Map<String,Object> adminLogin(AdminInfoVO admin, HttpSession session);
}
