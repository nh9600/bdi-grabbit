<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Station</title>
 
    <script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<style>
.stn-wrapper{
width:500px;
height:500px;
padding-top:50px;
display:block;
text-align:center;
margin:0 auto;
}
</style>
</head>
<body>
<c:if test="${empty venue }">
	<script>
	alert('로그인이 필요합니다.')
	location.href='/venue/grabit?page=main';
	</script>
</c:if>
<div class="body container stn-wrapper">
<button onclick="getSession()">웹소켓 test</button>
<button onclick="connect()">SockJS test</button>
<button onclick="onStation()">/app/order test</button>

</div>

<script>
if(`${venue.viStatus}`=='close'){
	alert('현재 영업중이 아닙니다. 영업상태를 변경해주세요');
	location.href='/venue/grabit?page=status';
}

function connect(){
	var socket = new SockJS('/ws');
	stompClient = Stomp.over(socket);
	stompClient.connect({},function(frame){
		console.log('Connected: ' + frame);
		stompClient.subscribe('/topic/orders',function(res){
			alert(res);
			
		});
	});
}

function disconnect(){
	if(stompClient !==null){
		stompClient.disconnect();
	}
	console.log("Disconnected");
}
function onStation(){
	stompClient.send("/app/orders",{},JSON.stringify({'ws':stompClient,'connectedHeaders':stompClient}))
}

$(document).ready(function(){
	
})
function getSession(){
	var socket = new SockJS('/wsws');
	
	
}
</script>
</body>
</html>