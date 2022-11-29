<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="res/main_theme/js/jquery.min.js"></script>
</head>
<body>
<button onclick=test()>크릭~</button>

<script>

function test(){
	alert("안녕?");
	$.get('/test2', function(response) {
		console.log(response);
	});
}

getData(function(tableData) {
	console.log(tableData); // $.get()의 response 값이 tableData에 전달됨
});
</script>
</body>
</html>