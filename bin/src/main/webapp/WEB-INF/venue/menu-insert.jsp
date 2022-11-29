<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.main-container {
    padding-top: 60px;
    padding-bottom: 100px;
    }
</style>

<body>
<c:if test="${empty venue }">
	<script>
	alert('로그인이 필요합니다.')
	location.href='/venue/grabit?page=main';
	</script>
</c:if>

	<div class="container">
		<!--<form method="post" action="/menu/insert"
			enctype="multipart/form-data">-->
			<table class="table table-bordered">
				<tr>
					<th>매장 번호</th>
					<td id="viNum">${venue.viNum}</td>
				</tr>
				<tr>
					<th style="width: 200px">카테고리 코드</th>
					<td><select id="mcCode">
							<option value=1>001 커피</option>
							<option value=2>002 차</option>
							<option value=3>003 에이드</option>
							<option value=4>004 스무디</option>
							<option value=5>005 블렌디드 음료</option>
							<option value=6>006 베이커리</option>
					</select></td>
				</tr>
				<tr>
					<th>메뉴 이름</th>
					<td><input style="width: 250px" type="text" id="miName"></td>
				</tr>
				<tr>
					<th>메뉴 가격</th>
					<td><input type="number" id="miPrice"></td>
				</tr>
				<tr>
					<th>메뉴 사진</th>
					<td><input type="text" id="miImg"></td>
				</tr>
				<!-- <tr>
					<th>메뉴 사진</th>
					<td><input type="file" id="mcImg"></td>
				<tr> -->
				<tr>
					<th>메뉴 소개말</th>
					<td><textarea id="miIntro" cols="70" rows="5"
							placeholder="내용을 입력하십시오."></textarea></td>
				<tr>
					<th colspan="2"><button style="" class="btn btn-outline-success"
							onclick="insertBtn()">저장</button></th>
				</tr>
			</table>
		<!-- </form> -->
	</div>
	<script>
		function insertBtn() {
			var param = {
				viNum : $('#viNum').html(),	
				mcCode : $('#mcCode').val(),
				miName : $('#miName').val(),
				miPrice : $('#miPrice').val(),
				miImg : $('#miImg').val(),
				miIntro : $('#miIntro').val()
			}
			$.ajax({
				url : '/menu/insert',
				method : 'POST',
				data : JSON.stringify(param),
				contentType : "application/json; charset=UTF-8",
				success : function(res) {
					alert('등록 되었습니다.');
					console.log(res);
					location.href='/venue/grabit?page=menu-managing';
				},
				error : function(res){
					console.log(res)
					alert('다시 시도해 주세요.');
					location.href='/venue/grabit?page=menu-managing';
				}
			});
		}
	</script>
</body>
</html>