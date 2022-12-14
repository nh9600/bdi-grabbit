<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="it">
    <meta name="keywords" content="Rapoo,creative, agency, startup, Mobicon,onepage, clean, modern,business, company,it">
    <meta name="author" content="Dreambuzz">

    <!-- JAVASCRIPT
    ================================================== -->
    <!-- Global JS -->
    
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

    <title>Grabit-venue</title>

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
	/*main-container(jsp??????????????????)*/
	.main-container{
		width:inherit;
		height:inherit;
		box-sizing: border-box;
	}
	/*footer img background??? ??????????????? banner img??? ????????? ?????? ?????????*/
	.footer-overlay{
	background-image:inherit !important;
	background: #111 !important	;
    opacity: .94 !important;
	}
    </style>
</head>

<body>
<!-- LOADER TEMPLATE -->
<div id="page-loader">
    <div class="loader-icon fa fa-spin colored-border"></div>
</div>
    <!-- /LOADER TEMPLATE -->
<body class="top-header">
    <div class="logo-bar d-none d-md-block d-lg-block bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo d-none d-lg-block">
                        <!-- Brand -->
                        <a class="navbar-brand js-scroll-trigger" href="/venue/grabit">
                            <h2>Grabit</h2>
                        </a>
                    </div>
                </div>
			<!-- ???????????? ???????????? ???????????? ?????? ??? ???????????? ?????? ?????? ??????
                 <div class="col-lg-8 justify-content-end ml-lg-auto d-flex col-12">
                    <div class="top-info-block d-inline-flex">
                        <div class="icon-block">
                            <i class="ti-mobile"></i>
                        </div>
                        <div class="info-block">
                            <h5 class="font-weight-500">+7809346657</h5>
                            <p>Call Free</p>
                        </div>
                    </div>

                    <div class="top-info-block d-inline-flex">
                        <div class="icon-block">
                            <i class="ti-email"></i>
                        </div>
                        <div class="info-block">
                            <h5 class="font-weight-500">info@example.com</h5>
                            <p>Email Us</p>
                        </div>
                    </div>
                    <div class="top-info-block d-inline-flex">
                        <div class="icon-block">
                            <i class="ti-time"></i>
                        </div>
                        <div class="info-block">
                            <h5 class="font-weight-500">Mon-Sat 9:00-12.00 </h5>
                            <p>Sunday Closed</p>
                        </div>
                    </div>
                </div>
                 -->
            </div>
        </div>
    </div>

    <!-- NAVBAR
    ================================================= -->
    <div class="main-navigation" id="mainmenu-area">
        <div class="container">
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary main-nav navbar-togglable">

                <a class="navbar-brand d-lg-none d-block" href="">
                    <h4>Grabit</h4>
                </a>
                <!-- Toggler -->
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="fa fa-bars"></span>
                </button>

                <!-- Collapse -->
                <div class="collapse navbar-collapse" id="navbarCollapse">
                   
                    <!-- venue??? ??????????????? ?????? ????????? ????????? ????????? -->
                    <c:if test="${empty admin}">
                    <ul class="navbar-nav ">
                        <li class="nav-item dropdown" data-page="status">
                            <a class="nav-link" id="navbarWelcome" role="button"  aria-haspopup="true" aria-expanded="false">
                                ?????? ??????
                            </a>
                        </li>
                        <li class="nav-item " data-page="menu-managing">
                            <a class="nav-link js-scroll-trigger">
                                ?????? ??????
                            </a>
                        </li>
                        <li class="nav-item " data-page="order-managing">
                            <a class="nav-link js-scroll-trigger">
                                ?????? ??????
                            </a>
                        </li>
                        <li class="nav-item " data-page="station">
                            <a class="nav-link js-scroll-trigger">
                                ?????? ????????????
                            </a>
                        </li>
                        <li class="nav-item " data-page="order">
                            <a class="nav-link js-scroll-trigger">
                                ?????? ?????????
                            </a>
                        </li>
                    </ul>
                    </c:if>
                    
                    <!-- admin ?????? ??????????????? ?????? ????????? ????????? ????????? -->
                    <c:if test="${not empty admin}">
					 <ul class="navbar-nav ">
                        <li class="nav-item dropdown" data-page="venues">
                            <a class="nav-link" id="navbarWelcome" role="button"  aria-haspopup="true" aria-expanded="false">
                                ?????? ??????
                            </a>
                        </li>
                        <li class="nav-item " data-page="venue-insert">
                            <a class="nav-link js-scroll-trigger">
                     	?????? ??????
                            </a>
                        </li>
                        <li class="nav-item " data-page="menus">
                            <a class="nav-link js-scroll-trigger">
                                ?????? ??????
                            </a>
                        </li>
                        <li class="nav-item " data-page="users">
                            <a class="nav-link js-scroll-trigger">
                                ?????? ??????
                            </a>
                        </li>
                    </ul>
                    </c:if>
                    <!-- admin??? ???????????? ???????????? ????????? ????????? ?????? ????????????. -->
                    <c:if test="${empty admin}">
					 <ul class="ml-lg-auto list-unstyled">
                        <li><a class="btn btn-trans-white btn-circled" data-toggle="modal" data-target="#myModal" style="font-size:15px;">????????????</a></li>
                    </ul>
                    </c:if>
                </div> <!-- / .navbar-collapse -->
            </nav>
        </div> <!-- / .container -->
    </div>

	<!-- ???????????? page ?????? ?????? jsp include ?????? ???????????????. ????????? ?????? / ????????? ?????? -->
	<!-- MAIN CONTAINER
	================================================== -->
	<div class="main-container" data-page="main">
	<c:if test="${empty admin}">
		<c:if test="${empty param.page}">
		<jsp:include page="/WEB-INF/venue/main.jsp"></jsp:include>
		</c:if>
		<c:if test="${not empty param.page}">
			<jsp:include page="/WEB-INF/venue/${param.page}.jsp"></jsp:include>
		</c:if>
	</c:if>
	<c:if test="${not empty admin}">
		<c:if test="${empty param.page}">
			<jsp:include page="/WEB-INF/venue/main.jsp"></jsp:include>
		</c:if>
		<c:if test="${not empty param.page}">
			<jsp:include page="/WEB-INF/admin/${param.page}.jsp"></jsp:include>
		</c:if>
		</c:if>
	</div>
	
    <!-- FOOTER
    ================================================== -->
    <footer class="section " id="footer">
        <div class="overlay footer-overlay"></div>
        <!--Content -->
        <div class="container">
            <div class="row justify-content-start">
                <div class="col-lg-4 col-sm-12">
                    <div class="footer-widget">
                        <!-- Brand -->
                        <a class="footer-brand text-white">
                            Grabit
                        </a>
                        <p>Order what you want when you want it.</p>
                    </div>
                </div>

                <div class="col-lg-3 ml-lg-auto col-sm-12">
                    <div class="footer-widget">
                        <h3>Account</h3>
                        <!-- Links -->
                        <ul class="footer-links ">
                            <li>
                                <a href="#">
                                    Terms and conditions
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Privacy policy
                                </a>
                            </li>                            
                            <li>
                                <a href="#">
                                    Help and support
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Frequently Asked Question
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>


                <div class="col-lg-2 col-sm-6">
                    <div class="footer-widget">
                        <h3>About</h3>
                        <!-- Links -->
                        <ul class="footer-links ">
                            <li>
                                <a href="#">
                                    About Us
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Team
                                </a>
                            </li>
                            <li>
                                <a href="#">
                                    Service
                                </a>
                            </li>

                            <li>
                                <a href="#">
                                    Contact
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div> <!-- / .row -->

            <div class="row text-right pt-5">
                <div class="col-lg-12">
                    <!-- Copyright -->
                    <p class="footer-copy ">
                        &copy; Copyright <span class="current-year"><a href="https://themefisher.com/free-bootstrap-templates">Free Bootstrap Templates</a></span> All rights reserved.
                    </p>
                </div>
            </div> <!-- / .row -->
        </div> <!-- / .container -->
    </footer>

    <!--  Page Scroll to Top  -->
    <a class="scroll-to-top js-scroll-trigger" href=".top-header">
        <i class="fa fa-angle-up"></i>
    </a>

    <!-- Modal
    ================================================== -->

    <div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">    
      <div class="modal-dialog modal-lg">
        <div class="modal-content">

          <!-- Modal Header -->
          <div class="modal-header">
            <h3 class="modal-title" id="lineModalLabel">????????????</h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <form>
                <div class="form-group">
                <label for="orgNm">* ??????(??????)???</label>
                <input type="text" id="orgNm" name="orgNm" class="form-control" placeholder="" data-title="????????????" maxlength="16"/>
                </div>

                <div class="form-group">
                    <label for="registrNm">* ????????????</label>
                    <input type="text" id="registrNm" name="registrNm" class="form-control" placeholder="" data-title="???????????????" maxlength="29"/>
                </div>           

                <div class="form-group">
                    <label for="ptnTel_1">* ?????????</label>                         
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4">             
                                <select name="ptnTel_1" class="form-control" title="????????? ????????? ??????" data-title="????????????" 
                                display= "inline-block">
                                    <option value=""></option>
                                    <option value="010">010</option>
                                    <option value="02">02</option>
                                    <option value="031">031</option>
                                    <option value="032">032</option>                                            
                                </select>       
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <input type="text" id="ptnTel_2" title="????????? ????????????" name="tel_2" class="form-control" value="" maxlength="4" data-title="????????????"/>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <input type="text" id="ptnTel_3" title="????????? ?????????" name="tel_3" class="form-control" value="" maxlength="4" data-title="????????????"/>
                            </div>        
                        </div>
                </div> 
                <div class="form-group">
                    <label for="exampleInputEmail1">* ???????????????</label>
                    <input type="email" class="form-control" id="ptnEmail_1" data-title="????????? ?????????" placeholder="">
                </div>
                <div class="form-group">
                    <label for="ptnTitle">* ??????</label>
                    <input type="text" class="form-control" id="ptnTitle" data-title="?????????" placeholder="">
                </div>

                <div class="form-group">
                    <label for="content">* ??????</label>
                    <textarea class="form-control" id="ptnContents" rows="5" data-title="?????????" placeholder=""></textarea>
                </div>
                <div class="form-group">
                    <label for="fileForm">????????????</label>
                        <input type="file" id="fileForm">
                            <p class="help-block">??????????????? 2M ???????????? ??????????????? GIF, JPG, PNG, PPT, PDF, HWP ??? ???????????????.</p>
                </div>
                <div class="form-group">
                    <div class="box_scroll">
                        <strong class="terms_tit">???????????? ?????? ??? ????????? ?????? ??????</strong>
                            <pre class= "pre-scrollable">
1. ??????&middot;?????? ??????: ?????????, ??????, ????????????, ????????? ??????<br>
2. ??????&middot;?????? ??????: ?????? ????????? ??? ?????? ?????? ??????<br>
3. ?????? ??????: ?????? ?????????????????? 1???<br>
??????????????? ?????? ?????? ????????? ????????? ?????????.
                            </pre>                                  
                    </div>

                    <div class="row">
                        <div class="col-md-9 col-sm-7 col-xs-7 terms_chk">
                            <input type="checkbox" id="agreeY" />
                                <label for="agreeY">???????????????.</label>
                        </div>
                        <div class="col-md-3 col-sm-5 col-xs-5">
                            <button type="button" class="btn btn-default submit" data-dismiss="" onclick="javascript:ptnBoard.insert();">??????</button>  
                        </div> 
                    </div>                      
                </div>
            </form>   
                
          <!-- Modal footer -->
         </div>
        </div>
      </div>
    </div>

  

<script>
var ptnBoard = {
	    insert: function test(){
        if(ptnBoard.validate.check()){
            var email = $("#ptnEmail_1").val();
            var tel = $('[name=ptnTel_1]').val() + $("#ptnTel_2").val() + $("#ptnTel_3").val();
            var telChk = $('[name=ptnTel_1]').val() + "-" + $("#ptnTel_2").val() + "-" + $("#ptnTel_3").val();
            $('.submit').attr('data-dismiss','');
            $("#ptnTel").val(tel);

            /** 
             * ??????????????? ????????? 010??? ??????????????? ?????? 4???????????? 
             * 011, 016, 017, 018, 019??? ?????? 3?????? ?????? 4??????????????? 
             * ?????? ?????? ???????????? ?????? 010????????? ??????????????? ?????? 4????????? ??????
             * ??? ?????? ????????? 3????????? 4????????? ?????? ??????.

             * ???????????? @, .~~ ????????????????????? ??????.
            **/
            var pattern = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
            var nomalTel = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]|7[0]))-(\d{3,4})-(\d{4})$/;
            var regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

            // ????????????(?????????) ???????????? TRUE, ????????? FALSE 
            if(!pattern.test(telChk)) { 
                if(!nomalTel.test(telChk)) {
                    alert("???????????? ????????? ???????????? ????????????.");
                    $("#ptnTel_3").focus();
                    return false;
                }
            } else {}
            if (!re.test(email)) {
                alert("????????? ????????? ????????? ???????????????");
                return false;
            }
            if( $("#agreeY").prop("checked") ) { 

            }else {
                alert("???????????? ?????? ??? ????????? ?????? ????????? ?????? ????????? ?????????.");
                $("#agreeY").first().focus();
                return false;
            }
            var data = {
            		service_id:'default_service',
            	    template_id: 'template_Hj5mfWZ5',
            	    user_id:'user_miVMOIEQ9YSLTKwQOjFJV',
            	    template_params: {
            	    	venue : $("[name=orgNm]").val(),
            	    	manager : $("#registrNm").val(),
            	    	telephone : $('[name=ptnTel_1]').val()+$("#ptnTel_2").val()+$("#ptnTel_3").val(),
            	    	email : $("#ptnEmail_1").val(),
            	    	title : $("#ptnTitle").val(),
            	    	content : $("#ptnContents").val()
            	    }
            	};
            	$.ajax('https://api.emailjs.com/api/v1.0/email/send', {
            	    type: 'POST',
            	    data: JSON.stringify(data),
            	    contentType: 'application/json'
            	}).done(function() {
            	    alert('??????????????? ?????????????????????. ?????????????????? ????????????????????????.');
            	}).fail(function(error) {
            	    alert('?????? ??????????????????.' + JSON.stringify(error));
            	});
            $('.submit').attr('data-dismiss','modal');
        }
    },
    validate: {
        check: function(){
            if($("[name=orgNm]").val() == ''){
                ptnBoard.validate.warning($("[name=orgNm]"));
                return false;
            }
            if($("#registrNm").val() == ''){
                ptnBoard.validate.warning($("#registrNm"));
                return false;
            }
            if($("#ptnTel_2").val() == ''){
                ptnBoard.validate.warning($("#ptnTel_2"));
                return false;
            }
            if($("#ptnTel_3").val() == ''){
                ptnBoard.validate.warning($("#ptnTel_3"));
                return false;
            }
            if($("#ptnEmail_1").val() == ''){
                ptnBoard.validate.warning($("#ptnEmail_1"));
                return false;
            }
            if($("#ptnTitle").val() == ''){
                ptnBoard.validate.warning($("#ptnTitle"));
                return false;
            }
            if($("#ptnContents").val() == ''){
                ptnBoard.validate.warning($("#ptnContents"));
                return false;
            }
            
            if($('#fileForm').val() != ''){
                var ex = [".GIF", ".JPG", ".PNG", ".PPT", ".PPTX", ".PDF", ".DOC",".DOCX", ".HWP", ".gif", ".jpg", ".png", ".ppt",".pptx", ".pdf", ".doc", ".docx", ".hwp"];
                var fileFlag = false;
                var targetVal = $('#fileForm').val();
                $.each(ex, function(i, val){
                    if (targetVal.lastIndexOf(val) > 0){
                        fileFlag = true;
                    }
                    
                    false;
                });

                if(!fileFlag){
                    alert("???????????? ????????? ?????? ????????????. \n (????????? ?????? ??????: gif, jpg, png, ppt, pptx, pdf, doc, docx, hwp)");
                    $("#fileForm").focus();
                    return false;
                }
            }
            return true;
        }, 
        warning: function(obj){
            $('.submit').attr('data-dismiss','');
            alert(obj.data('title') +' ??????????????????.');
            obj.focus();
        },
    },
   
};
//- ????????? ??????????????? ???????????? ???????????? ???????????? ???????????? ???????????? ?????? ??? ???????????? ??????
//??????????????? ??????????????? ????????? parameter??? page??? ????????? main-container?????? ?????? ??? ?????? ????????? ??????
//?????????/????????? ????????? ??????
$(document).ready(function(){
	$('#venueLogin').prop('checked','checked');
	var page = '${param.page}';
	if(!page){
		page='main';
	}
	$('li[data-page]').removeClass('active');
	$('li[data-page'+ page +']').addClass('active');
	$('li[data-page]').on('click',function(){
		var dPage = this.getAttribute('data-page');
		location.href='/venue/grabit?page='+dPage;
	})
})
function selectswitch(ele){
	$('input:checkbox').not(ele).prop('checked','');
}

	//button type??? submit??? ?????? button?????? ?????? enter?????? ?????? ????????? enterkey????????? ?????? ??????????????????
	function enterkey() {
        if (window.event.keyCode == 13) {
             // ???????????? ????????? ??? ????????? ??????
             doLogin();
        }
}
	function doLogin() {
		//***?????? ???***
		//???????????? ????????? ??????????????? ???????????? ?????? ?????? (???????????? username?????? venue_info??? viNum ????????? ?????????, ????????? ???????????? alert?????? ???????????????. )
		if($('#venueLogin').prop('checked')){
			//if(Number.isInteger(document.querySelector('#username').value)){
			//	alert('???????????? username??? ???????????? ?????????.');
			//	document.querySelector('#username').value ='';
			//	document.querySelector('#username').focus();
			//	return false;
			//}
			var param = {
					viNum : document.querySelector('#username').value,
					viPwd : document.querySelector('#userPwd').value
				}
			$.ajax({
				url : '/venue/login',
				method : 'POST',
				data : param,
				success : function(res) {
					if(res.result=='true'){
						alert('????????? ??????');
						location.replace('/venue/grabit');
					}else{
						alert('???????????? ?????? ??????????????? ??????????????? ????????????');
						document.querySelector('#userPwd').value = '';
					}
				},
				error : function(res){
					console.log(res);
				}
			})
		}
		//???????????? ????????? ??????????????? ?????????????????? ??????
		if($('#adminLogin').prop('checked')){
			var param = {
					aiId : document.querySelector('#username').value,
					aiPwd : document.querySelector('#userPwd').value
				}
			$.ajax({
				url : '/admin',
				method : 'POST',
				data : param,
				success : function(res) {
					if(res.result=='true'){
						alert('????????? ??????');
						//???????????? ????????????????????? ?????? ?????? ????????? replace??? ????????? ?????????????????? ???????????????
						location.replace('/venue/grabit');
					}else{
						alert('???????????? ?????? ??????????????? ??????????????? ????????????');
						// ????????????????????? ??????????????? ??????????????? ??????
						document.querySelector('#userPwd').value = '';
					}
				},
				error : function(res){
					console.log(res);
				}
			})
		}
	}
	
	function doLogout(){
		$.ajax({
			url : '/logout',
			method : 'GET',
			success : function(res) {
				alert(res.msg);	
				location.replace('/venue/grabit');
			},
			error : function(res){
				console.log(res);
			}
		})
	}
	</script>
</body>

</html>