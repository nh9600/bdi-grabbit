package com.grabit.bdi.vo;

import java.util.List;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("orderInfo")
@Data
public class OrderInfoVO {
	private Integer oiNum;
	private Integer uiNum;
	private Integer viNum;
	//주문 상태
	private String oiStatus;
	private String oiDate;
	//주문이 들어간 시각
	private String oiCretim;
	//주문 상태가 변경된 시각(예시-음료 제조 중 -> 음료 제조완료로 상태변경된 시각)
	private String oiModtim;
	//총가격
	private Integer oiSum;	

	private List<List<String>> oiMessage; 
	/*주문시에 가맹점에 전송해줄 주문관련 정보
	DB에 저장하기위해 oiMessage값을 toString해서 oiMsg에 저장한다. (DB에는 oiMessge라는 컬럼은 존재X)*/ 
	private String oiMsg;
	private String oiClaim;	//주문시 고객이 입력하는 주문관련 요청사항
	
//	private String moName;
//	private String moWhip;
//	private String moHotIce;
//	private Integer moIce;
//	private Integer moWater;
//	private Integer moMilk;
//	private Integer moShot;
	private List<OrderDetailsVO> odList;
	
}
