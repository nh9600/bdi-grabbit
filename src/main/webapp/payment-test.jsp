<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/res/main_theme/js/jquery.min.js"></script>
</head>
<body>
	<h1>카카오페이 테스트</h1>

	<button onclick="kpayTest()">테스트하기</button>
	<script>
		function kpayTest() {
			$.ajax({
					url : '/kakao/payment',
					method : 'POST',
					success : function(res) {
						alert(res)
					}
				})
			}
	</script>
</body>
</html>