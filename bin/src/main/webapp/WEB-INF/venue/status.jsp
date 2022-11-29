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
tr, th, td{
height:50px;
}
th{
width:100px;
}
td{
width:200px;
}
a.updateVenueInfo :hover{
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
	<input type="hidden" value="${venue.viNum }" id="currenVenueNum">
	<section class="bg-white" id="service">
		<div class="container">
			<div class="row ">
				<div class="col-lg-4">
					<div class="service-img">
						<img src="/res/main_theme/img/work/10.jpg" alt=""
							data-venue="viImg" class="img-fluid"
							style="border: 10px solid #fff;">
					</div>
				</div>

				<div class="col-lg-6 pl-4">
					<div class="service-content">
						<h1 class="cafeName" data-venue="viName">${venue.viName}</h1>
						<p data-venue="viIntro">${venue.viIntro}</p>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="pt-5 service-wrap">
		<div class="container">
			<div class="row ">
				<div class="col-lg-6 offset-lg-4">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="col-lg-12">
								<div class="row">
									<div class="col-lg-6">
										<div class="service-block media">
											<div class="service-icon" style="">
												<a><i class="ti-unlock"></i></a>
											</div>
											<div class="service-inner-content ">
												<a data-venue="viStatus" data-viStatus="open" onclick="changeStatus(this)" style="font-size:15px;" class="btn btn-white btn-block btn-circled"><span>open</span></a>
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="service-block media">
											<div class="service-icon">
												<i class="ti-lock"></i>
											</div>
											<div class="service-inner-content ">
												<a data-venue="viStatus" data-viStatus="close" onclick="changeStatus(this)" style="font-size:15px;" class="btn btn-white btn-block btn-circled"><span>close</span></a>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-12">
							<p class="pl-3">
								<a class="updateVenueInfo" style="color:#21c87a !important; " >정보 수정</a>	
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<div class="container" id="content-area">
		<table id="viewTb">
				<tr class="price-features list-unstyled">
					<th >번호</th>
					<td data-venue="viNum">${venue.viNum}</td>
				</tr>
				<tr>	
					<th >비밀번호</th>
					<td data-venue="viPwd" >******</td>
				</tr>
				<tr>	
					<th >주소</th>
					<td data-venue="viAddr">${venue.viAddr}</td>
				</tr>
				<tr>
					<th >전화번호</th>
					<td data-venue="viTel">${venue.viTel}</td>
				</tr>
				<tr>
					<th >영업일</th>
					<td data-venue="viBusinessdays">${venue.viBusinessdays}</td>
				</tr>
				<tr>
					<th >영업시간</th>
					<td data-venue="viBusinesshours">${venue.viBusinesshours}</td>
				</tr>
			</table>
	</div>

	<script>
		window.onload = function() {
			if(`${venue.viStatus}`=='open'){
				document.querySelector('a[data-viStatus=open]').style='background-color: #21c87a;'
			}else{
				document.querySelector('a[data-viStatus=close]').style='background-color: #21c87a;'
			}
			//정보 수정 버튼을 눌렀을 경우, input 태그가 나타나는 함수 입니다.
			$('.updateVenueInfo').on('click',function(){
				const p = document.querySelector('p[data-venue]');
				p.innerHTML = '<textarea class="updateForms form-control" name="viIntro" cols="50" rows="5">'+`${venue.viIntro}`+'</textarea>'
				const tds = document.querySelectorAll('td[data-venue]');
				for(var i=0;i<tds.length;i++){
					var attr = tds[i].getAttribute('data-venue');
					if(attr=='viNum'){
						
					}else if(attr=='viPwd'){
						tds[i].innerHTML = '<input type="password" name="viPwd" class="updateForms form-control viPwd" value="'+`${venue.viPwd}`+'">';
					}else if(attr=='viAddr'){
						tds[i].style.height='200px';
						tds[i].style.lineHeight='40px';
						tds[i].innerHTML = '<input type="text" class="updateForms form-control viAddr" id="roadFullAddr" name="roadFullAddr" value="'+`${venue.viAddr}`+'" readonly="readonly">';
						tds[i].innerHTML += '<input type="text" class="updateForms form-control viAddr" id="addrDetail"  name="addrDetail" >';
						tds[i].innerHTML += '<input type="button" class="btn btn-dark btn-circled AddressChk" onClick="goPopup()" value="주소찾기">';
					}else if(attr=='viTel'){
						tds[i].innerHTML = '<input type="text" name="viTel" class="updateForms form-control viTel" value="'+`${venue.viTel}`+'">';
					}else if(attr=='viBusinessdays'){
						tds[i].innerHTML = '<input type="text" name="viBusinessdays" class="updateForms form-control viBusinessdays" value="'+`${venue.viBusinessdays}`+'">';
					}else if(attr=='viBusinesshours'){
						tds[i].innerHTML = '<input type="text" name="viBusinesshours" class="updateForms form-control viBusinesshours" value="'+`${venue.viBusinesshours}`+'">';
					}
				}
				//생성된 input태그들 밑에 수정완료 버튼이 나타나게 하는 로직과 해당 버튼을 눌렀을 경우, 정보가 수정될 수 있도록 하는 함수입니다.
				var btn = '';
				if($('.updatebtn').length==0){
					btn = document.createElement('button');
					btn.className='btn btn-white btn-block btn-circled updatebtn';
					btn.style.width='200px';
					btn.style.margin='10px auto';
					btn.innerText = '수정';
				}
				btn.onclick = function updateVi(){
					const param = {
						viNum:`${venue.viNum}`,
						viIntro:$('[name=viIntro]').val(),
						viPwd:$('[name=viPwd]').val(),
						viAddr:$('[name=roadFullAddr]').val() +' '+$('[name=addrDetail]').val(),
						viTel:$('[name=viTel]').val(),
						viBusinessdays:$('[name=viBusinessdays]').val(),
						viBusinesshours:$('[name=viBusinesshours]').val(),
					}
					if($.trim(param.viPwd).length<5){
						alert('비밀번호는 5자 이상입니다');
						return ;
					}
					if($.trim(param.viAddr).length<1){
						alert('주소를 입력해주세요');
						return ;
					}
					if($.trim(param.viTel).length<9){
						alert('전화번호를 올바르게 입력해주세요');
						return ;
					}
					if($.trim(param.viIntro).length<5){
						alert('매장 소개글은 5자 이상 입력해주세요');
						return ;
					}
					if($.trim(param.viBusinessdays).length<1){
						alert('영업요일을 자세히 입력해주세요');
						return ;
					}
					if($.trim(param.viBusinesshours).length<1){
						alert('영업시간이 올바르지 않습니다');
						return ;
					}
					$.ajax({
						method:'POST',
						url:'/venue/update',
						contentType:'application/json',
						data:JSON.stringify(param),
						success:function(res){
							alert(res.msg);
							location.href='/venue/grabit?page=status';
						}
					})
				};
				document.querySelector('#content-area').appendChild(btn)
			})
		}
		//open / close 버튼으로 영업상태 변경
		function changeStatus(sts){
			//open을 눌렀다면 누른버튼의 innerText를 가져옴 => 바뀌길 바라는 상태(close 에서 open으로)
			const changeStatusTo = $(sts).children().text();
			$.ajax({
				url:'/venue/changeSts',
				method:'POST',
				data:{
					viNum:`${venue.viNum}`,
					viStatus:changeStatusTo
				},
				success:function(res){
					if(res==1){
						alert('정상적으로 변경되었습니다.');
						location.href='/venue/grabit?page=status';
					}else{
						alert('다시 시도해주세요.')
					}
				},
				error:function(res){
					alert('다시 시도해주세요')
				}
			})
		}
		//주소 찾기 버튼 누를 경우 발생하는 함수
		function goPopup(){
			var pop = window.open("/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 		
		}
		
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			$('#roadFullAddr').val(roadFullAddr);
			$('#addrDetail').val(addrDetail);
		}
	</script>
</body>
</html>