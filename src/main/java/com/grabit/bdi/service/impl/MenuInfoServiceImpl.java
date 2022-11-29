package com.grabit.bdi.service.impl;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.grabit.bdi.config.CredentialsConfig;
import com.grabit.bdi.handler.FileHandler;
import com.grabit.bdi.mapper.MenuInfoMapper;
import com.grabit.bdi.service.MenuInfoService;
import com.grabit.bdi.vo.MenuInfoVO;
import com.grabit.bdi.vo.PageVO;

@Service
public class MenuInfoServiceImpl implements MenuInfoService {

	@Resource
	private CredentialsConfig cc;
	@Resource
	private FileHandler fh;

	@Resource
	MenuInfoMapper miMapper;

	@Override
	public Map<String, Object> selectMenuInfoList(MenuInfoVO menu) {
		int startNum = menu.getPage().getPage() * 10 - 10;
		menu.getPage().setStartNum(startNum);
		Integer totalCount = miMapper.totalMenuInfoCount(menu);
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("list", miMapper.selectMenuInfoList(menu));
		PageVO page = menu.getPage();
		page.setTotalCount(totalCount);
		rMap.put("page", page);
		return rMap;
	}

	@Override
	public MenuInfoVO selectMenuInfo(MenuInfoVO menu) {
		return miMapper.selectMenuInfo(menu);
	}

	@Override
	public Map<String,Object> insertMenuInfo(MenuInfoVO menu) {
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("result","false");
		rMap.put("msg", "다시 시도해 주세요");
		
		if(menu.getMiImgFile() != null) {
			String fileName = fh.getNewFileName(menu.getMiImgFile());
			fh.putObject(menu.getMiImgFile(),fileName);
			menu.setMiImg(fileName);
			menu.setMiImgFile(null);
		   
			if(miMapper.insertMenuInfo(menu)!=0) {
			rMap.put("result", "true");
			rMap.put("msg", "성공적으로 변경되었습니다.");
		   }	
		}
		return rMap;
	}
	
	@Override
	public Map<String,Object> updateMenuInfo(MenuInfoVO menu) {
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("result","false");
		rMap.put("msg", "다시 시도해 주세요");
		
		if(menu.getMiImgFile() != null) {
			String fileName = fh.getNewFileName(menu.getMiImgFile());
			fh.putObject(menu.getMiImgFile(),fileName);
			menu.setMiImg(fileName);
			menu.setMiImgFile(null);
		   
			if(miMapper.updateMenuInfo(menu)!=0) {
			rMap.put("result", "true");
			rMap.put("msg", "성공적으로 변경되었습니다.");
		   }	
		}
		return rMap;
	}

	/*@Override
	public Map<String,Object> updateMenuInfo(MenuInfoVO menu) {
		Map<String,Object> rMap = new HashMap<>();
		rMap.put("result","false");
		rMap.put("msg", "다시 시도해 주세요");
		
		File filed = new File(menu.getMiImgFile().getOriginalFilename());
		if(menu.getMiImgFile() != null) {
			String file = menu.getMiImgFile().getOriginalFilename();
			String fileName = System.nanoTime() + file.substring(file.indexOf("."));
			
			ObjectMetadata omd = new ObjectMetadata();
			omd.setContentType(menu.getMiImgFile().getContentType());
			omd.setContentLength(menu.getMiImgFile().getSize());
			

			try {
				cc.getS3Client().putObject("spring-test-haley", "test/"+fileName, menu.getMiImgFile().getInputStream(), omd);
			} catch (SdkClientException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			menu.setMiImg(fileName);
			menu.setMiImgFile(null);
			if(miMapper.updateMenuInfo(menu)!=0) {
				menu = miMapper.selectMenuInfo(menu);
				rMap.put("result", "true");
				rMap.put("msg", "성공적으로 변경되었습니다.");
			}	
		}
			return rMap;
	}*/

	@Override
	public Map<String, Object> deleteMenuInfo(MenuInfoVO menu) {
		Map<String, Object> rMap = new HashMap<>();
		rMap.put("cnt", miMapper.deleteMenuInfo(menu));
		return rMap;
	}

}
