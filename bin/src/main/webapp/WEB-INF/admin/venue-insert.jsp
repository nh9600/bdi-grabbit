<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.venueInsert-container{
padding-top:40px;
}
.venueInsert-form{
padding-top:40px;
display:block;
margin:0 auto;
}
.venueInsert-h1{
padding-bottom:30px;
}
.venueInsert-btn{
margin-top:40px;
margin-bottom:40px;
}
</style>
</head>
<body>
  <div class="container venueInsert-container">
            <div class="row venueInsert-form">
                <div class="col-lg-8 col-lg-offset-2">
                    <h1 class="venueInsert-h1">가맹점 추가</h1>
                        <div class="messages"></div>
                        <div class="controls">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="form_name">매장 이름 *</label>
                                        <input id="form_name" type="text" name="name" class="form-control" placeholder="예) 스타벅스 가산디지털점 *" required="required" data-error="Firstname is required.">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                             </div>
                             <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="form_lastname">매장 주소 *</label>
                                        <input type="text" id="roadFullAddr" class="form-control" placeholder="예) 서울특별시 금천구 가산디지털1로 168 *" readonly="readonly">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input type="text" id="addrDetail" class="form-control" placeholder="예) 상세주소 입력란 *">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-6" >
                                    <div class="form-group" >
                                        <button class="btn btn-dark btn-send addrChk-btn" onclick="goPopup()" style="font-size:15px; height:45px;padding: 0.5rem 1.0rem;" >주소찾기</button>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="form_phone">매장 번호</label>
                                        <input id="viTel" type="tel" name="phone" class="form-control" placeholder="예) 000-0000-0000 *">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="form_message">매장 소개 *</label>
                                        <textarea id="form_message" name="message" class="form-control" placeholder="예) 시애틀에 본사를 두고 있고 간단한 스낵과 무료 Wi-Fi를 제공하는 유명 커피 체인점입니다. *" rows="4" required="required" data-error="Please,leave us a message."></textarea>
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="row">
	                                <div class="col-md-12">
	                                    <p class="text-muted" style="padding-left:20px;"><strong>*</strong> 표시된 항목은 필수항목 입니다</p>
	                                </div>
                           	 	</div>
                                <div class="col-md-12">
                                    <input type="submit" style="font-size:15px;"class="btn btn-success btn-send venueInsert-btn" value="가맹 등록" onclick="valChk()">
                                </div>
                            </div>
                        </div>
                </div>
            </div> <!-- /.row-->
        </div> <!-- /.container-->
        
	<script>
		function goPopup(){
			// 주소검색을 수행할 팝업 페이지를 호출합니다.
			// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
			var pop = window.open("/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 		
		}
		
		function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
			// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
			$('#addrDetail').val(addrDetail);
			$('#roadFullAddr').val(roadFullAddr);
		}
		
		//유효성검사
		function valChk(){

			if($.trim($('#form_name').val()).length<5){
				alert('매장명의 길이는 5자 이상입니다');
				return;
			}
			if($.trim($('#roadFullAddr').val()).length<1){
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
			
			if($.trim($('#form_message').val()).length<5){
				alert('매장 소개글은 5글자 이상 입력 해주세요');
				return;
			}
			insertVenue();
		}
		
		function insertVenue(){
			
			$.ajax({
				url:'/getVenue',
				method:'GET',
				data: 'viTel=' + $('#viTel').val().trim(),
				success:function(res){
					console.log(res);
					 if(res.result == 'true'){		
						alert('이미 사용중인 전화번호입니다.');
					}else{						
						$.ajax({
							url : '/insertVenue',
							method : 'GET',
							data : 'viName=' + $('#form_name').val() + '&viAddr=' + $('#roadFullAddr').val() + ' ' + $('#addrDetail').val() + '&viTel=' + $('#viTel').val() + '&viIntro=' + $('#form_message').val(),
							success : function(res) {
								alert(res.msg);
								location.href="/venue/grabit?page=venues"
							},
							error : function(res){
								console.log(res);
							}
						})  
					}
				}, 
				error:function(res){
					alert('회원가입 실패');
				}
			})
		}
	</script>
</body>
</html>