package com.grabit.bdi.mapper;

import java.util.List;
import java.util.Map;

import com.grabit.bdi.vo.BkmarkStatsVO;
import com.grabit.bdi.vo.UserInfoVO;

	public interface BkmarkInfoMapper {
		public List<BkmarkStatsVO> selectBkmarkName(BkmarkStatsVO bs);
		public BkmarkStatsVO selectBkvenue(BkmarkStatsVO bs);
		public int deleteBkMark(UserInfoVO user);
	}

	
