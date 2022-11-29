package com.grabit.bdi.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.amazonaws.SdkClientException;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.grabit.bdi.config.CredentialsConfig;
import com.grabit.bdi.mapper.VenueInfoMapper;
import com.grabit.bdi.service.VenueInfoService;
import com.grabit.bdi.vo.PageVO;
import com.grabit.bdi.vo.VenueInfoVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class VenueInfoServiceImpl implements VenueInfoService {

	@Resource
	private CredentialsConfig cc;
	@Resource
	private VenueInfoMapper vim;

	@Override
	public Map<String, Object> selectVenueInfoList(VenueInfoVO venue) {
		int startNum = venue.getPage().getPage() * 10 - 10;
		venue.getPage().setStartNum(startNum);
		Integer totalCount = vim.totalVenueInfoCount(venue);
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("list", vim.selectVenueInfoList(venue));
		PageVO page = venue.getPage();
		page.setTotalCount(totalCount);
		rMap.put("page", page);
		return rMap;
	}
	
	@Override
	public Map<String, Object> selectVenueInfo(VenueInfoVO venue) {
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("result", "false");
		rMap.put("msg", "다시 시도해 주세요");
		rMap.put("venue",venue);
		venue = vim.selectVenueInfo(venue);
		if(venue!=null) {
			rMap.put("venue",venue);
			rMap.put("result", "true");
			rMap.remove("msg");
		}
		return rMap;
	}


	@Override
	public Map<String, Object> updateVenueInfo(VenueInfoVO venue,  HttpSession session) {
		File filed = new File(venue.getViImgFile().getOriginalFilename());
		if(venue.getViImgFile() != null) {
			String file = venue.getViImgFile().getOriginalFilename();
			String fileName = System.nanoTime() + file.substring(file.indexOf("."));
			
			ObjectMetadata omd = new ObjectMetadata();
			omd.setContentType(venue.getViImgFile().getContentType());
			omd.setContentLength(venue.getViImgFile().getSize());
			

			try {
				cc.getS3Client().putObject("spring-test-haley", "test/"+fileName, venue.getViImgFile().getInputStream(), omd);
			} catch (SdkClientException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("파일네임이 찍혀야 함 : " + fileName );
			venue.setViImg(fileName);
			venue.setViImgFile(null);   
		}
		if(venue.getViPwd().length() < 5) {
			venue.setViPwd(null);
		}
		int cnt = vim.updateVenueInfo(venue);
		session.setAttribute("venue", venue);
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("msg", "업데이트 실패");
		if(cnt==1) {
			rMap.put("msg", "업데이트 성공");
		}
		return rMap;
	}


	@Override
	public int updateVenueOpeningStatus(VenueInfoVO venue, HttpSession session) {
		if(vim.updateVenueOpeningStatus(venue)==1) {
			venue = vim.selectVenueInfo(venue);
			session.setAttribute("venue", venue);
			return 1;
		}
		return 0;
	}

	@Override
	public Map<String, Object> selectVenueInfoForLogin(VenueInfoVO venue,  HttpSession session) {
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("result", "false");
		venue = vim.selectVenueInfoForLogin(venue);
		if(venue!=null) {
			rMap.put("venue",venue);	
			rMap.put("result", "true");
			session.setAttribute("venue", venue);
		}
		return rMap;
	}

	@Override
	public Map<String, Object> deleteVenueInfo(VenueInfoVO venue) {
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("msg", "알 수 없는 오류입니다");
		if(vim.deleteVenueInfo(venue)!=0) {
			rMap.put("msg", "삭제되었습니다");
		}
		return rMap;
	}

	@Override
	public Map<String, Object> insertVenueInfo(VenueInfoVO venue) {
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("msg", "작성에 실패했습니다");
		if(vim.insertVenueInfo(venue)!=0) {
			rMap.put("msg", "작성이 완료 되었습니다");
		}
		return rMap;
	}

	@Override
	public Map<String, Object> selectVenueInfoForValidationCheck(VenueInfoVO venue) {
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("result", "false");
		if(vim.selectVenueInfoForValidationCheck(venue)!=null) {
			rMap.put("result", "true");
			rMap.put("venue", vim.selectVenueInfoForValidationCheck(venue));
		}
		return rMap;
	}

}
