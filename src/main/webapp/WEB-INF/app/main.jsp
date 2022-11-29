<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.col-md-4{
  display: inline-block;
  margin-left:-10px;
}
.col-md-4 img{
  width:100%;
  height:auto;
}
  
body .carousel-control-prev-icon,
body .carousel-indicators li,
body .carousel-control-next-icon{
  background-color:#000;
}

span.carousel-control-prev-icon {
 position: relative;
 bottom: 40px;
 right: 40px;
}

span.carousel-control-next-icon {
 position: relative;
 bottom: 40px;
}

@media(min-width:416px) and (max-width:575px){ 
.bkSlide {
	padding-right: 29px;	
}
}
@media(min-width:100px) and (max-width:415px){ 
.bkSlide {
	padding-right: 25px;	
}
}
</style>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
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
                            <jsp:include page="/kakaotest.jsp"></jsp:include>					
                                <!--<img src="/res/main_theme/img/projects/p-2.jpg" alt="" class="img-fluid"> -->
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
		<h1 style="text-align:center;">즐겨찾기</h1>
		<div class="container" style="padding-left: 50px;"> 
			<div id="demo" class="carousel slide" data-ride="carousel"  data-interval="999999">
				<div id="cafeList2" class="carousel-inner no-padding my-5">
				</div>
				<a class="carousel-control-prev" href="#demo" data-slide="prev">
					<span class="carousel-control-prev-icon sp"></span>
				</a>
				<a class="carousel-control-next" href="#demo" data-slide="next">
					<span class="carousel-control-next-icon sp"></span>
				</a>
			</div>
		</div>
    </section>

    <!-- View Script -->
    <script>  
 	var imgPath = "https://spring-test-haley.s3.ap-northeast-2.amazonaws.com/test/";
	$(document).ready(function(){
		var slideHtml = '';
		$.ajax({
			url:'/user',
			method:'GET',
			data:'uiNum=' + ${userNum},
			success:function(res){
				console.log(res);
				for(var i=0;i<res.VenueNum.length;i++) {   
				  	if(i == 0){
				  		slideHtml += '<div class="carousel-item active">'
				  		slideHtml += '<div class="col-xs-12 col-sm-12 col-md-4 bkSlide"></div>'
				  	} else if((i+1)%3 == 0){  		
				  		slideHtml += '<div class="carousel-item">'
				    }     	    
				  	slideHtml += '<div class="col-xs-12 col-sm-12 col-md-4 bkSlide" style="text-align:center">'
				    slideHtml += '<a href="/app/grabit?page=cafe-view&vNum=' + res.VenueNum[i] + '&vName=' + res.VenueName[i] + '&vImg=' + res.VenueImg[i] + '" class="slider_info">'		   		
				   	slideHtml += '<img style="width:auto;height:200px;" class="img-fluid card-img-top" src="' + imgPath + res.VenueImg[i] + '">'
				   	slideHtml += '</a>'
				   	slideHtml += '<h3>' + res.VenueName[i] + '</h3>' 
				   	slideHtml += '</div>'				  
					if((i+2)%3 == 0){
						slideHtml += '</div>'
					}		    
				}	
				document.querySelector('#cafeList2').innerHTML = slideHtml;	
			},
			error:function(res){
				alert("fail");			
			}
		})
	})   		
    </script>  
</body>
</html>
