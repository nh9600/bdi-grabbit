<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
	font-family: 'Montserrat', sans-serif;
	color: #333;
	line-height: 1.6;
}
.mb-60 {
	margin-bottom: 60px;
}
.section-title p {
	font-size: 24px;
	font-family: Oleo Script;
	margin-bottom: 0px;
}
.section-title h4 {
	font-size: 40px;
	text-transform: capitalize;
	color: #FF5E18;
	position: relative;
	display: inline-block;
	padding-bottom: 25px;
}
.section-title h4::before {
	width: 80px;
	height: 1.5px;
	bottom: 0;
	left: 50%;
	margin-left: -40px;
}
.section-title h4::before, .section-title h4::after {
	position: absolute;
	content: "";
	background-color: #FF5E18;
}
#myTabContent {
	margin-top: 50px;
}
.menu_tab {
	width: auto;
	margin: 0 auto;
}
.nav-tabs .nav-item {
	margin-bottom: -1px;
}
.nav-item a {
	color: #333;
}
.menu_tab .nav-tabs .nav-item.show .nav-link, .nav-tabs .nav-link.active {
	color: white;
	background-color: #FF5E18;
	border-color: #FF5E18;
}
.single_menu_list {
	position: relative;
	padding-left: 190px;
	margin-bottom: 110px;
}

.single_menu_list img {
	max-width: 30%;
	position: absolute;
	left: 0px;
	top: 0;
	border: 1px solid #ddd;
	padding: 3px;
	border-radius: 50%;
	transition: .4s
}

.single_menu_list:hover img {
	border-radius: 0;
	transition: .4s
}

.single_menu_list h4 {
	font-size: 20px;
	border-bottom: 1px dashed #333;
	padding-bottom: 15px;
	margin-bottom: 10px;
}

.single_menu_list h4 span {
	float: right;
	font-weight: bold;
	color: #FF5E18;
}

.single_menu_list span {
	font-size: 25px;
	float: right;
	font-weight: bold;
	color: #FF5E18;
}

@media(max-width:1199px){ 
.single_menu_list {
	padding-left: 160px;
}
}

@media(max-width:991px){ 
.single_menu_list {
	padding-left: 215px;
}
}

@media(max-width:767px){ 
.single_menu_list {
	padding-left: 180px;
}
}

@media(max-width:414px){ 
.single_menu_list {
	padding-left: 125px;	
}
}

</style>
</head>
<link href="https://fonts.googleapis.com/css?family=Montserrat:300,400,500,600,700,900" rel="stylesheet">
      <link href="https://fonts.googleapis.com/css?family=Oleo+Script" rel="stylesheet">
<body>
	<section id="menuList" class="menu_list mt-60 mb-60" hidden>
	 <div class="container">
		<div class="row">
		   <div class="col-xl-12" style="padding-top:80px;">
			  <div class="section-title text-center mb-60">
				 <h2><img id="cafeImg" src="https://spring-test-haley.s3.ap-northeast-2.amazonaws.com/test/15660782292818.png" alt="" class="img-fluid" style = "width:20%; height:20%;"></h2>
			  	 <p id="cafeName"></p>
			  </div>
		   </div>
		</div>
		<div class="row">
		   <ul class="nav nav-tabs menu_tab" id="myTab" role="tablist">
  
		   </ul>
		</div>
		<div class="row">
		   <div class="tab-content col-xl-12" id="myTabContent">
			  <div class="tab-pane fade active show" id="coffee" role="tabpanel">
				 <div id="mCoffee" class="row">
				

				 </div>
			  </div>
			  <div class="tab-pane fade" id="smoothie" role="tabpanel">
				 <div id="mSmoothie" class="row">
					
					
				 </div>
			  </div>
			  <div class="tab-pane fade" id="tea" role="tabpanel">
				 <div id="mTea" class="row">
					
				 </div>
			  </div>

		   </div>
		</div>

	 </div>
  </section>
  
  	<jsp:include page="/WEB-INF/app/menu-view.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/app/cart.jsp"></jsp:include>
  

    
    <!-- Click Event Script -->
    <script>
    
    $(document).ready(function(){	
    	var imgPath = "https://spring-test-haley.s3.ap-northeast-2.amazonaws.com/test/";	
		var vNum = '${param.vNum}';
		var vName = '${param.vName}';
		var vImg = imgPath + '${param.vImg}';
		
		$('#menuList').removeAttr('hidden');
		$('#cafeName').text(vName);
		$('#cafeImg').attr('src', vImg);
		orderHtml = '';
		
		var cafeHtml = '';
		var menuHtml = '';
		$.ajax({
			url:'/menus',
			method:'GET',
			data:'viNum=' + vNum,
			success:function(res){	
				function cafeView(){ 	
					cafeHtml += '<div class="col-lg-6 col-md-12" style="height:200px;">'
					cafeHtml += '<div class="single_menu_list">'
					cafeHtml += '<div class="menu_content" data-toggle="modal" data-target="#modMenu" value="' + res.list[i].miNum + ',' + res.list[i].miImg + ',' + res.list[i].miPrice + '" onclick="modMenu(this)">'	  
					cafeHtml += '<h4 id="getName" style="white-space:nowrap;height:40px;text-overflow:ellipsis;overflow:hidden;">' + res.list[i].miName + '</h4>'	  
					cafeHtml += '<img src="' + res.list[i].miImg + '" alt="">'
					cafeHtml += '</div>'
					cafeHtml += '<p style="white-space:nowrap;height:40px;text-overflow:ellipsis;overflow:hidden;">' + res.list[i].miIntro + '</p>'	
					cafeHtml += '<div class="row">'
					cafeHtml += '<div class="col-md-12">'
					cafeHtml += '<span>' + res.list[i].miPrice + '원 </span>'	
					cafeHtml += '</div></div></div></div>'
				}
				
				function navView(name){
					menuHtml += '<li class="nav-item">'
					menuHtml += '<a class="nav-link" id="' + name + '-tab" data-toggle="tab" href="#' + name + '" role="tab" aria-selected="true">' + name + '</a>'
					menuHtml += '</li>'		
				}
				
  				for(var i=0; i<res.list.length; i++) {
  					if(res.list[i].mcCode == 1){
  						cafeView();
  					}
				}  				
				document.querySelector('#mCoffee').innerHTML = cafeHtml;
				if(document.querySelector('#mCoffee').innerHTML != ''){
					navView('coffee');
				}
				
				cafeHtml = '';
  				for(var i=0; i<res.list.length; i++) {
  					if(res.list[i].mcCode == 2){
  						cafeView();
  					}
				}
  				
  				document.querySelector('#mSmoothie').innerHTML = cafeHtml;
				if(document.querySelector('#mSmoothie').innerHTML != ''){
					navView('smoothie');
				}
  				
				cafeHtml = '';
  				for(var i=0; i<res.list.length; i++) {
  					if(res.list[i].mcCode == 3){
  						cafeView();
  					}
				}
  				document.querySelector('#mTea').innerHTML = cafeHtml;
				if(document.querySelector('#mTea').innerHTML != ''){
					navView('tea');
				}
				
  				document.querySelector('#myTab').innerHTML = menuHtml;
			},
			error:function(res){
				alert("fail");			
			}
		})			   	
    })
    
    var mList = '';
    var mName = '';
    function modMenu(obj){
    	mList = obj.getAttribute('value').split(",");
    	mName = obj.innerText;
    } 
    
    </script>
</body>
</html>
