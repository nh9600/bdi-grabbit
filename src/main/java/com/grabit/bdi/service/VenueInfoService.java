package com.grabit.bdi.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.grabit.bdi.vo.PageVO;
import com.grabit.bdi.vo.VenueInfoVO;

public interface VenueInfoService {

	public Map<String, Object> selectVenueInfoList(VenueInfoVO venue);
	public Map<String,Object> selectVenueInfo(VenueInfoVO venue);
	public Map<String,Object> selectVenueInfoForLogin(VenueInfoVO venue,  HttpSession session);
	public Map<String,Object> selectVenueInfoForValidationCheck(VenueInfoVO venue);
	public Map<String,Object> updateVenueInfo(VenueInfoVO venue , HttpSession session);
	public int updateVenueOpeningStatus(VenueInfoVO venue, HttpSession session);
	public Map<String,Object> deleteVenueInfo(VenueInfoVO venue);
	public Map<String,Object> insertVenueInfo(VenueInfoVO venue);

}
