package com.grabit.bdi.mapper;

import java.util.List;

import com.grabit.bdi.vo.UserInfoVO;
import com.grabit.bdi.vo.VenueInfoVO;


	public interface UserInfoMapper {
		public UserInfoVO selectUserInfo(UserInfoVO user);
		public List<UserInfoVO> selectUserInfoList(UserInfoVO user);
		public int totalUserInfoCount(UserInfoVO user);
		public UserInfoVO doLogin(UserInfoVO user);
		public int insertUserInfo(UserInfoVO user);
		public int updateUserInfo(UserInfoVO user);
		public int deleteUserInfo(UserInfoVO user);
	}

