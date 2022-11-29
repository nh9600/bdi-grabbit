<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>카테고리로 장소 검색하기</title>

</head>
<body>
<!-- 나중에 버튼 지도위로 옮길예정 아직 어떻게 하는지 모르겠습니다 -->
	<input class="form-control border-secondary py-2" type="search" id="searchName" placeholder="검색">
	<button class="btn btn-primary" onclick="search()">현 지도에서 카페 찾기</button>
	<button class="btn btn-primary" onclick="searchMyloacation()">현재 위치</button>
	<div id="map" style="width: 100%; height: 500px;"></div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24722588d60c0162b3a02434e2e449a5&libraries=services"></script>
	<script>
// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places(map); 

// GeoLocation을 이용해서 현재 접속 위치를 얻어옵니다
function searchMyloacation() {
    navigator.geolocation.getCurrentPosition(function(position) {
        
    	latitude = position.coords.latitude, // 위도
    	longitude = position.coords.longitude; // 경도
        

        var locPosition = new kakao.maps.LatLng(latitude, longitude), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
        message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
	    // 마커와 인포윈도우를 표시합니다
	    displayMarker(locPosition, message);
       
        
      	var mapOption = {
    		center : locPosition,
  	        level: 3 // 지도의 확대 레벨
	    };     
        //현재위치를 지도 중앙에 놓기
   		map.setCenter(locPosition);
    });
}

//현재 지도에서 주변에있는 카페를 검색합니다
function search(){
	var position = map.getCenter();
	map.setCenter(position);
	ps.categorySearch('CE7', placesSearchCB, {useMapBounds:true});
}





// 키워드 검색 완료 시 호출되는 콜백함수 입니다
function placesSearchCB (data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {
        for (var i=0; i<data.length; i++) {
            displayMarker(data[i]);
        }       
    }
    for(var i = 0; i<data.length; i++){
    	if(data[i].phone == ''){
    		continue;
    	}
	    var param = 'viName=' + data[i].place_name + '&viTel=' + data[i].phone + '&viAddr=' + data[i].road_address_name + '&viLatitude=' + data[i].x + '&viLongitude=' + data[i].y;
	    $.ajax({
			url : '/getVenue',
			method : 'GET',
			data : 'viName=' + data[i].place_name + '&viLatitude=' + data[i].x + '&viLongitude=' + data[i].y,
			async : false,
			success : function(res) {
				if(res.result == 'false'){
					insertCafe(param);
				}
			},
			error : function(res){
				console.log(res);
			}
		})
	    
	    
    }
}

function insertCafe(param){
	 $.ajax({
			url : '/insertVenue',
			method : 'GET',
			data : param,
			success : function(res) {
			}
		}) 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place, message) {
	if(place.Ga && place.Ha){
		place.x = place.Ga
		place.y = place.Ha
		place.place_name = '현재 위치'
	}
    // 마커를 생성하고 지도에 표시합니다
    var marker = new kakao.maps.Marker({
        map: map,
        position: new kakao.maps.LatLng(place.y, place.x) 
    });

    // 마커에 클릭이벤트를 등록합니다 
    kakao.maps.event.addListener(marker, 'click', function() {
        // 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
        $.ajax({ 
			url : '/getVenue',
			method : 'GET',
			data : 'viName=' + place.place_name + '&viLatitude=' + place.x + '&viLongitude=' + place.y,
			success : function(res) {
				if(place.place_name=='현재 위치'){
					infowindow.setContent('<div id="cafe" style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
			        infowindow.open(map, marker);
				}else{
			        infowindow.setContent('<div id="cafe" style="padding:5px;font-size:12px;"><a href="/app/grabit?page=cafe-view&vNum=' + res.venue.viNum + '&vName=' + res.venue.viName + '&vImg=' + res.venue.viImg + '">' + place.place_name + '</a></div>');
			        infowindow.open(map, marker);
				}
				
			},
			error : function(res){
				console.log(res);
			}
		})
    });
}
</script>
</body>
</html>