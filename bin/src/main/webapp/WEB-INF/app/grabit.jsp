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
    <link rel="stylesheet" href="/res/main_theme/css/bootstrap.min.css">
    <link rel="stylesheet" href="/res/main_theme/fonts/themify/themify-icons.css">

    <link rel="stylesheet" href="/res/main_theme/css/slick.css">
    <link rel="stylesheet" href="/res/main_theme/css/slick-theme.css">
    <link rel="stylesheet" href="/res/main_theme/css/all.css">

    <!-- Theme CSS -->
    <link rel="stylesheet" href="/res/main_theme/css/style.css">
    <link rel="stylesheet" href="/res/main_theme/css//responsive.css">
	
    <!-- Global JS -->
    <script src="/res/main_theme/js/jquery.min.js"></script>
    
    <title>Grabit</title>
    <style>
    h2{font-family: 'Muli', sans-serif !important;
    font-weight: 700 !important;
    font-size:2rem !important;
    line-height: 1.35 !important;
    margin-bottom: .5rem !important;
    color: #212529 !important;
    }
    #mainmenu-area{
    display:block !important;
    
    }
    .bg-primary, .btn-primary, .btn-white:hover {
    color: #fff!important;
    </style>
</head>


<body class="top-header">

    <!-- LOADER TEMPLATE -->
    <div id="page-loader">
        <div class="loader-icon fa fa-spin colored-border"></div>
    </div>
    <!-- /LOADER TEMPLATE -->

    <div class="top-bar bg-dark " id="top-bar">
        <div class="container">
            <div class="row align-items-center">
                
            </div>
        </div>
    </div>
    <div class="logo-bar d-none d-md-block d-lg-block bg-light">
        <div class="container">
            <div class="row">
                <div class="col-lg-2">
                    <div class="logo d-none d-lg-block">
                        <!-- Brand -->
                        <a class="navbar-brand js-scroll-trigger" href="/app/grabit">
                            <h2>Grabit</h2>
                        </a>
                    </div>
                </div>
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
                    <ul class="navbar-nav ">
                        <li class="nav-item dropdown" data-page="login">
                           	<a class="nav-link" style="cursor:pointer;" onclick="popup()" id="navbarWelcome" aria-haspopup="true" aria-expanded="false">
                                로그인 / 회원가입
                            </a>
                        </li>
                        <li class="nav-item" data-page="">
                            <a href=".bottom" class="nav-link js-scroll-trigger">
                                주문
                            </a>
                        </li>
                        <li class="nav-item " data-page="">
                            <a href="/app/grabit?page=user-view" class="nav-link js-scroll-trigger">
       		     내정보
                            </a>
                        </li>
                                                <li class="nav-item " data-page="menu">
                            <a  class="nav-link js-scroll-trigger">
                                메뉴
                            </a>
                        </li>
                        <li class="nav-item " data-page="test">
                            <a  class="nav-link js-scroll-trigger">
                                즐겨찾기
                            </a>
                        </li>
                    </ul>
                </div> <!-- / .navbar-collapse -->
            </nav>
        </div> <!-- / .container -->
    </div>

 	<!-- jsp include 영역 시작
 	================================================= -->
 	
 	<div class="main-container" >
		<c:if test="${empty param.page }">   
	    	<jsp:include page="/WEB-INF/app/main.jsp"></jsp:include>
	    	<jsp:include page="/WEB-INF/app/cart.jsp"></jsp:include>
		</c:if>
		<c:if test="${not empty param.page }">
			<jsp:include page="/WEB-INF/app/${param.page}.jsp"></jsp:include>
		</c:if>
	</div>
	<!-- jsp include 영역 끝
	================================================== -->
	
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
                        &copy; Copyright <span class="current-year"><a href="https://themefisher.com/free-bootstrap-templates">Free Bootstrap Templates</a></span> All rights /reserved.
                    </p>
                </div>
            </div> <!-- / .row -->
        </div> <!-- / .container -->
    </footer>


    <!--  Page Scroll to Top  -->

    <a class="scroll-to-top js-scroll-trigger" href=".top-header">
        <i class="fa fa-angle-up"></i>
    </a>

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
	<!-- Login JS -->
	<script>
	//modal 로 keep
	function popup(){
		const url ='/app/login';
		const name='login page';
		const option='width=500px , height=500px, top=400, left=1000';
		window.open(url,name,option);
	}
	window.onload=function(){
		var sessionId = '<%=session.getAttribute("user")%>';
		if (sessionId == 'null'){
			popup();
		} else if(sessionId != null){
			$('#ssName').text(sessionId + '님 반갑습니다.'); 
			$('#navbarWelcome').attr('onclick','doLogout()');
			$('#navbarWelcome').text('로그아웃');
		} 
	}
	
	function doLogout(){
		var xhr = new XMLHttpRequest();
		xhr.open('GET', '/user/logout');
		xhr.onreadystatechange = function() {
			if (xhr.readyState == xhr.DONE) {
				if (xhr.status == 200) {				
					//화면새로고침이 되지 않기 때문에 replace로 화면을 새로고침해준 로직입니다
					location.replace('/app/grabit');
					$('#navbarWelcome').attr('href','/user/logout');
					alert('로그아웃 되었습니다.');
				}
			}
		}
		xhr.send();
	}
	</script>
</body>

</html>