<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>venue-main</title>
<style>
#banner .overlay{
opacity: 1;
}
.overlay
{
background-image:url(/res/main_theme/img/home.jpg);
}
</style>
</head>
<body>
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
                
                    <!-- session에 admin, venue 둘다 없을 경우 로그인 창이 보이게 했습니다. -->
             	  	<c:if test="${ empty admin and empty venue}">
                    	<div class="banner-contact-form bg-white">                
                         	<div class="form-group">
                                <input type="checkbox" id="venueLogin" value="venue" onchange="selectswitch(this)">가맹점
                                <input type="checkbox" id="adminLogin" value="admin" onchange="selectswitch(this)">관리자
                            </div>
                            <div class="form-group">
                                <input type="number" name="username" id="username" class="form-control" placeholder="Username" onkeyup="enterkey()">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control" name="userPwd" id="userPwd" placeholder="Password" onkeyup="enterkey()">
                            </div>
                            <button class="btn btn-dark btn-block btn-circled" onclick="doLogin()" type="button">Login</button>                        
                   	 	</div>
               		 </c:if>
               		 
               		 <!-- 로그인시 로그인폼이 사라져야 된다 생각해서 로그인이 되었을시 로그아웃버튼을 제외한 나머지를 없앴습니다 -->
               		 <c:if test="${not empty admin || not empty venue}">
                        <button class="btn btn-dark btn-block btn-circled" onclick="doLogout()" type="button">Log out</button>
                     </c:if>
                </div>
            </div> <!-- / .row -->
        </div> <!-- / .container -->
    </section>

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
                            <img src="/res/main_theme/img/blog/blog-1.jpg" alt="" class="img-fluid blog-img">
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
                            <img src="/res/main_theme/img/blog/blog-2.jpg" alt="" class="img-fluid blog-img">
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
                            <img src="/res/main_theme/img/blog/blog-3.jpg" alt="" class="img-fluid blog-img">
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
</body>
</html>