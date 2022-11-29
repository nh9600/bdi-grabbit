<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>venue-main</title>
</head>
<body>

    <!-- HERO
    ================================================== -->
    
    <section class="banner-area py-5" id="banner">

        <table class="table">
				<thead class="thead-light">
					<tr>
						<th>매장 번호</th>
						<th>메뉴 번호</th>
						<th>카테고리 코드</th>
						<th>메뉴 이름</th>
						<th>메뉴 가격</th>
						<th>메뉴 사진</th>
						<th>메뉴 소개말</th>
					</tr>
				</thead>
				<tbody id="venue-table">
				</tbody>
			</table>
    </section>
    <script>
		window.onload = function(){
			var xhr = new XMLHttpRequest();
			xhr.open('GET', '/getMenu');
			var html = '';
			xhr.onreadystatechange = function() {
				if (xhr.readyState == xhr.DONE) {
					if (xhr.status == 200) {
						var res = JSON.parse(xhr.responseText);
						for(var idx of res){
							html += '<tr>';
							html += '<td>' + idx.viNum + '</td>';
							html += '<td>' + idx.viName + '</td>';
							html += '<td>' + idx.viAddr + '</td>';
							html += '<td>' + idx.viTel + '</td>';
							html += '<td>' + idx.viImg + '</td>';
							html += '<td>' + idx.viIntro + '</td>';
							html += '<td>' + idx.viBusinessdays + '</td>';
							html += '<td>' + idx.viBusinesshours + '</td>';
							html += '<td>' + idx.viStatus + '</td>';
							html += '</tr>'
						}
						document.querySelector('#venue-table').innerHTML = html;
				}
			}
		}
//		xhr.send();
	}
	</script>
</body>
</html>