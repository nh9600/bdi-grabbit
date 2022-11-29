 
package com.grabit.bdi.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.grabit.bdi.vo.MapVO;

import lombok.extern.slf4j.Slf4j;


@RestController
@Slf4j
public class MapController {
	private List<MapVO> mvoList = new ArrayList<MapVO>();
	
	private ObjectMapper om = new ObjectMapper().configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
	
	@GetMapping("/keyword/search")
	public Map<String,Object> keyword(String latitude, String longitude, String keyword) throws Exception{
		String text = URLEncoder.encode(keyword,"UTF-8");
		URL url = new URL("https://dapi.kakao.com/v2/local/search/keyword.json?y="+latitude+
		"&x="+longitude+"&radius=20000&query="+text);
		HttpURLConnection hc = (HttpURLConnection)url.openConnection();
		hc.setRequestMethod("GET");
		hc.setRequestProperty("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
		hc.setRequestProperty("Authorization", "KakaoAK c2b9186eb03d6389949f53b43dfb1a4e");
		hc.setDoOutput(true); //parameter를 보내려면 이걸 true로 해줘야 됨
		DataOutputStream dos = new DataOutputStream(hc.getOutputStream());
		dos.flush();
		dos.close();
		
		InputStreamReader isr = new InputStreamReader(hc.getInputStream(), "UTF-8");
		BufferedReader br = new BufferedReader(isr);
		StringBuffer res = new StringBuffer();
		String str = null;
		while((str=br.readLine())!=null) {
			res.append(str);
			log.info("res=>{}",res);
		}
		br.close();
		Map<String,Object> keywordResponse = om.readValue(res.toString(), Map.class);		
		List<Map<String,Object>> documents = (List<Map<String, Object>>) keywordResponse.get("documents");
		Map<String,Object> result = new HashMap<String,Object>();
		result.put("documents", documents);
		for (int i=0;i<documents.size();i++) {
			MapVO mvo = new MapVO();
			Map<String,Object> tempMap = new HashMap<String, Object>();
			tempMap=documents.get(i);
			mvo.setTitle((String) tempMap.get("place_name"));
			mvo.setFile((String) tempMap.get("place_url"));
			mvo.setLatitude((String) tempMap.get("y"));
			mvo.setLongitude((String) tempMap.get("x"));
			mvoList.add(mvo);
		}
		log.info("mvoList=>{}",mvoList);
//		if(documents.size()<1) {
//			url = new URL("https://dapi.kakao.com/v2/local/search/address.json?query="+text);
//			hc = (HttpURLConnection)url.openConnection();
//			hc.setRequestMethod("GET");
//			hc.setRequestProperty("Authorization", "KakaoAK 0adadcca011c7f21e6d13552445d214d");
//			hc.setDoOutput(true); //parameter를 보내려면 이걸 true로 해줘야 됨
//			dos = new DataOutputStream(hc.getOutputStream());
//			dos.flush();
//			dos.close();
//			isr = new InputStreamReader(hc.getInputStream(), "UTF-8");
//			br = new BufferedReader(isr);
//			res = new StringBuffer();
//			str = null;
//			while((str=br.readLine())!=null) {
//				res.append(str);
//			}
//			br.close();
//			keywordResponse = om.readValue(res.toString(), Map.class);
//		}
		
		return result;
	}

}