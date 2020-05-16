<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel=" shortcut icon" href="resources/images/logo2.png">
<link rel="icon" href="resources/images/logo2.png">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div#mid-left {
	    position: absolute;
	    left: 200px;
	    top: 200px;
        width: 750px;
    	height: 563px;
	}
	div#mid-right {
	    width: 750px;
	    height: 563px;
	    position: absolute;
	    top: 200px;
	    left: 950px;
	}
	div#mid_head {
	    text-align: center;
	    line-height: 6;
	}
	h1#mid_head_title {height: 160px;}
	div#mid_content_right {
	    float: right;
	    display: table-cell;
	    margin-right: 150px;
	}
	div#mid_content_left {
	    display: table-cell;
	    float: left;
	    margin-left: 126px;
	}
	div#mid_footer {
	    position: absolute;
	    bottom: 90px;
	    left: 45%;
	}
	button#comBtn {
	    height: 35px;
	    width: 100px;
	    border-radius: 15px;
	    font-weight: 900;
	    cursor: pointer;
	    outline: none !important;
	}
	.imgBtn{cursor:pointer;}
	button#apiBtn {
	    position: absolute;
	    width: 90px;
	    height: 30px;
	    border-radius: 15px;
	    right: 10px;
	    bottom: 10px;
	}
	/* 위치보기 modal 스타일 */
	.apiModal {
	    position: absolute;
	    left: 60px;
	    top: 100px;
	    width: 1750px;
	}
	
</style>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69b0a9018799ca073e6a3156072740a5"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69b0a9018799ca073e6a3156072740a5&libraries=LIBRARY"></script>
<!-- services 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69b0a9018799ca073e6a3156072740a5&libraries=services"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=69b0a9018799ca073e6a3156072740a5&libraries=services,clusterer,drawing"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- jQuery CDN -->
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->

<%-- <!-- modal bootstrap js -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- modal bootstrap css -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/medical/modal/css/bootstrap.css"> --%>
</head>
<body>
	<div id="outer">
		<!-- 중앙 화면 부분 -->
		<div id="mid-left">
			<img src="resources/images/mid-left-main.jpg" style="width: 750px; position: absolute;"/>
			<button type="button" id="apiBtn" onclick="displayApi();">위치보기</button>
		</div>
		<div id="mid-right">
			<div id="mid_head">
				<h1 id="mid_head_title">KH의원 역삼점</h1>
			</div>
			<div id="mid_content">
				<div id="mid_content_left">
					<h2 id="mid_head_title">진료안내</h2><br>
					<table>
						<tr>
							<td>평일</td>
							<td>09:00 ~ 18:30</td>
						</tr>
						<tr>
							<td>주말/공휴일</td>
							<td>09:00 ~ 13:00</td>
						</tr>
						<tr>
							<td>점심시간</td>
							<td>13:00 ~ 14:00</td>
						</tr>
					</table>				
				</div>
				<div id="mid_content_right">
					<br><br>
					<img class="imgBtn" src="resources/images/add_large.png" onclick="imgBtn(0);"/>
					<br><br>
					<img class="imgBtn" src="resources/images/consult_small_yellow_pc.png" onclick="imgBtn(1);"/>
				</div>
			</div>
			
			<div id="mid_footer">
				<button type="button" id="comBtn">예약하기</button>
			</div>
		</div>	
		<!-- 지도 API 부분 -->
		<div id="apiArea" style="display: none;">
			<div id="map" style="width:500px;height:400px;"></div>
			<input type='text' id="inputAddress" value='서울 강남구 테헤란로14길 6 남도빌딩 '>
  		</div>
		
		
		
	</div>
	<script>
		// 카카오 서비스 링크 부분
		function imgBtn(e){
			if(e==1){
				window.open("http://pf.kakao.com/_xcxnmaxb/chat");
			}else{
				window.open("http://pf.kakao.com/_xcxnmaxb");
			}
		};
		var container = document.getElementById('map');
		
		
		
		// 지도 api 부분
		function displayApi(){
			// 열어줄 div
			var container = document.getElementById("apiArea");
			//console.log(container);
			// 주소값 저장
			var addr = document.getElementById("inputAddress").value;
			console.log(addr);
			var options = {
				center: new kakao.maps.LatLng(33.450701, 126.570667),
				level: 3	// 지도 확대 레벨
			};
			// 지도 생성
			var map = new kakao.maps.Map(container, options);
			
			// 주소-좌표 변환 객체를 생성합니다
	         var geocoder = new kakao.maps.services.Geocoder();
	         // 주소로 좌표를 검색합니다
	         geocoder.addressSearch(addr, function(result, status) {
	             // 정상적으로 검색이 완료됐으면 
	              if (status === kakao.maps.services.Status.OK) {

	                 var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

	                 // 결과값으로 받은 위치를 마커로 표시합니다
	                 var marker = new kakao.maps.Marker({
	                     map: map,
	                     position: coords
	                 });

	                 // 인포윈도우로 장소에 대한 설명을 표시합니다
	                 var infowindow = new kakao.maps.InfoWindow({
	                     content: '<div style="width:150px;text-align:center;padding:6px 0;">병원위치</div>'
	                 });
	                 infowindow.open(map, marker);

	                 // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	                 map.setCenter(coords);
	             }   
	         });
	         
         var container = document.getElemetById('map');			// 지도를 표시할 div
         mapOption ={
       		 center: new daum.maps.Map(container, mapOption),	// 지도의 중심좌표
       		 leve: 1											// 지도의 확대 레벨
         };
         // 지도를 미리 생성
		 var map = new daum.maps.Map(Container, mpaOption);
         // 주소-좌표 변환 객체를 생성
         var geocoder = new daum.maps.services.Geocoder();
         // 마커를 미리 생성
         var marker = new daum.maps.Marker({
        	 position: new daum.maps.Latlng(0, 0),
        	 map: map
         });
         
         new daum.Postcode({
        	oncomplete: function(data){
        		var addr = data.address;						// 최종 주소 변수
        		 // 주소 정보를 해당 필드에 넣는다.
        		var addr = document.getElementById("inputAddress").value;
        		// 담길 주소값 : 서울 강남구 테헤란로14길 6 남도빌딩
        		geocoder.addressSearch(addr, function(results, status){
        			// 정상적으로 검색이 완료되었을 경우
        			if(status == daum.maps.services.Status.OK){
        				var result = results[0];					// 첫번재 결과의 값을 활용
        				
        				// 해당 주소에 대한 좌표를 받아서
        				var coords = new daum.maps.LatLng(result.y, result.x);
        				// 지도를 보여준다.
        				container.style.display = "block";
        				map.relayout();
        				// 지도 중심을 변경한다.
        				map.setCenter(coords);
        				// 마커를 결과값으로 받은 위치로 옮긴다.
        				marker.setPosition(coords);
        			}
       			});
       		}
         }).open();
		}
		      
	</script>

</body>
</html>