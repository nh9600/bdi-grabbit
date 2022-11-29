<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>	
<meta charset="UTF-8">
<title>Status</title>
<style>
@media ( max-width : 318px) {
	h1.cafeName {
		padding-top: 20px;
	}
	#content-area {
		text-align: left;
	}
}
@media ( max-width : 800px) {
	h1.cafeName {
		padding-top: 20px;
	}
	#content-area {
		text-align: left;
	}
}
button{
font-size:1rem !important;}

#viewTb{
	margin:0 auto;
}
.pt-5, .py-5 {
	padding-bottom: 1rem !important;;
}
.service-img {
	border: unset;
}
#service {
	padding-top: 50px;
	margin-top: 50px;
}
#content-area {
	padding-top:30px;
	padding-bottom: 50px;
	margin-bottom: 50px;
}
.service-block{
	width:270px;
}
.service-content{
	padding-top:0px !important;
}
tr, th, td{
height:50px;
}
th{
width:100px;
}
td{
width:200px;
}
a.updateMenuInfo :hover{
cursor:hand !important;
color:#21c87a !important;
}
.updateForms{
width:400px;
}
input.AddressChk{
display:block;
margin:0 auto !important;
text-align:center;
}
</style>
</head>
<body>
<c:if test="${empty venue }">
	<script>
	alert('로그인이 필요합니다.')
	location.href='/venue/grabit?page=main';
	</script>
</c:if>

    <input type="hidden" value="${venue.viNum}" id="currenVenueNum" i-data-menu="viNum" name="viNum">
	<input type="hidden" value="${param.miNum}" id="currenMenuNum" i-data-menu="miNum" name="miNum">
	
	<section class="bg-white" id="service">
		<div class="container">
			<div class="row ">
				<div class="col-lg-4">
					<div class="service-img">
                        <img src="/res/main_theme/img/work/10.jpg" alt="" id="miImg" data-venue="miImg" class="img-fluid" style="border: 10px solid #fff;">
	                    <input id="miImgFile" type="file" name="miImgFile" class="form-control">
					</div>
				</div>

				<div class="col-lg-6 pl-4">
					<div class="service-content">
						<h1 class="miName" name="miName"></h1>
						<td>메뉴 이름<input type="text" name="miName" class="form-control"></td>
						<td>메뉴 소개말<input data-menu="miIntro" name="miIntro" class="form-control"></td>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	<div class="container" id="content-area">
		<table id="viewTb">
				<tr>
					<th colspan="2" style="text-align:center;"><a class="updateMenuInfo" style="color:#21c87a !important;">정보 수정</a></th>
				</tr>
				<tr>	
					<th >카테고리</th>
					<td><select data-Menu="mcCode">
						<option value=1>001 커피</option>
						<option value=2>002 차</option>
						<option value=3>003 에이드</option>
						<option value=4>004 스무디</option>
						<option value=5>005 블렌디드 음료</option>
						<option value=6>006 베이커리</option>
					</select></td>
				</tr>
				<tr>	
					<th >가격</th>
					<td><input type="number" data-menu="miPrice" class="form-control" name="miPrice"></td>
				</tr>
				<tr>
				<th class="btn btn-white btn-block btn-circled updatebtn" onclick="updatebtn()">저장</th>
				</tr>
			</table>
	</div>
<script>

//view
var imgPath = "https://spring-test-haley.s3.ap-northeast-2.amazonaws.com/test/";
$(document).ready(function(){
    function updatebtn(){
    var objs = document.querySelectorAll('input[i-data-menu],textarea[name]')
	var formData = new FormData(); 
		for(var i=0;i<objs.length;i++){
			var obj = objs[i];
			if(obj.type=='file'){
				if(obj.files.length){
				formData.append(obj.name, obj.files[0]);
				console.log(obj.files[0]);
				}
			}else{
				formData.append(obj.name, obj.value);
			}
		}
	//유효성 검사 
	if($('[name=miName]').val().trim().length < 1){
		alert('메뉴 이름을 입력해 주세요.');
		return false;
	}
	if($('[name=miIntro]').val().trim().length < 1){
		alert('메뉴 소개말을 입력해 주세요.');
	}
	if($('[name=mcCode]').val() == 0){
		alert('카테고리를 선택해 주세요.');
		return false;
	}
	if($('[name=miPrice]').val().trim().length < 1){
		alert('메뉴 가격을 입력해 주세요.');
		return false;
	}
	
	//업데이트
	$.ajax({
		url:'/menu/insert',
		method:'POST',	
		data:formData,
		contentType:false,
		processData: false,
		success:function(res){
			console.log(res);
			location.href='/venue/grabit?page=menu-managing';
		},
		error:function(res){
			alert('다시 시도해주세요.');
		}
	});	
   }
    document.querySelector('#content-area')
})

</script>
</body>
</html>