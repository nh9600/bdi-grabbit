<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="/res/main_theme/js/jquery.min.js"></script>
    <script src="/res/main_theme/js/popper.min.js"></script>

    <!-- Plugins JS -->
    <script src="/res/main_theme/js/bootstrap.min.js"></script>

    <!-- Slick JS -->
    <script src="/res/main_theme/js/jquery.easing.1.3.js"></script>
    <script src="/res/main_theme/js/slick.min.js"></script>
    <!-- Theme JS -->
    <script src="/res/main_theme/js/theme.js"></script>   

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="/res/main_theme/css/bootstrap.min.css">
    <link rel="stylesheet" href="/res/main_theme/fonts/themify/themify-icons.css">

    <link rel="stylesheet" href="/res/main_theme/css/slick.css">
    <link rel="stylesheet" href="/res/main_theme/css/slick-theme.css">
    <link rel="stylesheet" href="/res/main_theme/css/all.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="/res/main_theme/css/style.css">
    <link rel="stylesheet" href="/res/main_theme/css/responsive.css">
<script language="javascript">

// opener관련 오류가 발생하는 경우 아래 주석을 해지하고, 사용자의 도메인정보를 입력합니다. ("팝업API 호출 소스"도 동일하게 적용시켜야 합니다.)
//document.domain = "abc.go.kr";

function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/admin/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	
	// 모바일 웹인 경우, 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrMobileLinkUrl.do)를 호출하게 됩니다.
    //var pop = window.open("/popup/jusoPopup.jsp","pop","scrollbars=yes, resizable=yes"); 
}


function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
		console.log(roadFullAddr);//데이터베이스로 넘어갈 주소
		document.form.roadFullAddr.value = roadFullAddr;
		document.form.addrDetail.value = addrDetail;
		document.form.zipNo.value = zipNo;
		
}

function test(){
	function tt(){
		alert(1);
	}
	tt();
}
console.log(test.tt);
</script>
<title>주소 입력 샘플</title>
</head>
<body>
<form name="form" id="form" method="post">

	<input type="button" onClick="goPopup();" value="팝업_domainChk"/>
	<div id="list"></div>
	<div id="callBackDiv">
		<table>
			<tr ><td>우편번호             </td><td><input type="text" readonly="readonly" style="width:100px;" id="zipNo"  name="zipNo" /></td></tr>
			<tr><td>지번                 </td><td><input type="text" readonly="readonly" style="width:500px;" id="jibunAddr"  name="jibunAddr" /></td></tr>
			<tr><td>상세주소    </td><td><input type="text"  style="width:500px;" id="addrDetail"  name="addrDetail" /></td></tr>
		</table>
	</div>

</form>
</body>
</html>