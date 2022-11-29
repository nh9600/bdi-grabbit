<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
                            <b>Grabit</b>
                        </h1>

                        <!-- Subheading -->
                        <p class="lead mb-4" id="ssName">
                           Grabit 소개
                        </p>

                        <!-- Button -->
                        <p class="mb-0">
                            <a href=".bottom" target="_blank" class="btn btn-primary btn-circled nav-link js-scroll-trigger" style="width:300px;font-size:15px;">
                                주문하기
                            </a>
                        </p>
                    </div>
                </div>

                <div class="col-lg-5 d-none d-lg-block">
                    <div class="banner-img-block">
                        <img src="/res/main_theme/img/coffee.png" alt="banner-img" class="img-fluid">
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
                                <img src="/res/main_theme/img/projects/p-2.jpg" alt="" class="img-fluid">
                            </div>	
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
   
    
    <!-- Pricing
    ================================================== -->
    <section class="section bottom" id="pricing">
        <!-- Content -->
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-4 col-sm-6 col-md-6">
                    <div class="pricing-box">
                       <h3>스타벅스</h3>
                        <div class="price-block">
                            <img src="/res/main_theme/img/process/process-3.jpg" alt="" class="img-fluid">
							<p>카페설명1</p>
                        </div>

                        <ul class="price-featu/res list-unstyled">
                            <li>아메리카노</li>
                            <li>카페라떼</li>
                            <li>카페모카 </li>
                            <li>자몽에이드</li>
                            <li>스무디</li>
                        </ul>
                   		<button id="joinBtn" type="button" class="btn btn-primary btn-circled" data-toggle="modal" data-target="#myModal" style="font-size:15px;">
			     		주문하기
						</button> 
                    </div>
                </div>
                <div class="col-lg-4 col-sm-6 col-md-6">
                    <div class="pricing-box">
                        <h3>할리스</h3>
                       <div class="price-block">
                            <img src="/res/main_theme/img/process/process-3.jpg" alt="" class="img-fluid">
							<p>카페설명2</p>
                        </div>

                        <ul class="price-featu/res list-unstyled">
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
                            <img src="/res/main_theme/img/process/process-3.jpg" alt="" class="img-fluid">
							<p>카페설명3</p>
                        </div>

                        <ul class="price-featu/res list-unstyled">
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
</body>
</html>