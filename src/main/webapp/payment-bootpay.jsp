<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js" type="application/javascript"></script>
    <script src="/res/main_theme/js/jquery.min.js"></script>
</head>
<body>
<button onclick="pay()">결제</button>
<table border="1">
	<tr>
		<td>주문번호</td>
	</tr>
	<tbody id="ckReceipt">
	</tbody>
</table>

<script>
var html = '';
function pay(){
	BootPay.request({
		price: '1000', 
		application_id: "5e4b725102f57e00224b3e58",
		name: '블링블링 마스카라', 
		pg: '',
		method: '', 
		show_agree_window: 0, 
		items: [
			{
				item_name: '나는 아이템',
				qty: 1, 
				unique: '123',
				price: 1000, 
				cat1: 'TOP', 
				cat2: '티셔츠', 
				cat3: '라운드 티', 
			}
		],
		user_info: {
			username: '사용자 이름',
			email: '사용자 이메일',
			addr: '사용자 주소',
			phone: '010-1234-4567'
		},
		order_id: '고유order_id_1234', 
		params: {callback1: '그대로 콜백받을 변수 1', callback2: '그대로 콜백받을 변수 2', customvar1234: '변수명도 마음대로'},
		account_expire_at: '2018-05-25', 
		extra: {
		    start_at: '2019-05-10', 
			end_at: '2022-05-10',
	        vbank_result: 1,
	        quota: '0,2,3' 
		}
	}).error(function (data) {
		console.log(data);
	}).cancel(function (data) {
		console.log(data);
	}).ready(function (data) {
		console.log(data);
	}).confirm(function (data) {
		console.log(data);
		var enable = true; 
		if (enable) {
			BootPay.transactionConfirm(data);
		} else {
			BootPay.removePaymentWindow(); 
		}
	}).close(function (data) {
	    console.log(data);
	}).done(function (data) {
	 	$.ajax({
			url:'/pay',
			method:'GET',
			data: 'pmReceipt=' + data.receipt_id,
			success:function(res){
				console.log(res);
			 	html += '<tr>'
				html += '<td onclick="payDelete(this)">' + data.receipt_id, + '</td>'
				document.querySelector('#ckReceipt').innerHTML = html;		
				if(res == null){
					alert("검증 실패!");			
				}
			}, 
			error:function(res){
				alert("검증 실패!");
			}
		})	
	});
}

function payDelete(obj){
	var receiptNum = obj.innerText 
 	$.ajax({
		url:'/pay',
		method:'DELETE',
		data: 'pmReceipt=' + receiptNum,
		success:function(res){
			alert("취소 성공!")			
		}, 
		error:function(res){
			alert("취소 실패!");
		}
	}) 
}
</script>


</body>
</html>