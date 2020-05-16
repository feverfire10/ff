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
<!-- jQuery CDN -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- modal bootstrap js -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- modal bootstrap css -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/medical/modal/css/bootstrap.css">
</head>
<body>
	<div id="outer">
		<!-- 중앙 화면 부분 -->
		<div id="mid-left">
			<img src="resources/images/mid-left-main.jpg" style="width: 750px; position: absolute;"/>
			<button type="button" id="apiBtn" data-toggle="modal" data-target="#apiModal">위치보기</button>
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
		<div id="modal_api_area">
			<input type='text' value='서울 강남구 테헤란로14길 6 남도빌딩 2층, 3층, 4층'>
		</div>
		<div class="modal fade" id="apiModal" role="dialog">
	    <div class="apiModal">    
	
	      <!-- Modal content-->
	      <div class="modal-content">
	        <div class="modal-header">
	          <h4 class="codeTitle">상병코드조회</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	        
	        <div id="map" style="width:500px;height:400px;"></div>
			
	     
	      </div>
	    </div>
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
		
		// 지도 api 부분
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(33.450701, 126.570667),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
	</script>

</body>
</html>