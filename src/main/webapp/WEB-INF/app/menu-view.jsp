<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

@media(min-width:576px){ 
.options {
	padding:0.5rem 2.25rem;
}
}
@media(min-width:415px) and (max-width:575px){ 
.options {
	padding:0.5rem 4.6rem;
}
}
@media(min-width:100px) and (max-width:414px){ 
.options {
	padding:0.5rem 3.0rem;
}
}

.btn-secondary:not(:disabled):not(.disabled).active, 
.btn-secondary:not(:disabled):not(.disabled):active, 
.show>.btn-secondary.dropdown-toggle {
	color: #fff;
    background-color: #28a745;
    border-color: #28a745;
}

/* opCount */
.mBtn, .pBtn {
  padding: 0rem 1rem;
}

.spinner * {
  text-align: center;
}
.spinner input::-webkit-outer-spin-button,
.spinner input::-webkit-inner-spin-button {
  margin: 0;
  -webkit-appearance: none;
}
.spinner input:disabled {
  background-color: white;
}


</style>
</head>
<body>
    <div class="modal fade bs-example-modal-sm" id="modMenu" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">    
      <div class="modal-dialog modal-sm">
        <div class="modal-content">

          <!-- Modal Header -->
          <div class="modal-header">
            <h3 class="modal-title" id="mName"></h3>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
          </div>

          <!-- Modal body -->
          <div class="modal-body"> 
			<div class="container text-center">
				<img class="img-thumbnail" id="mImg" src="">					
			<div class="container divCount">
			  <span class="opCounter" hidden>1</span>
			  <div class="input-group spinner">
			    <div class="input-group-prepend">
			      <button class="btn text-monospace minus mBtn" type="button">-</button>
			    </div>
			    <input id="cntAmout" type="number" class="count form-control" min="0" max="100" step="1" value="1">
			    <div class="input-group-append">
			      <button class="btn text-monospace plus pBtn" type="button">+</button>
			    </div>
			  </div>
			</div>
			</div>
			<h4 class="page-header" style="padding:5px 0px 3px 8px;"></h4>	
			<div id="mOpt">
			
			</div>
			<br>
			<div class="container mb-4">
			    <div class="row">
			        <div class="col-12">
			            <div  class="table-responsive">
				            </div>
			        </div>
			        <div class="col mb-2">
			            <div class="row">
			            	<button class="btn btn-block btn-light" data-dismiss="" onclick="addCart()">카트에 추가</button>
							<button class="btn btn-lg btn-block btn-success text-uppercase" data-dismiss="" data-target="#modCart" data-toggle="" onclick="addCart()">결제</button>
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
    var orderList = [];

	//cart 타고 DB 까지 넘어가야할 데이터 
    var odMap = {};
	var odList = [];

  	</script>
  	
    <!-- opCount Script -->
    <script>
	$(document).ready(function() {
		  min = 1; // Minimum of 0
		  max = 100; // Maximum of 10
		  $('.count').prop('disabled', true);
		  $(".mBtn").on("click", function() {
		    if ($('.count').val() > min) {
		      $('.count').val(parseInt($('.count').val()) - 1 );
		      $('.opCounter').text(parseInt($('.opCounter').text()) - 1 );
		    }
		  });
		  $(".pBtn").on("click", function() {
		    if ($('.count').val() < max) {
		      $('.count').val(parseInt($('.count').val()) + 1 );
		      $('.opCounter').text(parseInt($('.opCounter').text()) + 1 );
		    }
		  });
	});
    </script>
      
    <!-- Modal Script -->
    <script>
    $('#modMenu').on('show.bs.modal', function(e) {
    	$('#mName').text(mName); 
    	$('#mImg').attr('src',mList[1]);
    	$.ajax({
    		url:'/menu',
    		method:'GET',
    		data:'miNum=' + mList[0],
    		success:function(res){
    			if(res.moCode == 1){   				
    				options('opHotIce');
    				options('opWhipping');
    				options('opIce');
    				options('opWater');
    				options('opMilk');
    				options('opShot');
    			} else if(res.moCode == 2){
    				options('opIce');
    				options('opMilk');				
    			} else if(res.moCode == 3){
    				options('opHotIce');
    				options('opIce');
    				options('opWater');
    			}
    			document.querySelector('#mOpt').innerHTML = optHtml; 
    			slider();
    			optHtml = '';
    		},
    		error:function(res){
    			alert();			
    		}
    	})	  	 
    })

    
    </script>
    
    <!-- function Script -->
    <script>   
	var optHtml = '';
	function options(op){
		if (op == 'opHotIce'){
			optHtml += '<h4 class="page-header" style="padding:5px 0px 3px 8px;"></h4>'	
			optHtml += '<div class="container text-center">'				
			optHtml += '<div class="btn-group btn-group-toggle" data-toggle="buttons">'
			optHtml += '<label class="btn btn-secondary options">'
			optHtml += '<input type="radio" name="opHotIce" value="hot" autocomplete="off"> Hot'
			optHtml += '</label>'
			optHtml += '<label class="btn btn-secondary options">'
			optHtml += '<input type="radio" name="opHotIce" value="ice" autocomplete="off"> Ice'
			optHtml += '</label>'
			optHtml += '</div></div>'			
		} else if(op == 'opWhipping'){
			optHtml += '<h4 class="page-header" style="padding:20px 0px 3px 10px;">휘핑</h4>'	
			optHtml += '<div class="container text-center">'				
			optHtml += '<div class="btn-group btn-group-toggle" data-toggle="buttons">'
			optHtml += '<label class="btn btn-secondary options">'
			optHtml += '<input type="radio" name="opWhip" value="whipYes" autocomplete="off"> Yes'
			optHtml += '</label>'
			optHtml += '<label class="btn btn-secondary options">'
			optHtml += '<input type="radio" name="opWhip" value="whipNo" autocomplete="off"> No'
			optHtml += '</label>'
			optHtml += '</div></div>'	
		} else if(op == 'opIce'){ 
			optHtml += '<div class="container" style="padding:20px 10px 10px 10px">'
			optHtml += '<h4 class="page-header">얼음양 <span style="float:right;" id="iceVal"></span></h4>'
	    	optHtml += '<div class="panel panel-default">'
	    	optHtml += '<div class="panel-body">'
	    	optHtml += '<input class="opIce" type="text" data-slider-min="0" data-slider-max="100" data-slider-step="25" data-slider-value="50"/><br>'
	    	optHtml += '</div></div></div>' 	   
		} else if(op == 'opWater'){
			optHtml += '<div class="container" style="padding:20px 10px 10px 10px">'
			optHtml += '<h4 class="page-header">물양 <span style="float:right;" id="waterVal"></span></h4>'
	    	optHtml += '<div class="panel panel-default">'
	    	optHtml += '<div class="panel-body">'
	    	optHtml += '<input class="opWater" type="text" data-slider-min="0" data-slider-max="100" data-slider-step="25" data-slider-value="50"/><br>'
	    	optHtml += '</div></div></div>' 	
		} else if(op == 'opMilk'){
			optHtml += '<div class="container" style="padding:20px 10px 10px 10px">'
			optHtml += '<h4 class="page-header">우유양 <span style="float:right;" id="milkVal"></span></h4>'
	    	optHtml += '<div class="panel panel-default">'
	    	optHtml += '<div class="panel-body">'
	    	optHtml += '<input class="opMilk" type="text" data-slider-min="0" data-slider-max="100" data-slider-step="25" data-slider-value="50"/><br>'
	    	optHtml += '</div></div></div>' 	    	
		} else if(op == 'opShot'){
			optHtml += '<div class="container" style="padding:20px 10px 10px 10px">'
			optHtml += '<h4 class="page-header">에스프레소 <span style="float:right;" id="shotVal"></span></h4>'
	    	optHtml += '<div class="panel panel-default">'
	    	optHtml += '<div class="panel-body">'
	    	optHtml += '<input class="opShot" type="text" data-slider-min="0" data-slider-max="2" data-slider-step="1" data-slider-value="0"/><br>'
	    	optHtml += '</div></div></div>' 		
		}
	}
	</script>
	
	<!-- Function Script -->
	<script>
	function slider(){
	   	$('.opIce').slider({
	  		formatter: function(value){
			return '현재값: ' + value;
			}
		})
		$(".opIce").on("slide", function(slideEvt){
			$("#iceVal").text(slideEvt.value + '%');
		})
		
		$('.opWater').slider({
	  		formatter: function(value){
			return '현재값: ' + value;
			}
		})
		$(".opWater").on("slide", function(slideEvt){
			$("#waterVal").text(slideEvt.value + '%');
		})		
		$('.opMilk').slider({
	  		formatter: function(value){
			return '현재값: ' + value;
			}
		})
		$(".opMilk").on("slide", function(slideEvt){
			$("#milkVal").text(slideEvt.value + '%');
		})
		$('.opShot').slider({
	  		formatter: function(value){
			return '현재값: ' + value;
			}
		})
		$(".opShot").on("slide", function(slideEvt){
			$("#shotVal").text(slideEvt.value + '샷 추가');
		})
	}

	function addCart(){	
		modInit()
		var ckAmount = $('.opCounter').text();
		if(document.querySelector('input[name=opHotIce]:checked') == null){
			alert('Hot과 Ice 중 선택해주세요.');
    		return false;
		} else if(document.querySelector('input[name=opWhip]:checked') == null){
			alert('Whipping 여부를 선택해주세요.');
    		return false;
		} else {
			var ckHotIce = document.querySelector('input[name=opHotIce]:checked').value;
			var ckWhip = document.querySelector('input[name=opWhip]:checked').value;
		}	
		var ckIce = $('.opIce').attr('value');
		var ckWater = $('.opWater').attr('value');
		var ckMilk = $('.opMilk').attr('value');
		var ckShot = $('.opShot').attr('value');
		    	
		var orderForm = {
			miNum:mList[0],
			name : mName,
			image : mList[1],
			price : mList[2],
			count : ckAmount,
			hotIce : ckHotIce,
			whip : ckWhip,
			ice : ckIce,
			water : ckWater,
			milk : ckMilk,
			shot : ckShot
		}
		odMap = {
			miNum:mList[0],
			miPrice:mList[2],
			odQuantity:ckAmount,
			whip : ckWhip,
			ice : ckIce,
			water : ckWater,
			milk : ckMilk,
			shot : ckShot
		}
		
		orderList.push(orderForm);	
		odList.push(odMap);

		$('.count').val(1);
		$('.opCounter').text(1);
		$('.btn-light').attr('data-dismiss','modal');
		modEnd();
	}
    </script>
	
	<!-- Modal Script -->
	<script>
		function modInit() { 
			$('.btn-light').attr('data-dismiss','');
			$('.text-uppercase').attr('data-dismiss','');
			$('.text-uppercase').attr('data-toggle','');	
		}
		function modEnd() {
			$('.btn-light').attr('data-dismiss','modal');
			$('.text-uppercase').attr('data-dismiss','modal');
			$('.text-uppercase').attr('data-toggle','modal');			
		}
	
		$('#modMenu').on('hide.bs.modal', function(e) {
			$('.count').val(1);
			$('.opCounter').text(1);
		})
	</script>
	    
</body>
</html>