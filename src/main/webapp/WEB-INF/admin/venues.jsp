<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>venue-main</title>
<style>
.tableDiv{
width:80% !important;
height:80% !important;
margin:0 auto !important;
padding:20px !important;
text-align:center !important;
}
#selectCheck{
	float : left;
	padding : 0.8rem 1.7rem;
}
#venue-insert{
	float : left;
	padding : 0.8rem 1.7rem;
}
#venue-delete{
	float : right;
	padding : 0.8rem 1.7rem;
}
.btn-outline-secondary{
	padding : 0.8rem 2rem;
	background-color : #21c87a !important;
	border-color : #6c757d !important;
	border-width : 1px;
}
.selectpicker{
	border-color : #6c757d;
}
.fa-search{
	font-style: normal !important;
}
.table td:hover{
	color : #000000;
	cursor : pointer;
}
.checkBox{
	cursor : pointer;
}
</style>
</head>
<body>

    <!-- HERO
    ================================================== -->
    
    <section class="banner-area py-5" id="banner">
		<div class="tableDiv">
			<div class="container">
    			<div class="row">
    		    	<div class="col-12">
     		   	    	<div class="input-group">
			 				<select class="selectpicker" data-style="btn-primary">
			 					<option>선택</option>
			 					<option value="vi_num">번호</option>
			 					<option value="vi_name">이름</option>
								<option value="vi_addr">주소</option>
		 						<option value="vi_tel">전화번호</option>
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
			<br>
        <table class="table">
			<thead class="table-light">
				<tr>
					<th class="checkBox"><input type="checkbox" id="chk"></th>
					<th>NO</th>
					<th colspan="2" align="left">매장 정보</th>
					<th></th>
					<th>Photo</th>
				</tr>
			</thead>
			<tbody id="venue-table">
			</tbody>
		</table>				
 		<ul class="pagination justify-content-center" id="pagination">
		</ul><br>
		<button class="btn btn-info" id="selectCheck" onclick="selectCheck()">선택</button>
		<button class="btn btn-success" id="venue-insert">매장 추가</button>
		<button class="btn btn-danger" id="venue-delete" onclick="deleteCheck()">삭제</button>	
    </div>
    </section>
    
    <script>
    $('#venue-insert').click(function(){
    	location.href='/venue/grabit?page=venue-insert';
    })
    
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
		
    	
		//선택 click시 체크박스 보이게 하는 로직입니다
		function selectCheck(){
			$('.checkBox').show();
			$('#venue-insert').hide();
			$('#selectCheck').attr('onclick','').unbind('click');
			$('#selectCheck').html('취소');
			$('#selectCheck').on('click',function(){
				$('#selectCheck').attr('onclick','').unbind('click');
				$('.checkBox').hide();
				$('#venue-insert').show();
				$('#selectCheck').html('선택');
				$('#selectCheck').on('click',function(){
					selectCheck();
				})
			})
			
		}

		// 삭제가 되기전에 재확인하는 로직입니다
		function deleteCheck(){

				var msg = '체크된 항목들이 전부 삭제 됩니다 정말 삭제하시겠습니까?';

				if(confirm(msg)!=0){
					deleteTestInfo();

				}
			}

		function deleteTestInfo(){
			
				var viNums = [];
				$('input:checkbox[name=checkValue]:checked').each(function(){
					viNums.push($(this).val());
				})

				$.ajax({
						url : '/deleteVenue',
						method : 'GET',
						data : 'viNums=' + viNums,
						success : function(res) {
							alert(res.msg);
							location.replace('/venue/grabit?page=venues');

						}
					})
			}


			var rowCount = 10;
			var imgPath = "https://spring-test-haley.s3.ap-northeast-2.amazonaws.com/test/";
			
			$(document).ready(function() {
				goPage(1);
			})
			
			function goPage(p,searchParam){
				$.ajax({
					url : '/getVenueList',
					method : 'GET',
					data : 'page.page=' + p + '&' + searchParam,
					success : function(res) {
						var html = '';
						for (var idx of res.list) {
							if(idx.viStatus=='open'){
							html += '<tr class="table-light">';
							}else{
								html += '<tr class="table-secondary">';
							}
							html += '<td class="checkBox"><input type="checkbox" name="checkValue" value="' + idx.viNum + '"></td>'
							html += '<td onclick="goView(' + idx.viNum + ')">' + idx.viNum +'</td>';
							html += '<td onclick="goView(' + idx.viNum + ')" colspan="2" align="left">매장명 : ' + idx.viName + '<br>전화번호 : ' + idx.viTel + '<br>주소 : ' + idx.viAddr + '</td>';
							html += '<td></td>';
							html += '<td><img src="' + imgPath + idx.viImg + '" width="100" height="100" alt="' + idx.viImgFile + '"></td>';
							html += '</tr>';
						}
 
						$('#venue-table').html(html);
						$('.checkBox').hide();
						
						// 체크박스 전체선택 옵션입니다
						$('#chk').click('on',function(){
							if($('input:checkbox[id="chk"]').is(':checked')){
								$('input:checkbox').prop('checked',true);
							}else{
								$('input:checkbox').prop('checked',false);
							}
						})
						
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
						setEvent(searchParam);
					},
					error : function(res){
						console.log(res);
					}
				})
			}
			
			 function setEvent(searchParam){
				$('a[data-page]').on('click',function(){
					goPage(this.getAttribute('data-page'),searchParam);
				})
			}
			 
			 function goView(num){
				 location.href='/venue/grabit?page=venue-view&num=' + num;
			 }
	</script>
</body>
</html>