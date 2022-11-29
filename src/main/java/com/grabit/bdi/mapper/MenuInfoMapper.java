package com.grabit.bdi.mapper;

import java.util.List;

import com.grabit.bdi.vo.MenuInfoVO;

public interface MenuInfoMapper {
	public List<MenuInfoVO> selectMenuInfoList(MenuInfoVO menu);
	public int totalMenuInfoCount(MenuInfoVO menu);
	public MenuInfoVO selectMenuInfo(MenuInfoVO menu);
	public int insertMenuInfo(MenuInfoVO menu);
	public int updateMenuInfo(MenuInfoVO menu);
	public int deleteMenuInfo(MenuInfoVO menu);
}
