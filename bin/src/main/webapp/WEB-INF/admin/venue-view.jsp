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

button {
	font-size: 1rem !important;
}

#viewTb {
	margin: 0 auto;
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
	padding-top: 30px;
	padding-bottom: 50px;
	margin-bottom: 50px;
}

.service-block {
	width: 270px;
}

tr, th, td {
	height: 50px;
}

th {
	width: 100px;
}

td {
	width: 200px;
}

a.updateVenueInfo :hover {
	cursor: hand !important;
	color: #21c87a !important;
}

.updateForms {
	width: 400px;
}

input.AddressChk {
	display: block;
	margin: 0 auto !important;
	text-align: center;
}
</style>
</head>
<body>
	<section class="bg-white" id="service">
		<div class="container">
			<div class="row ">
				<div class="col-lg-4">
					<div class="service-img">
						<img src="/res/main_theme/img/work/10.jpg" alt="" id="viImg" data-venue="viImg" class="img-fluid" style="border: 10px solid #fff;">
	                    <input id="viImgFile" type="file" name="img" class="form-control">
					</div>
				</div>

				<div class="col-lg-6 pl-4">
					<div class="service-content">
						<h1 class="cafeName" data-venue="viName">카페 이름</h1>
						<p data-venue="viIntro">카페 설명</p>
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
												<a data-venue="viStatus" data-viStatus="open" onclick="changeStatus(this)" style="font-size: 15px;" class="btn btn-white btn-block btn-circled"><span>open</span></a>
											</div>
										</div>
									</div>
									<div class="col-lg-6">
										<div class="service-block media">
											<div class="service-icon">
												<i class="ti-lock"></i>
											</div>
											<div class="service-inner-content ">
												<a data-venue="viStatus" data-viStatus="close" onclick="changeStatus(this)" style="font-size: 15px;" class="btn btn-white btn-block btn-circled"><span>close</span></a>
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
								<a class="updateVenueInfo" style="color: #21c87a !important;">정보
									수정</a>
								<a class="updateCancle" style="color: #21c87a !important;">수정 취소</a>
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
				<th>번호</th>
				<td data-venue="viNum"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td data-venue="viPwd"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td data-venue="viAddr"></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td data-venue="viTel"></td>
			</tr>
			<tr>
				<th>영업일</th>
				<td data-venue="viBusinessdays"></td>
			</tr>
			<tr>
				<th>영업시간</th>
				<td data-venue="viBusinesshours"></td>
			</tr>
		</table>
	</div>

	<script>
	$(document).ready(function(){
		
		$.ajax({
			url:'/getVenue?viNum='+ ${param.num},
			method:'GET',
			success:function(res){
				console.log(res);
				const tds = document.querySelectorAll('[data-venue]');
				console.log(tds);
				function inner(){
					$('.updateCancle').hide();
					$('#viImgFile').hide();
					tds[0].setAttribute('src','/res/images/' + res.venue.viImg);
					tds[1].innerHTML = res.venue.viName;
					tds[2].innerHTML = res.venue.viIntro;
					if(res.venue.viStatus=='open'){
						tds[3].style='background-color: #21c87a;'
					}else{
						tds[4].style='background-color: #21c87a;'
					}
					tds[5].innerHTML = res.venue.viNum;
					tds[6].innerHTML = res.venue.viPwd;
					tds[7].innerHTML = res.venue.viAddr;
					tds[8].innerHTML = res.venue.viTel;
					tds[9].innerHTML = res.venue.viBusinessdays;
					tds[10].innerHTML = res.venue.viBusinesshours;
				}
				inner();
				
				$('.updateVenueInfo').click(function(){
					$('.updateCancle').show();
					$('#viImgFile').show();
					tds[2].innerHTML = '<textarea class="updateForms form-control" id="viIntro" cols="50" rows="5">' + res.venue.viIntro + '</textarea>';
					tds[6].innerHTML = '<input type="text" id="viPwd" class="updateForms form-control" value="'+ res.venue.viPwd +'">';
					tds[7].innerHTML = '<input type="text" id="viAddr" class="updateForms form-control" value="'+ res.venue.viAddr +'" readonly>';
					tds[7].innerHTML += '<input type="text" id="addrDetail" class="form-control" placeholder="예) 상세주소 입력란 *">';
					tds[7].innerHTML += '<button class="btn btn-dark btn-send addrChk-btn" onclick="goPopup()" style="font-size:15px; height:45px;padding: 0.5rem 1.0rem;">주소찾기</button><div class="help-block with-errors"></div>';
					tds[8].innerHTML = '<input type="text" id="viTel" class="updateForms form-control" value="'+ res.venue.viTel +'">';
					tds[9].innerHTML = '<input type="text" id="viBusinesshours" class="updateForms form-control" value="'+ res.venue.viBusinessdays +'">';
					tds[10].innerHTML = '<input type="text" id="viBusinessdays" class="updateForms form-control" value="'+ res.venue.viBusinesshours +'">';
					tds[10].innerHTML += '<button class="btn btn-dark btn-send addrChk-btn" onclick="valChk()" style="font-size:15px; height:45px;padding: 0.5rem 1.0rem;">수정</button>'
					$('.updateCancle').click(function(){
						inner();
					})
				})
				
				
			}, 
			error:function(res){
				console.log(res);
			}
		})
	})
	//유효성검사
		function valChk(){
			if($.trim($('#viAddr').val()).length<1){
				alert('주소명을 입력해주세요');
				return;
			}
			if($.trim($('#addrDetail').val()).length<1){
				alert('상세주소를 입력해주세요');
				return;
			}

			var pNum = $("#viTel").val();
		    var ev = /^[0-9]{2,3}[-]+[0-9]{3,4}[-]+[0-9]{4}$/
		    var nev = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/
		    
		    if(!ev.test(pNum)){
		        if (!nev.test(pNum)) {
		        	alert("올바른 전화번호를 입력하세요");
		        	return false;
		        }
		    } 
			
			if($.trim($('#viIntro').val()).length<5){
				alert('매장 소개글은 5글자 이상 입력 해주세요');
				return;
			}
			if($.trim('#viBusinessdays').length<1){
				alert('영업요일을 자세히 입력해주세요');
				return ;
			}
			if($.trim('#viBusinesshours').length<1){
				alert('영업시간이 올바르지 않습니다');
				return ;
			}
			
			$.ajax({
				url:'/getVenue',
				method:'GET',
				data: 'viTel=' + $('#viTel').val().trim(),
				success:function(res){
					console.log(res);
					console.log(res.venue.viNum);
					console.log(${param.num});
					 if(res.result == 'true' && res.venue.viNum != ${param.num}){
						 alert('이미 사용중인 전화번호입니다.');
					}else{
						updateVenue();
					}
				}, 
				error:function(res){
					alert('회원가입 실패');
				}
			})
		}
		
		function updateVenue(){
			var objs = document.querySelectorAll('input[id],textarea[id]')
			var formData = new FormData(); 
			for(var i=0;i<objs.length;i++){
				var obj = objs[i];
				if(obj.type=='file'){
					if(obj.files.length){
					formData.append(obj.id, obj.files[0]);
					console.log(obj.files[0]);
					}
				}else{
					formData.append(obj.id, obj.value);
				}
				formData.append('viNum', ${param.num});
			}
			$.ajax({
				method:'PUT',
				url:'/updateVenue',
				data: formData,
				contentType: false,
				processData: false,
				success:function(res){
					alert(res.msg);
					//location.href='/venue/grabit?page=venue-view&num=' + ${param.num};
				}
			})
		}
	
		function changeStatus(sts){
			const currentState = $(sts).children().text();
			console.log(currentState);
			 $.ajax({
				url:'/venue/changeSts',
				method:'POST',
				data:{
					viNum : ${param.num},
					viStatus : currentState
				},
				success:function(res){
					if(res==1){
						alert('정상적으로 변경되었습니다.');
						location.href='/venue/grabit?page=venue-view&num=' + ${param.num};
					}else{
						alert('다시 시도해 주세요.')
					}
				},
				error:function(res){
					
				}
				
			}) 
		}
	
		function goPopup(){
			var pop = window.open("/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 		
		}
		
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			$('#viAddr').val(roadFullAddr);
			$('#addrDetail').val(addrDetail);
		}
		
		
</script>

</body>
</html>