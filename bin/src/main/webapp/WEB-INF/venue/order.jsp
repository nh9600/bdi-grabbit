<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<style>
.cart{
padding-top:100px;
text-align:center;
padding-bottom:100px;
}
</style>
</head>
<body>
<div class="cart cart-contatiner">
<button onclick="placeAnOrder()">주문</button>
<button onclick="socketTest3()">연결</button>
</div>
<script>
function placeAnOrder(){
	$.ajax({
		url:'/sendNotification?viNum=1&oiNum=1',
		method:'GET',
		success:function(res){
			console.log(res);
			alert(res);
		}
		
	})
}

function socketTest3(){
	var ws = new SockJS('/test3');
	ws.onopen = function(res){
		console.log('connected..venue:`${venue.viNum}`');
		alert('open');
		ws.send('/sendNotification');	
	}
	ws.onmessage = function(data) {
		console.log(data);
		alert(data.data);
	}
}
</script>
</body>
</html>