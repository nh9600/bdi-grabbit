<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<style>
.cart {
	padding-top: 100px;
	text-align: center;
	padding-bottom: 100px;
}

.board-wrapper {
	height: 1300px;
}

.board-container {
	display: none;
}

.showing {
	display: block;
}

.bcDiv {
	width: 360px;
	height: 400px;
	margin: 20px;
	margin-top:40px;
	margin-bottom:40px;
	display: block;
	text-align: center;
	float:left;
}
tr{
width:400px;
height:50px;
}
td{
width:200px;
}

</style>
</head>
	<c:if test="${venue.viStatus=='close'}">
		<script>
			alert('영업중으로 상태를 변경해주세요');
			location.href='/venue/grabit?page=status';
		</script>
	</c:if>
<body>
	
	<div class="cart cart-contatiner">
		<button onclick="socketConnection()">연결</button>
		<button onclick="showingNewOrder()">div 테스트</button>
	</div>
	<div class="board board-wrapper">
		<div class="board board-container"></div>
	</div>
	
	
	<script>
	if(`${param.oiNum}`){
		var oiNum = `${param.oiNum}`;
		getNewOrderDetail(oiNum);
	}
	function loadOrders(){
		$.ajax({
			url : '/loadOrders',
			method : 'GET',
			success : function(res) {
				if (res.result == 'true') {
					console.log(res.orderDetails);
					var order = res.orderDetails;
					showingNewOrder(order);
				} else {
					alert('에러발생 다시시도');
					getNewOrderDetail(oiNum);
				}
			},
			error : function(res) {

			}
		})
	}
	
	/* 	grabit.jsp에서 실행해서 session연결 유지시간을 늘려줄 수 있음
		function socketConnection() {
			var ws = new SockJS('/grabitWs');
			ws.onopen = function(res) {
				console.log('connected..venue:`${venue.viNum}`');
			}
			ws.onmessage = function(data) {
				var oiNum = data.data
				console.log(oiNum);
				getNewOrderDetail(oiNum);
			}
			ws.onclose = function() {
				alert('session closed...')
			}
		} */
	</script>
</body>
</html>