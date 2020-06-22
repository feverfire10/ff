<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/FullCalendar/vendor/css/fullcalendar.min.css" />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/FullCalendar/vendor/css/bootstrap.min.css">
	<link rel="stylesheet" href='${ pageContext.servletContext.contextPath }/resources/FullCalendar/vendor/css/select2.min.css' />
	<link rel="stylesheet" href='${ pageContext.servletContext.contextPath }/resources/FullCalendar/vendor/css/bootstrap-datetimepicker.min.css' />
	<link rel="stylesheet" href="${ pageContext.servletContext.contextPath }/resources/FullCalendar/css/main.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Open+Sans:400,500,600">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
#wrapper {
	width: 426px;
}

.container1 {
	padding: 0px;
}

.div_main {
	border : 1px solid silver;
	width: 1300px;
	min-width: 500px;
	margin: auto;
	border-radius: 6px;
	background-color: rgb(250, 253, 255);
}

.div_header {
	margin: 1px;
	width: 1296px;
	height: 43px;
	background-color: rgb(240, 251, 255);
}

.tb_header {
	width: 100%;
	height: 100%;
	text-align: center;
	border-collapse: collapse;
	border-top-right-radius: 5px;
	border-top-left-radius: 5px;
	letter-spacing: 1px;
	font-size: 15px;
	border-style: hidden; /* hide standard table (collapsed) border */
	/* box-shadow: 0 0 0 1px #666; /* this draws the table border  */
}

#medicalDate {
	height: 100%;
	width: 100%;
	font-size: 16px;
}

input[type="date"]::-webkit-outer-spin-button, input[type="date"]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

.tb_body1_tb tbody tr:nth-child(odd) {
	/* background-color: rgb(196, 235, 255); */
	
}

.tb_body1_tb tbody tr:nth-child(even) {
	/* background-color: rgb(235, 248, 255); */
	
}

.tb_body1_tb tbody tr:first-child {
	background-color: rgb(1, 153, 220);
	color: white;
}

.div_body1 {
	/* border: 1px solid gray; */
	width: 100%;
	height: 465px;
}

.div_body1_cal {
	margin: 0px;
	float: left;
	/* border: 1px solid gray; */
	width: 33%;
	height: 100%;
}

.div_body1_tb, .div_body2_tb {
	margin: 0px;
	float: left;
	/* border: 1px solid gray; */
	width: 67%;
	/* margin-left: 12px; */
	height: 100%;
}

.div_body1{
	border-top: 1px solid silver;
}

.div_body1_tb{
	border-left: 1px solid silver;
}

.tb_body1_tb{
	width: 100%;
	border-collapse: collapse;
	white-space: nowrap;
	text-align: center;
}

.tb_body2_tb{
	width: 100%;
	border-collapse: collapse;
	white-space: nowrap;
	text-align: center;
}

.tb_body2_tb>tbody>tr:first-child {
	background-color: rgb(1, 153, 220);
	color: white;
}

.tb_body2_tb>tbody>tr {
	line-height: 43px;
}

.tb_body1_tb>tbody>tr>th, .tb_body1_tb>tbody>tr>td, .tb_body2_tb>tbody>tr>th,
	.tb_body2_tb>tbody>tr>td {
	/* border: 1px solid gray; */
	text-align: center;
}

.div_body1_div1 {
	height: 394px;
    overflow-y: scroll;
    margin-top: 13px;
}

.tb_body1_tr:hover {
	cursor: pointer;
	background-color: rgb(196, 235, 255);
	line-height: 43px;
}

.div_checkbox{
	margin-top: 15px;
	margin-left: 15px;
	margin-bottom: 15px;
}

.tb_body1_tr {
	line-height: 43px;
}

.div_body2 {
	/* border: 1px solid gray; */
	border-top : 1px solid silver;
	width: 100%;
	height: 350px;
}

.div_body2_div2 {
	height: 303px;
	overflow-y: scroll;
}

.div_body3 {
	/* border: 1px solid gray; */
	width: 100%;
	height: 150px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
}

#body3_txt {
	width: 100%;
	height: 100%;
	resize: none;
	line-height: 30px;
	letter-spacing: 1px;
	font-size: 20px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	border : none;
	border-top: 1px solid silver;
}

.btn-primary {
	margin-top: 20px;
	margin-left: 5px;
	margin-bottom: 5px;
	background-color: rgb(1, 153, 220);
	border: none;
}

.btn_vital{
    margin-top: 3px;
    margin-left: 0px;
    margin-bottom: 0px;
    background-color: rgb(1, 153, 220);
    border: none;
}

.tb_header_td1 {
	/* border: 1px solid gray; */
	width: 145px;
	background-color: rgb(1, 153, 220);
	color: white;
}

.tb_header_td2 {
	/* border: 1px solid gray; */
	width: 145px;
}

.label1 {
	display: inline-block;
	width: 100px;
}

.fc-sat {
	color: #0000FF;
} /* 토요일 */
.fc-sun {
	color: #FF0000;
} /* 일요일 */
.fc-day:hover {
	background: lightblue;
	cursor: pointer;
}
/*Allow pointer-events through*/
.fc-slats, /*horizontals*/ .fc-content-skeleton, /*day numbers*/
	.fc-bgevent-skeleton /*events container*/ {
	pointer-events: none
}

.fc-button {
	border: none;
}

.fc-day-header {
	background: rgb(1, 153, 220);
	color: white;
	font-weight: bold;
	font-size: 15px;
}

/* The container */
.container {
  display: inline-block;
  width: 90px;
  position: relative;
  padding-left: 35px;
  margin-bottom: 12px;
  cursor: pointer;
  font-size: 15px;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* Hide the browser's default checkbox */
.container input {
  position: absolute;
  opacity: 0;
  cursor: pointer;
  height: 0;
  width: 0;
}

/* Create a custom checkbox */
.checkmark {
  position: absolute;
  top: 0;
  left: 0;
  height: 25px;
  width: 25px;
  background-color: #eee;
}

/* On mouse-over, add a grey background color */
.container:hover input ~ .checkmark {
  background-color: #ccc;
}

/* When the checkbox is checked, add a blue background */
.container input:checked ~ .checkmark {
  background-color: #2196F3;
}

/* Create the checkmark/indicator (hidden when not checked) */
.checkmark:after {
  content: "";
  position: absolute;
  display: none;
}

/* Show the checkmark when checked */
.container input:checked ~ .checkmark:after {
  display: block;
}

/* Style the checkmark/indicator */
.container .checkmark:after {
  left: 9px;
  top: 5px;
  width: 5px;
  height: 10px;
  border: solid white;
  border-width: 0 3px 3px 0;
  -webkit-transform: rotate(45deg);
  -ms-transform: rotate(45deg);
  transform: rotate(45deg);
}

</style>
<script>
	var clickDate ="";
	var clickChartNum ="";
	var clickPatientsName ="";
	var clickPatientsPno ="";
	$(function(){
		document.getElementById("medicalDate").value = new Date().toISOString().substring(0, 10);
	});
	
/* 	$(document).on("click",".fc-day",function(){
		var thisDate = $(this).attr("data-date");
		alert(thisDate);
	}); */
	
	$(document).on("click",".tb_body1_tr",function(){
		clickChartNum = $(this).children().eq(1).text();
		clickPatientsName = $(this).children().eq(2).text();
		clickPatientsPno = $(this).children().eq(3).text();
		
		$('#tb_header_chartNum').text($(this).children().eq(1).text());
		$('#tb_header_name').text($(this).children().eq(2).text());
		$('#tb_header_insurance').text($(this).children().eq(9).text());
		
		var ssnYear = $(this).children().eq(3).text().substring(0,2);
		var genNum = $(this).children().eq(3).text().substring(7,8);
		var nowYear = new Date().getFullYear();
		var gender;
		var age = 0;
		if(genNum == "1" || genNum == "3"){
			 gender = "남";
			 if(genNum == "1"){
				 age = parseInt(nowYear) - (1900 + parseInt(ssnYear));
			 }else if(genNum == "3"){
				 age = parseInt(nowYear) - (2000 + parseInt(ssnYear));
			 }
		}else{
			gender = "여";
			if(genNum == "2"){
				 age = parseInt(nowYear) - (1900 + parseInt(ssnYear));
			 }else if(genNum == "4"){
				 age = parseInt(nowYear) - (2000 + parseInt(ssnYear));
			 }
		}
		$('#tb_header_genAge').text(gender+"("+age+")");
		
		$.ajax({
			url : "initCal.rc",
			data : {
				patiName : $(this).children().eq(2).text(),
				patiSSN : $(this).children().eq(3).text()
			},
			type : "get",
			success : function(list) {
				
				$('#calendar').fullCalendar('removeEvents'); //원래있던 이벤트 싹다 지워줌
				var obj = ""; // json 객체 담아줄놈
				for(var i in list){
					if(i==0){
						obj += "[";
					}
					var date = list[i].receiptDate.toString();/* .replace(/\//gi, "-"); */
					obj += '{"backgroundColor":"rgb(196, 235, 255)", "rendering" : "background", "date" :"' + date +'"}';
					if(i!=list.length-1){
						obj += ",";
					}
					if(i==list.length-1){
						obj += "]";
					}
				}
				var arr = JSON.parse(obj);
				//console.log(arr);
				$("#calendar").fullCalendar('addEventSource', arr);
			},
			error : function(){
				
			}
		});
	});
</script>
</head> 
<body>
	<!--가즈아 ~! -->
	<div class="div_main" id="div_main">
		<div class="div_header" id="div_header">
			<table class="tb_header" id="tb_header">
			<jsp:include page="/WEB-INF/views/common/sideBar.jsp"></jsp:include>
				<tr>
					<td class="tb_header_td1"><b>작업일자</b></td>
					<td class="tb_header_td2"><input type="date" id="medicalDate"></td>
					<td class="tb_header_td1"><b>차트번호</b></td>
					<td class="tb_header_td2" id="tb_header_chartNum"></td>
					<td class="tb_header_td1"><b>수진자명</b></td>
					<td class="tb_header_td2" id="tb_header_name"></td>
					<td class="tb_header_td2" id="tb_header_genAge"></td>
					<td class="tb_header_td1"><b>보험유형</b></td>
					<td class="tb_header_td2" id="tb_header_insurance"></td>
				</tr>
			</table>
		</div>
		<div class="div_body1" id="div_body1">
			<div class="div_body1_cal" id="div_body1_cal">
				<%-- <jsp:include page="fullCal.jsp" /> --%>
	<div class="container1">
        <div id="wrapper">
            <div id="loading"></div>
            <div id="calendar"></div>
        </div>
    </div>
    <!-- /.container -->
			</div>
			<div class="div_body1_tb" id="div_body1_tb">
				<button class="btn btn-primary" id="btn_WaitTreatment">진료대기</button>
				<button class="btn btn-primary" id="btn_medicalTreatment">진료보류</button>
				<button class="btn btn-primary" id="btn_waitReserv">예약대기</button>
				<div class="div_body1_div1">
				<table class="tb_body1_tb" id="tb_body1_tb">
					<tr style="line-height: 43px;">
						<th>순번</th>
						<th>차트번호</th>
						<th>이름</th>
						<th>주민번호</th>
						<th>성별</th>
						<th>나이</th>
						<th>담당의</th>
						<th>진료과</th>
						<th>초재진</th>
						<th>보험</th>
					</tr>
				</table>
				</div>
			</div>
		</div>
		<div class="div_body2" id="div_body2">
			<div class="div_checkbox">
			<label class="container">전체
				  <input id="cbAll" type="checkbox" checked="checked">
				  <span class="checkmark"></span>
				</label>
				<label class="container">상병
				  <input id="cbSb" type="checkbox" checked="checked">
				  <span class="checkmark"></span>
				</label>
				<label class="container">증상
				  <input id="cbJs" type="checkbox" checked="checked">
				  <span class="checkmark"></span>
				</label>
				<label class="container">처방
				  <input id="cbYak" type="checkbox" checked="checked">
				  <span class="checkmark"></span>
				</label>
				<button class="btn btn-primary btn_vital" id="btn_vital">바이탈</button>
				</div>
			<div class="div_body2_div2">
				<table class="tb_body2_tb" id="tb_body2_tb">
					<tr style="line-height: 43px;">
						<th>진료코드</th>
						<th>진료명칭</th>
						<th>총투여</th>
						<th>횟수</th>
						<th>일수</th>
						<th>급여구분</th>
						<th>전달부서</th>
						<th>단가</th>
						<th>야간</th>
						<th>응급</th>
					</tr>
				</table>
				<div class="div_Chart" style="display : none;"><canvas id="myChart" width="1270" height="280"></canvas></div>
			</div>
		</div>
		<div class="div_body3" id="div_body3">
			<textarea id="body3_txt"></textarea>
		</div>
	</div>
	<script>
		$("#cbAll").change(function(){
	        if($("#cbAll").is(":checked")){
	        	$("input:checkbox[id='cbSb']").prop("checked", true);
	        	$("input:checkbox[id='cbJs']").prop("checked", true);
	        	$("input:checkbox[id='cbYak']").prop("checked", true);
	        	$(".diseaseHistory").css('visibility','visible');
				$(".PrescriptionHistory").css('visibility','visible');
				$("#body3_txt").css('visibility','visible');
	        }else{
	        	$("input:checkbox[id='cbSb']").prop("checked", false);
	        	$("input:checkbox[id='cbJs']").prop("checked", false);
	        	$("input:checkbox[id='cbYak']").prop("checked", false);
	        	$(".diseaseHistory").css('visibility','collapse');
				$(".PrescriptionHistory").css('visibility','collapse');
				$("#body3_txt").css('visibility','collapse');
	        }
	    });
	
		$("#cbSb").change(function(){
			if($("#cbSb").is(":checked")){
				$(".diseaseHistory").css('visibility','visible');
			}else{
				$(".diseaseHistory").css('visibility','collapse');
				$("input:checkbox[id='cbAll']").prop("checked", false);
			}
		});
		$("#cbJs").change(function(){
			if($("#cbJs").is(":checked")){
				$(".PrescriptionHistory").css('visibility','visible');
			}else{
				$(".PrescriptionHistory").css('visibility','collapse');
				$("input:checkbox[id='cbAll']").prop("checked", false);
			}
		});
		$("#cbYak").change(function(){
			if($("#cbYak").is(":checked")){
				$("#body3_txt").css('visibility','visible');
			}else{
				$("#body3_txt").css('visibility','collapse');
				$("input:checkbox[id='cbAll']").prop("checked", false);
			}
		});
		
		$(function() {
			$("#btn_WaitTreatment").click(function(){
				$(".div_Chart").css("display","none");
				var clickChartNum ="";
				var clickPatientsName ="";
				var clickPatientsPno ="";
				goajax1(0);
			});
		});
		$(function() {
			$("#btn_medicalTreatment").click(function(){
				$(".div_Chart").css("display","none");
				goajax1(1);
			});
		});
		$(function() {
			$("#btn_waitReserv").click(function(){
				$(".div_Chart").css("display","none");
				goajax1(2);
			});
		});
		$(function() {
			$("#btn_vital").click(function(){
				govital();
			});
		});
		
		function govital(){
			if(clickPatientsName == ""){
				return;
			}
			$.ajax({
				url : "vitalChart.rc",
				data : {
					clickPatientsName : clickPatientsName,
					clickPatientsPno : clickPatientsPno
				},
				type : "get",
				success : function(list) {
						console.log(list);

					var dd = '';
					var ctx = document.getElementById('myChart');
					var myChart = new Chart(ctx, {
						type: 'line',
						data: {
							labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
							datasets: [
								{
									label: '체온',	data: [12, 19, 3, 5, 2, 3],borderWidth: 1,
									backgroundColor: ['rgba(220, 1, 1, 0.2)'],borderColor: ['rgba(255, 99, 132, 1)'],
									pointRadius: 5, pointHoverRadius: 5, fill : 'start'
								},
								{
									label: '몸무게',	data: [12, 19, 3, 5, 2, 3],borderWidth: 1,
									backgroundColor: ['rgba(220, 209, 1, 0.2)'],borderColor: ['rgba(255, 99, 132, 1)'],
									pointRadius: 5, pointHoverRadius: 5, fill : 0
								},
								{
									label: '식전혈당',	data: [12, 19, 3, 5, 2, 3],borderWidth: 1,
									backgroundColor: ['rgba(23, 220, 1, 0.2)'],borderColor: ['rgba(255, 99, 132, 1)'],
									pointRadius: 5, pointHoverRadius: 5, fill : 1
								},
								{
									label: '식후혈당',	data: [12, 19, 3, 5, 2, 3],borderWidth: 1,
									backgroundColor: ['rgba(1, 220, 187, 0.2)'],borderColor: ['rgba(255, 99, 132, 1)'],
									pointRadius: 5, pointHoverRadius: 5, fill : 2
								},
								{
									label: '최저혈압',	data: [12, 19, 3, 5, 2, 3],borderWidth: 1,
									backgroundColor: ['rgba(0, 76, 255, 0.2)'],borderColor: ['rgba(255, 99, 132, 1)'],
									pointRadius: 5, pointHoverRadius: 5, fill : 3
								},
								{
									label: '최고혈압',	data: [12, 19, 3, 5, 2, 3],borderWidth: 1,
									backgroundColor: ['rgba(166, 0, 255, 0.2)'],borderColor: ['rgba(255, 99, 132, 1)'],
									pointRadius: 5, pointHoverRadius: 5, fill : 4
								}
							]
						},
						options: {
							responsive: false,
							scales: {
								yAxes: [{
									ticks: {
										beginAtZero: true
									}
								}]
							}
						}
					});
					$("#tb_body2_tb tbody").empty();
					$(".div_Chart").css("display","block");
					
					$.each(list, function(i, obj) { // list[i] == obj
						myChart.data.labels[i] = obj.receiptDate;
						myChart.data.datasets[0].data[i] = obj.fever;
						myChart.data.datasets[1].data[i] = obj.weight;
						myChart.data.datasets[2].data[i] = obj.beforeBs;
						myChart.data.datasets[3].data[i] = obj.afterBs;
						myChart.data.datasets[4].data[i] = obj.minBp;
						myChart.data.datasets[5].data[i] = obj.maxBp;
						
					});
					
					myChart.update();
				},
				error : function(request, status, error) {
					alert("code = " + request.status + " message = "
							+ request.responseText + " error = " + error); // 실패 시 처리
				}
			});
			
		
			

		}
		
		function goajax1(clinicState){	
			$.ajax({
				url : "selPatients.rc",
				data : { 
					receiptDate : $("#medicalDate").val(),
					clinicState : clinicState
					
				},
				type : "get",
				success : function(list) {
					console.log(list);
					$('#calendar').fullCalendar('removeEvents'); //원래있던 이벤트 싹다 지워줌
				    view = calendar.fullCalendar('getView');
				    view.unrenderDates();
				    view.renderDates();
				    calendar.fullCalendar('refetchEvents');
					
				var value = "<tr style='line-height: 43px;'>" + "<th>" + "순번" + "</th>" + "<th>"
							+ "차트번호" + "</th>" + "<th>" + "이름" + "</th>"
							+ "<th>" + "주민번호" + "</th>" + "<th>" + "성별"
							+ "</th>" + "<th>" + "나이" + "</th>" + "<th>"
							+ "담당의" + "</th>" + "<th>" + "진료과" + "</th>"
							+ "<th>" + "초재진" + "</th>" + "<th>" + "보험"
							+ "</th>" + "</tr>";

					$.each(list, function(i, obj) { // list[i] == obj
						var ssnYear = obj.patientsPno.substring(0, 2);
						var genNum = obj.patientsPno.substring(7, 8);
						var nowYear = new Date().getFullYear();
						var gender;
						var age = 0;
						if (genNum == "1" || genNum == "3") {
							gender = "남";
							if (genNum == "1") {
								age = parseInt(nowYear)
										- (1900 + parseInt(ssnYear));
							} else if (genNum == "3") {
								age = parseInt(nowYear)
										- (2000 + parseInt(ssnYear));
							}
						} else {
							gender = "여";
							if (genNum == "2") {
								age = parseInt(nowYear)
										- (1900 + parseInt(ssnYear));
							} else if (genNum == "4") {
								age = parseInt(nowYear)
										- (2000 + parseInt(ssnYear));
							}

						}
						value += "<tr class='tb_body1_tr'>" + "<td>" + i
								+ "</td>" + "<td>" + obj.chartNo + "</td>"
								+ "<td>" + obj.patientsName + "</td>" + "<td>"
								+ obj.patientsPno + "</td>" + "<td>" + gender
								+ "</td>" + "<td>" + age + "</td>" + "<td>"
								+ obj.mo + "</td>" + "<td>" + obj.lastDo
								+ "</td>" + "<td>" + obj.adhd + "</td>"
								+ "<td>" + obj.insurance + "</td>" + "</tr>";
					});
					$("#tb_body1_tb tbody").empty();
					$("#tb_body1_tb tbody").append(value);
				},
				error : function(request, status, error) {
					alert("code = " + request.status + " message = "
							+ request.responseText + " error = " + error); // 실패 시 처리
				}
			});
		}
	</script>
	<script src="${ pageContext.servletContext.contextPath }/resources/FullCalendar/vendor/js/jquery.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/FullCalendar/vendor/js/bootstrap.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/FullCalendar/vendor/js/moment.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/FullCalendar/vendor/js/fullcalendar.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/FullCalendar/vendor/js/ko.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/FullCalendar/vendor/js/select2.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/FullCalendar/vendor/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/FullCalendar/js/main.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/FullCalendar/js/addEvent.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/FullCalendar/js/editEvent.js"></script>
    <script src="${ pageContext.servletContext.contextPath }/resources/FullCalendar/js/etcSetting.js"></script>
	<script type="text/javascript"> 
	
	/* var arr = [{'backgroundColor':'99CCFF', 'start':'2020-05-23', 'end':'2020-05-25'}]; */
	
	var calendar = $('#calendar').fullCalendar({
		dayClick: function(date, jsEvent, view) {
			clickDate = moment(date).format('YYYY-MM-DD');
			history();
	     }
	});
	
	function history(){
		if(clickPatientsName == ""){
			return;
		}
		$(".div_Chart").css("display","none");
		$("#tb_body2_tb tbody").empty();
		$.ajax({
			url : "DiseaseHistory.rc",
			data : {
				clickDate : clickDate,
				clickPatientsName : clickPatientsName,
				clickPatientsPno : clickPatientsPno
			},
			type : "post",
			success : function(list) {
			var value = "<tr class='tb_body2_tb' style='line-height: 43px;'>" 
					+ "<th>" + "진료코드" + "</th>"
					+ "<th>" + "진료명칭" + "</th>"
					+ "<th>" + "총투여" + "</th>"
					+ "<th>" + "횟수" + "</th>"
					+ "<th>" + "일수" + "</th>"
					+ "<th>" + "급여구분" + "</th>"
					+ "<th>" + "전달부서" + "</th>"
					+ "<th>" + "단가" + "</th>"
					+ "<th>" + "야간" + "</th>"
					+ "<th>" + "응급" + "</th>"
					+ "</tr>";
			//console.log(list);
				$.each(list, function(i, obj) { // list[i] == obj
					
					value += "<tr class='tb_body2_tr diseaseHistory'>"
							+ "<td>" + obj.diseaseCode + "</td>"
							+ "<td>" + obj.diseaseKname + "</td>"
							+ "<td>" + "" + "</td>"
							+ "<td>" + "" + "</td>"
							+ "<td>" + "" + "</td>"
							+ "<td>" + "" + "</td>"
							+ "<td>" + "" + "</td>"
							+ "<td>" + "" + "</td>"
							+ "<td>" + "" + "</td>"
							+ "<td>" + "" + "</td>"
							+ "</tr>";
				});
				$("#tb_body2_tb tbody").append(value);
			},
			error : function(request, status, error) {
				alert("code = " + request.status + " message = "
						+ request.responseText + " error = " + error); // 실패 시 처리
			}
		});
		$.ajax({
			url : "PrescriptionHistory.rc",
			data : {
				clickDate : clickDate,
				clickPatientsName : clickPatientsName,
				clickPatientsPno : clickPatientsPno
			},
			type : "post",
			success : function(list) {
			var	value = "";
			//console.log(list);
				$.each(list, function(i, obj) { // list[i] == obj
				value += "<tr class='tb_body2_tr PrescriptionHistory'>"
							+ "<td>" + obj.prescripUserCode + "</td>"
							+ "<td>" + obj.prescripName + "</td>"
							+ "<td>" + obj.totalAd + "</td>"
							+ "<td>" + obj.numTimes + "</td>"
							+ "<td>" + obj.numDays + "</td>"
							+ "<td>" + obj.salaryClassific + "</td>"
							+ "<td>" + obj.prescripType + "</td>"
							+ "<td>" + "" + "</td>"
							+ "<td>" + obj.nightTime + "</td>"
							+ "<td>" + obj.emergency + "</td>"
							+ "</tr>";
				});
				$("#tb_body2_tb tbody").append(value);
			},
			error : function(request, status, error) {
				alert("code = " + request.status + " message = "
						+ request.responseText + " error = " + error); // 실패 시 처리
			}
		});
		$.ajax({
			url : "SymptomHistory.rc",
			data : {
				clickDate : clickDate,
				clickPatientsName : clickPatientsName,
				clickPatientsPno : clickPatientsPno
			},
			type : "post",
			success : function(list) {
				var value = "";
				$.each(list, function(i, obj) { // list[i] == obj
					value += obj.symptomHistory + "\n";							
				});
				$("#body3_txt").val(value);
			},
			error : function(request, status, error) {
				alert("code = " + request.status + " message = "
						+ request.responseText + " error = " + error); // 실패 시 처리
			}
		});
	}
	</script>

<%--push test--%>
</body>
</html>









