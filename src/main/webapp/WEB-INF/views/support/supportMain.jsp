<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>

<% response.setContentType("text/html; charset=utf-8"); %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel=" shortcut icon" href="resources/images/logo2.png">
<link rel="icon" href="resources/images/logo2.png">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   .move_share1 {
       POSITION: fixed;
       MARGIN-LEFT: -700px;
       TOP: 130px;
       LEFT: 44%;
       border: 1px solid #E7E7E7;
       background: #FAFAFA;
       padding: 10px;
       width: 95px;
       text-align: center;
        border-radius: 15px;
   }
   .move_share2 {
       POSITION: fixed;
       MARGIN-LEFT: -700px;
       TOP: 390px;
       LEFT: 44%;
       border: 1px solid #E7E7E7;
       background: #FAFAFA;
       padding: 10px;
       width: 95px;
       text-align: center;
        border-radius: 15px;
   }
   .sideBtn {
       width: 70px;
       height: 40px;
       background: rgb(1,153,220);
       border-radius: 10px;
       border: 0;
       outline: none;
       cursor: pointer;
       font-weight: bolder;
       font-size: 14px;
   }
   .sideBtn:hover {
       background: cadetblue;
       color: white;
   }
   .sideH{
      margin: 0;
       padding-top: 5px;
       padding-bottom: 5px;
   } 
*:focus{outline: none;}
.supportOuter{
	width:1300px;
	margin-left: auto;
	margin-right:auto;
}
.patientCount{
	height:40px;
	float:left;
	border: 1px solid ;
	background: rgb(1,153,220);
	width:100px;
	font-size: 1.2em;
	text-align:center;
	line-height:40px;
}
.selectbox{
	float:left;
}
.selectbox input{
	width:200px;
	height:42px;
}
.patientInfo{
	float:left;
	height: 180px;
	border: 1px solid;
}
.infoOne{
	float:left;
}
.infoTwo{
	float:left;
}
.infoThree{
	float:left;
}
.infoFour{
	float:left;
}
.infoName{
	width: 150px;
	height: 40px;
	border-radius: 3px 5px 8px 10px;
	margin-left:15px;
}
.form-control{
	margin-top:30px;
	width: 230px;
	height: 24px;
	border-radius: 3px 5px 8px 10px;
}
p{
	
}
#supportListOne{
	border-collapse: collapse;

}
#supportListOne th{
	border:1px solid;
/* 	width:100%; */
	height:50px;
	text-align:center;
	white-space:nowrap; 
	background: rgb(1,153,220);
}
#supportListOne td{
	text-align:center;
	overflow:hidden;
}
#supportListTwo{border-collapse: collapse;}
#supportListTwo th{
	border:1px solid;
	width:100%;
	height:50px;
	text-align:center;
 	white-space:nowrap; 
	background: rgb(1,153,220);
}
#supportListTwo td{
	text-align:center;
	overflow:hidden;
}
td{
	text-align:center;
}
</style>
</head>
<body>
	<!-- 사이드 메뉴바 영역 -->
   <div class="move_share1">
      <h5 class="sideH">page</h5>
      <hr>   
      <button class="sideBtn" data-toggle="modal" data-target="#intro">원무</button>
      <br><br>
      <button class="sideBtn">진료</button>
      <br><br>
      <button class="sideBtn">지원</button>
      <br>
   </div>
   <div class="move_share2">
      <h5 class="sideH">menu</h5>
      <hr>   
      <button class="sideBtn" data-toggle="modal" data-target="#patientSearch">환자조회</button>
      <br><br>
      <button class="sideBtn" data-toggle="modal" data-target="#completeList">외래내역</button>
      <br><br>
      <button class="sideBtn" data-toggle="modal" data-target="#patientSearch">대기환자</button>
      <br>
   </div>
   
	<div class="supportOuter" style="margin-top:50px;">
		<!-- <div class="patientCount">외래</div>
		<div class="patientCount" style="background:white;">14</div>
		<div class="patientCount">물리치료</div>
		<div class="patientCount" style="background:white;">14</div>
		<div class="patientCount">방사선</div>
		<div class="patientCount" style="background:white;">14</div> -->
		
		<div class="selectbox"> 
			<input type="button" id="supportWait" value="대기환자">
			<input type="button" id="supportFinish" value="완료환자">
		</div><br>
		<!-- 
		<div class="date">
			<label>날짜</label> <input type="text" id="datePicker">
		</div>
		-->
		
		<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>-->
		<!--<script type="text/javascript">
			$('#datePicker').datepicker({
				format : "yyyy-mm-dd",
				language : "kr",
				todayHighlight : true
			});
		</script>-->
	<form id="enrollForm" action="psComplete.me" method="post">
		<div class="patientInfo" style="width:100%;">
			<div style="background:rgb(1,153,220); height:20px;margin-top:-16px;text-align:center;">
				<p style="">환자정보</p>
			</div>
			<div class="infoOne">
				<label for="" class="infoName">차트번호</label>
				<input type="text" class="form-control" id="chartNo" name="chartNo" readonly><br> 
				<label for="" class="infoName">접수일시</label>
				<input type="text" class="form-control" id="receiptDate" name="receiptDate" value="" readonly><br>
			</div>	
			<div class="infoTwo">
				<label for="" class="infoName">환자이름</label>
				<input type="text" class="form-control" id="patientsName" name="patientsName" value="" readonly><br>
				<label for="" class="infoName">담당의사</label>
				<input type="text" class="form-control" id="mo" name="mo" value="" readonly><br>
			</div>
			<div class="infoThree">
				<label for="" class="infoName">주민번호</label>
				<input type="text" class="form-control" id="patientsPrivateNo1" name="patientsPrivateNo1" value="" readonly><br>
				<label for="" class="infoName">진료실  </label>
				<input type="text" class="form-control" id="ddo" name="ddo" value="" readonly style="margin-left:15px;"><br>
			</div>
			<div class="infoFour">
				<label for="" class="infoName">보험종류</label>
				<input type="text" class="form-control" id="insurance" name="insurance" value="" readonly><br>
				
				<button type="button" class="updateClinic">처방완료</button>
			
			</div>
		
		</div>
		</form>
		
		<div style="border:1px solid;width:100%;height:400px;overflow:auto;">
			<table id="supportListOne" class="chart" align="center">
				<thead>
					<tr>
						<th style="width:80px;">차트번호</th>
						<th style="width:130px;">환자이름</th>
						<th style="width:200px;">진료실</th>
						<th style="width:80px;">처방코드</th>
						<th style="width:800px;">처방명칭</th>
						<th style="width:40px;">횟수</th>
						<th style="width:40px;">응급</th>
						<th style="width:40px;">야간</th>
						<th style="width:80px;">주치의</th>
					</tr>
				</thead>
				<tbody>
					
					<c:forEach items="${ list1 }" var="s">
						<tr>
							<td>${ s.chartNo }</td>
							<td>${ s.patientsName }</td>
							<td>${ s.ddo }</td>
							<td>${ s.prescripUserCode }</td>
							<td>${ s.prescripName }</td>
							<td>${ s.numTimes }</td>
							<td>${ s.emergency }</td>
							<td>${ s.nightTime }</td>
							<td>${ s.mo }</td>
							<td style="display:none">${ s.receiptDate }</td>
							<td style="display:none">${ s.patientsPrivateNo }</td>
							<td style="display:none">${ s.insurance }</td>
						</tr>
					</c:forEach>
				</tbody>	
			</table>
		</div>
		
		<div style="border:1px solid; width:100%;height:400px;">
			<table id="supportListTwo" class="chart" align="center">
				<thead>
					<tr>
						<th style="width:80px;">차트번호</th>
						<th style="width:130px;">환자이름</th>
						<th style="width:200px;">진료실</th>
						<th style="width:80px;">처방코드</th>
						<th style="width:800px;">처방명칭</th>
						<th style="width:40px;">횟수</th>
						<th style="width:40px;">응급</th>
						<th style="width:40px;">야간</th>
						<th style="width:80px;">주치의</th>
					</tr>
				</thead>
				<tbody>
					
					<c:forEach items="${ list2 }" var="s">
						<tr>
							<td>${ s.chartNo }</td>
							<td>${ s.patientsName }</td>
							<td>${ s.ddo }</td>
							<td>${ s.prescripUserCode }</td>
							<td>${ s.prescripName }</td>
							<td>${ s.numTimes }</td>
							<td>${ s.emergency }</td>
							<td>${ s.nightTime }</td>
							<td>${ s.mo }</td>
							<td style="display:none">${ s.receiptDate }</td>
							<td style="display:none">${ s.patientsPrivateNo }</td>
							<td style="display:none">${ s.insurance }</td>
						</tr>
					</c:forEach>
				</tbody>	
			</table>
		</div>
	</div>
	
	<script>
	var aaaa="";
		$(function() {
			$("#supportWait").click(function(){
				location.href = "supWaitList.me";
			})
		});
		
		$(function() {
			$("#supportFinish").click(function(){
				location.href = "supCompleteList.me";
			})
		});
		
		$(function(){
			
			$(".chart tbody tr").click(function(){
				var str ="";
				var tdArr= new Array();
				1
				var tr=$(this);
				var td=tr.children();
				
				console.log(tr.text());
				
				td.each(function(i){
					tdArr.push(td.eq(i).text());
				})
				
				console.log(tdArr);
				
				var chartNo = td.eq(0).text();
				aaaa = chartNo;
				var patientsName = td.eq(1).text();
				var ddo = td.eq(2).text();
				var prescripUserCode = td.eq(3).text();
				var prescripName = td.eq(4).text();
				var numTimes= td.eq(5).text();
				var emergency = td.eq(6).text();
				var nightTime = td.eq(7).text();
				var mo = td.eq(8).text();
				var receiptDate = td.eq(9).text();
				var patientsPrivateNo = td.eq(10).text();
				var insurance = td.eq(11).text();
				
				$("#chartNo").val(chartNo);
				$("#patientsName").val(patientsName);
				$("#patientsPrivateNo").val(patientsPrivateNo);
				$("#patientsPrivateNo1").val(patientsPrivateNo);
				$("#mo").val(mo);
				$("#ddo").val(ddo);
				$("#receiptDate").val(receiptDate);
				$("#insurance").val(insurance);
			});
		});
		
		$(".updateClinic").click(function(){
			location.href="supUpdateClinic.me?aaaa="+aaaa;
		});
	</script>
</body>
</html>