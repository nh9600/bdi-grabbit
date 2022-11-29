<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/*Modal Style*/
.center {
	margin-top: 50px;
}

.modal-header {
	padding-bottom: 5px;
}

.modal-footer {
	padding: 0;
}

.modal-footer .btn-group button {
	height: 40px;
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	border: none;
	border-right: 1px solid #ddd;
}

.modal-footer .btn-group:last-child>button {
	border-right: 0;
}
}
</style>

<script src="https://cdn.bootpay.co.kr/js/bootpay-3.0.2.min.js"
	type="application/javascript"></script>
</head>
<body>

	<!-- Modal
    ================================================== -->

	<div class="modal fade bs-example-modal-lg" id="modCart" tabindex="-1"
		role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h3 class="modal-title" id="lineModalLabel">쇼핑카트</h3>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body">
					<div class="container mb-4">
						<div class="row">
							<div class="col-12">
								<div class="table-responsive">
									<table class="table table-striped text-center">
										<thead>
											<tr>
												<th colspan="5">주문내역</th>
											</tr>
										</thead>
										<tbody id="cartView">

										</tbody>
									</table>
								</div>
							</div>
							<div class="col mb-2">
								<div class="row">
									<div class="col-sm-12  col-md-6">
										<button class="btn btn-block btn-light">Continue
											Shopping</button>
									</div>
									<div class="col-sm-12 col-md-6 text-right">
										<button
											class="btn btn-lg btn-block btn-success text-uppercase"
											onclick="checkOut()">Checkout</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- Modal footer -->
			</div>
		</div>
	</div>

	<script>
		var orderHtml = '';
		$('#modCart')
				.on(
						'show.bs.modal',
						function(e) {
							for (var i = 0; i < orderList.length; i++) {
								console.log(orderList[i]);
								orderHtml += '<tr>';
								orderHtml += '<td><img class="img-thumbnail" style="width:50px; height:50px;" src="' + orderList[i].image + '"/></td>'
								orderHtml += '<td style="display:none;">' + i
										+ '</td>'
								//카트에서 삭제할 때 odList에서도 삭제하기 위해서 넣은 정보(브라우저에선 보이지 않음)
								orderHtml += '<td name="odrName" style="vertical-align:middle;">'
										+ orderList[i].name + ' '
								orderHtml += '<br>'
								orderHtml += '<p name="odrOption" value="">'

								if (orderList[i].hotIce != null) {
									orderHtml += orderList[i].hotIce + ", "
								}
								if (orderList[i].whip != null) {
									orderHtml += orderList[i].whip + ", "
								}
								if (orderList[i].ice != null) {
									orderHtml += orderList[i].ice + "%, "
								}
								if (orderList[i].water != null) {
									orderHtml += orderList[i].water + "%, "
								}
								if (orderList[i].milk != null) {
									orderHtml += orderList[i].milk + "%, "
								}
								if (orderList[i].shot != null) {
									orderHtml += orderList[i].shot + "샷 "
								}
								orderHtml += '</p>'
								orderHtml += '</td>'
								if (orderList[i].count > 1) {
									orderHtml += '<td style="vertical-align:middle;">수량 : '
											+ orderList[i].count + '</td>'
								}
								if (orderList[i].count == 1) {
									orderHtml += '<td style="vertical-align:middle;">수량 : 1 </td>'
								}
								orderHtml += '<td style="vertical-align:middle;">'
										+ orderList[i].price
										* orderList[i].count + '원</td>'
								orderHtml += '<td style="vertical-align:middle;"><button value="1" onclick = deleteLine(this)><i class=\"fa fa-trash\"></i></button>'
								orderHtml += '</tr>'

							}
							document.querySelector('#cartView').innerHTML = orderHtml;
							orderList = [];
						})

		function deleteLine(obj) {
			var tr = $(obj).parent().parent();

			tr.remove();
			orderHtml = $('#cartView').html();

			var td = tr.children()[1];//숨겨진 td값 (테이블 행 순서)
			var index = parseInt(td.innerText);
			odList[index] = null;//odList안의 해당 index값을 null로 바꿔 방번호수와 쇼핑카트 행의 수는 동기화를 유지하면서 값은 삭제된 형태로 바꿔줌
		}
	</script>
	<script>
		
		function checkOut(){
			$.ajax({
				async : false,
				url : '/venue/check',
				method : 'GET',
				data : {
					viNum : `1`
				},
				success : function(res) {
					if (res.result == 'true') {
						var venue = res.venue;
						if (venue.viStatus == 'open') {
							cartPay();
						} else {
							alert('현재 영업중이 아닙니다.')
							return false;
						}
					}
				}
			})
		}
		//브라우저에서 checkout누르면 위의 checkOut 이 실행되고 그안에서 cartPay호출
		function cartPay() {
			var oiMessage = []
			for (i = 0; i < document.querySelectorAll('[name=odrOption]').length; i++) {
				var odrName = []
				odrName.push(document.querySelectorAll('[name=odrName]')[i].textContent);
				oiMessage.push(odrName);
			}
			var param = {
				odList : odList,
				oiMessage : oiMessage,
				uiNum : `${userNum}`,
				viNum : `${param.vNum}`
			}
			if (oiMessage.length < 1) {
				alert(' 상품이 존재하지 않습니다');
				return false;
			}
			if (ckOrder() == true) {
				$.ajax({
					async : false,
					url : '/order',
					method : 'POST',
					data : JSON.stringify(param),
					contentType : 'application/json',
					success : function(res) {
						console.log(res);
						pay();
					},
					error : function(res) {
						alert('다시 시도해주세요');
					}
				})
			}
		}
	</script>

	<!-- Order Validation Check -->
	<script>
		function ckOrder() {
			var flag = [];
			for (var i = 0; i < odList.length; i++) {
				$.ajax({ // 결제 페이지로 넘어가기 전 miNum과 miPrice가 DB와 일치하는지 확인하는 작업
					url : '/order',
					method : 'GET',
					data : 'miNum=' + odList[i].miNum + '&miPrice='
							+ odList[i].miPrice,
					success : function(res) {
						if (res.result == 'false') {
							alert('주문오류!');
							location.reload();
						}
					},
					error : function(res) {
					}
				})
			}
			return true;
		}
	</script>

	<!-- Payment Script -->
	<script>
		var html = '';
		function pay() {
			BootPay
					.request({
						price : '1000',
						application_id : "5e4b725102f57e00224b3e58",
						name : '블링블링 마스카라',
						pg : '',
						method : '',
						show_agree_window : 0,
						items : [ {
							item_name : '나는 아이템',
							qty : 1,
							unique : '123',
							price : 1000,
							cat1 : 'TOP',
							cat2 : '티셔츠',
							cat3 : '라운드 티',
						} ],
						user_info : {
							username : '사용자 이름',
							email : '사용자 이메일',
							addr : '사용자 주소',
							phone : '010-1234-4567'
						},
						order_id : '고유order_id_1234',
						params : {
							callback1 : '그대로 콜백받을 변수 1',
							callback2 : '그대로 콜백받을 변수 2',
							customvar1234 : '변수명도 마음대로'
						},
						account_expire_at : '2018-05-25',
						extra : {
							start_at : '2019-05-10',
							end_at : '2022-05-10',
							vbank_result : 1,
							quota : '0,2,3'
						}
					})
					.error(function(data) {
						console.log(data);
					})
					.cancel(function(data) {
						console.log(data);
					})
					.ready(function(data) {
						console.log(data);
					})
					.confirm(function(data) {
						console.log(data);
						var enable = true;
						if (enable) {
							BootPay.transactionConfirm(data);
						} else {
							BootPay.removePaymentWindow();
						}
					})
					.close(function(data) {
						console.log(data);
					})
					.done(
							function(data) {
								$
										.ajax({
											url : '/pay',
											method : 'GET',
											data : 'pmReceipt='
													+ data.receipt_id,
											success : function(res) {
												console.log(res);
												html += '<tr>'
														html += '<td onclick="payDelete(this)">'
																+ data.receipt_id,
														+'</td>'
												document
														.querySelector('#ckReceipt').innerHTML = html;
												if (res == null) {
													alert("검증 실패!");
												}
											},
											error : function(res) {
												alert("검증 실패!");
											}
										})
							});
		}

		function payDelete(obj) {
			var receiptNum = obj.innerText
			$.ajax({
				url : '/pay',
				method : 'DELETE',
				data : 'pmReceipt=' + receiptNum,
				success : function(res) {
					alert("취소 성공!")
				},
				error : function(res) {
					alert("취소 실패!");
				}
			})
		}
	</script>
</body>
</html>