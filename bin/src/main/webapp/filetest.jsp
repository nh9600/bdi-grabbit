<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
        <script src="/res/main_theme/js/jquery.min.js"></script>
</head>
<body>
<div class="container">
	제목 : <input type="text" id="pbTitle"><br>
	내용 : <textarea id="pbContent"></textarea><br>
	유저 : <input type="number" id="creusr"><br>
	이미지 : <input type="file" id="pbImg"><br>
	<button onclick="submit()">등록</button>
</div>


https://spring-test-haley.s3.ap-northeast-2.amazonaws.com/test/ 


<script>
function submit(){
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
	
 	$.ajax({
		url:'/fileupload',
		method:'POST',
		data : formData,
		contentType: false,
		processData: false,
		success:function(res){
			alert('성공!');
		}, 
		error:function(res){
 			alert('실패');
 		}
 	})
}	
	
</script>


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
                                        <input id="uiName" type="text" name="name" class="form-control" value="${user}" placeholder="">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                       			<div class="col-md-6">
                                   <div class="form-group">
                                       <label for="form_name">연락처</label>
                                      <input id="uiTel" type="text" name="tel" class="form-control" value="${userTel}" placeholder="">
                         	       <div class="help-block with-errors"></div>
                                </div>
                             	</div>
                             </div>
                             <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="form_lastname">이메일</label>
                                        <input type="text" id="uiEmail" class="form-control" value="${userEmail}" placeholder="">
                                        <div class="help-block with-errors"></div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="form_lastname">주소</label>
                                        <input type="text" id="uiAddr" class="form-control" value="${userAddr}" placeholder="">
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
                                <input id="uiNum" type="text" value="2" hidden>
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
			data:'uiNum=' + '2',
			success:function(res){
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
</body>
</html>