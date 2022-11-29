package com.grabit.bdi.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.grabit.bdi.mapper.UserInfoMapper;
import com.grabit.bdi.vo.FileTestVO;
import com.grabit.bdi.vo.UserInfoVO;
 
@RestController
public class FileTestController {

	@Resource 
	private UserInfoMapper uiMapper;
	
	@PostMapping("/fileupload")
	public FileTestVO fileupload(@ModelAttribute FileTestVO ft, HttpSession session) {
		String path = session.getServletContext().getRealPath("");
		System.out.println(path);
		path += "res\\images\\";
		
		if(ft.getPbImg() != null) {
			String file = ft.getPbImg().getOriginalFilename();
			String fileName = System.nanoTime() + file.substring(file.indexOf("."));
			try {
				ft.getPbImg().transferTo(new File(path + fileName));	
				
			} catch(IllegalStateException | IOException e) {
				e.printStackTrace();
			}	
			ft.setPbImgName(fileName);
			ft.setPbImg(null); // RestController에서 return할 때 MultipartFile 데이터 타입을 가진 변수들을 모두 null로 만들어야 return이 됨.  
		}
		
		System.out.println(ft);	
		return ft;
	}
	
	@GetMapping("/test2")
	public List<UserInfoVO> callbackTest(UserInfoVO user) {
		
		return uiMapper.selectUserInfoList(user);
		
	}
}
