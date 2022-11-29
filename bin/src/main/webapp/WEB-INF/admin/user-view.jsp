<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
                <div class="col-lg-12">
                    <h1 class="venueInsert-h1">내 정보 </h1>                
                        <div class="messages"></div>
                        <div class="controls">
                            <div class="row">
                                <div class="col-md-6">
	                              	<div class="form-group">
	                              		<img id="userImg" src="/res/main_theme/img/work/10.jpg" alt=""
										data-user="viImg" class="img-fluid"
										style="border: 10px solid #fff;">
	                               	</div>
	                            </div>                              
	                            <div class="col-md-6">
	                              	<div class="form-group">
	                              		<label for="form_name">이미지</label>
	                               		<input id="uiImg" type="file" name="img" class="form-control"><br><br>
	                               		
	                               	<div class="form-group" style="overflow:auto; width:100%; height:350px;">
                                        <label for="form_message">즐겨찾기 목록</label>
                                       
                                        	<ul id="bkmark">
          									</ul>
          							
                                        <div class="help-block with-errors"></div>
                                    </div>

	                              	</div>
                                </div>
 
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="form_name">이름</label>
                                        <input id="uiName" type="text" name="name" class="form-control" value="" placeholder="">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                       			<div class="col-md-6">
                                   <div class="form-group">
                                       <label for="form_name">연락처</label>
                                      <input id="uiTel" type="text" name="tel" class="form-control" value="" placeholder="">
                         	       <div class="help-block with-errors"></div>
                                </div>
                             	</div>
                             </div>
                             <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="form_lastname">이메일</label>
                                        <input type="text" id="uiEmail" class="form-control" value="" placeholder="">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="form_lastname">주소</label>
                                        <input type="text" id="uiAddr" class="form-control" value="" placeholder="">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                               		<input type="button" class="btn btn-success btn-send venueInsert-btn" value="비밀번호 변경" data-toggle="modal" data-target="#myModal" style="font-size:15px;">
                                    <input type="button" class="btn btn-success btn-send venueInsert-btn" value="수정" onclick="updateUser()" style="font-size:15px; float:right;">
                                </div>  
                     		</div>                                
                                <input id="uiNum" type="text" value="${param.num}" hidden>
                            </div>
                        </div>
                </div>
            </div>
        </div>
        
    <!-- Modal -->
    <div class="modal fade bs-example-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">    
      <div class="modal-dialog modal-sm">
        <div class="modal-content">

          <!-- Modal Header -->
          <div class="modal-header">
            <h3 class="modal-title" id="lineModalLabel">비밀번호 변경</h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>

          <!-- Modal body -->
          <div class="modal-body"> 
                <div class="form-group">
                    <label for="usrPwd">* 비밀번호</label>
                    <input type="password" id="uiPwd" class="form-control" placeholder="" data-title="비밀번호를" maxlength="29"/>
                </div>  
                
                <div class="form-group">
                    <label for="usrPwdCk">* 비밀번호 확인</label>
                    <input type="password" id="uiPwdCk" class="form-control" placeholder="" data-title="비밀번호를" maxlength="29"/>
                </div>           
				<div style="float: right;">
				<input type="button" class="btn btn-primary btn-circled" data-dismiss="" value="수정 완료" onclick="updatePwd()" style="font-size:15px; float:right;">	
				</div>          
          </div>  
   		</div>  
      </div>   
    </div>               

	<!-- View Script --> 
	<script>
	$(document).ready(function(){
		$.ajax({
			url:'/user',
			method:'GET',
			data:'uiNum=' + ${param.num},
			success:function(res){
				console.log(res);
				$('#userImg').attr('src', '/res/images/' + res.UserInfo.uiImgname);
				$('#uiName').val(res.UserInfo.uiName);
				$('#uiName').attr('placeholder',res.UserInfo.uiName);
				$('#uiAddr').val(res.UserInfo.uiAddr);
				$('#uiAddr').attr('placeholder',res.UserInfo.uiAddr);			
				$('#uiTel').val(res.UserInfo.uiTel);
				$('#uiTel').attr('placeholder',res.UserInfo.uiTel);
				$('#uiEmail').val(res.UserInfo.uiEmail);	
				$('#uiEmail').attr('placeholder',res.UserInfo.uiEmail);
				
				var html = '';			
				for(var i=0;i<res.UserBkmark.length;i++) {
					html += '<li>' + res.UserBkmark[i] + '<a href="" class="close">&times;</a></li>&nbsp;';
				}
				document.querySelector('#bkmark').innerHTML = html;		
			},
			error:function(res){
				alert("fail");			
			}
		})
	})
	</script>

	<!-- Update Script -->
	<script>
	function updateUser(){
		if(valCk()==true){
			var objs = document.querySelectorAll('input[id],textarea[id]')
			var formData = new FormData(); 
			for(var i=0;i<objs.length;i++){
				var obj = objs[i];
				if(obj.type=='file'){
					if(obj.files.length){
					formData.append(obj.id, obj.files[0]);
					}
				}else{
					formData.append(obj.id, obj.value);
				}
			}
			console.log(formData);
			$.ajax({
				url:'/user',
				method:'PUT',
				data: formData,
				contentType: false,
				processData: false,
				success:function(res){
					alert("수정 성공!");
					$('#myModal').modal("hide");
				},
				error:function(res){	
					alert('수정 실패..');
				}
			})
		}
	}
	
	function updatePwd(){
		if($("#uiPwd").val().length<5){
			alert('비밀번호는 5글자 이상입니다');
			$("#uiPwd").focus();
			return false;
		} else if($("#uiPwd").val() != $("#uiPwdCk").val()){
		    alert("비밀번호가 일치하지 않습니다.");
		    $("#uiPwd").focus();
			return false;
		} 
		updateUser();
	}
	
	</script>

	<!-- Validation Check Script -->
	<script>
	function valCk(){
		if($("#uiName").val() == ''){
		    alert('이름을 입력해주세요.');
		    return false;
		} 
		
		if($("#uiTel").val() == ''){
		    alert('전화번호를 입력해주세요.');
		    return false;
		} else if(valCkTel() == false) {
			return false;
		}
		
		if($("#uiEmail").val() == ''){
		    alert('이메일을 입력해주세요.');
		    return false;
		} else if(valCkEmail() == false) {
			return false;
		}
		
		return true;
	}
	
	function valCkEmail() {
		var email = $("#uiEmail").val();
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    if(!re.test(email)) {
	        alert("올바른 이메일 주소를 입력하세요");
	        return false;
	    } else{
			$.ajax({
		 		url:'/user',
		 		method:'GET',
		 		data: 'uiEmail=' + $('#uiEmail').val().trim(),
		 		success:function(res){	 			
		 			if(res.UserInfo.uiEmail != null && res.UserInfo.uiEmail != $('#uiEmail').attr('placeholder')){
		 				alert('이미 사용중인 이메일입니다.');
		 			} 
		 		}, 
		 		error:function(res){
		 			alert('회원가입 실패');
		 		}
		 	})
			return true;
		}
	}
	
	function valCkTel() {
		var pNum = $("#uiTel").val();
	    var ev = /^[0-9]{2,3}[-]+[0-9]{3,4}[-]+[0-9]{4}$/
	    var nev = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/
	    
	    if(!ev.test(pNum)){
	        if (!nev.test(pNum)) {
	        	alert("올바른 전화번호를 입력하세요");
	        	return false;
	        }
	    } 
			
		$.ajax({
			url:'/user',
			method:'GET',
			data: 'uiTel=' + $('#uiTel').val().trim(),
			success:function(res){
				if(res.UserInfo.uiTel != null && res.UserInfo.uiTel != $('#uiTel').attr('placeholder')){		
					alert('이미 사용중인 전화번호입니다.');
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