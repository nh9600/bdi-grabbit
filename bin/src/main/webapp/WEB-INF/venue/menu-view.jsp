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

    <input type="hidden" value="${venue.viNum}" id="currenVenueNum">
	<input type="hidden" value="${param.miNum}" id="currenMenuNum">
	
	<section class="bg-white" id="service">
		<div class="container">
			<div class="row ">
				<div class="col-lg-4">
					<div class="service-img">
						<img src="/res/main_theme/img/work/10.jpg" alt=""
							data-Menu="miImg" class="img-fluid"
							style="border: 10px solid #fff;">
					</div>
				</div>

				<div class="col-lg-6 pl-4">
					<div class="service-content">
						<h1 class="miName" data-Menu="miName"></h1>
						<p data-Menu="miIntro"></p>
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
					<td data-Menu=mcCode ></td>
				</tr>
				<tr>	
					<th >가격</th>
					<td data-Menu="miPrice"></td>
				</tr>
				<tr>
					<th >사진</th>
					<td data-Menu="miImg"></td>
				</tr>
			</table>
	</div>
<script>

//view
var list;
$(document).ready(function(){
	$.ajax({
		url:'/menu?miNum='+$('#currenMenuNum').val(),
	    method:'GET',
	    success:function(res){
	    	console.log(res)
	    	list = res;
	    	
	    	//메뉴 이름
	    	const h = document.querySelector('h1[data-Menu]');
	    	h.innerHTML = list.miName;
	    	//메뉴 소개말
	    	const p = document.querySelector('p[data-Menu]');
	    	p.innerHTML = '<input class="form-control" readonly="readonly" value="'+ list.miIntro +'">';
	    	
	    	var tds = document.querySelectorAll('td[data-Menu]');
	    	for(var idx = 0; idx < tds.length; idx++){
	    		var attr = tds[idx].getAttribute('data-venue');
	    		var td = tds[idx];
	    		var key = td.getAttribute('data-Menu');
	    		td.innerHTML = '<input class="form-control" name="miName" readonly="readonly" value="'+list[key]+'">';
	    	}
	    }
	});

})

//정보 수정 버튼 클릭시 값을 수정할 수 있게 바뀜
$('.updateMenuInfo').on('click',function(){
	//메뉴 이름
	const h = document.querySelector('h1[data-Menu]');
	h.innerHTML = '<input name="miName" value="'+ list.miName +'">';
	//메뉴 소개말
	const p = document.querySelector('p[data-Menu]');
	p.innerHTML = '<input name="miIntro" class="form-control" value="'+ list.miIntro +'">';
	var tds = document.querySelectorAll('td[data-Menu]');
	for (var i = 0; i < tds.length; i++) {
	var td = tds[i];
	var id = td.getAttribute('data-Menu');
	if(id=='mcCode'){
		td.innerHTML = '<select name="mcCode"><option value=0>선택 </option><option value=1>001 커피 </option><option value=2>002 차 </option><option value=3>003 에이드 </option><option value=4>004 스무디 </option><option value=5>005 블렌디드 음료 </option><option value=6>006 베이커리 </option></select>';
	}else if(id=='miPrice'){
		td.innerHTML = '<input class="form-control" name="miPrice" value="'+list[id]+'">';
	}else if(id=='miImg'){
		td.innerHTML = '<input class="form-control" name="miImg"  value="'+list[id]+'">';
	  }
	}
	
	var btn = '';
	if($('.updatebtn').length==0){
	btn = document.createElement('button');
		btn.className='btn btn-white btn-block btn-circled updatebtn';
		btn.style.width='200px';
		btn.style.margin='10px auto';
		btn.innerText = '수정';
	}

    btn.onclick = function updateMenu(){
	var param = {
			viNum : ${venue.viNum},	
			mcCode : $('[name=mcCode]').val(),
			miNum : $('#currenMenuNum').val(),
			miName : $('[name=miName]').val(),
			miPrice : $('[name=miPrice]').val(),
			miImg : $('[name=miImg]').val(),
			miIntro : $('[name=miIntro]').val()
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

	$.ajax({
		url:'/menu/update',
		method:'PUT',	
		data:JSON.stringify(param),
		contentType:'application/json; charset=utf-8',
		success:function(res){
			alert(res.msg);
			console.log(res);
			location.href='/venue/grabit?page=menu-view&miNum='+ $('#currenMenuNum').val();
		},
		error:function(res){
			alert('다시 시도해주세요.');
		}
	});	
   }
    document.querySelector('#content-area').appendChild(btn)
})

//update 

</script>
</body>
</html>