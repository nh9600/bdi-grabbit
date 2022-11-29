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
		<input type="hidden" value="${venue.viCode}" id="currenVenueNum" data-menu="viCode" name="viCode">  
		<input type="hidden" value="${param.miNum}" id="currenMenuNum" data-menu="miNum" name="miNum">
		<!--<form method="post" action="/menu/insert"
			enctype="multipart/form-data">-->
			<table class="table table-bordered">
				<tr>
					<th style="width: 200px">카테고리 코드</th>
					<td><select data-menu="mcCode" name="mcCode">
							<option value=1>001 커피</option>
							<option value=2>002 차</option>
							<option value=3>003 에이드</option>
							<option value=4>004 스무디</option>
							<option value=5>005 블렌디드 음료</option>
							<option value=6>006 베이커리</option>
					</select></td>
				</tr>
				<tr>
				    <th>메뉴 옵션 코드</th>
				    <td><select data-menu="moCode" name="moCode">
							<option value=1>001 핫/아이스,얼음량,시럽,샷,휘핑</option> <!--우유가 안들어간 커피-->
							<option value=2>002 핫/아이스,우유량,시럽,휘핑</option> <!--우유가 들어간 커피-->
							<option value=3>003 핫/아이스,얼음량</option> <!--차(ex.아이스티)-->
							<option value=4>004 얼음량</option><!--에이드-->
							<option value=5>005 휘핑</option> <!--스무디-->
							<option value=6>006 옵션 없음</option> <!--베이커리 등(선택할게 없음)-->
					</select></td>
				</tr>
				<tr>
					<th>메뉴 이름</th>
					<td><input style="width: 250px" type="text" data-menu="miName" name="miName"></td>
				</tr>
				<tr>
					<th>메뉴 가격</th>
					<td><input type="number" data-menu="miPrice" name="miPrice"></td>
				</tr>
				<tr>
					<th>메뉴 사진</th>
					<td><input type="file" data-menu="miImgFile" name="miImgFile" class="form-control"></td>
				</tr>
				<!-- <tr>
					<th>메뉴 사진</th>
					<td><input type="file" id="miImg"></td>
				<tr> -->
				<tr>
					<th>메뉴 소개말</th>
					<td><textarea data-menu="miIntro" name="miIntro" cols="70" rows="5"
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
			var objs = document.querySelectorAll('select[data-menu],input[data-menu],textarea[name]')
			console.log(objs);
			
			var formData = new FormData(); 
			for(var i=0;i<objs.length;i++){
				var obj = objs[i];
				if(obj.type=='file'){
					if(obj.files.length){
					formData.append(obj.name, obj.files[0]);				
					console.log(obj.files[0]);
					}
				}else{
					formData.append(obj.name, obj.value);
				}
			}
/* 			var param = {
				viNum : $('#viNum').html(),	
				mcCode : $('#mcCode').val(),
				miName : $('#miName').val(),
				miPrice : $('#miPrice').val(),
				miImg : $('#miImg').val(),
				miIntro : $('#miIntro').val()
			} */
			
			console.log(formData);
			
			$.ajax({
				url : '/menu/insert',
				method : 'POST',
				data : formData,
				contentType : false,
				processData: false,
				success : function(res) {
					alert(res.msg);
					console.log(res);
					location.href='/venue/grabit?page=menu-managing';
				},
				error : function(res){
					console.log(res)
					alert(res.msg);
				}
			});
		}
	</script>
</body>
</html>