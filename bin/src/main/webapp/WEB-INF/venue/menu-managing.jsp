<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
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
.btn-outline-secondary{
	padding: 0.5rem 1.5rem;
	background-color : #21c87a !important;
	border-color : #6c757d !important;
	border-width : 1px;
}
.fa-search{
	font-style: normal !important;
}
</style>

<body>
<c:if test="${empty venue }">
<script>
	alert('로그인이 필요합니다.')
	location.href='/venue/grabit?page=main';
	</script>
</c:if>

    <input type="hidden" value="${venue.viNum}" id="currenVenueNum">
	<div class="container">
		<div style="margin: 10px; float: left">
			<button id="menu-insert" type="button" class="btn btn-outline-success">추가</button>
			<button type="button" class="btn btn-outline-danger" onclick="deleteBtn()">삭제</button>
		</div>
		<div class="tableDiv" style="float: left;margin: 10px;">
			<div class="row">
				<div class="col-12">
					<div class="input-group" style="width: 600px">
						<select class="selectpicker" data-style="btn-primary">
			 					<option>선택</option>
			 					<option value="mi_num">메뉴 번호</option>
			 					<option value="mc_code">카테고리 코드</option>
								<option value="mi_name">메뉴 이름</option>
		 						<option value="mc_price">메뉴 가격</option>
		 					</select>
                               <input class="form-control border-secondary py-2" type="search" id="searchBar" placeholder="검색">
      		          		<div class="input-group-append">
								<button class="btn btn-outline-secondary" type="button" onclick="searchBtn()">
									<i class="fa fa-search"></i>
								</button>
							</div>
					</div>
				</div>
			</div>
		</div>
		<table class="table table-bordered">
			<tr>
			    <th>선택</th>
				<th>카테고리 코드</th>
				<th>메뉴 이름</th>
				<th>메뉴 가격</th>
				<th>메뉴 사진</th>
			</tr>
			<tbody id="tBody">
			</tbody>
		</table>
		<ul class="pagination justify-content-center" id="pagination">
		</ul><br>
	</div>

</body>
<script>

function searchBtn(){
	
	var searchOpt = $(".selectpicker option:selected").val();
	var searchVal = $('#searchBar').val();
	
	if(searchOpt=='선택'){
		alert('검색할 옵션을 선택해주세요.');
		return;
	}
	if($.trim(searchVal).length<1){
		alert('한 글자 이상 입력해주세요');
		return;
	}
	var searchParam = 'searchOpt=' + searchOpt + '&searchVal=' + searchVal;
	goPage(1,searchParam);
}

//insert 
$('#menu-insert').click(function(){
	location.href='/venue/grabit?page=menu-insert';
})

//list
var rowCount = 10;
$(document).ready(function(){
	goPage(1);
})
function goPage(page,searchParam){
	$.ajax({
		url:'/menus?viNum='+$('#currenVenueNum').val(),
		method:'GET',
		data : 'page.page=' + page + '&' + searchParam,
		success:function(res){
			console.log(res);
			var html = '';
			for(lists of res.list){
				html += '<tr onclick="goView('+ lists.miNum +')">'
			    html+='<td><input type="checkbox" value="'+ lists.miNum +'"></td>';
				html += '<td>'+ lists.mcCode +'</td>';
				html += '<td>'+ lists.miName +'</td>';
				html += '<td>'+ lists.miPrice +'</td>';
				html += '<td>'+ lists.miImg +'</td>';
				html += '</tr>'
			}
			$('#tBody').html(html);
			
			var totalPage = Math.ceil(res.page.totalCount/rowCount);
			var sPage = Math.floor((res.page.page-1)/10)*10 + 1;
			var ePage = sPage + 9;
			var numberHtml = '';
			if(ePage>totalPage){
				ePage = totalPage;
			}
			if(res.page.page!=1){
				if(sPage==1){
					numberHtml = '<li class="page-item"><a data-page="' + sPage + '" class="page-link" aria-label="Previous"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a> </li>';
				}else{
					numberHtml = '<li class="page-item"><a data-page="' + (sPage-1) + '" class="page-link" aria-label="Previous"><span aria-hidden="true">&laquo;</span><span class="sr-only">Previous</span></a> </li>';
				}
			}
			for(var i = sPage; i<=ePage; i++){
				if(i==res.page.page){
					numberHtml += '<li class="page-item active"><a class="page-link">' + i + '</a></li>';
				}else{
				numberHtml += '<li class="page-item"><a class="page-link" data-page="'+i+'">' + i + '</a></li>';
				}
			}
			if(res.page.page!=totalPage){
				if(ePage==totalPage){
					numberHtml += '<li class="page-item"><a data-page="' + ePage + '" class="page-link" aria-label="Next"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>';
				}else{
					numberHtml += '<li class="page-item"><a data-page="' + (ePage+1) + '" class="page-link" aria-label="Next"><span aria-hidden="true">&raquo;</span><span class="sr-only">Next</span></a></li>';
				}
			}
			$('#pagination').html(numberHtml);
			setEvent();
		},
		error:function(res){
			alert('다시 시도해 주세요.');
		}
	})
}

function setEvent(){
	$('a[data-page]').on('click',function(){
		goPage(this.getAttribute('data-page'));
	})
}
//delete(＊다중 삭제 가능)
function deleteBtn(){
	var checkedObjs = $('input[type=checkbox]:checked');
    console.log(checkedObjs);
    if(checkedObjs.length<1){
    	alert('1개이상 선택하세요.');
    	return;
    }
    var miNums = [];
    for(var i=0;i<checkedObjs.length;i++){
    	miNums.push(checkedObjs[i].value);
    }
    //alert(miNums); 선택한 번호 알림
    
    $.ajax({
    	url:'/menu/delete',
    	method: 'DELETE',
    	data: JSON.stringify({
    		miNums : miNums
    	}),
    	beforeSend : function(xhr){
        	xhr.setRequestHeader('Content-type','application/json;charset=utf-8');
        },
    	success : function(res){
    		console.log(res);
    		if(res.cnt != 0){
    			alert('삭제 완료');
    			location.replace('/venue/grabit?page=menu-managing');
    		}
    	}
    });
}

function goView(miNum){
	 location.href='/venue/grabit?page=menu-view&miNum=' + miNum;
}

</script>
</html>