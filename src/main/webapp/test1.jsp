<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
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

    <title>Grabit</title>
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
                        <a class="navbar-brand js-scroll-trigger" href="index.html">
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
                        <li class="nav-item dropdown">
                            <a class="nav-link" style="cursor:pointer;" onclick="popup()" id="navbarWelcome" aria-haspopup="true" aria-expanded="false">
                                로그인 / 회원가입
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a href="about.html" class="nav-link js-scroll-trigger">
                                주문
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a href="service.html" class="nav-link js-scroll-trigger">
                                카페
                            </a>
                        </li>
                        <li class="nav-item ">
                            <a href="pricing.html" class="nav-link js-scroll-trigger">
                                즐겨찾기
                            </a>
                        </li>
                    </ul>
                </div> <!-- / .navbar-collapse -->
            </nav>
        </div> <!-- / .container -->
    </div>


    <!-- HERO
    ================================================== -->
    <section class="banner-area py-7">
        <!-- Content -->
        <div class="container">
            <div class="row  align-items-center">
                <div class="col-md-12 col-lg-7 text-center text-lg-left">
                    <div class="main-banner">
                        <!-- Heading -->
                        <h1 class="display-4 mb-4 font-weight-normal">
                            Grabit
                        </h1>

                        <!-- Subheading -->
                        <p class="lead mb-4" id="ssName">
                           Grabit 소개
                        </p>

                        <!-- Button -->
                        <p class="mb-0">
                            <a href="#" target="_blank" class="btn btn-primary btn-circled" style="font-size:15px;">
                                주문하기
                            </a>
                        </p>
                    </div>
                </div>

                <div class="col-lg-5 d-none d-lg-block">
                    <div class="banner-img-block">
                        <img src="res/main_theme/img/banner-img-5.png" alt="banner-img" class="img-fluid">
                    </div>
                </div>
            </div> <!-- / .row -->
        </div> <!-- / .container -->
    </section>

	 <!-- SECTIONS
    ================================================== -->
    
    <section class="section" id="services-2">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="row">
                        <div class="col-lg-12">
							 <div class="section-heading">
								<!-- Heading -->
								<h2 class="section-title mb-2 text-white" style="text-align:center;">
									주변카페
								</h2>
								<!-- Subheading -->
								<p class="mb-5 text-white"  style="text-align:center;">
									현재 사용자 위치를 기준으로 가까운 카페부터 보여드립니다.
								</p>
							</div>
                            <div class="project-lg-img">						
                                <img src="res/main_theme/img/projects/p-2.jpg" alt="" class="img-fluid">
                            </div>	
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
    
    <!-- Pricing
    ================================================== -->
    <section class="section" id="pricing">
        <!-- Content -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-4 col-sm-6 col-md-6">
                    <div class="pricing-box">
                       <h3>스타벅스</h3>
                        <div class="price-block">
                            <img src="res/main_theme/img/process/process-3.jpg" alt="" class="img-fluid">
							<p>카페설명1</p>
                        </div>

                        <ul class="price-features list-unstyled">
                            <li>아메리카노</li>
                            <li>카페라떼</li>
                            <li>카페모카 </li>
                            <li>자몽에이드</li>
                            <li>스무디</li>
                        </ul>

                        <a href="#" class="btn btn-outline-dark btn-circled" style="font-size:15px;">주문하기</a>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6 col-md-6">
                    <div class="pricing-box">
                        <h3>할리스</h3>
                       <div class="price-block">
                            <img src="res/main_theme/img/process/process-3.jpg" alt="" class="img-fluid">
							<p>카페설명2</p>
                        </div>

                        <ul class="price-features list-unstyled">
                            <li>아메리카노</li>
                            <li>카페라떼</li>
                            <li>카페모카 </li>
                            <li>자몽에이드</li>
                            <li>스무디</li>
                        </ul>

                        <a href="#" class="btn btn-primary btn-circled"  style="font-size:15px;">메뉴더보기</a>
                    </div>
                </div>
                <div class="col-lg-4 col-sm-8 col-md-6">
                    <div class="pricing-box ">
                        <h3>투썸플레이스</h3>
                        <div class="price-block">
                            <img src="res/main_theme/img/process/process-3.jpg" alt="" class="img-fluid">
							<p>카페설명3</p>
                        </div>

                        <ul class="price-features list-unstyled">
                            <li>아메리카노</li>
                            <li>카페라떼</li>
                            <li>카페모카 </li>
                            <li>자몽에이드</li>
                            <li>스무디</li>
                        </ul>

                        <a href="#" class="btn btn-outline-dark btn-circled" style="font-size:15px;">카페선택</a>
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
					location.replace('grabit-app.jsp');
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