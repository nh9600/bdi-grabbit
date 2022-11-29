package com.grabit.bdi.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.grabit.bdi.service.VenueInfoService;
import com.grabit.bdi.vo.UserInfoVO;
import com.grabit.bdi.vo.VenueInfoVO;

import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
public class VenueController {

	@Resource
	private VenueInfoService vis;
	
	@GetMapping("/venue/status")
	public Map<String,Object> selectVenueInfo(@ModelAttribute VenueInfoVO venue){
		return vis.selectVenueInfo(venue);
	}
	
	@GetMapping("/venue/check")
	public Map<String, Object> selectVenueInfoForValidationCheck(VenueInfoVO venue){
		return vis.selectVenueInfoForValidationCheck(venue);
	}
	 
	
	@PostMapping("/venue/changeSts")
	public int updateVenueOpeningStatus(@ModelAttribute VenueInfoVO venue, HttpSession session) {
		return vis.updateVenueOpeningStatus(venue, session);
	}
	
	@PostMapping("/venue/login")
	public Map<String, Object> selectVenueInfoForLogin(@ModelAttribute VenueInfoVO venue, HttpSession session){
		return vis.selectVenueInfoForLogin(venue, session);
	}
	
	@PostMapping("/venue/update")
	public Map<String,Object> updateVenueInfo(@RequestBody VenueInfoVO venue, HttpSession session){
		return vis.updateVenueInfo(venue, session);
	}
	
	@PutMapping("/updateVenue")
	public Map<String, Object> updateVenue(@ModelAttribute VenueInfoVO venue, HttpSession session) {
		log.info("venue=>{}", venue);
		return vis.updateVenueInfo(venue, session);
	}
	
	//venue목록 가져오기 
	@GetMapping("/getVenueList")
	public Map<String, Object> getVenueList(VenueInfoVO venue){
		log.info("getVenueList=>{}",venue);
		return vis.selectVenueInfoList(venue);
	}
	
	@GetMapping("/getVenue")
	public Map<String, Object> getVenue(VenueInfoVO venue){
		log.info("getVenue=>{}",venue);
		return vis.selectVenueInfo(venue);
	}
	
	//venue 삭제
	@GetMapping("/deleteVenue")
	public Map<String, Object> deleteVenueList(VenueInfoVO venue){
		log.info("getVenue=>{}",venue);
		return vis.deleteVenueInfo(venue);
	}
	
	@GetMapping("/insertVenue")
	public Map<String, Object> insertVenueList(VenueInfoVO venue){
		log.info("venue=>{}",venue);
		return vis.insertVenueInfo(venue);
	}
}
