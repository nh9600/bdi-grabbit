function updateOrderInfo(oiNum){
	$.ajax({
		url:'/order',
		method:'PUT',
		
	})
}
const bcDivDetails = 'bcDiv';
function showingNewOrder(order) {
	// order detail을 포함하는 div를 만들어 화면에 뿌려준다
	var boardWrapper = document.querySelector('.board-wrapper');
	var item = document.querySelectorAll('.board-container');
	var itemsId = 'item' + item.length
	var newBcDiv = document.createElement("DIV");
	newBcDiv.classList.add(bcDivDetails);
	newBcDiv.id = itemsId
	boardWrapper.appendChild(newBcDiv);
	var html = '<div class=\"card border-success mb-3\" style=\"max-width: 18rem;\">';
	html += '<div class=\"card-header bg-transparent border-success\">주문번호 : '
			+ order.oiNum + '</div>';
	html += '<div class=\"card-body text-success\">';
	html += '<h5 class=\"card-title\">유저번호 : ' + order.uiNum + '</h5>';
	html += '<p class=\"card-text\">주문내역 : ' + order.oiMsg + '</p>';
	html += '<p class=\"card-text\">요청사항 : ' + order.oiClaim + '</p>';
	html += '<button class=\"btn btn-dark\" onclick=\"updateOrderInfo('+order.oiNum+')\">주문수락</button></div>';
	html += '<div class=\"card-footer bg-transparent border-success\">'
			+ order.oiDate + '  ' + order.oiCretim + '</div>'
	html += '</div>';
	newBcDiv.innerHTML = html;
}

function getNewOrderDetail(oiNum) {
	console.log(oiNum)
	// onmessage를 통해 받은 메세지의 order number를 가지고 order info에서 detatil을 가져온다
	order = {
		oiNum : oiNum
	}
	$.ajax({
		url : '/loadNewOrder',
		method : 'POST',
		contentType : 'application/json; charset=UTF-8',
		data : JSON.stringify(order),
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