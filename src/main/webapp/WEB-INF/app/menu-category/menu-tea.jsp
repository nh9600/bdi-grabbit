<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		$(document).ready(function() {
			$.ajax({
					url : '/menu/coffee',
					method : 'GET',
					success : function(res) {
					var list = res;
					console.log(list);
					var html = '';
					for (var i = 0; i < list.length; i++) {
					if (list[i].mcCode == 2) {
					html += '<div class="col-lg-4 col-md-6 mb-4">';
					html += '<div class="card h-100">';
					html += '<a href="#"><img class="card-img-top" src="http://placehold.it/700x400" alt=""></a>';
					html += '<div class="card-body">';
					html += '<h4 class="card-title">';
					html += '<a href="#" >'+ list[i].miName + '</a></h4>';
					html += '<h5>'+ list[i].miPrice + '</h5>'
					html += '<p class="card-text">' + list[i].miIntro + '</p>';
					html += '</div></div></div>'
						}
					}
                    $('#rowClass').html(html);
                    }
			});
		})
						
	</script>
</body>
</html>