<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
	<link rel="icon" type="image/png" href="/res/app-theme/login/images/icons/favicon.ico"/>
	<link rel="stylesheet" type="text/css" href="/res/app-theme/login/vendor/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/res/app-theme/login/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" type="text/css" href="/res/app-theme/login/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
	<link rel="stylesheet" type="text/css" href="/res/app-theme/login/vendor/animate/animate.css">
	<link rel="stylesheet" type="text/css" href="/res/app-theme/login/vendor/css-hamburgers/hamburgers.min.css">
	<link rel="stylesheet" type="text/css" href="/res/app-theme/login/vendor/animsition/css/animsition.min.css">
	<link rel="stylesheet" type="text/css" href="/res/app-theme/login/vendor/select2/select2.min.css">
	<link rel="stylesheet" type="text/css" href="/res/app-theme/login/vendor/daterangepicker/daterangepicker.css">
	<link rel="stylesheet" type="text/css" href="/res/app-theme/login/css/util.css">
	<link rel="stylesheet" type="text/css" href="/res/app-theme/login/css/main.css">
	
<style>
/*Modal Style*/    
.center {
	margin-top:50px;   
}
.modal-header {
    padding-bottom: 5px;
}
.modal-footer {
    padding: 0;
}
.modal-footer .btn-group button {
	height:40px;
	border-top-left-radius : 0;
	border-top-right-radius : 0;
	border: none;
	border-right: 1px solid #ddd;
}
.modal-footer .btn-group:last-child > button {
	border-right: 0;
}
</style>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-l-85 p-r-85 p-t-55 p-b-55">
				<form class="login100-form validate-form flex-sb flex-w">
					<span class="login100-form-title p-b-32">
						Login
					</span>
					<span class="txt1 p-b-11">
						Id
					</span>
					<div class="wrap-input100 validate-input m-b-36" data-validate = "Username is required">
						<input class="input100" type="text"  id="uiId" >
						<span class="focus-input100"></span>
					</div>
					<span class="txt1 p-b-11">
						Password
					</span>
					<div class="wrap-input100 validate-input m-b-12" data-validate = "Password is required">
						<span class="btn-show-pass">
							<i class="fa fa-eye"></i>
						</span>
						<input class="input100" type="password" id="uiPwd">
						<span class="focus-input100"></span>
					</div>
					<div class="limiter" align="center">
						<button id="loginBtn" type="button" class="btn btn-primary btn-circled" style="font-size:15px;">
							로그인
						</button>
						<!-- 회원가입 눌렀을 시 다른페이지로 이동하게 부탁드립니다 -->
						<button id="joinBtn" type="button" class="btn btn-primary btn-circled" data-toggle="modal" data-target="#myModal" style="font-size:15px;">
							회원가입
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
	<!-- Login Script -->
	<script>
	$(document).ready(function(){
		$('#loginBtn').on('click',function(){
			var uiId = document.querySelector('#uiId');
			if(uiId.value.trim().length<5){
				alert('아이디는 5글자 이상입니다');
				uiId.value='';
				uiId.focus();
				return false;
			}
			var uiPwd = document.querySelector('#uiPwd');
			if(uiPwd.value.trim().length<5){
				alert('비밀번호는 5글자 이상입니다');
				uiPwd.value='';
				uiPwd.focus();
				return false;
			}
			var param = {
					uiId:$('#uiId').val(),
					uiPwd:$('#uiPwd').val()
			}
			param = JSON.stringify(param);
			$.ajax({
				url:'/login',
				url:'/user/login',
				method:'POST',
				data:param,
				beforeSend:function(xhr){
				},
				contentType:'application/json',
				success:function(res){
					if(res.result == 'true'){
						alert(res.user.uiName + '님 환영합니다.');
						opener.document.location.reload();
						close();		
						
						<!--로그인 성공시 웹소켓 세션 연결-->
						connectWebSocket();
					} else if(res.result == 'false'){
						alert('아이디와 비밀번호를 확인해주세요.');
					}
				},
				error:function(res){
					alert(res.user.msg);			
				}
			})
		})
	})
	function connectWebSocket(){
		var ws = new SockJS('/grabitWs');
		ws.onopen = function(res){
			alert('ws connected..userNum:`${userNum}`');
		}
		ws.onmessage = function(res){
			console.log(res.data);
		}
	}
	</script>

    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">    
      <div class="modal-dialog modal-lg">
        <div class="modal-content">
          <div class="modal-header">
            <h3 class="modal-title" id="lineModalLabel">회원가입</h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>
          <div class="modal-body"> 
                <div class="form-group">
	                <label for="usrId" style="float:left;">* 아이디 </label><button type="button" class="btn-info" onclick="valCkId()" style="float:right;">&nbsp;중복확인&nbsp;</button>  
	                <input type="text" id="usrId" name="usrId" class="form-control" placeholder="" data-title="아이디를" maxlength="16"/>          
                </div>
                <div class="form-group">
                    <label for="usrPwd">* 비밀번호</label>
                    <input type="password" id="usrPwd" name="usrPwd" class="form-control" placeholder="" data-title="비밀번호를" maxlength="29"/>
                </div>  
                <div class="form-group">
                    <label for="usrPwdCk">* 비밀번호 확인</label>
                    <input type="password" id="usrPwdCk" name="usrPwdCk" class="form-control" placeholder="" data-title="비밀번호를" maxlength="29"/>
                </div>          
                <div class="form-group">
                    <label for="usrName">* 이름</label>
                    <input type="text" id="usrName" name="usrName" class="form-control" placeholder="" data-title="이름을" maxlength="29"/>
                </div>
                <div class="form-group">
                    <label for="usrTel" style="float:left;">* 전화번호</label><button type="button" class="btn-info" onclick="valCkPn()" style="float:right;">&nbsp;중복확인&nbsp;</button>
                    <input type="text" class="form-control" id="usrTel" name="usrTel" placeholder="" data-title="전화번호를" maxlength="29"/>
                </div>
                <div class="form-group">
                    <label for="usrEmail" style="float:left;">* 이메일주소</label><button type="button" class="btn-info" onclick="valCkEmail()" style="float:right;">&nbsp;중복확인&nbsp;</button>
                    <input type="text" class="form-control" id="usrEmail" data-title="이메일 주소를" placeholder="">
                </div>
                <div class="form-group">
                    <label for="usrEmail" style="float:left;">* 주소</label>
                    <input type="text" class="form-control" id="usrAddr" data-title="주소를" placeholder="">
                </div>                    
                <div class="form-group">
                    <div class="box_scroll">
                        <strong class="terms_tit">개인정보 수집 및 이용에 관한 동의</strong>
                            <pre class= "pre-scrollable">
1. 수집&middot;이용 항목: 이름, 전화번호, 이메일 주소<br>
2. 수집&middot;이용 목적: 가입 문의자 및 가입 내용 확인<br>
3. 보유 기간: 문의 접수일로부터 1년<br>
동의하시지 않는 경우 가입이 불가능 합니다.
                            </pre>                                  
                    </div>
                	<input type="checkbox" id="agreeY" />  동의합니다.     
					<div style="float: right;"><button type="button" class="btn btn-primary btn-circled" data-dismiss="" onclick="javascript:valCk.insert();" style="font-size:15px;">제출</button></div>          
                </div>                      
            </div>                           
         </div>
        </div>
      </div>
  	
  	<!-- SignUp Script -->
	<script>
	function signUp(){
   	 	var param = {
				uiId : $('#usrId').val().trim(),
				uiPwd : $('#usrPwd').val().trim(),
				uiName : $('#usrName').val().trim(),
				uiEmail : $('#usrEmail').val().trim(),
				uiAddr : $('#usrAddr').val().trim(),
				uiTel : $('#usrTel').val().trim()
		} 	 	
		$.ajax({
			url:'/user',
			method:'POST',
			data:JSON.stringify(param),
		beforeSend : function(xhr){
			xhr.setRequestHeader('Content-type','application/json;charset=utf-8')
		},
			success:function(res){
				alert(res.msg);
			}, 
			error:function(res){
				alert('회원가입 실패');
			}
		})
	}
	</script>
	
	<!--  Validation Check Script -->
	<script>
	var valCk = {
	    insert: function test(){
	        if(valCk.validate.check()){
	            var email = $("#usrEmail").val();
	            var telChk = $('#usrTel').val();
	            $('.submit').attr('data-dismiss','');	
	           	// 이메일은 @, .~~ 포함되어있어야 된다.
	       		// 전화번호는 00000000000 or 000-0000-0000로 구성되어야 한다.  
	            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	            var ev = /^[0-9]{2,3}[-]+[0-9]{3,4}[-]+[0-9]{4}$/
	            var nev = /^[0-9]{2,3}[0-9]{3,4}[0-9]{4}$/            
	            if($("#usrPwd").val() != $("#usrPwdCk").val()){
	                alert("비밀번호가 일치하지 않습니다.");
	                $("#usrPwdCk").focus();
	           		return false;
	            }
	            if(!ev.test(telChk)){
		            if (!nev.test(telChk)) {
		            	alert("올바른 전화번호를 입력하세요");
		            	$("#usrTel").focus();
		            	return false;
		            }
	            } 
	            if(!re.test(email)) {
	                alert("올바른 이메일 주소를 입력하세요");
	                $("#usrEmail").focus();
	                return false;
	            }
	            if($("#agreeY").prop("checked") ) { 
	
	            }else {
	                alert("개인정보 수집 및 이용에 관한 약관에 동의 하셔야 합니다.");
	                $("#agreeY").first().focus();
	                return false;
	            } 	        
	        signUp();    
	        $('.btn-circled').attr('data-dismiss','modal');
	        }
	    },
	    validate: {
	        check: function(){
	            if($("[name=usrId]").val() == ''){
	                valCk.validate.warning($("[name=usrId]"));
	                return false;
	            } else if($("#usrId").val().length<5){
					alert('아이디는 5글자 이상입니다');
					$("#usrId").focus();
					return false;
				}
	            if($("#usrPwd").val() == ''){
	                valCk.validate.warning($("#usrPwd"));
	                return false;
	            } else if($("#usrPwd").val().length<5){
					alert('비밀번호는 5글자 이상입니다');
					$("#usrPwd").focus();
					return false;
				}
	            
	            if($("#usrPwdCk").val() == ''){
	                alert('비밀번호를 확인해주세요');
	                return false;
	            }
	            
	            if($("#usrName").val() == ''){
	                valCk.validate.warning($("#usrName"));
	                return false;
	            }
	            if($("#usrTel").val() == ''){
	                valCk.validate.warning($("#usrTel"));
	                return false;
	            }
	            if($("#usrEmail").val() == ''){
	                valCk.validate.warning($("#usrEmail"));
	                return false;
	            }
	            
	            return true;
	        }, 
	        warning: function(obj){
	            $('.submit').attr('data-dismiss','');
	            alert(obj.data('title') +' 입력해주세요.');
	            obj.focus();
	        },
	    },
	};
	
	function valCkId() {
		var id = $('#usrId').val().trim();
		if($('#usrId').val().trim()==''){
			alert('아이디를 입력해주세요.');
		} else{
			$.ajax({
		 		url:'/user',
		 		method:'GET',
		 		data: 'uiId=' + $('#usrId').val().trim(),
		 		success:function(res){
		 			console.log(res);
		 			if(res.UserInfo != null) {
		 				alert('이미 사용중인 아이디입니다.'); 			
		 			} else{
		 				alert('사용가능한 아이디입니다.');
		 				$('#usrId').val(id);
		 			}
		 			
		 		}, 
		 		error:function(res){
		 			alert('회원가입 실패');
		 		}
	 		})
		}
	}
	
	function valCkEmail() {
		var email = $("#usrEmail").val();
		var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    if(!re.test(email)) {
	        alert("올바른 이메일 주소를 입력하세요");
	        return false;
	    } else{
			$.ajax({
		 		url:'/user',
		 		method:'GET',
		 		data: 'uiEmail=' + $('#usrEmail').val().trim(),
		 		success:function(res){
		 			if(res.UserInfo != null){
		 				alert('이미 사용중인 이메일입니다.');
		 			} else {
		 				alert('사용가능한 이메일입니다.')
		 				$('#usrEmail').val(email);
		 			}
		 		}, 
		 		error:function(res){
		 			alert('회원가입 실패');
		 		}
		 	})
		}
	}
	
	function valCkPn() {
		var pNum = $("#usrTel").val();
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
			data: 'uiTel=' + $('#usrTel').val().trim(),
			success:function(res){
				if(res.UserInfo != null){		
					alert('이미 사용중인 전화번호입니다.');
				} else {
					console.log(res);
					alert('사용가능한 전화번호입니다.')
					$('#uiTel').val(pNum);
				}
			}, 
			error:function(res){
				alert('회원가입 실패');
			}
		})
	}
	</script>

    <!-- JAVASCRIPT
    ================================================== -->

    <script src="/res/main_theme/js/popper.min.js"></script>

    <!-- Plugins JS -->
    <script src="/res/main_theme/js/bootstrap.min.js"></script>

    <!-- Slick JS -->
    <script src="/res/main_theme/js/jquery.easing.1.3.js"></script>
    <script src="/res/main_theme/js/slick.min.js"></script>
    <!-- Theme JS -->
    <script src="/res/main_theme/js/theme.js"></script>
    
    
<!-- 로그인 체크박스에 관리자로 바꿀경우 가맹점에 기본으로 체크되어 있는 거 풀어주는 로직 -->
<script>
window.onload=function(){
	$('#venueLogin').prop('checked','checked');
}
function selectswitch(ele){
	$('input:checkbox').not(ele).prop('checked','');
}
	
</script>
</body>
</html>