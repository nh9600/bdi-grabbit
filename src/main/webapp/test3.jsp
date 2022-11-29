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

    <!-- Plugins CSS -->
    <link rel="stylesheet" href="res/main_theme/css/bootstrap.min.css">
    <link rel="stylesheet" href="res/main_theme/fonts/themify/themify-icons.css">

    <link rel="stylesheet" href="res/main_theme/css/slick.css">
    <link rel="stylesheet" href="res/main_theme/css/slick-theme.css">
    <link rel="stylesheet" href="res/main_theme/css/all.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="res/main_theme/css/style.css">
    <link rel="stylesheet" href="res/main_theme/css/responsive.css">

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
                        <a class="navbar-brand js-scroll-trigger" href="index-2.html">
                            <h2>Grabit</h2>
                        </a>
                    </div>
                </div>
			<!-- 이부분은 가맹점이 로그인을 했을 때 보여주는 로직 넣을 예정
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
                    <!-- Links -->
                    <c:if test="${empty admin}">
                    <ul class="navbar-nav ">
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="/venue/status" id="navbarWelcome" role="button"  aria-haspopup="true" aria-expanded="false">
                                매장 현황
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a href="about.html" class="nav-link js-scroll-trigger">
                                메뉴 관리
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a href="service.html" class="nav-link js-scroll-trigger">
                                주문 관리
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a href="pricing.html" class="nav-link js-scroll-trigger">
                                주문 스테이션
                            </a>
                        </li>
                    </ul>
                    </c:if>
                    
                    <!-- admin으로 로그인했을 경우 보이는 메뉴 -->
                    <c:if test="${not empty admin}">
					 <ul class="navbar-nav ">
                        <li class="nav-item dropdown">
                            <a class="nav-link" href="/app/login" id="navbarWelcome" role="button"  aria-haspopup="true" aria-expanded="false">
                                매장 현황
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a href="about.html" class="nav-link js-scroll-trigger">
                                메뉴 관리
                            </a>
                        </li>
                    </ul>
                    </c:if>
                    <!--  -->
                    
					 <ul class="ml-lg-auto list-unstyled">
                        <li><a href="#" class="btn btn-trans-white btn-circled" data-toggle="modal" data-target="#myModal" style="font-size:15px;">가맹제휴</a></li>
                    </ul>
                </div> <!-- / .navbar-collapse -->
            </nav>
        </div> <!-- / .container -->
    </div>

    <!-- HERO
    ================================================== -->
    <section class="banner-area py-5" id="banner">
       <div class="overlay"></div>
        <!-- Content -->
        <div class="container">
            <div class="row  align-items-center justify-content-center">
                <div class="col-md-12 col-lg-8">
                   <div class="banner-content text-center text-lg-left">
                        <!-- Heading -->
                        <h1 class="display-4 mb-4 ">
                            Grabit
                        </h1>
                    </div>
                </div>
                
                <div class="col-lg-4 ">
                    <div class="banner-contact-form bg-white">
                        <c:if test="${empty admin}"> 
                    	<div class="banner-contact-form bg-white">                
                         	<div class="form-group">
                                <input type="checkbox" id="venueLogin" value="venue" onchange="selectswitch(this)">가맹점
                                <input type="checkbox" id="adminLogin" value="admin" onchange="selectswitch(this)">관리자
                            </div>
                            <div class="form-group">
                                <input type="text" name="email" id="email" class="form-control" placeholder="Username" onkeyup="enterkey()">
                            </div>
                            
                            <div class="form-group">
                                <input type="text" class="form-control" name="subject" id="subject" placeholder="Password" onkeyup="enterkey()">
                            </div>
                            <button class="btn btn-dark btn-block btn-circled" onclick="doLogin()" type="button">Login</button>                        
                   	 	</div>
               		 </c:if>
               		 
               		 <!-- 로그인시 로그인폼이 사라져야 된다 생각해서 로그인이 되었을시 로그아웃버튼을 제외한 나머지를 없앴습니다 -->
               		 <c:if test="${not empty admin}">
                        <button class="btn btn-dark btn-block btn-circled" onclick="doLogout()" type="button">Log out</button>
                     </c:if>
                    </div>
                </div>
            </div> <!-- / .row -->
        </div> <!-- / .container -->
    </section>
    <script>
	
	//button type을 submit이 아닌 button으로 할시 enter키가 먹지 않아서 enterkey펑션을 따로 구현했습니다
	function enterkey() {
        if (window.event.keyCode == 13) {
             // 엔터키가 눌렸을 때 실행할 내용
             doLogin();
        }
}

	function doLogin() {
		var param = {
			aiId : document.querySelector('#email').value,
			aiPwd : document.querySelector('#subject').value
		}
		var xhr = new XMLHttpRequest();
		xhr.open('POST', '/admin');
		xhr.setRequestHeader('Content-Type', 'application/json');
		xhr.onreadystatechange = function() {
			if (xhr.readyState == xhr.DONE) {
				if (xhr.status == 200) {
					var res = JSON.parse(xhr.responseText);
					console.log(res);
					if(res.result=='true'){
						alert('로그인 성공');
						
						//로그인시 화면새로고침이 되지 않기 때문에 replace로 화면을 새로고침해준 로직입니다
						location.replace('grabit-venue.jsp');
					}else{
						alert('유효하지 않은 아이디거나 비밀번호가 다릅니다');
						
						// 잘못입력했을시 비밀번호가 초기화되는 로직
						document.querySelector('#subject').value = '';
					}
				}
			}
		}
		xhr.send(JSON.stringify(param));
	}
	
	function doLogout(){
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/logout');
		xhr.onreadystatechange = function() {
			if (xhr.readyState == xhr.DONE) {
				if (xhr.status == 200) {
					var res = JSON.parse(xhr.responseText);
					alert(res.msg);		
					//화면새로고침이 되지 않기 때문에 replace로 화면을 새로고침해준 로직입니다
					location.replace('grabit-venue.jsp');
					
				}
			}
		}
		xhr.send();
	}
	</script>

    <!-- LATEST BLOG
    ================================================== -->
    <section class="section" id="blog">
        <div class="container">
            <div class="row justify-content-center mb-4">
                <div class="col-md-8 col-lg-6 text-center">
                    <div class="section-heading">
                        <!-- Heading -->
                        <h2 class="section-title mb-2">
                            공지사항
                        </h2>

                        <!-- Subheading -->
                        <p class="mb-5">
                            가맹점주님들께 알립니다.
                        </p>
                    </div>
                </div>
            </div> <!-- / .row -->

            <div class="row justify-content-center">
                <div class="col-lg-4 col-md-6">
                    <div class="blog-box">
                        <div class="blog-img-box">
                            <img src="res/main_theme/img/blog/blog-1.jpg" alt="" class="img-fluid blog-img">
                        </div>
                        <div class="single-blog">
                            <div class="blog-content">
                                <h6> 17 October 2018</h6>
                                <a href="#">
                                    <h3 class="card-title">이벤트 안내</h3>
                                </a>
                                <p>There are many variations of passages Lorem Ipsum available, but majority have ama suffered altratio. the lorem.</p>
                                <a href="#" class="read-more">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="blog-box">
                        <div class="blog-img-box">
                            <img src="res/main_theme/img/blog/blog-2.jpg" alt="" class="img-fluid blog-img">
                        </div>
                        <div class="single-blog">
                            <div class="blog-content">
                                <h6> 17 October 2018</h6>
                                <a href="#">
                                    <h3 class="card-title">적립금 기준</h3>
                                </a>

                                <p>There are many variations of passages Lorem Ipsum available, but majority have ama suffered altratio. the lorem.</p>
                                 <a href="#" class="read-more">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-8">
                    <div class="blog-box">
                        <div class="blog-img-box">
                            <img src="res/main_theme/img/blog/blog-3.jpg" alt="" class="img-fluid blog-img">
                        </div>
                        <div class="single-blog">
                            <div class="blog-content">
                                <h6> 17 October 2018</h6>
                                <a href="#">
                                    <h3 class="card-title">결제 관련</h3>
                                </a>
                                <p>There are many variations of passages Lorem Ipsum available, but majority have ama suffered altratio. the lorem.</p>
                                 <a href="#" class="read-more">Read More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

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
                        <a href="#" class="footer-brand text-white">
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
            <h3 class="modal-title" id="lineModalLabel">가맹제휴</h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <form>
                <div class="form-group">
                <label for="orgNm">* 회사(기관)명</label>
                <input type="text" id="orgNm" name="orgNm" class="form-control" placeholder="" data-title="회사명을" maxlength="16"/>
                </div>

                <div class="form-group">
                    <label for="registrNm">* 담당자명</label>
                    <input type="text" id="registrNm" name="registrNm" class="form-control" placeholder="" data-title="담당자명을" maxlength="29"/>
                </div>           

                <div class="form-group">
                    <label for="ptnTel_1">* 연락처</label>                         
                        <div class="row">
                            <div class="col-md-4 col-sm-4 col-xs-4">             
                                <select name="ptnTel_1" class="form-control" title="연락처 앞자리 입력" data-title="연락처를" 
                                display= "inline-block">
                                    <option value=""></option>
                                    <option value="010">010</option>
                                    <option value="02">02</option>
                                    <option value="031">031</option>
                                    <option value="032">032</option>                                            
                                </select>       
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <input type="text" id="ptnTel_2" title="연락처 중간자리" name="tel_2" class="form-control" value="" maxlength="4" data-title="연락처를"/>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-4">
                                <input type="text" id="ptnTel_3" title="연락처 끝자리" name="tel_3" class="form-control" value="" maxlength="4" data-title="연락처를"/>
                            </div>        
                        </div>
                </div> 
                <div class="form-group">
                    <label for="exampleInputEmail1">* 이메일주소</label>
                    <input type="email" class="form-control" id="ptnEmail_1" data-title="이메일 주소를" placeholder="">
                </div>
                <div class="form-group">
                    <label for="ptnTitle">* 제목</label>
                    <input type="text" class="form-control" id="ptnTitle" data-title="제목을" placeholder="">
                </div>

                <div class="form-group">
                    <label for="content">* 내용</label>
                    <textarea class="form-control" id="ptnContents" rows="5" data-title="내용을" placeholder="">
</textarea>
                </div>
                <div class="form-group">
                    <label for="fileForm">첨부파일</label>
                        <input type="file" id="fileForm">
                            <p class="help-block">첨부파일은 2M 이하이며 파일형식은 GIF, JPG, PNG, PPT, PDF, HWP 만 지원합니다.</p>
                </div>
                <div class="form-group">
                    <div class="box_scroll">
                        <strong class="terms_tit">개인정보 수집 및 이용에 관한 동의</strong>
                            <pre class= "pre-scrollable">
1. 수집&middot;이용 항목: 회사명, 이름, 전화번호, 이메일 주소<br>
2. 수집&middot;이용 목적: 제휴 문의자 및 제휴 내용 확인<br>
3. 보유 기간: 문의 접수일로부터 1년<br>
동의하시지 않는 경우 문의가 불가능 합니다.
                            </pre>                                  
                    </div>
                    <div>
                    	<input type="checkbox" id="agreeY" />
                    	<label for="agreeY">동의합니다.</label>
                    </div>
                    <div style="float: right;">
                    	<button type="button" class="btn btn-primary submit" data-dismiss="" onclick="javascript:ptnBoard.insert();">제출</button>  
                    </div>                     
                </div>
            </form>   
                
          <!-- Modal footer -->
         </div>
        </div>
      </div>
    </div>


<script type="text/javascript">
var ptnBoard = {
    insert: function test(){
        if(ptnBoard.validate.check()){
            var email = $("#ptnEmail_1").val();
            var tel = $('[name=ptnTel_1]').val() + $("#ptnTel_2").val() + $("#ptnTel_3").val();
            var telChk = $('[name=ptnTel_1]').val() + "-" + $("#ptnTel_2").val() + "-" + $("#ptnTel_3").val();
            $('.submit').attr('data-dismiss','');
            $("#ptnTel").val(tel);

            /** 
             * 휴대전화의 경우는 010은 중간자리가 항상 4자리이고 
             * 011, 016, 017, 018, 019의 경우 3자리 또는 4자리이므로 
             * 위와 같이 정해주게 되면 010일때는 중간번호를 항상 4자리를 받고
             * 그 외의 경우는 3자리나 4자리를 받게 된다.

             * 이메일은 @, .~~ 포함되어있어야 된다.
            **/
            var pattern = /^(?:(010-\d{4})|(01[1|6|7|8|9]-\d{3,4}))-(\d{4})$/;
            var nomalTel = /^(0(2|3[1-3]|4[1-4]|5[1-5]|6[1-4]|7[0]))-(\d{3,4})-(\d{4})$/;
            var regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
            var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

            // 전화번호(휴대폰) 올바르면 TRUE, 틀리면 FALSE 
            if(!pattern.test(telChk)) { 
                if(!nomalTel.test(telChk)) {
                    alert("전화번호 형식이 올바르지 않습니다.");
                    $("#ptnTel_3").focus();
                    return false;
                }
            } else {}
            if (!re.test(email)) {
                alert("올바른 이메일 주소를 입력하세요");
                return false;
            }
            if( $("#agreeY").prop("checked") ) { 

            }else {
                alert("개인정보 수집 및 이용에 관한 약관에 동의 하셔야 합니다.");
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
            	    alert('정상적으로 접수되었습니다. 빠른시일내로 연락드리겠습니다.');
            	}).fail(function(error) {
            	    alert('다시 시도해주세요.' + JSON.stringify(error));
            	    console.log(JSON.stringify(error));
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
                    alert("첨부파일 형식이 맞지 않습니다. \n (가능한 파일 형식: gif, jpg, png, ppt, pptx, pdf, doc, docx, hwp)");
                    $("#fileForm").focus();
                    return false;
                }
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

</script>




    <!-- JAVASCRIPT
    ================================================== -->
    <!-- Global JS -->
    <script src="res/main_theme/js/jquery.min.js"></script>
    <script src="res/main_theme/js/popper.min.js"></script>

    <!-- Plugins JS -->
    <script src="res/main_theme/js/bootstrap.min.js"></script>

    <!-- Slick JS -->
    <script src="res/main_theme/js/jquery.easing.1.3.js"></script>
    <script src="res/main_theme/js/slick.min.js"></script>
    <!-- Theme JS -->
    <script src="res/main_theme/js/theme.js"></script>
    
    
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