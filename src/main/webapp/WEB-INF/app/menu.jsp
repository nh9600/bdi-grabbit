<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<head>
<!--jquery-->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"
	integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
	crossorigin="anonymous">
</script>

<!--style-->
<style>
.list-group{
cursor:pointer;
}
</style>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>app-menu</title>

<!-- Bootstrap core CSS -->
<link href="/res/menu-theme/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link href="/res/menu-theme/css/shop-homepage.css" rel="stylesheet">

</head>

<body>

	<!-- Page Content -->
	<div style="padding: 50px" id=menu>

		<div class="container">


			<div class="row">

				<div class="col-lg-3">

					<h1 class="my-4">스타벅스</h1>
					<div class="list-group">
						<a style="color: black" data-page="menu-coffee" class="list-group-item" >커피</a> 
						<a style="color: black" data-page="menu-tea" class="list-group-item" >차</a> 
						<a style="color: black" data-page="menu-ade" class="list-group-item" >에이드</a> 
						<a style="color: black" data-page="menu-smoothie" class="list-group-item" type="button">스무디</a>
						<a style="color: black" data-page="menu-blended" class="list-group-item" type="button">블렌디드 음료</a>
						<a style="color: black" data-page="menu-bakery" class="list-group-item" type="button">베이커리</a>

					</div>

				</div>
				<!-- /.col-lg-3 -->

				<div class="col-lg-9">

					<div id="carouselExampleIndicators" class="carousel slide my-4"
						data-ride="carousel">
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>

					<div class="row" id="rowClass">
						<!-- jsp include 영역 시작
 	================================================= -->
						<div class="container">
							<c:if test="${empty param.page }">
								<jsp:include page="/WEB-INF/app/menu-category/menu-coffee.jsp"></jsp:include>
							</c:if>
							<c:if test="${not empty param.page }">
								<jsp:include page="/WEB-INF/app/menu-category/${param.page}.jsp"></jsp:include>
							</c:if>
						</div>
						<!-- jsp include 영역 끝
	================================================== -->
					</div>
					<!-- /.row -->

				</div>
				<!-- /.col-lg-9 -->

			</div>
			<!-- /.row -->

		</div>
		<!-- /.container -->
	</div>
	<script>
		$(document).ready(function() {
			$('a[data-page]').on('click', function() {
				var page = this.getAttribute('data-page');
				location.href = '?page=' + page;
			})
		})
	</script>

	<!-- Bootstrap core JavaScript -->
	<script src="/res/menu-theme/vendor/jquery/jquery.min.js"></script>
	<script
		src="/res/menu-theme/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>
<!-- 수정중 -->

</html>