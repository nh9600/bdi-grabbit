package com.grabit.bdi.service;

import java.util.Map;

import com.grabit.bdi.vo.MenuInfoVO;

public interface MenuInfoService {
	public MenuInfoVO selectMenuInfo(MenuInfoVO menu);
	public Map<String,Object> selectMenuInfoList(MenuInfoVO menu);
	public Map<String,Object> insertMenuInfo(MenuInfoVO menu);
	public Map<String,Object> updateMenuInfo(MenuInfoVO menu);
	public Map<String,Object> deleteMenuInfo(MenuInfoVO menu);
}
