<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<style>
 
	#outer{
	    width: 1300px;
		min-width: 900px;
		height:1010px;
		margin-left:auto;
		margin-right:auto;
		font-family: 'NanumSquare', sans-serif ;
		background: rgb(250, 253, 255);
	}
	#dateTable, #vitalTable, #diseaseTable, #prescriptionTable{
		width:100%;
		/* border:1px solid gray; */
		text-align:center;
		text-align-last: center;
		border-collapse: collapse;	
		height: 43px;
	}
	#symptomArea {
	    width: 50%;
	    float: left;
	}
	textarea#symptom {font-size: large; border : none; resize: none;}
	div#diseaseArea {
	    display: inline-block;
	    width: 100%;
	}
	tr, td, th {
    	/* border: 1px solid gray; */
    	height : 43px;
    }
    #diseaseTable>thead>tr>th {
    	background-color: rgb(1, 153, 220);
    	color : white;
    	font-size: 14px;
    }
    
    #prescriptionTable>thead>tr>th {
        background-color: rgb(1, 153, 220);
    	color : white;
    	font-size: 14px;
    }
    
    .r1 {
    	background-color: rgb(1, 153, 220);
    	color:white;
    	font-size:14px;
    }
    textarea{
    	box-sizing: border-box;
    	resize:none;
    	width:100%;
    	height:200px;
    	border-radius : 5px;
    }
    div#topDate {margin-top: 50px; border : 1px solid silver;}
    #medicalDate, #vitalDate{
    	height:100%;
    	width:100%;
    	box-sizing: border-box;
    	border: none;
    	text-align: center;
    }
    #medicalDate::-webkit-inner-spin-button{
    	display: none;
    	-webkit-appearance: none;
	}
	#vitalDate::-webkit-inner-spin-button{
    	display: none;
    	-webkit-appearance: none;
	}
    #btnArea {
	    height: 60px;
	    text-align: right;
	    /* background: lightgrey; */
	    margin-bottom: 50px;
	}
    .btnF {
	    height: 40px;
	    width: 70px;
	    background-color: rgb(1, 153, 220);
	    border-radius: 7px;
	    color: white;
	    font-weight: bolder;
	    cursor: pointer;
	    outline: none;
        margin-top: 10px;
	}
	.btnF:hover {background: #286090;}
	input[type="checkbox"]{	
		margin-left: auto !important;
	    margin-right: auto !important;
	}
	.data{width:100%;}
	/* 진료대기 영역 스타일 */
	.standBtn {
	    font-size: larger;
	    width: 200px;
	    height: 30px;
	}
	.standBtn:hover{color: rgb(1, 153, 220);}
	.standBtn.on{
		border-bottom: 2px solid cadetblue;
		font-weight: 700;
		color: rgb(1, 153, 220);
	}
	.listBox{
		display: none;
		padding: 20px;
	}
	.listBox.on{
		display: block;
	}
	#standArea {
	    float: right;
	    width: 50%;
	    height: 250px;
	}
	.standList{
		height: 67%;
		overflow: auto;
	}
	.listBox1.listBox.on {padding: 0;}
	.listBox2.listBox {padding: 0;}
	#standTable>thead>tr {text-align-last: center; background-color: rgb(1,153,220);color:white;}
	#holdTable {text-align-last: center; background-color: rgb(1,153,220);color:white;}
	.jList {cursor:pointer;}
	.column100{cursor:pointer;}
	div#symptomHistoryArea {
	    position: absolute;
	    left: 1602px;
	    top: 100px;
	    width: 300px;
	    height: 800px;
	    border-radius: 20px;
	    background: cadetblue;
	    display: none;
	}
	div#symptomHistoryBox {
	    margin-top: 30px;
	    background: white;
	    height: 96.3%;
	    border-radius: 20px;
	    font-size: initial;
	}
	button#closeBtn {
	    float: right;
	    margin-right: 20px;
	    font-size: large;
	    font-weight: 900;
	}
	
	
	/* 클릭시 div 색 설정부분 */
	.transColor {
	    border: 5px solid rgb(138, 219, 255);
	    -moz-box-shadow: 3px 3px 3px 3px #999;
	    /* box-shadow: 3px 3px 3px 3px rgba(138, 219, 255, 1); */
	}
	h3.valueH {
	    margin: 0;
	    /* background: darkgoldenrod; */
	    height: 50px;
	    line-height: 53px;
	}
	
	/* 마우스 우클릭 메뉴 스타일  */
	* {
	  -webkit-box-sizing: border-box;
	  -moz-box-sizing: border-box;
	  box-sizing: border-box;
	}
	.contextmenu {
	  display: none;
	  position: absolute;
	  width: 200px;
	  margin: 0;
	  padding: 0;
	  background: #FFFFFF;
	  border-radius: 5px;
	  list-style: none;
	  box-shadow:
	    0 15px 35px rgba(50,50,90,0.1),
	    0 5px 15px rgba(0,0,0,0.07);
	  overflow: hidden;
	  z-index: 999999;
	}
	.contextmenu li a {
	  display: block;
	  padding: 10px;
	  color: gray;
	  text-decoration: none;
	  transition: ease .2s;
	}
	.contextmenu li: {
	  background: rgb(196, 235, 255);
	  border-left: 3px solid cadetblue;
	}
	.contextmenu li:hover a {
	  color: rgb(196, 235, 255);
	}
	
	/* 테이블 관련 스타일 */
	/* 상병 테이블 */
	td.column100.column1 {width: 40px;}
	td.column100.column3 {width: 500px;}
	
	/* 처방 테이블 */
	/* input 속성 */
	.pTextbox, .preTextbox, .othi {
	    width: 100%;
	    height: 100%;
	}
	
	
	/* modal 스타일 */
	#dsModal {
	    margin-top: 272px;
	    width: 1100px;
	    margin-left: 410px;
	}
	.codeTitle {
	    margin-right: auto;
	    padding-left: 20px;
	}
	.codeBody {height: 400px;}
	table.codeTable {text-align-last: center;}
	#searchCode {
	    width: 400px;
	    border: 1px solid lightgray !important;
	}
	.searchBtn {
	    background: cadetblue;
	    width: 60px;
	    height: 30px;
	    color: white;
	    border-radius: 10px;
	}
	.searchBtn:hover{color: rgb(196, 235, 255);}
	.codeContent {border-radius: 20px !important;}
	.searchArea {align-self: center;}
	/* 처방코드조회 modal */
	#sideValue {
	    float: left;
	    width: 10%;
	    height: 100%;
	    text-align: center;
	}
	#tableArea {
	    float: right;
	    width: 90%;
	    height: 100%;
	}
	#preModal {
	    left: 200px;
	    width: 1600px;
	    top: 140px;
	}
	#preModal-content{
        /* position: relative; */
	    background-color: #fff;
	    /* -webkit-background-clip: padding-box; */
	    /* background-clip: padding-box; */
	    border: 1px solid #999;
	    border: 1px solid rgba(0, 0, 0, .2);
	    border-radius: 20px;
	    outline: 0;
	    /* -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, .5); */
	    box-shadow: 0 3px 9px rgba(0, 0, 0, .5);
	    height: 700px;
	}
	.preCodeBody{height: 600px;}
	#preSearchArea {
		text-align: center;
		margin-top: 12px;	
	}
	#preSearch {
	    border: 1px solid lightgray !important;
	    width: 400px;
	    border-radius: 6px;
	}
	.preTypeCheck {
	    position: relative;
	    top: 25%;
	}
	table#pmodalTable {text-align-last: center;}
	.sizeTh {width: 90px;}
	tr.pdb {cursor: pointer;}
	
	/* 상병 코드 입력 div 발생 스타일 */
	div#searchDivArea {
	    position: absolute;
	    left: 755px;
	    top: 522px;
	    display: block;
	    height: 300px;
	    overflow: auto;
	}
	/* 처방 코드 입력 div 발생 스타일 */
	div#divPrescriptionArea {
	    position: absolute;
	    top: 783px;
	    left: 750px;
	    height: 300px;
	    overflow: auto;
	    width: 850px;
	}
	/* 검색 div 공통 스타일 */
	div#searchDivArea, #divPrescriptionArea {
	    text-align-last: center;
	}
	/* 환자조회 modal */
	.patientsModal {
	    position: absolute;
	    width: 1300px;
	    left: 293px;
	    top: 200px;
	}
	.borderDiv {
	    border: 1px solid lightgray;
	    padding: 2px;
	    width: 150px;
	    display: inline;
	    margin-left: 20px;
	    margin-right: 20px;
	}
	input.readonlyInput {
	    margin-left: 20px;
	    text-align: center;
	    width: 100px;
	    height: 28px;
	    border-radius: 15px;
	    background: beige;
	}
	.dayDiv {
	    display: inline;
	    margin-left: 20px;
	}
	button#patientsSearchBtn {
	    background: beige;
	    width: 100px;
	    height: 28px;
	    border-radius: 20px;
	}
	.inputBtnArea {
	    padding: 15px;
	    align-self: center;
	}
	table#parientsListTable {text-align-last: center;}
	div#patientsListArea {height: 400px;}
	.daypl{cursor:pointer;}
	input#nameBox {
        width: 80px;
	    height: 28px;
	    text-align: center;
	    border-radius: 15px;
	    background: beige;
    }
    hr.mhLine {margin-top: 0;}
    tr#mlhead {cursor: pointer;}
    th.hPick:hover {background: rgb(196, 235, 255); !important;}
    
    
    
    .tb_header_th{
    	background-color: rgb(1, 153, 220);
    	color : white;
    	font-size : 14px;
    }
    
    .areaA{
    	border-left: 1px solid silver;
    	border-right : 1px solid silver;
    	border-bottom : 1px solid silver;
    }
    

</style>
<!-- jQuery CDN -->
<!--asdsad  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- modal bootstrap js -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- modal bootstrap css -->
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/resources/medical/modal/css/bootstrap.css">

<!-- 테이블 파일 링크 부분 -->
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/medical/table/vendor/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/medical/table/css/util.css">
<link rel="stylesheet" type="text/css" href="${pageContext.servletContext.contextPath}/resources/medical/table/css/main.css">
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/sideBar.jsp"></jsp:include>
	
	<!-- modal 영역 -->
  	<!-- 환자조회 modal 영역 -->
  	<div class="modal fade" id="#completeList" role="dialog">
	    <div class="modal-dialog">    
	
	      <!-- Modal content-->
	      <div class="modal-content ">
	        <div class="modal-header">
	          <h4 class="modal-title">모달 창 타이틀</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	
	        <div class="modal-body">
	          <p>여기에 필요한 텍스트 메시지 넣기</p>
	        </div>
	
	        <div class="modal-footer">
	          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        </div>
	      </div>
	    </div>
  	</div>
  	
  	<!-- 외래내역 modal 영역 -->
	<!-- 외래내역 modal 영역 -->
   <div class="modal fade" id="patientSearch" role="dialog">
       <div class="patientsModal">    
   
      <div class="modal-content codeContent">
           <div class="modal-header">
               <h4>외래내역</h4>
           </div>
   
           <div class="inputBtnArea">
                <input type='text' class='readonlyInput' value='기간' style="outline:none" readonly>
                <div class='dayDiv'>
                   <input type='radio' id="toDay" name='dayValue' checked>&nbsp;
                   <label for='toDay'>당일</label>
                </div>
                <div class='dayDiv'>
                   <input type='radio' id='betDay' name='dayValue'>&nbsp;
                   <label for='betDay'>기간</label>
                </div>
                <div class='borderDiv'>
                   <input type='date' id="startDay" disabled>
                </div>
                 ~ 
                 <div class='borderDiv'>
                    <input type='date' id="endDay" disabled>
                 </div>
                    <input type="text" id="nameBox" style="outline:none" value="수진자명">
                 <div class="borderDiv">
                    <input type='text' id='patientsSearch' style="outline:none">                    
                 </div>
                 &nbsp;&nbsp;
                <button type="button" id="patientsSearchBtn">검색</button>   
           </div>
           <hr class="mhLine">
           <div class="container-table100">
            <div class="table100 ver3 m-b-110">
                 <div id="patientsListArea" style="overflow:auto;">
                    <table id="parientsListTable">
                       <thead>
                          <tr id="mlhead">
                             <th>No</th>
                             <th id="hpPati" class="hPick">환자번호</th>
                             <th>차트번호</th>
                             <th id="hpName" class="hPick">수진자명</th>
                             <th id="hpPno" class="hPick">주민번호</th>
                             <th>보험유형</th>
                             <th>초/재진</th>
                             <th>담당의</th>
                             <th id="hpDate" class="hPick">진료일</th>
                          </tr>
                       </thead>
                       <tbody>
                       
                       </tbody>
                    </table>
                 </div>
              </div>
         </div>
         
           <div class="modal-footer">
           </div>
         </div>
       </div>
     </div>
  	<script>
        $(function(){
           $(document).ready(function(){
              
              $("#modalPatients").click(function(){
                 var mDate = $("#medicalDate").val();
                 //console.log(mDate);
                 var mpl = "";
                 $.ajax({
                    url:"modalPaientsList.js",
                    data:{
                       receiptDate:mDate
                    },
                    type:"post",
                    success: function(mpList){
                       $.each(mpList, function(i, obj){
                          mpl += "<tr class='row100 daypl disName'>" +
                                   "<td data-column='column1'>"+ (i+1) +"</td>" +
                                 "<td data-column='column2'>"+ obj.patientsNo +"</td>" +
                                 "<td data-column='column3'>"+ obj.chartNo +"</td>" +
                                 "<td data-column='column4'>"+ obj.patientsName +"</td>" +
                                 "<td data-column='column5'>"+ obj.patientsPno +"</td>" +
                                 "<td data-column='column6'>"+ obj.insurance +"</td>" +
                                 "<td data-column='column7'>"+ obj.adhd +"</td>" +
                                 "<td data-column='column8'>"+ obj.mo +"</td>" +
                                 "<td data-column='column9'>"+ obj.receiptDate +"</td>" +
                              "</tr>";
                       });
                       $("#parientsListTable tbody").html(mpl);
                    }, error: function(){
                       console.log("ajax 외래내역 modal 통신 실패");
                    }
                 });
              });
              var checkVal = 0;
              var startDay = $("#startDay").val();
              var endDay = $("#endDay").val();
              // 검색 기간 활성화/비활성화 설정 부분
              $("#betDay").click(function(){
                 $("input[id='startDay']").attr('disabled', false);
                 $("input[id='endDay']").attr('disabled', false);
                 checkVal = 1;
              });
              $("#toDay").click(function(){
                 $("input[id='startDay']").attr('disabled', true);
                 $("input[id='endDay']").attr('disabled', true);
                 checkVal = 0;
              });
              $("#startDay").change(function(){
                 //console.log("333");
                 startDay = $("#startDay").val();
              });
              $("#endDay").change(function(){
                 //console.log("333");
                 endDay = $("#endDay").val();
              });
              
              // 환자 조회 실행 부분
              $(document).on("click", "#patientsSearchBtn", function(){
                 //console.log("333");
                 //console.log(checkVal);
                 //console.log(startDay);
                 //console.log(endDay);
                 
                 var btl = "";
                 $.ajax({
                    url:"betweenDayList.js",
                    data:{
                       startDay: startDay,
                       endDay: endDay
                    },
                    type:"post",
                    success: function(betList){
                       $.each(betList, function(i, obj){
                          btl += "<tr class='row100 daypl disName'>" +
                                   "<td data-column='column1'>"+ (i+1) +"</td>" +
                                 "<td data-column='column2'>"+ obj.patientsNo +"</td>" +
                                 "<td data-column='column3'>"+ obj.chartNo +"</td>" +
                                 "<td data-column='column4'>"+ obj.patientsName +"</td>" +
                                 "<td data-column='column5'>"+ obj.patientsPno +"</td>" +
                                 "<td data-column='column6'>"+ obj.insurance +"</td>" +
                                 "<td data-column='column7'>"+ obj.adhd +"</td>" +
                                 "<td data-column='column8'>"+ obj.mo +"</td>" +
                                 "<td data-column='column9'>"+ obj.receiptDate +"</td>" +
                              "</tr>";
                              
                       });
                       $("#parientsListTable tbody").html(btl);
                    }, error: function(){
                       console.log("ajax 기간사이 진료환자 조회 통신 실패");
                    }
                 });
              });  
           
           });
         $("#patientsSearch").keyup(function(){
            var k = $(this).val();
            $("#parientsListTable > tbody > tr").hide();
            var temp = $("#parientsListTable > tbody > tr > td:nth-child(4):contains('" + k + "')");
                     
            $(temp).parent().show();
         });
         
         // 정렬기준 변경하는 부분
         $("#hpPati").click(function(){
            // 환자번호로 정렬
            /* $("#hpPati").css("background", "darkgray");
            $("#hpName").css("background", "lightgray");
            $("#hpPno").css("background", "lightgray");
            $("#hpDate").css("background", "lightgray"); */
            
            startDay = $("#startDay").val();
            endDay = $("#endDay").val();
            //console.log(startDay);
            //console.log(endDay);
            var notl = "";
            $.ajax({
               url:"sortpNo.js",
               data:{
                  startDay:startDay,
                  endDay:endDay
               },
               type:"post",
               success: function(sortList){
                  $.each(sortList, function(i, obj){
                     notl += "<tr class='row100 daypl disName'>" +
                              "<td data-column='column1'>"+ (i+1) +"</td>" +
                              "<td data-column='column2'>"+ obj.patientsNo +"</td>" +
                              "<td data-column='column3'>"+ obj.chartNo +"</td>" +
                              "<td data-column='column4'>"+ obj.patientsName +"</td>" +
                              "<td data-column='column5'>"+ obj.patientsPno +"</td>" +
                              "<td data-column='column6'>"+ obj.insurance +"</td>" +
                              "<td data-column='column7'>"+ obj.adhd +"</td>" +
                              "<td data-column='column8'>"+ obj.mo +"</td>" +
                              "<td data-column='column9'>"+ obj.receiptDate +"</td>" +
                           "</tr>";
                  })
                  $("#parientsListTable tbody").html(notl);   
                  notl = "";
                  
               },error: function(){
                  console.log("ajax 환자번호 정렬 통신 실패");
               }
            });
         });
         $("#hpName").click(function(){
            // 수진자명으로 정렬
            /* $("#hpPati").css("background", "lightgray");
            $("#hpName").css("background", "darkgray");
            $("#hpPno").css("background", "lightgray");
            $("#hpDate").css("background", "lightgray"); */
            
            var natl = "";
            startDay = $("#startDay").val();
            endDay = $("#endDay").val();
            $.ajax({
               url:"sortpName.js",
               data:{
                  startDay:startDay,
                  endDay:endDay
               },
               type:"post",
               success: function(sortList){
                  $.each(sortList, function(i, obj){
                     natl += "<tr class='row100 daypl disName'>" +
                              "<td data-column='column1'>"+ (i+1) +"</td>" +
                              "<td data-column='column2'>"+ obj.patientsNo +"</td>" +
                              "<td data-column='column3'>"+ obj.chartNo +"</td>" +
                              "<td data-column='column4'>"+ obj.patientsName +"</td>" +
                              "<td data-column='column5'>"+ obj.patientsPno +"</td>" +
                              "<td data-column='column6'>"+ obj.insurance +"</td>" +
                              "<td data-column='column7'>"+ obj.adhd +"</td>" +
                              "<td data-column='column8'>"+ obj.mo +"</td>" +
                              "<td data-column='column9'>"+ obj.receiptDate +"</td>" +
                           "</tr>";
                  })
                  $("#parientsListTable tbody").html(natl);
                  natl = "";
                  
               },error: function(){
                  console.log("ajax 환자이름 정렬 통신 실패");
               }
            });
         });
         $("#hpPno").click(function(){
            // 주민번호로 정렬
            /* $("#hpPati").css("background", "lightgray");
            $("#hpName").css("background", "lightgray");
            $("#hpPno").css("background", "darkgray");
            $("#hpDate").css("background", "lightgray"); */
            
            var pnotl = "";
            startDay = $("#startDay").val();
            endDay = $("#endDay").val();
            $.ajax({
               url:"sortpPno.js",
               data:{
                  startDay:startDay,
                  endDay:endDay
               },
               type:"post",
               success: function(sortList){
                  $.each(sortList, function(i, obj){
                     pnotl += "<tr class='row100 daypl disName'>" +
                              "<td data-column='column1'>"+ (i+1) +"</td>" +
                              "<td data-column='column2'>"+ obj.patientsNo +"</td>" +
                              "<td data-column='column3'>"+ obj.chartNo +"</td>" +
                              "<td data-column='column4'>"+ obj.patientsName +"</td>" +
                              "<td data-column='column5'>"+ obj.patientsPno +"</td>" +
                              "<td data-column='column6'>"+ obj.insurance +"</td>" +
                              "<td data-column='column7'>"+ obj.adhd +"</td>" +
                              "<td data-column='column8'>"+ obj.mo +"</td>" +
                              "<td data-column='column9'>"+ obj.receiptDate +"</td>" +
                           "</tr>";
                  })
                  $("#parientsListTable tbody").html(pnotl);
                  pnotl = "";
                  
               },error: function(){
                  console.log("ajax 환자이름 정렬 통신 실패");
               }
            });
         });
         $("#hpDate").click(function(){
            // 진료일로 정렬
            /* $("#hpPati").css("background", "lightgray");
            $("#hpName").css("background", "lightgray");
            $("#hpPno").css("background", "lightgray");
            $("#hpDate").css("background", "darkgray"); */
            
            var pdtl = "";
            startDay = $("#startDay").val();
            endDay = $("#endDay").val();
            $.ajax({
               url:"betweenDayList.js",
               data:{
                  startDay:startDay,
                  endDay:endDay
               },
               type:"post",
               success: function(sortList){
                  $.each(sortList, function(i, obj){
                     pdtl += "<tr class='row100 daypl disName'>" +
                              "<td data-column='column1'>"+ (i+1) +"</td>" +
                              "<td data-column='column2'>"+ obj.patientsNo +"</td>" +
                              "<td data-column='column3'>"+ obj.chartNo +"</td>" +
                              "<td data-column='column4'>"+ obj.patientsName +"</td>" +
                              "<td data-column='column5'>"+ obj.patientsPno +"</td>" +
                              "<td data-column='column6'>"+ obj.insurance +"</td>" +
                              "<td data-column='column7'>"+ obj.adhd +"</td>" +
                              "<td data-column='column8'>"+ obj.mo +"</td>" +
                              "<td data-column='column9'>"+ obj.receiptDate +"</td>" +
                           "</tr>";
                  })
                  $("#parientsListTable tbody").html(pdtl);
                  pnotl = "";
                  
               },error: function(){
                  console.log("ajax 환자이름 정렬 통신 실패");
               }
            });
         });
         
         
         // 외래내역 선택 환자 진료조회 부분
         $(document).on("dblclick", ".daypl", function(event){
            var pNo = $(this).children().eq(1).text();
            var pMo = $(this).children().eq(7).text();
            var pDate = $(this).children().eq(8).text();
            //console.log(pNo);
            //console.log(pDate);
            
            $.ajax({
               url:"detailPatients.me",
               data:{
                  patientsNo:pNo,
                  mo:pMo,
                  receiptDate:pDate
               },
               type:"post",
               success:function(map){
                  //console.log(map);
                  /* 작업일자 부분 */
                  $.each(map.dateBar, function(i, obj){
                     $("#medicalDate").val(obj.receiptDate);
                     $("#dChartNo").text(obj.chartNo);
                     $("#hdChart").val(obj.chartNo);
                     $("#dPatientsName").text(obj.patientsName);
                     $("#dGenAge").text("("+obj.gender+" / "+obj.age+"세)");
                     $("#dInsurance").text(obj.insurance);
                  });
                  
                  
                  /* 바이탈 부분 */
                  var valueV="";
                  console.log(map.v);                        
                  if(map.v.length == 0){
                     valueV += "<tr>" +
                                "<td><input type='date' name='receiptDate' id='vitalDate'></td>" + 
                                "<td><input type='text' name='maxBp' value='0' onFocus="+"this.value='';return true;"+"></td>" +
                                "<td><input type='text' name='minBp' value='0' onFocus="+"this.value='';return true;"+"></td>" +
                                "<td><input type='text' name='beforeBs' value='0' onFocus="+"this.value='';return true;"+"></td>" +
                                "<td><input type='text' name='afterBs' value='0' onFocus="+"this.value='';return true;"+"></td>" +
                                "<td><input type='text' name='weight' value='0.0' onFocus="+"this.value='';return true;"+"></td>" +
                                "<td><input type='text' name='height' value='0.0' onFocus="+"this.value='';return true;"+"></td>" +
                                "<td><input type='text' name='fever' value='0.0' onFocus="+"this.value='';return true;"+"></td>" +
                             "</tr>";
                  }else{
                     $.each(map.v, function(i, obj){
                        valueV += "<tr>" +
                                 "<td><input type='date' name='receiptDate' value='"+ obj.receiptDate +"'></td>" +
                                 "<td><input type='text' name='maxBp' value='" + obj.maxBp + "'></td>" +
                                 "<td><input type='text' name='minBp' value='" + obj.minBp + "'></td>" +
                                 "<td><input type='text' name='beforeBs' value='" + obj.beforeBs + "'></td>" +
                                 "<td><input type='text' name='afterBs' value='" + obj.afterBs + "'></td>" +
                                 "<td><input type='text' name='weight' value='" + obj.weight + "'></td>" +
                                 "<td><input type='text' name='height' value='" + obj.height + "'></td>" +
                                  "<td><input type='text' name='fever' value='" + obj.fever + "'></td>" +
                               "</tr>";
                     });   
                  }
                  $("#vitalTable tbody").html(valueV);
                  
                  
                  /* 증상 부분 */
                  var valueS = "";
                  if(map.s.length != 0){
                     $.each(map.s, function(i, obj){
                        //console.log(obj.symptomHistory);
                        valueS += obj.symptomHistory;
                     });
                  }
                  $("#symptom").val(valueS);      
                  /* 과거증상내역 부분 */
                  var symHistory = "";
                  $.each(map.sList, function(i, obj){
                     symHistory += "<br>***** 작업일자 : " + obj.receiptDate + " *****" + "<br>" +
                                obj.symptomHistory;
                  });
                  $("#symptomHistoryBox").html(symHistory);
                  
                  
                  /* 상병 부분 */
                  var valueD = "";
                  // 조회 결과가 있을 경우
                  $.each(map.dHistory, function(i, obj){
                     var dkn = obj.diseaseKorName.replace(/\s/gi, "");
                     var sq = ("■");
                     nl = obj.userLicense;
                     console.log(map.dHistory);
                     
                     if(i==0){
                        valueD +=  "<tr class='row100 yes'>" + 
                                    "<td class='column100 column1 sq' data-column='column1'>"+ sq +"</td>" +
                                    "<td class='column100 column2' data-column='column2'><input type='text' class='pTextbox' value="+ obj.diseaseCode +"></td>" +
                                    "<td class='column100 column3' data-column='column3'>"+ dkn +"</td>" + 
                                    "<td class='column100 column4 nv' data-column='column4'>"+ 1 +"</td>" +
                                    "<td class='column100 column5' data-column='column5'>"+ obj.userDepartment +"</td>" +
                                    "<td class='column100 column6 nl' data-column='column6'>"+ obj.userLicense +"</td>" +
                                    "<td style='display:none'><input type='hidden' name='diseaseNo' class='dno' value="+ obj.diseaseNo +"></td>" +
                                 "</tr>";
                     }else{
                        valueD +=  "<tr class='row100 yes'>" + 
                                    "<td class='column100 column1 sq' data-column='column1'></td>" +
                                    "<td class='column100 column2' data-column='column2'><input type='text' class='pTextbox' value="+ obj.diseaseCode +"></td>" +
                                    "<td class='column100 column3' data-column='column3'>"+ dkn +"</td>" + 
                                    "<td class='column100 column4 nv' data-column='column4'>"+ 2 +"</td>" +
                                    "<td class='column100 column5' data-column='column5'>"+ obj.userDepartment +"</td>" +
                                    "<td class='column100 column6 nl' data-column='column6'></td>" +
                                    "<td style='display:none'><input type='hidden' name='diseaseNo' class='dno' value="+ obj.diseaseNo +"></td>" +
                                 "</tr>";
                     }
                  });
                  if(map.dHistory.length==0){
                     // 새로 추가하는 경우에 기준점을 잡기 위해 클래스 넣는 부분
                     valueD +=  "<tr class='row100 yes' style='display:none'>" + 
                              "</tr>";
                     // 조회 결과가 없을 경우
                     for(var i=0; i<=5; i++){
                        valueD +=  "<tr class='row100'>" + 
                                    "<td class='column100 column1 sq' data-column='column1'></td>" +
                                    "<td class='column100 column2' data-column='column2'><input type='text'class='pTextbox pReset' ></td>" +
                                    "<td class='column100 column3' data-column='column3'></td>" + 
                                    "<td class='column100 column4' data-column='column4'></td>" +
                                    "<td class='column100 column5' data-column='column5'></td>" +
                                    "<td class='column100 column6' data-column='column6'></td>" +
                                 "</tr>";
                     }
                  }else{
                     if(map.dHistory.length==1){
                        for(var i=0; i<=4; i++){
                           valueD +=  "<tr class='row100'>" + 
                                       "<td class='column100 column1 sq' data-column='column1'></td>" +
                                       "<td class='column100 column2' data-column='column2'><input type='text'class='pTextbox pReset' ></td>" +
                                       "<td class='column100 column3' data-column='column3'></td>" + 
                                       "<td class='column100 column4' data-column='column4'></td>" +
                                       "<td class='column100 column5' data-column='column5'></td>" +
                                       "<td class='column100 column6' data-column='column6'></td>" +
                                    "</tr>";
                        }
                     }else if(map.dHistory.length==2){
                        for(var i=0; i<=3; i++){
                           valueD +=  "<tr class='row100'>" + 
                                       "<td class='column100 column1 sq' data-column='column1'></td>" +
                                       "<td class='column100 column2' data-column='column2'><input type='text'class='pTextbox pReset' ></td>" +
                                       "<td class='column100 column3' data-column='column3'></td>" + 
                                       "<td class='column100 column4 nv' data-column='column4'></td>" +
                                       "<td class='column100 column5' data-column='column5'></td>" +
                                       "<td class='column100 column6' data-column='column6'></td>" +
                                    "</tr>";
                        }
                     }else if(map.dHistory.length==3){
                        for(var i=0; i<=2; i++){
                           valueD +=  "<tr class='row100'>" + 
                                       "<td class='column100 column1 sq' data-column='column1'></td>" +
                                       "<td class='column100 column2' data-column='column2'><input type='text'class='pTextbox pReset' ></td>" +
                                       "<td class='column100 column3' data-column='column3'></td>" + 
                                       "<td class='column100 column4' data-column='column4'></td>" +
                                       "<td class='column100 column5' data-column='column5'></td>" +
                                       "<td class='column100 column6' data-column='column6'></td>" +
                                    "</tr>";
                        }
                     }else if(map.dHistory.lenth==4){
                        for(var i=0; i<=1; i++){
                           valueD +=  "<tr class='row100'>" + 
                                       "<td class='column100 column1 sq' data-column='column1'></td>" +
                                       "<td class='column100 column2' data-column='column2'><input type='text'class='pTextbox pReset' ></td>" +
                                       "<td class='column100 column3' data-column='column3'></td>" + 
                                       "<td class='column100 column4' data-column='column4'></td>" +
                                       "<td class='column100 column5' data-column='column5'></td>" +
                                       "<td class='column100 column6' data-column='column6'></td>" +
                                    "</tr>";
                        }
                     }
                  }
                  $("#diseaseTable tbody").html(valueD);
                  
                  
                  /* 처방 부분 */
                  var valueP = "";
                  // 조회결과가 있을 경우
                  $.each(map.pList, function(i, obj){   
                     //console.log(map.pList.length);
                     valueP +=  "<tr class='row100 pYes' style='display:none'>" + 
                                 "</tr>";
                     valueP += "<tr class='row100 pYes pdb'>" + 
                                 "<td class='' data-column='column1' style='display:none'>"+ obj.prescripUserCode +"</td>" +
                                 "<td class='' data-column='column1'><input type='text' class='preTextbox' value="+ obj.prescripUserCode +"></td>" +
                                 "<td class='' data-column='column2'>"+ obj.prescripName +"</td>" +
                                 "<td class='' data-column='column3'><input type='text' class='pTextbox totalAd' value="+ obj.totalAd +"></td>" +
                                 "<td class='' data-column='column4'><input type='text' class='pTextbox' value="+ obj.numTimes +"></td>" +
                                 "<td class='' data-column='column5'><input type='text' class='pTextbox' value="+ obj.numDays +"></td>" +
                                 "<td class='' data-column='column6'><input type='text' class='pTextbox' value="+ obj.salaryClassific +"></td>";
                                 if(obj.prescripType=='처치'){
                                    valueP += "<td class='' data-column='column7'>PT</td>";   
                                 }else if(obj.prescripType=='방사선'){
                                    valueP += "<td class='' data-column='column7'>Xray</td>";   
                                 }else{
                                    valueP += "<td class='' data-column='column7'></td>";
                                 }
                                 // 단가 금액 설정 부분
                                 valueP += "<td class='' data-column='column8'>"+ (obj.totalAd * obj.prescripInsup) +"</td>";
                                 // 야간 여부 체크 확인 부분
                                 if(obj.nighttime=='N'){
                                    valueP += "<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>";
                                 }else {
                                    valueP += "<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box' checked></td>";
                                 }
                                 // 응급 여부 체크 확인 부분
                                 if(obj.emergency=='N'){
                                    valueP += "<td class='' data-column='column10'><input type='checkbox' class='eCheck'></td>"; 
                                 }else {
                                    valueP += "<td class='' data-column='column10'><input type='checkbox' class='eCheck' checked></td>";
                                 }
                    valueP += "</tr>";
                  });
                  if(map.pList.length==1){
                     for(var i=0; i<=5; i++){
                        valueP += "<tr class='row100 pdb'>" + 
                                    "<td class='' data-column='column1' style='display:none'>" +
                                    "<td class='' data-column='column1'><input type='text' class='preTextbox preReset'></td>" +
                                    "<td class='' data-column='column2'></td>" +
                                    "<td class='' data-column='column3'><input type='text' class='othi totalAd'></td>" +
                                    "<td class='' data-column='column4'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column5'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column6'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column7'></td>" +
                                    "<td class='' data-column='column8'></td>" +
                                    "<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>" +
                                    "<td class='' data-column='column10'><input type='checkbox'class='eCheck' class='eCheck'></td>" +
                                "</tr>";
                     }
                  }else if(map.pList.length==2){
                     for(var i=0; i<=4; i++){
                        valueP += "<tr class='row100 pdb'>" + 
                                    "<td class='' data-column='column1' style='display:none'>" +
                                    "<td class='' data-column='column1'><input type='text' class='preTextbox preReset'></td>" +
                                    "<td class='' data-column='column2'></td>" +
                                    "<td class='' data-column='column3'><input type='text' class='othi totalAd'></td>" +
                                    "<td class='' data-column='column4'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column5'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column6'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column7'></td>" +
                                    "<td class='' data-column='column8'></td>" +
                                    "<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>" +
                                    "<td class='' data-column='column10'><input type='checkbox' class='eCheck'></td>" +
                                "</tr>";
                     }
                  }else if(map.pList.length==3){
                     for(var i=0; i<=3; i++){
                        valueP += "<tr class='row100 pdb'>" + 
                                    "<td class='' data-column='column1' style='display:none'>" +
                                    "<td class='' data-column='column1'><input type='text' class='preTextbox preReset'></td>" +
                                    "<td class='' data-column='column2'></td>" +
                                    "<td class='' data-column='column3'><input type='text' class='othi totalAd'></td>" +
                                    "<td class='' data-column='column4'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column5'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column6'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column7'></td>" +
                                    "<td class='' data-column='column8'></td>" +
                                    "<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>" +
                                    "<td class='' data-column='column10'><input type='checkbox' class='eCheck'></td>" +
                                "</tr>";
                     }
                  }else if(map.pList.length==4){
                     for(var i=0; i<=2; i++){
                        valueP += "<tr class='row100 pdb'>" + 
                                    "<td class='' data-column='column1' style='display:none'>" +
                                    "<td class='' data-column='column1'><input type='text' class='preTextbox preReset'></td>" +
                                    "<td class='' data-column='column2'></td>" +
                                    "<td class='' data-column='column3'><input type='text' class='othi totalAd'></td>" +
                                    "<td class='' data-column='column4'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column5'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column6'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column7'></td>" +
                                    "<td class='' data-column='column8'></td>" +
                                    "<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>" +
                                    "<td class='' data-column='column10'><input type='checkbox' class='eCheck'></td>" +
                                "</tr>";
                     }
                  }else if(map.pList.length==5){
                     for(var i=0; i<=1; i++){
                        valueP += "<tr class='row100 pdb'>" + 
                                    "<td class='' data-column='column1' style='display:none'>" +
                                    "<td class='' data-column='column1'><input type='text' class='preTextbox preReset'></td>" +
                                    "<td class='' data-column='column2'></td>" +
                                    "<td class='' data-column='column3'><input type='text' class='othi totalAd'></td>" +
                                    "<td class='' data-column='column4'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column5'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column6'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column7'></td>" +
                                    "<td class='' data-column='column8'></td>" +
                                    "<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>" +
                                    "<td class='' data-column='column10'><input type='checkbox' class='eCheck'></td>" +
                                "</tr>";
                     }
                  }
                  if(map.pList.length==0){
                     if(adhd == '초진'){
                        valueP +=  "<tr class='row100 pYes' style='display:none'>" + 
                                    "</tr>";
                        valueP += "<tr class='row100 pYes pdb'>" +  
                                    "<td class='' data-column='column1' style='display:none'>AA154</td>" +
                                    "<td class='' data-column='column1'><input type='text' class='preTextbox value='AA154'></td>" +
                                    "<td class='' data-column='column2'>초진진찰료-의과의원보건의료원내의과</td>" +
                                    "<td class='' data-column='column3'><input type='text' class='othi totalAd' name='totalAd' value='1'></td>" +
                                    "<td class='' data-column='column4'><input type='text' class='othi' name='numTimes' value='1'></td>" +
                                    "<td class='' data-column='column5'><input type='text' class='othi' name='numDays' value='1'></td>" +
                                    "<td class='' data-column='column6'><input type='text' class='othi' name='salaryClassific' value='1'></td>" +
                                    "<td class='' data-column='column7'></td>" +
                                    "<td class='' data-column='column8'name='prescripInsup'>15690</td>" +
                                    "<td class='' data-column='column9'><input type='checkbox' name='nighttime'class='nCheck'></td>" +
                                    "<td class='' data-column='column10'><input type='checkbox' name='emergency' class='eCheck'></td>" +
                                    "<td class='insertPreValue' style='display:none'>0<input type='hidden' value='AA154'></td>" +
                                "</tr>";
                     }else{
                        valueP +=  "<tr class='row100 pYes' style='display:none'>" + 
                              "</tr>";
                        valueP += "<tr class='row100 pYes pdb'>" +  
                                    "<td class='' data-column='column1' style='display:none'>AA254</td>" +
                                    "<td class='' data-column='column1'><input type='text' class='preTextbox' value='AA254'></td>" +
                                    "<td class='' data-column='column2'>재진진찰료-의과의원보건의료원내의과</td>" +
                                    "<td class='' data-column='column3'><input type='text' class='othi totalAd' name='totalAd' value='1'></td>" +
                                    "<td class='' data-column='column4'><input type='text' class='othi' name='numTimes' value='1'></td>" +
                                    "<td class='' data-column='column5'><input type='text' class='othi' name='numDays' value='1'></td>" +
                                    "<td class='' data-column='column6'><input type='text' class='othi' name='salaryClassific' value='1'></td>" +
                                    "<td class='' data-column='column7'></td>" +
                                    "<td class='' data-column='column8'name='prescripInsup'>11210</td>" +
                                    "<td class='' data-column='column9'><input type='checkbox' name='nighttime'class='nCheck'></td>" +
                                    "<td class='' data-column='column10'><input type='checkbox' name='emergency' class='eCheck'></td>" +
                                    "<td class='insertPreValue' style='display:none'>0<input type='hidden' value='AA254'></td>" +
                                "</tr>";
                     }
                     for(var i=0; i<=5; i++){
                        valueP += "<tr class='row100 pdb'>" + 
                                    "<td class='' data-column='column1' style='display:none'>" +
                                    "<td class='' data-column='column1'><input type='text' class='preTextbox preReset'></td>" +
                                    "<td class='' data-column='column2'></td>" +
                                    "<td class='' data-column='column3'><input type='text' class='othi totalAd'></td>" +
                                    "<td class='' data-column='column4'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column5'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column6'><input type='text' class='othi'></td>" +
                                    "<td class='' data-column='column7'></td>" +
                                    "<td class='' data-column='column8'></td>" +
                                    "<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>" +
                                    "<td class='' data-column='column10'><input type='checkbox' class='eCheck'></td>" +
                                "</tr>";   
                     }
                  }
                  $("#prescriptionTable tbody").html(valueP);
                  $('#patientSearch').modal("hide");
                  
                  
                  document.getElementById("vitalDate").value = new Date().toISOString().substring(0, 10);
               }, error: function(){
                  console.log("ajax 외래내역 to Page 통신 실패");
               }
            });
         });
         
           
        });
     </script>
  	
  	
  	<!-- 상병 코드조회 modal 영역 -->
	<div class="modal fade" id="dsModal" role="dialog">
	    <div class="codeModal">    
	
	      <!-- Modal content-->
	      <div class="modal-content codeContent">
	        <div class="modal-header">
	          <h4 class="codeTitle">상병코드조회</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
			
			<div class="container-table100">
				<div class="table100 ver3 m-b-110">
			        <div class="codeBody" style="overflow:auto;">
						<table id="dmodalTable" class="codeTable">
							<thead>
								<tr class="codeHead">
									<th>코드</th>
									<th>한글명칭</th>
									<th>영문명칭</th>
								</tr>
							</thead>
						<tbody>
			
						</tbody>
					</table>       
			        </div>
		        </div>
	        </div>	     
	
	        <div class="modal-footer searchArea">
	        	<div id="diseaseSearch">
	        		<select id="searchBase">
	        			<option class="sValue" value="코드">코드</option>
	        			<option class="sValue" value="한글">한글명칭</option>
	        			<option class="sValue" value="영문">영문명칭</option>
	        		</select>
	        		&nbsp;&nbsp;
	        		<input type="text" id="searchCode" class="basic code">
	        	</div>
	        	
	        </div>
	      </div>
	    </div>
  	</div>
  	
  	<!-- 처방 코드조회 modal 영역 -->
	<div class="modal fade" id="preModal" role="dialog">
	    <div class="codeModal">    
	
	      <!-- Modal content-->
	      <div id="preModal-content">
	        <div class="modal-header">
	          <h4 class="codeTitle">처방코드조회</h4>
	          <button type="button" class="close" data-dismiss="modal">×</button>
	        </div>
	
	        <div class="preCodeBody" style="overflow:auto;">
	        	<div id="sideValue">
	        		<input type="radio" id="preAll" name="pType" class="preTypeCheck" checked>
	        		<label for="preAll" class="preTypeCheck"> 전체&nbsp;&nbsp;&nbsp;</label>
	        		<br><br>
	        		<input type="radio" id="preBase" name="pType" class="preTypeCheck">
	        		<label for="preBase" class="preTypeCheck">진찰&nbsp;&nbsp;&nbsp;</label>
	        		<br><br>
	        		<input type="radio" id="preMedi" name="pType" class="preTypeCheck">
	        		<label for="preMedi" class="preTypeCheck">투약&nbsp;&nbsp;&nbsp;</label>
	        		<br><br>
	        		<input type="radio" id="preHand" name="pType" class="preTypeCheck">
	        		<label for="preHand" class="preTypeCheck">처치&nbsp;&nbsp;&nbsp;</label>
	        		<br><br>
	        		<input type="radio" id="preXray" name="pType" class="preTypeCheck">
	        		<label for="preXray" class="preTypeCheck">방사선</label>
	        		<br><br>
	        		<input type="radio" id="preCheckup" name="pType" class="preTypeCheck">
	        		<label for="preCheckup" class="preTypeCheck">검사&nbsp;&nbsp;&nbsp;</label>
	        		<br><br>
	        	</div>
	        	
	        	<div class="container-table100">
					<div class="table100 ver3 m-b-110">
			        	<div id="tableArea" style="overflow:auto;">
			        		<table id="pmodalTable">
				        		<thead>
				        			<tr>
				        				<th class="sizeTh">사용자코드</th>
				        				<th class="sizeTh">청구코드</th>
				        				<th>처방명칭</th>
				        				<th class="sizeTh">보험금액</th>
				        				<th class="sizeTh">일반금액</th>
				        				<th>제약회사</th>
				        			</tr>	        		
				        		</thead>
				        		<tbody>
				        			
				        		</tbody>
			        		</table>
			        	</div>
		        	</div>
	        	</div>     
	        </div>
	
	        <div class="searchArea">
	        	<div id="preSearchArea">
	        		<select id="preSearchList">
	        			<option class="pValue" value="사용자코드">사용자코드</option>
	        			<option class="pValue" value="청구코드">청구코드</option>
	        			<option class="pValue" value="처방명칭">처방명칭</option>
	        		</select>
	        		&nbsp;
	        		<input type="text" id="preSearch" class="basic userCode">
	        	</div>
	        </div>
	        
	      </div>
	    </div>
  	</div> 
  	
	
	<!-- 마우스 우클릭 메뉴 영역 -->
	<!-- 바이탈 -->
	<ul class="contextmenu menuV" id="menuV">
	  <li><a href="#">과거바이탈조회</a></li>
	  <li><a href="#">삭제</a></li>
	</ul>
	<!-- 증상 -->
	<ul class="contextmenu menuS" id="menuS">
	  <li><a id="hs">과거증상조회</a></li>
	  <li><a href="#">상용구</a></li>
	</ul>
	<!-- 상병 -->
	<ul class="contextmenu menuD" id="menuD">
	  <li><a id="dco">상병코드조회</a></li>
	  <li><a id="dDelete">삭제</a></li>
	</ul>
	<!-- 처방 -->
	<ul class="contextmenu menuP" id="menuP">
	  <li><a id="pco">처방코드조회</a></li>
	  <li><a id="pDelete">삭제</a></li>
	</ul>
	<script>
		$(function(){
			// 과거증상 div 여는 부분
			$(document).ready(function(){
				$("#hs").click(function(){
					$("#symptomHistoryArea").css("display", "block");
				});
				$("#closeBtn").click(function(){
					$("#symptomHistoryArea").css("display", "none");
				});
			});
			
			
			// 상병 모달 여는 부분
			$(document).ready(function(){
				$("#dco").click(function(){
					$("#dsModal").modal("show");
					$.ajax({
						url:"selectDiseaseAll.di",
						data:{
							
						},
						type:"post",
						success:function(diseaseAll){
							//console.log(diseaseAll);
							var dmt = "";
							
							$.each(diseaseAll, function(i, obj){
								dmt += "<tr class='row100 dbd'>" +
											"<td class='column100 column1' data-column='column1'>"+ obj.diseaseCode +"</td>" + 
											"<td class='column100 column2' data-column='column2'>"+ obj.diseaseKorName +"</td>" + 
											"<td class='column100 column3' data-column='column3'>"+ obj.diseaseEngName +"</td>" +
											"<td style='display:none;'>"+ obj.diseaseNo +"</td>" +
									   "</tr>";
									   
							});
							
							$("#dmodalTable tbody").html(dmt);
						},error:function(){
							console.log("ajax 상병코드 조회 실패");
						}
						
					});
				});
			});
			
			// 상병코드 조회에서 상병칸으로 보내주는 부분
			$(document).on("dblclick", ".dbd", function(event){
				//console.log($(this).children().eq(0).text());
				var dCode = $(this).children().eq(0).text();
				var dName = $(this).children().eq(1).text();
				var dChartNo = $("#dChartNo").text();
				var dCodeNo = $(this).children().eq(3).text();
				var ms = $(".yes").length;
				//console.log(ms);
				
				if(ms==1){
					addCode =  "<tr class='row100 yes'>" + 
								   "<td class='column100 column1 sq' data-column='column1'>■</td>" +
								   "<td class='column100 column2' data-column='column2'><input type='text' class='pTextbox' value="+ dCode +"></td>" +
								   "<td class='column100 column3' data-column='column3'>"+ dName +"</td>" + 
								   "<td class='column100 column4 nv' data-column='column4'>1</td>" +
								   "<td class='column100 column5' data-column='column5'></td>" +
								   "<td class='column100 column6 nl' data-column='column6'></td>" +
								   "<td style='display:none'><input type='hidden' name='diseaseNo' class='dno' value="+ dCodeNo +"></td>" +
								   "<td class='insertValue' style='display:none'>0<input type='hidden' value='"+dCodeNo+"'></td>" +
							   "</tr>";
				}else{
					addCode =  "<tr class='row100 yes'>" + 
								   "<td class='column100 column1 sq' data-column='column1'></td>" +
								   "<td class='column100 column2' data-column='column2'><input type='text' class='pTextbox' value="+ dCode +"></td>" +
								   "<td class='column100 column3' data-column='column3'>"+ dName +"</td>" + 
								   "<td class='column100 column4 nv' data-column='column4'>2</td>" +
								   "<td class='column100 column5' data-column='column5'></td>" +
								   "<td class='column100 column6 nl' data-column='column6'></td>" +
								   "<td style='display:none'><input type='hidden' name='diseaseNo' class='dno' value="+ dCodeNo +"></td>" +
								   "<td class='insertValue' style='display:none'>0<input type='hidden' value='"+dCodeNo+"'></td>" +
							   "</tr>";
				}
				
				$("#diseaseTable tbody").children(".yes").last().after(addCode);
				$("#dsModal").modal("hide");
			});	
			
			// 선택상병 삭제하는 부분
			var dLine = null;
			$(document).on("click", ".yes", function(){
				dLine = $(this);
				//console.log(dLine.text());
				dLine.css("background", "rgb(196, 235, 255)");
				dLine.siblings().css("background", "transparent");
				
			});
			$(document).on("click", "#dDelete", function(){
				var dCode = dLine.children().eq(6).children().val();
				console.log(dCode);
				var chartNo = $("#hdChart").val();
				console.log(chartNo);
				
				$.ajax({
					url:"deleteDiseaseCode.di",
					data:{
						diseaseNo:dCode,
						chartNo:chartNo
					},
					type:"post",
					success: function(msg){
						alert(msg);
						
					}, error: function(){
						console.log("ajax 처방 삭제 실패");
					}
				});
				dLine.remove();
			});		
			
			
			// 처방 모달 여는부분
			$(document).ready(function(){
				$("#pco").click(function(){
					$("#preModal").modal("show");
					
					$.ajax({
						url:"selectPrescriptionAll.pr",
						data:{
							
						},
						type:"post",
						success:function(pAllList){
							var pl = "";
							if(pAllList.length==0){
								alert("등록된 처방코드가 없습니다. 시스템관리자에게 문의하세요.");
							}else{
								$.each(pAllList, function(i, obj){
									pl += "<tr class='row100 pdb'>" + 
												"<td data-column='column1'>"+ obj.prescripUserCode +"</td>" +
												"<td data-column='column2'>"+ obj.prescripCode +"</td>" +
												"<td data-column='column3'>"+ obj.prescripName +"</td>" +
												"<td data-column='column4'>"+ obj.prescripInsup +"</td>" +
												"<td data-column='column5'>"+ obj.prescripGenep +"</td>" +
												"<td data-column='column6'>";
												if(obj.prescripInsuOffice==null){
													pl += "";
												}else{
													pl += obj.prescripInsuOffice;
												};
												pl += "</td>" +
												"<td style='display:none'>"+ obj.prescripType +"</td>" +
										  "</tr>";
								});
								$("#pmodalTable tbody").html(pl);
							}
						}, error:function(){
							console.log("ajax 처방 전체리스트 통신 실패");
						}
					});
				});
				// 전체 클릭했을 때
				$("#preAll").click(function(){
					$.ajax({
						url:"selectPrescriptionAll.pr",
						data:{
							
						},
						type:"post",
						success:function(pAllList){
							var pl = "";
							if(pAllList.length==0){
								alert("등록된 처방코드가 없습니다. 시스템관리자에게 문의하세요.");
							}else{
								$.each(pAllList, function(i, obj){
									pl += "<tr class='row100 pdb'>" + 
												"<td data-column='column1'>"+ obj.prescripUserCode +"</td>" +
												"<td data-column='column2'>"+ obj.prescripCode +"</td>" +
												"<td data-column='column3'>"+ obj.prescripName +"</td>" +
												"<td data-column='column4'>"+ obj.prescripInsup +"</td>" +
												"<td data-column='column5'>"+ obj.prescripGenep +"</td>" +
												"<td data-column='column6'>";
												if(obj.prescripInsuOffice==null){
													pl += "";
												}else{
													pl += obj.prescripInsuOffice;
												};
												pl += "</td>" +
												"<td style='display:none'>"+ obj.prescripType +"</td>" +
										  "</tr>";
								});
								$("#pmodalTable tbody").html(pl);
							}
						}, error:function(){
							console.log("ajax 처방 전체리스트 통신 실패");
						}
					});
				});
				// 진찰 클릭했을 때
				$("#preBase").click(function(){
					$.ajax({
						url:"selectPrescriptionBase.pr",
						data:{
							
						},
						type:"post",
						success:function(baseList){
							var bl = "";
							if(baseList.length==0){
								alert("등록된 진찰료 코드가 없습니다. 시스템관리자에게 문의하세요");
							}else{
								$.each(baseList, function(i, obj){
									bl += "<tr class='row100 pdb'>" + 
												"<td data-column='column1'>"+ obj.prescripUserCode +"</td>" +
												"<td data-column='column2'>"+ obj.prescripCode +"</td>" +
												"<td data-column='column3'>"+ obj.prescripName +"</td>" +
												"<td data-column='column4'>"+ obj.prescripInsup +"</td>" +
												"<td data-column='column5'>"+ obj.prescripGenep +"</td>" +
												"<td data-column='column6'>";
												if(obj.prescripInsuOffice==null){
													bl += "";
												}else{
													 bl += obj.prescripInsuOffice;
												};
												bl += "</td>" +
												"<td style='display:none'>"+ obj.prescripType +"</td>" +
										  "</tr>";
								});
								$("#pmodalTable tbody").html(bl);
							}
						}, error:function(){
							console.log("ajax 진찰타입 조회 실패");
						}
					});
				});
				// 투약 클릭했을 때
				$("#preMedi").click(function(){
					$.ajax({
						url:"selectPrescriptionMedi.pr",
						data:{
							
						},
						type:"post",
						success:function(mediList){
							var ml = "";
							if(mediList.length==0){
								alert("등록된 투약 코드가 없습니다. 시스템관리자에게 문의하세요");
							}else{
								$.each(mediList, function(i, obj){
									ml += "<tr class='row100 pdb'>" + 
												"<td data-column='column1'>"+ obj.prescripUserCode +"</td>" +
												"<td data-column='column2'>"+ obj.prescripCode +"</td>" +
												"<td data-column='column3'>"+ obj.prescripName +"</td>" +
												"<td data-column='column4'>"+ obj.prescripInsup +"</td>" +
												"<td data-column='column5'>"+ obj.prescripGenep +"</td>" +
												"<td data-column='column6'>";
												if(obj.prescripInsuOffice==null){
													ml += "";
												}else{
													ml += obj.prescripInsuOffice;
												};
												ml += "</td>" +
												"<td style='display:none'>"+ obj.prescripType +"</td>" +
										  "</tr>";
								});
								$("#pmodalTable tbody").html(ml);
							}
						}, error:function(){
							console.log("ajax 진찰타입 조회 실패");
						}
					});
				});
				// 처치 클릭했을 때
				$("#preHand").click(function(){
					$.ajax({
						url:"selectPrescriptionHand.pr",
						data:{
							
						},
						type:"post",
						success:function(handList){
							var hl = "";
							if(handList.length==0){
								alert("등록된 처치 코드가 없습니다. 시스템관리자에게 문의하세요");
							}else{
								$.each(handList, function(i, obj){
									hl += "<tr class='row100 pdb'>" + 
												"<td data-column='column1'>"+ obj.prescripUserCode +"</td>" +
												"<td data-column='column2'>"+ obj.prescripCode +"</td>" +
												"<td data-column='column3'>"+ obj.prescripName +"</td>" +
												"<td data-column='column4'>"+ obj.prescripInsup +"</td>" +
												"<td data-column='column5'>"+ obj.prescripGenep +"</td>" +
												"<td data-column='column6'>";
												if(obj.prescripInsuOffice==null){
													hl += "";
												}else{
													hl += obj.prescripInsuOffice;
												};
												hl += "</td>" +
												"<td style='display:none'>"+ obj.prescripType +"</td>" +
										  "</tr>";
								});
								$("#pmodalTable tbody").html(hl);
							}
						}, error:function(){
							console.log("ajax 진찰타입 조회 실패");
						}
					});
				});
				// 방사선 클릭했을 때
				$("#preXray").click(function(){
					$.ajax({
						url:"selectPrescriptionXray.pr",
						data:{
							
						},
						type:"post",
						success:function(xrayList){
							var xl = "";
							if(xrayList.length==0){
								alert("등록된 방사선 코드가 없습니다. 시스템관리자에게 문의하세요");
							}else{
								$.each(xrayList, function(i, obj){
									xl += "<tr class='row100 pdb'>" + 
												"<td data-column='column1'>"+ obj.prescripUserCode +"</td>" +
												"<td data-column='column2'>"+ obj.prescripCode +"</td>" +
												"<td data-column='column3'>"+ obj.prescripName +"</td>" +
												"<td data-column='column4'>"+ obj.prescripInsup +"</td>" +
												"<td data-column='column5'>"+ obj.prescripGenep +"</td>" +
												"<td data-column='column6'>";
												if(obj.prescripInsuOffice==null){
													xl += "";
												}else{
													xl += obj.prescripInsuOffice;
												};
												xl += "</td>" +
												"<td style='display:none'>"+ obj.prescripType +"</td>" +
										  "</tr>";
								});
								$("#pmodalTable tbody").html(xl);
							}
						}, error:function(){
							console.log("ajax 진찰타입 조회 실패");
						}
					});
				});
				// 검사 클릭했을 때
				$("#preCheckup").click(function(){
					$.ajax({
						url:"selectPrescriptionCheckup.pr",
						data:{
							
						},
						type:"post",
						success:function(checkupList){
							var cl = "";
							if(checkupList.length==0){
								alert("등록된 검사 코드가 없습니다. 시스템관리자에게 문의하세요");
							}else{
								$.each(checkupList, function(i, obj){
									cl += "<tr class='row100 pdb'>" + 
												"<td data-column='column1'>"+ obj.prescripUserCode +"</td>" +
												"<td data-column='column2'>"+ obj.prescripCode +"</td>" +
												"<td data-column='column3'>"+ obj.prescripName +"</td>" +
												"<td data-column='column4'>"+ obj.prescripInsup +"</td>" +
												"<td data-column='column5'>"+ obj.prescripGenep +"</td>" +
												"<td data-column='column6'>";
												if(obj.prescripInsuOffice==null){
													cl += "";
												}else{
													cl += obj.prescripInsuOffice;
												};
												cl += "</td>" +
												"<td style='display:none'>"+ obj.prescripType +"</td>" +
										  "</tr>";
								});
								$("#pmodalTable tbody").html(cl);
							}
						}, error:function(){
							console.log("ajax 진찰타입 조회 실패");
						}
					});
				});
				
				// 처방코드 조회에서 처방칸으로 보내주는 부분
				var addP = "";
				$(document).on("dblclick", ".pdb", function(event){
					var pCode = $(this).children().eq(0).text();	// 사용자코드 추출
					var pName = $(this).children().eq(2).text();	// 처방명칭 추출
					var pInsu = $(this).children().eq(3).text();	// 보험금액 추출
					var pGene = $(this).children().eq(4).text();	// 일반금액 추출	
					var pType = $(this).children().eq(6).text();	// 처방타입 추출
					var pChartNo = $("#dChartNo").text();			// 차트번호
					var pInsurance = $("#dInsurance").text();		// 보험유형
					
					if(pInsurance=='일반'){
						addP = "<tr class='row100 pYes pdb'>" + 
									"<td class='' data-column='column1' style='display:none'>"+ pCode +"</td>" +
									"<td class='' data-column='column1'><input type='text' class='pTextbox' name='prescripUserCode' value="+ pCode +"></td>" +
									"<td class='' data-column='column2'>"+ pName +"</td>" +
									"<td class='' data-column='column3'><input type='text' class='pTextbox totalAd' name='totalAd' value='1'></td>" +
									"<td class='' data-column='column4'><input type='text' class='pTextbox' name='numTimes' value='1'></td>" +
									"<td class='' data-column='column5'><input type='text' class='pTextbox' name='numDays' value='1'></td>" +
									"<td class='' data-column='column6'><input type='text' class='pTextbox' name='salaryClassific' value='1'></td>" +
									"<td class='' data-column='column7'>";
									if(pType=='방사선'){
										addP += 'Xray';
									}else if(pType=='처치'){
										addP += 'PT';
									}
							addP +=	"</td>" +
									"<td class='' data-column='column8'name='prescripInsup'>"+ pGene +"</td>" +
									"<td class='' data-column='column9'><input type='checkbox' name='nighttime'class='nCheck'></td>" +
									"<td class='' data-column='column10'><input type='checkbox' name='emergency' class='eCheck'></td>" +
									"<td class='insertPreValue' style='display:none'>0<input type='hidden' value='"+pCode+"'></td>" +
							   "</tr>";
					}else{
						addP = "<tr class='row100 pYes pdb'>" + 
									"<td class='' data-column='column1' style='display:none'>"+ pCode +"</td>" +
									"<td class='' data-column='column1'><input type='text' class='pTextbox' value="+ pCode +"></td>" +
									"<td class='' data-column='column2'>"+ pName +"</td>" +
									"<td class='' data-column='column3'><input type='text' class='pTextbox totalAd' name='totalAd' value='1'></td>" +
									"<td class='' data-column='column4'><input type='text' class='pTextbox' name='numTimes' value='1'></td>" +
									"<td class='' data-column='column5'><input type='text' class='pTextbox' name='numDays' value='1'></td>" +
									"<td class='' data-column='column6'><input type='text' class='pTextbox' name='salaryClassific' value='0'></td>" +
									"<td class='' data-column='column7'>";
									if(pType=='방사선'){
										addP += 'Xray';
									}else if(pType=='처치'){
										addP += 'PT';
									}
							addP +=	"</td>" +
									"<td class='' data-column='column8'name='prescripInsup'>"+ pInsu +"</td>" +
									"<td class='' data-column='column9'><input type='checkbox' name='nighttime'class='nCheck'></td>" +
									"<td class='' data-column='column10'><input type='checkbox' name='emergency' class='eCheck'></td>" +
									"<td class='insertPreValue' style='display:none'>0<input type='hidden' value='"+pCode+"'></td>" +
							   "</tr>";
					}
					//console.log(addP);
					$("#prescriptionTable tbody").children(".pYes").last().after(addP);
					$("#preModal").modal("hide");
					$(".preReset").val("");
					$("#divPrescriptionArea").css("display", "none");
				});
				// 선택 처방 삭제하는 부분
				var pLine = null;
				$(document).on("click", ".pYes", function(){
					pLine = $(this);
					pLine.css("background", "rgb(196, 235, 255)");
					pLine.siblings().css("background", "transparent");
					
				});
				$(document).on("click", "#pDelete", function(){
					var preUc = pLine.children().eq(0).text()
					console.log(preUc);
					var chartNo = $("#hdChart").val();
					console.log(chartNo);
					
					$.ajax({
						url:"deletePreCode.pr",
						data:{
							prescripUserCode:preUc,
							chartNo:chartNo
						},
						type:"post",
						success: function(msg){
							alert(msg);
							
						}, error: function(){
							console.log("ajax 처방 삭제 실패");
						}
					});
					pLine.remove();
				});	
				// 총투여 횟수로 단가 변경하는 부분
				var pcLine = null;
				$(document).on("click", ".totalAd", function(){
					pcLine = $(this);			// 총투여
					var pPrice = $(this).parent().parent().children().eq(8).text();
					//console.log(pcLine.val());
					console.log($(this).parent().parent().children().eq(0).text());
					console.log($(this).parent().parent().children().eq(8).text());
					$(pcLine).keydown(function(key) {
		                if (key.keyCode == 13) {
		                	console.log("엔터");
		                	var pcV = pcLine.val();
		                	var nP = pcV * pPrice;
		                	console.log(nP);
		                	$(this).parent().parent().children().eq(8).text(nP);
		                }
		            });
				});
				// 야간 체크로 단가 변경하는 부분				
				$(document).on("click", ".nCheck", function(){
					var pInsurance = $("#dInsurance").text();							// 보험유형
					var pType = 0;
					if(pInsurance=='일반'){
						pType = 1;
					}
					console.log(pType);
					var pCode = $(this).parent().parent().children().eq(0).text();		// 사용자코드
					var pPrice = $(this).parent().parent().children().eq(8).text();		// 단가
					var bp = $(this).parent().parent().children().eq(8);				// ajax 조회후 값 넣을 위치
					console.log(pCode);
					console.log(pPrice);					
					var np = Math.floor((pPrice * 1.15) / 10) * 10;
					console.log(np);
					if($(this).is(":checked")){
						//console.log("수정하기");
						$(this).parent().parent().children().eq(8).text(np);
					}else{
						console.log("원래대로");
						$.ajax({
							url:"infoPrice.pr",
							data:{
								prescripUserCode:pCode,
								prescripType:pType
							},
							type:"post",
							success: function(basicP){
								//console.log(basicP.prescripInsup);
								//console.log(basicP.prescripGenep);
								bp.text(basicP.prescripInsup);								
							}, error: function(){
								console.log("ajax 야간적용 단가 조회 실패");
							}
						});
					}
				});
				// 야간 체크로 단가 변경하는 부분				
				$(document).on("click", ".eCheck", function(){
					var pInsurance = $("#dInsurance").text();							// 보험유형
					var pType = 0;
					if(pInsurance=='일반'){
						pType = 1;
					}
					console.log(pType);
					var pCode = $(this).parent().parent().children().eq(0).text();		// 사용자코드
					var pPrice = $(this).parent().parent().children().eq(8).text();		// 단가
					var bp = $(this).parent().parent().children().eq(8);				// ajax 조회후 값 넣을 위치
					console.log(pCode);
					console.log(pPrice);					
					var np = Math.floor((pPrice * 1.15) / 10) * 10;
					console.log(np);
					if($(this).is(":checked")){
						//console.log("수정하기");
						$(this).parent().parent().children().eq(8).text(np);
					}else{
						console.log("원래대로");
						$.ajax({
							url:"emerPrice.pr",
							data:{
								prescripUserCode:pCode,
								prescripType:pType
							},
							type:"post",
							success: function(basicP){
								//console.log(basicP.prescripInsup);
								//console.log(basicP.prescripGenep);
								bp.text(basicP.prescripInsup);								
							}, error: function(){
								console.log("ajax 응급적용 단가 조회 실패");
							}
						});
					}
				});
				
				
			});
			
	
		});
	</script>
	<script>
		$(document).ready(function(){
			var area = "";
			
			$(document).click(function(){
				area = $('.transColor').attr('name');
				//console.log(area);
				
				
				switch(area){
				case "vital" :
					console.log(area);
					
					$(document).contextmenu(function(e){
					    //Get window size:
					    var winWidth = $(document).width();
					    var winHeight = $(document).height();
					    //Get pointer position:
					    var posX = e.pageX;
					    var posY = e.pageY;
					    //Get contextmenu size:
					    var menuWidth = $(".menuV").width();
					    var menuHeight = $(".menuV").height();
					    //Security margin:
					    var secMargin = 10;
					    //Prevent page overflow:
					    if(posX + menuWidth + secMargin >= winWidth
					    && posY + menuHeight + secMargin >= winHeight){
					      //Case 1: right-bottom overflow:
					      posLeft = posX - menuWidth - secMargin + "px";
					      posTop = posY - menuHeight - secMargin + "px";
					    }
					    else if(posX + menuWidth + secMargin >= winWidth){
					      //Case 2: right overflow:
					      posLeft = posX - menuWidth - secMargin + "px";
					      posTop = posY + secMargin + "px";
					    }
					    else if(posY + menuHeight + secMargin >= winHeight){
					      //Case 3: bottom overflow:
					      posLeft = posX + secMargin + "px";
					      posTop = posY - menuHeight - secMargin + "px";
					    }
					    else {
					      //Case 4: default values:
					      posLeft = posX + secMargin + "px";
					      posTop = posY + secMargin + "px";
					    };
					    //Display contextmenu:
					    $(".contextmenu").hide();
					    $("#menuV").css({
					      "left": posLeft,
					      "top": posTop
					    }).show();
					    //Prevent browser default contextmenu.
					    return false;
			  		});
					
					break;
				case "symptom" :
					console.log(area);
					
					$(document).contextmenu(function(e){
					    //Get window size:
					    var winWidth = $(document).width();
					    var winHeight = $(document).height();
					    //Get pointer position:
					    var posX = e.pageX;
					    var posY = e.pageY;
					    //Get contextmenu size:
					    var menuWidth = $(".menuS").width();
					    var menuHeight = $(".menuS").height();
					    //Security margin:
					    var secMargin = 10;
					    //Prevent page overflow:
					    if(posX + menuWidth + secMargin >= winWidth
					    && posY + menuHeight + secMargin >= winHeight){
					      //Case 1: right-bottom overflow:
					      posLeft = posX - menuWidth - secMargin + "px";
					      posTop = posY - menuHeight - secMargin + "px";
					    }
					    else if(posX + menuWidth + secMargin >= winWidth){
					      //Case 2: right overflow:
					      posLeft = posX - menuWidth - secMargin + "px";
					      posTop = posY + secMargin + "px";
					    }
					    else if(posY + menuHeight + secMargin >= winHeight){
					      //Case 3: bottom overflow:
					      posLeft = posX + secMargin + "px";
					      posTop = posY - menuHeight - secMargin + "px";
					    }
					    else {
					      //Case 4: default values:
					      posLeft = posX + secMargin + "px";
					      posTop = posY + secMargin + "px";
					    };
					    //Display contextmenu:
					    $(".contextmenu").hide();
					    $("#menuS").css({
					      "left": posLeft,
					      "top": posTop
					    }).show();
					    //Prevent browser default contextmenu.
					    return false;
			  		});
					
					break;
				case "disase" :
					console.log(area);
					
					$(document).contextmenu(function(e){
					    //Get window size:
					    var winWidth = $(document).width();
					    var winHeight = $(document).height();
					    //Get pointer position:
					    var posX = e.pageX;
					    var posY = e.pageY;
					    //Get contextmenu size:
					    var menuWidth = $(".menuS").width();
					    var menuHeight = $(".menuS").height();
					    //Security margin:
					    var secMargin = 10;
					    //Prevent page overflow:
					    if(posX + menuWidth + secMargin >= winWidth
					    && posY + menuHeight + secMargin >= winHeight){
					      //Case 1: right-bottom overflow:
					      posLeft = posX - menuWidth - secMargin + "px";
					      posTop = posY - menuHeight - secMargin + "px";
					    }
					    else if(posX + menuWidth + secMargin >= winWidth){
					      //Case 2: right overflow:
					      posLeft = posX - menuWidth - secMargin + "px";
					      posTop = posY + secMargin + "px";
					    }
					    else if(posY + menuHeight + secMargin >= winHeight){
					      //Case 3: bottom overflow:
					      posLeft = posX + secMargin + "px";
					      posTop = posY - menuHeight - secMargin + "px";
					    }
					    else {
					      //Case 4: default values:
					      posLeft = posX + secMargin + "px";
					      posTop = posY + secMargin + "px";
					    };
					    //Display contextmenu:
					    $(".contextmenu").hide();
					    $("#menuD").css({
					      "left": posLeft,
					      "top": posTop
					    }).show();
					    //Prevent browser default contextmenu.
					    return false;
			  		});
					
					break;
				case "prescription" :
					//console.log(area);
					
					$(document).contextmenu(function(e){
					    //Get window size:
					    var winWidth = $(document).width();
					    var winHeight = $(document).height();
					    //Get pointer position:
					    var posX = e.pageX;
					    var posY = e.pageY;
					    //Get contextmenu size:
					    var menuWidth = $(".menuS").width();
					    var menuHeight = $(".menuS").height();
					    //Security margin:
					    var secMargin = 10;
					    //Prevent page overflow:
					    if(posX + menuWidth + secMargin >= winWidth
					    && posY + menuHeight + secMargin >= winHeight){
					      //Case 1: right-bottom overflow:
					      posLeft = posX - menuWidth - secMargin + "px";
					      posTop = posY - menuHeight - secMargin + "px";
					    }
					    else if(posX + menuWidth + secMargin >= winWidth){
					      //Case 2: right overflow:
					      posLeft = posX - menuWidth - secMargin + "px";
					      posTop = posY + secMargin + "px";
					    }
					    else if(posY + menuHeight + secMargin >= winHeight){
					      //Case 3: bottom overflow:
					      posLeft = posX + secMargin + "px";
					      posTop = posY - menuHeight - secMargin + "px";
					    }
					    else {
					      //Case 4: default values:
					      posLeft = posX + secMargin + "px";
					      posTop = posY + secMargin + "px";
					    };
					    //Display contextmenu:
					    $(".contextmenu").hide();
					    $("#menuP").css({
					      "left": posLeft,
					      "top": posTop
					    }).show();
					    //Prevent browser default contextmenu.
					    return false;
			  		});
					
					break;
				default : 
					//console.log("default");
					break;
				
				}
			});
	  		
	 		 //Hide contextmenu:
	 		 $(document).click(function(){
	 		   $(".contextmenu").hide();
	 		 });
		});
	</script>
	

	<!-- 가운데 화면 시작 -->
	<div id="outer">
		<button onclick="location.href='rcMain.rc'" class="btnF" style="width:150px;">오른쪽 클리닉</button>
		<!-- 작업일자 영역 -->
		<form id="mediForm" method="post" action="">
			<div id="topDate" class="areaA">
				<table id="dateTable">
					<tr>
						<th class="tb_header_th"><b>작업일자</b></th>
						<td style="width:142px;">
							<input type="date" id="medicalDate" name="medicalDate">
						</td>
						<th class="tb_header_th"><b>차트번호</b></th>
						<td id="dChartNo">&nbsp;&nbsp;&nbsp;</td>
						<td style="display:none;"><input type="text" id="hdChart" name="chartNo"></td>
						<th class="tb_header_th"><b>수진자명</b></th>
						<td id="dPatientsName">&nbsp;&nbsp;&nbsp;</td>
						<td id="dGenAge">&nbsp;&nbsp;&nbsp;</td>
						<th class="tb_header_th"><b>보험유형</b></th>
						<td id="dInsurance">&nbsp;&nbsp;&nbsp;</td>
					</tr>
				</table>
			</div>
			<!-- 바이탈 영역 -->
			<div id="vitalArea" class="areaA" name="vital">
				<div id="vitalHeader">
					<h3 class="valueH">&nbsp;바이탈</h3>		
				</div>
				<table id="vitalTable">
					<thead>
						<tr class="r1">
							<th>입력일시</th>
							<th>최고혈압</th>
							<th>최저혈압</th>
							<th>식전혈당</th>
							<th>식후혈당</th>
							<th>몸무게</th>
							<th>키</th>
							<th>체온</th>
						</tr>					
					</thead>
					<tbody>
						<tr>
						    <td><input type='date' id='vitalDate' readonly></td>
						    <td><input type='text'></td>
						    <td><input type='text'></td>
						    <td><input type='text'></td>
						    <td><input type='text'></td>
						    <td><input type='text'></td>
						    <td><input type='text'></td>
						    <td><input type='text'></td>
					    </tr>
					</tbody>
				</table>			
			</div>
			
			
			<!-- 증상 영역 -->
			<div id="symptomArea" class="areaA" name="symptom">
				<div id="symptomH">
					<h3 class="valueH">&nbsp;증상</h3>
				</div>
				<textarea id="symptom" name='symptomHistory'></textarea>
			</div>
			<!-- 과거증상조회 영역 -->
			<div id="symptomHistoryArea" class="areaA" style="border:1px solid lightgray;">
				<div id="historyClose">
					<button type="button" id="closeBtn">X</button>
				</div>
				<div id="symptomHistoryBox">
					<br><br>				
				</div>
			</div>
			
			
			<!-- 진료대기 영역 -->
			<div id="standArea" class="areaA">
				<div id="standH">
					<h3 class="valueH">진료환자</h3>
				</div>
				<button type="button" class="standBtn1 standBtn on">진료대기</button>
				<button type="button" class="standBtn2 standBtn">진료보류</button>
				<div class="standList">
					<div class="listBox1 listBox on" style="overflow:auto;">
						<table id="standTable">
							<thead>
								<tr>
									<th>진찰중</th>
									<th>환자번호</th>
									<th>차트번호</th>
									<th>이름</th>
									<th>나이</th>
									<th>초재진</th>
									<th>담당의</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ list }" var="j">
									<c:choose>
										<c:when test="${ !empty j.chartNo }">
											<tr class="jList">
												<td class="checkH"></td>
												<td>${ j.patientsNo }</td>
												<td>${ j.chartNo }</td>
												<td>${ j.patientsName }</td>
												<td>${ j.age }</td>
												<td>${ j.adhd }</td>
												<td>${ j.mo }</td>
											</tr>										
										</c:when>
										<c:otherwise>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>										
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="listBox2 listBox">
						<table id="holdTable">
							<thead>
								<tr>
									<th>진찰중</th>
									<th>환자번호</th>
									<th>차트번호</th>
									<th>이름</th>
									<th>나이</th>
									<th>초재진</th>
									<th>담당의</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${ hList }" var="h">
									<c:choose>
										<c:when test="${ !empty h.chartNo }">
											<tr class="jList">
												<td class="checkH"></td>
												<td>${ h.patientsNo }</td>
												<td>${ h.chartNo }</td>
												<td>${ h.patientsName }</td>
												<td>${ h.age }</td>
												<td>${ h.adhd }</td>
												<td>${ h.mo }</td>
											</tr>
										</c:when>
										<c:otherwise>
											<tr>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
												<td>&nbsp;</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 진료환자 영역 script -->
			<script>
				// 버튼 색 제거, 추가
				$('.standBtn').on('click', function(){
					$('.standBtn').removeClass('on');
					$(this).addClass('on');
				});
				
				// 대기, 보류창 display
				$('.standBtn1').on('click', function(){
					$('.listBox').hide();
					$('.listBox1').show();
				});
				$('.standBtn2').on('click', function(){
					$('.listBox').hide();
					$('.listBox2').show();
				});
				
				// 주상병 부상병 변경하는 부분
				var nl = "";
				$(document).on("click", ".sq", function(event){
					$(".sq").text("");
					$(this).text("■");

					$(".nv").text("2");
					$(this).parent().children().eq(3).text("1");
					
					$(".nl").text("");
					$(this).parent().children().eq(5).text(nl);
					
				});
				
				$(function(){		
					//change 사용(달력)
					$("#medicalDate").change(function(){
						console.log($(this).val());
					})
	
					// 진료대기 환자 호출 부분
					$(".jList").dblclick(function(){
						var pno = $(this).children().eq(1).text();
						console.log(pno);
						var mDate = $("#medicalDate").val();
						console.log(mDate);
						var mo = $(this).children().eq(6).text();
						console.log(mo);
						var adhd = $(this).children().eq(4).text();
						console.log(adhd);
						/* var cNo = $(this).children().eq(2).text();
						console.log(cNo);
						 */
						$(".checkH").text("");
						$(this).children().eq(0).text('V');
						
						$(this).css("color", "blue").css("font-weight", "700");
						$(this).siblings().css("color", "black").css("font-weight", "normal");

						$.ajax({
							url:"detailPatients.me",
							data:{patientsNo:pno,
								  receiptDate:mDate,
								  mo:mo},
							type:"post",
							success:function(map){
								//console.log(map);
								/* 작업일자 부분 */
								$.each(map.dateBar, function(i, obj){
									$("#medicalDate").val(obj.receiptDate);
									$("#dChartNo").text(obj.chartNo);
									$("#hdChart").val(obj.chartNo);
									$("#dPatientsName").text(obj.patientsName);
									$("#dGenAge").text("("+obj.gender+" / "+obj.age+"세)");
									$("#dInsurance").text(obj.insurance);
								});
								
								
								/* 바이탈 부분 */
								var valueV="";
								console.log(map.v);								
								if(map.v.length == 0){
									valueV += "<tr>" +
												  "<td><input type='date' name='receiptDate' id='vitalDate'></td>" + 
												  "<td><input type='text' name='maxBp' value='0' onFocus="+"this.value='';return true;"+"></td>" +
												  "<td><input type='text' name='minBp' value='0' onFocus="+"this.value='';return true;"+"></td>" +
												  "<td><input type='text' name='beforeBs' value='0' onFocus="+"this.value='';return true;"+"></td>" +
												  "<td><input type='text' name='afterBs' value='0' onFocus="+"this.value='';return true;"+"></td>" +
												  "<td><input type='text' name='weight' value='0.0' onFocus="+"this.value='';return true;"+"></td>" +
												  "<td><input type='text' name='height' value='0.0' onFocus="+"this.value='';return true;"+"></td>" +
												  "<td><input type='text' name='fever' value='0.0' onFocus="+"this.value='';return true;"+"></td>" +
											  "</tr>";
								}else{
									$.each(map.v, function(i, obj){
										valueV += "<tr>" +
													"<td><input type='date' name='receiptDate' value='"+ obj.receiptDate +"'></td>" +
													"<td><input type='text' name='maxBp' value='" + obj.maxBp + "'></td>" +
													"<td><input type='text' name='minBp' value='" + obj.minBp + "'></td>" +
													"<td><input type='text' name='beforeBs' value='" + obj.beforeBs + "'></td>" +
													"<td><input type='text' name='afterBs' value='" + obj.afterBs + "'></td>" +
													"<td><input type='text' name='weight' value='" + obj.weight + "'></td>" +
													"<td><input type='text' name='height' value='" + obj.height + "'></td>" +
												 	"<td><input type='text' name='fever' value='" + obj.fever + "'></td>" +
												 "</tr>";
									});	
								}
								$("#vitalTable tbody").html(valueV);
								
								
								/* 증상 부분 */
								var valueS = "";
								if(map.s.length != 0){
									$.each(map.s, function(i, obj){
										//console.log(obj.symptomHistory);
										valueS += obj.symptomHistory;
									});
								}
								$("#symptom").val(valueS);		
								/* 과거증상내역 부분 */
								var symHistory = "";
								$.each(map.sList, function(i, obj){
									symHistory += "<br>***** 작업일자 : " + obj.receiptDate + " *****" + "<br>" +
												  obj.symptomHistory;
								});
								$("#symptomHistoryBox").html(symHistory);
								
								
								/* 상병 부분 */
								var valueD = "";
								// 조회 결과가 있을 경우
								$.each(map.dHistory, function(i, obj){
									var dkn = obj.diseaseKorName.replace(/\s/gi, "");
									var sq = ("■");
									nl = obj.userLicense;
									console.log(map.dHistory);
									
									if(i==0){
										valueD +=  "<tr class='row100 yes'>" + 
													   "<td class='column100 column1 sq' data-column='column1'>"+ sq +"</td>" +
													   "<td class='column100 column2' data-column='column2'><input type='text' class='pTextbox' value="+ obj.diseaseCode +"></td>" +
													   "<td class='column100 column3' data-column='column3'>"+ dkn +"</td>" + 
													   "<td class='column100 column4 nv' data-column='column4'>"+ 1 +"</td>" +
													   "<td class='column100 column5' data-column='column5'>"+ obj.userDepartment +"</td>" +
													   "<td class='column100 column6 nl' data-column='column6'>"+ obj.userLicense +"</td>" +
													   "<td style='display:none'><input type='hidden' name='diseaseNo' class='dno' value="+ obj.diseaseNo +"></td>" +
												   "</tr>";
									}else{
										valueD +=  "<tr class='row100 yes'>" + 
													   "<td class='column100 column1 sq' data-column='column1'></td>" +
													   "<td class='column100 column2' data-column='column2'><input type='text' class='pTextbox' value="+ obj.diseaseCode +"></td>" +
													   "<td class='column100 column3' data-column='column3'>"+ dkn +"</td>" + 
													   "<td class='column100 column4 nv' data-column='column4'>"+ 2 +"</td>" +
													   "<td class='column100 column5' data-column='column5'>"+ obj.userDepartment +"</td>" +
													   "<td class='column100 column6 nl' data-column='column6'></td>" +
													   "<td style='display:none'><input type='hidden' name='diseaseNo' class='dno' value="+ obj.diseaseNo +"></td>" +
												   "</tr>";
									}
								});
								if(map.dHistory.length==0){
									// 새로 추가하는 경우에 기준점을 잡기 위해 클래스 넣는 부분
									valueD +=  "<tr class='row100 yes' style='display:none'>" + 
											   "</tr>";
									// 조회 결과가 없을 경우
									for(var i=0; i<=5; i++){
										valueD +=  "<tr class='row100'>" + 
													   "<td class='column100 column1 sq' data-column='column1'></td>" +
													   "<td class='column100 column2' data-column='column2'><input type='text'class='pTextbox pReset' ></td>" +
													   "<td class='column100 column3' data-column='column3'></td>" + 
													   "<td class='column100 column4' data-column='column4'></td>" +
													   "<td class='column100 column5' data-column='column5'></td>" +
													   "<td class='column100 column6' data-column='column6'></td>" +
												   "</tr>";
									}
								}else{
									if(map.dHistory.length==1){
										for(var i=0; i<=4; i++){
											valueD +=  "<tr class='row100'>" + 
														   "<td class='column100 column1 sq' data-column='column1'></td>" +
														   "<td class='column100 column2' data-column='column2'><input type='text'class='pTextbox pReset' ></td>" +
														   "<td class='column100 column3' data-column='column3'></td>" + 
														   "<td class='column100 column4' data-column='column4'></td>" +
														   "<td class='column100 column5' data-column='column5'></td>" +
														   "<td class='column100 column6' data-column='column6'></td>" +
													   "</tr>";
										}
									}else if(map.dHistory.length==2){
										for(var i=0; i<=3; i++){
											valueD +=  "<tr class='row100'>" + 
														   "<td class='column100 column1 sq' data-column='column1'></td>" +
														   "<td class='column100 column2' data-column='column2'><input type='text'class='pTextbox pReset' ></td>" +
														   "<td class='column100 column3' data-column='column3'></td>" + 
														   "<td class='column100 column4 nv' data-column='column4'></td>" +
														   "<td class='column100 column5' data-column='column5'></td>" +
														   "<td class='column100 column6' data-column='column6'></td>" +
													   "</tr>";
										}
									}else if(map.dHistory.length==3){
										for(var i=0; i<=2; i++){
											valueD +=  "<tr class='row100'>" + 
														   "<td class='column100 column1 sq' data-column='column1'></td>" +
														   "<td class='column100 column2' data-column='column2'><input type='text'class='pTextbox pReset' ></td>" +
														   "<td class='column100 column3' data-column='column3'></td>" + 
														   "<td class='column100 column4' data-column='column4'></td>" +
														   "<td class='column100 column5' data-column='column5'></td>" +
														   "<td class='column100 column6' data-column='column6'></td>" +
													   "</tr>";
										}
									}else if(map.dHistory.lenth==4){
										for(var i=0; i<=1; i++){
											valueD +=  "<tr class='row100'>" + 
														   "<td class='column100 column1 sq' data-column='column1'></td>" +
														   "<td class='column100 column2' data-column='column2'><input type='text'class='pTextbox pReset' ></td>" +
														   "<td class='column100 column3' data-column='column3'></td>" + 
														   "<td class='column100 column4' data-column='column4'></td>" +
														   "<td class='column100 column5' data-column='column5'></td>" +
														   "<td class='column100 column6' data-column='column6'></td>" +
													   "</tr>";
										}
									}
								}
								$("#diseaseTable tbody").html(valueD);
								
								
								/* 처방 부분 */
								var valueP = "";
								// 조회결과가 있을 경우
								$.each(map.pList, function(i, obj){	
									//console.log(map.pList.length);
									valueP +=  "<tr class='row100 pYes' style='display:none'>" + 
										   	   "</tr>";
									valueP += "<tr class='row100 pYes pdb'>" + 
													"<td class='' data-column='column1' style='display:none'>"+ obj.prescripUserCode +"</td>" +
													"<td class='' data-column='column1'><input type='text' class='preTextbox' value="+ obj.prescripUserCode +"></td>" +
													"<td class='' data-column='column2'>"+ obj.prescripName +"</td>" +
													"<td class='' data-column='column3'><input type='text' class='pTextbox totalAd' value="+ obj.totalAd +"></td>" +
													"<td class='' data-column='column4'><input type='text' class='pTextbox' value="+ obj.numTimes +"></td>" +
													"<td class='' data-column='column5'><input type='text' class='pTextbox' value="+ obj.numDays +"></td>" +
													"<td class='' data-column='column6'><input type='text' class='pTextbox' value="+ obj.salaryClassific +"></td>";
													if(obj.prescripType=='처치'){
														valueP += "<td class='' data-column='column7'>PT</td>";	
													}else if(obj.prescripType=='방사선'){
														valueP += "<td class='' data-column='column7'>Xray</td>";	
													}else{
														valueP += "<td class='' data-column='column7'></td>";
													}
													// 단가 금액 설정 부분
													valueP += "<td class='' data-column='column8'>"+ (obj.totalAd * obj.prescripInsup) +"</td>";
													// 야간 여부 체크 확인 부분
													if(obj.nighttime=='N'){
														valueP += "<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>";
													}else {
														valueP += "<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box' checked></td>";
													}
													// 응급 여부 체크 확인 부분
													if(obj.emergency=='N'){
														valueP += "<td class='' data-column='column10'><input type='checkbox' class='eCheck'></td>"; 
													}else {
														valueP += "<td class='' data-column='column10'><input type='checkbox' class='eCheck' checked></td>";
													}
								  valueP += "</tr>";
								});
								if(map.pList.length==1){
									for(var i=0; i<=5; i++){
										valueP += "<tr class='row100 pdb'>" + 
														"<td class='' data-column='column1' style='display:none'>" +
														"<td class='' data-column='column1'><input type='text' class='preTextbox preReset'></td>" +
														"<td class='' data-column='column2'></td>" +
														"<td class='' data-column='column3'><input type='text' class='othi totalAd'></td>" +
														"<td class='' data-column='column4'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column5'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column6'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column7'></td>" +
														"<td class='' data-column='column8'></td>" +
														"<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>" +
														"<td class='' data-column='column10'><input type='checkbox'class='eCheck' class='eCheck'></td>" +
												  "</tr>";
									}
								}else if(map.pList.length==2){
									for(var i=0; i<=4; i++){
										valueP += "<tr class='row100 pdb'>" + 
														"<td class='' data-column='column1' style='display:none'>" +
														"<td class='' data-column='column1'><input type='text' class='preTextbox preReset'></td>" +
														"<td class='' data-column='column2'></td>" +
														"<td class='' data-column='column3'><input type='text' class='othi totalAd'></td>" +
														"<td class='' data-column='column4'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column5'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column6'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column7'></td>" +
														"<td class='' data-column='column8'></td>" +
														"<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>" +
														"<td class='' data-column='column10'><input type='checkbox' class='eCheck'></td>" +
												  "</tr>";
									}
								}else if(map.pList.length==3){
									for(var i=0; i<=3; i++){
										valueP += "<tr class='row100 pdb'>" + 
														"<td class='' data-column='column1' style='display:none'>" +
														"<td class='' data-column='column1'><input type='text' class='preTextbox preReset'></td>" +
														"<td class='' data-column='column2'></td>" +
														"<td class='' data-column='column3'><input type='text' class='othi totalAd'></td>" +
														"<td class='' data-column='column4'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column5'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column6'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column7'></td>" +
														"<td class='' data-column='column8'></td>" +
														"<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>" +
														"<td class='' data-column='column10'><input type='checkbox' class='eCheck'></td>" +
												  "</tr>";
									}
								}else if(map.pList.length==4){
									for(var i=0; i<=2; i++){
										valueP += "<tr class='row100 pdb'>" + 
														"<td class='' data-column='column1' style='display:none'>" +
														"<td class='' data-column='column1'><input type='text' class='preTextbox preReset'></td>" +
														"<td class='' data-column='column2'></td>" +
														"<td class='' data-column='column3'><input type='text' class='othi totalAd'></td>" +
														"<td class='' data-column='column4'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column5'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column6'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column7'></td>" +
														"<td class='' data-column='column8'></td>" +
														"<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>" +
														"<td class='' data-column='column10'><input type='checkbox' class='eCheck'></td>" +
												  "</tr>";
									}
								}else if(map.pList.length==5){
									for(var i=0; i<=1; i++){
										valueP += "<tr class='row100 pdb'>" + 
														"<td class='' data-column='column1' style='display:none'>" +
														"<td class='' data-column='column1'><input type='text' class='preTextbox preReset'></td>" +
														"<td class='' data-column='column2'></td>" +
														"<td class='' data-column='column3'><input type='text' class='othi totalAd'></td>" +
														"<td class='' data-column='column4'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column5'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column6'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column7'></td>" +
														"<td class='' data-column='column8'></td>" +
														"<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>" +
														"<td class='' data-column='column10'><input type='checkbox' class='eCheck'></td>" +
												  "</tr>";
									}
								}
								if(map.pList.length==0){
									if(adhd == '초진'){
										valueP +=  "<tr class='row100 pYes' style='display:none'>" + 
										   		   "</tr>";
										valueP += "<tr class='row100 pYes pdb'>" +  
														"<td class='' data-column='column1' style='display:none'>AA154</td>" +
														"<td class='' data-column='column1'><input type='text' class='preTextbox value='AA154'></td>" +
														"<td class='' data-column='column2'>초진진찰료-의과의원보건의료원내의과</td>" +
														"<td class='' data-column='column3'><input type='text' class='othi totalAd' name='totalAd' value='1'></td>" +
														"<td class='' data-column='column4'><input type='text' class='othi' name='numTimes' value='1'></td>" +
														"<td class='' data-column='column5'><input type='text' class='othi' name='numDays' value='1'></td>" +
														"<td class='' data-column='column6'><input type='text' class='othi' name='salaryClassific' value='1'></td>" +
														"<td class='' data-column='column7'></td>" +
														"<td class='' data-column='column8'name='prescripInsup'>15690</td>" +
														"<td class='' data-column='column9'><input type='checkbox' name='nighttime'class='nCheck'></td>" +
														"<td class='' data-column='column10'><input type='checkbox' name='emergency' class='eCheck'></td>" +
														"<td class='insertPreValue' style='display:none'>0<input type='hidden' value='AA154'></td>" +
												  "</tr>";
									}else{
										valueP +=  "<tr class='row100 pYes' style='display:none'>" + 
								   		   "</tr>";
										valueP += "<tr class='row100 pYes pdb'>" +  
														"<td class='' data-column='column1' style='display:none'>AA254</td>" +
														"<td class='' data-column='column1'><input type='text' class='preTextbox' value='AA254'></td>" +
														"<td class='' data-column='column2'>재진진찰료-의과의원보건의료원내의과</td>" +
														"<td class='' data-column='column3'><input type='text' class='othi totalAd' name='totalAd' value='1'></td>" +
														"<td class='' data-column='column4'><input type='text' class='othi' name='numTimes' value='1'></td>" +
														"<td class='' data-column='column5'><input type='text' class='othi' name='numDays' value='1'></td>" +
														"<td class='' data-column='column6'><input type='text' class='othi' name='salaryClassific' value='1'></td>" +
														"<td class='' data-column='column7'></td>" +
														"<td class='' data-column='column8'name='prescripInsup'>11210</td>" +
														"<td class='' data-column='column9'><input type='checkbox' name='nighttime'class='nCheck'></td>" +
														"<td class='' data-column='column10'><input type='checkbox' name='emergency' class='eCheck'></td>" +
														"<td class='insertPreValue' style='display:none'>0<input type='hidden' value='AA254'></td>" +
												  "</tr>";
									}
									for(var i=0; i<=5; i++){
										valueP += "<tr class='row100 pdb'>" + 
														"<td class='' data-column='column1' style='display:none'>" +
														"<td class='' data-column='column1'><input type='text' class='preTextbox preReset'></td>" +
														"<td class='' data-column='column2'></td>" +
														"<td class='' data-column='column3'><input type='text' class='othi totalAd'></td>" +
														"<td class='' data-column='column4'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column5'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column6'><input type='text' class='othi'></td>" +
														"<td class='' data-column='column7'></td>" +
														"<td class='' data-column='column8'></td>" +
														"<td class='' data-column='column9'><input type='checkbox' class='nCheck' name='box'></td>" +
														"<td class='' data-column='column10'><input type='checkbox' class='eCheck'></td>" +
												  "</tr>";	
									}
								}
								$("#prescriptionTable tbody").html(valueP);
								
								document.getElementById("vitalDate").value = new Date().toISOString().substring(0, 10);
							}, error:function(){
								console.log("ajax 통신 실패");
							}
						});				
					});
					
					// 상병 코드 검색부분
					$(function(){
						$(document).on("click", "#searchBase", function(){
							var searchBase = document.getElementById("searchBase");
							searchBase = searchBase.options[searchBase.selectedIndex].value;
							//console.log(searchBase);
							
							switch(searchBase){
							case '코드' : 
								$("#searchCode").addClass("code");
								$("#searchCode").removeClass("kor");
								$("#searchCode").removeClass("eng");
								break;
							case '한글' : 
								$("#searchCode").addClass("kor");
								$("#searchCode").removeClass("code");
								$("#searchCode").removeClass("eng");
								break;
							case '영문' : 
								$("#searchCode").addClass("eng");
								$("#searchCode").removeClass("kor");
								$("#searchCode").removeClass("code");
								break;
							}
						});
					});
					
					/* $(document).ready(function () {
						$('#dtBasicExample').DataTable();
						$('.dataTables_length').addClass('bs-select');
					}); */
					$(document).ready(function() {
						$(document).on("click", "#searchCode", function(){
							if($("#searchCode").hasClass("code") === true) {
								$(".code").keyup(function() {
							        var k = $(this).val();
							        $("#dmodalTable > tbody > tr").hide();
							        var temp = $("#dmodalTable > tbody > tr > td:nth-child(5n+1):contains('" + k + "')");
							
							        $(temp).parent().show();
							    });
							}else if($("#searchCode").hasClass("kor") === true) {
								$(".kor").keyup(function() {
							        var k = $(this).val();
							        $("#dmodalTable > tbody > tr").hide();
							        var temp = $("#dmodalTable > tbody > tr > td:nth-child(5n+2):contains('" + k + "')");
							
							        $(temp).parent().show();
							    });
							}else if($("#searchCode").hasClass("eng") === true) {
								$(".eng").keyup(function() {
							        var k = $(this).val();
							        $("#dmodalTable > tbody > tr").hide();
							        var temp = $("#dmodalTable > tbody > tr > td:nth-child(5n+3):contains('" + k + "')");
							
							        $(temp).parent().show();
							    });
							}
						});
					   /*  $(".basic").keyup(function() {
					        var k = $(this).val();
					        $("#dmodalTable > tbody > tr").hide();
					        var temp = $("#dmodalTable > tbody > tr > td:nth-child(5n+1):contains('" + k + "')");
					
					        $("#user-table2 > tbody > tr").hide();
					        var temp2 = $("#user-table2 > tbody > tr > td:nth-child(5n+2):contains('" + k + "')");
					
					        $(temp).parent().show();
					        $(temp2).parent().show();
					    }) */
					})
					//$('#zero_config').DataTable();
					
					
					// 처방 코드 검색부분
					$(function(){
						$(document).on("click", "#preSearchList", function(){
							var preSearchList = document.getElementById("preSearchList");
							preSearchList = preSearchList.options[preSearchList.selectedIndex].value;
							//console.log(searchBase);
												
							switch(preSearchList){
							case '사용자코드' : 
								$("#preSearch").addClass("userCode");
								$("#preSearch").removeClass("baseCode");
								$("#preSearch").removeClass("preName");
								break;
							case '청구코드' : 
								$("#preSearch").addClass("baseCode");
								$("#preSearch").removeClass("userCode");
								$("#preSearch").removeClass("preName");
								break;
							case '처방명칭' : 
								$("#preSearch").addClass("preName");
								$("#preSearch").removeClass("userCode");
								$("#preSearch").removeClass("baseCode");
								break;
							}
						});
					});

					$(document).ready(function() {
						$(document).on("click", "#preSearch", function(){
							if($("#preSearch").hasClass("userCode") === true) {
								$(".userCode").keyup(function() {
									var k = $(this).val();
									$("#pmodalTable > tbody > tr").hide();
									var temp = $("#pmodalTable > tbody > tr > td:nth-child(5n+1):contains('" + k + "')");
												
									$(temp).parent().show();
								});
							}else if($("#preSearch").hasClass("baseCode") === true) {
								$(".baseCode").keyup(function() {
									var k = $(this).val();
									$("#pmodalTable > tbody > tr").hide();
									var temp = $("#pmodalTable > tbody > tr > td:nth-child(5n+2):contains('" + k + "')");
												
									$(temp).parent().show();
								});
							}else if($("#preSearch").hasClass("preName") === true) {
								$(".preName").keyup(function() {
									var k = $(this).val();
									$("#pmodalTable > tbody > tr").hide();
									var temp = $("#pmodalTable > tbody > tr > td:nth-child(5n+3):contains('" + k + "')");
												
									$(temp).parent().show();
								});
							}
						});
					})
					
					
					// 작업일자 기본값 오늘날짜로 설정해주는 부분
					document.getElementById("medicalDate").value = new Date().toISOString().substring(0, 10);;
					document.getElementById("vitalDate").value = new Date().toISOString().substring(0, 10);;
					document.getElementById("startDay").value = new Date().toISOString().substring(0, 10);;
					document.getElementById("endDay").value = new Date().toISOString().substring(0, 10);;
					
				});
			</script>
			
			
			<!-- 상병 영역 -->
			<div id="diseaseArea" class="areaA" name="disase">
				<div id="diseaseH">
					<h3 class="valueH">&nbsp;상병</h3>
					<input type='hidden' id="dnoInput" name="dnoInput">
				</div>
				
				<div class="container-table100">
					<div class="table100 ver3 m-b-110">
						<table id="diseaseTable">
							<thead>
								<tr class="row100 head">
									<th class="column100 column1" data-column="column1">M</th>
									<th class="column100 column2" data-column="column2">상병코드</th>
									<th class="column100 column3" data-column="column3">상병명칭</th>
									<th class="column100 column4" data-column="column4">구분</th>
									<th class="column100 column5" data-column="column5">과목</th>
									<th class="column100 column6" data-column="column6">면허번호</th>
								</tr>
							</thead>
							<tbody>
								<tr class="row100">
									<td class="column100 column1" data-column="column1"></td>
									<td class="column100 column2" data-column="column2"></td>
									<td class="column100 column3" data-column="column3"></td>
									<td class="column100 column4" data-column="column4"></td>
									<td class="column100 column5" data-column="column5"></td>
									<td class="column100 column6" data-column="column6"></td>
								</tr>
			
								<tr class="row100">
									<td class="column100 column1" data-column="column1"></td>
									<td class="column100 column2" data-column="column2"></td>
									<td class="column100 column3" data-column="column3"></td>
									<td class="column100 column4" data-column="column4"></td>
									<td class="column100 column5" data-column="column5"></td>
									<td class="column100 column6" data-column="column6"></td>
								</tr>
			
								<tr class="row100">
									<td class="column100 column1" data-column="column1"></td>
									<td class="column100 column2" data-column="column2"></td>
									<td class="column100 column3" data-column="column3"></td>
									<td class="column100 column4" data-column="column4"></td>
									<td class="column100 column5" data-column="column5"></td>
									<td class="column100 column6" data-column="column6"></td>
								</tr>
			
								<tr class="row100">
									<td class="column100 column1" data-column="column1"></td>
									<td class="column100 column2" data-column="column2"></td>
									<td class="column100 column3" data-column="column3"></td>
									<td class="column100 column4" data-column="column4"></td>
									<td class="column100 column5" data-column="column5"></td>
									<td class="column100 column6" data-column="column6"></td>
								</tr>
			
								<tr class="row100">
									<td class="column100 column1" data-column="column1"></td>
									<td class="column100 column2" data-column="column2"></td>
									<td class="column100 column3" data-column="column3"></td>
									<td class="column100 column4" data-column="column4"></td>
									<td class="column100 column5" data-column="column5"></td>
									<td class="column100 column6" data-column="column6"></td>
								</tr>
			
								<tr class="row100">
									<td class="column100 column1" data-column="column1"></td>
									<td class="column100 column2" data-column="column2"></td>
									<td class="column100 column3" data-column="column3"></td>
									<td class="column100 column4" data-column="column4"></td>
									<td class="column100 column5" data-column="column5"></td>
									<td class="column100 column6" data-column="column6"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- 상병 코드 입력시 나타나는 div 영역 -->
			<div class="container-table100">
				<div class="table100 ver3 m-b-110">
					<div id="searchDivArea" style="display:none">
						<table id="diseaseDivTable">
							<thead>
								<tr>
									<th>코드</th>
									<th>한글명칭</th>
								</tr>
							</thead>
							<tbody>
								
							</tbody>
						</table>
					</div>
				</div>
			</div>	
			<script>
				$(document).ready(function(){
					var ddv = "";
					$.ajax({
						url:"divDiseaseArea.di",
						data:{
							
						},
						type:"post",
						success: function(divList){
							$.each(divList, function(i, obj){
								ddv += "<tr class='row100 ddbd'>" +
											"<td class='column100 column1' data-column='column1'>"+ obj.diseaseCode +"</td>" +
											"<td class='column100 column2' data-column='column2'>"+ obj.diseaseKorName +"</td>" +
											"<td style='display:none;'>"+ obj.diseaseNo +"</td>" +
										"</tr>";
							});
							$("#diseaseDivTable tbody").html(ddv);
						}, error: function(){
							console.log("ajax div 상병 테이블 조회 실패");
						}
					});
					var resetText = "";
					$(document).on("click", ".pTextbox", function(){
						resetText = $(this).find(".pTextbox");
						//console.log(resetText);
						$(".pTextbox").keyup(function() {
							$("#searchDivArea").css("display", "block");
							
							var k = $(this).val();
							$("#diseaseDivTable > tbody > tr").hide();
							var temp = $("#diseaseDivTable > tbody > tr > td:nth-child(5n+1):contains('" + k + "')");
										
							$(temp).parent().show();
						});
					});
					$(document).on("dblclick", ".ddbd", function(event){
						var divCode = "";
						var code = $(this).children().eq(0).text();
						var codeName = $(this).children().eq(1).text();
						var codeNo = $(this).children().eq(2).text();
						var ms = $(".yes").length;
						//console.log(code);
						//console.log(codeName);
						//console.log(ms);
						//console.log(codeNo);
						
						if(ms==1){
							divCode =  "<tr class='row100 yes'>" + 
										   "<td class='column100 column1 sq' data-column='column1'>■</td>" +
										   "<td class='column100 column2' data-column='column2'><input type='text' class='pTextbox' value="+ code +"></td>" +
										   "<td class='column100 column3' data-column='column3'>"+ codeName +"</td>" + 
										   "<td class='column100 column4 nv' data-column='column4'>1</td>" +
										   "<td class='column100 column5' data-column='column5'></td>" +
										   "<td class='column100 column6 nl' data-column='column6'></td>" +
										   "<td style='display:none'><input type='hidden' name='diseaseNo' class='dno' value="+ codeNo +"></td>" +
										   "<td class='insertValue' style='display:none'>0<input type='hidden' value='"+codeNo+"'></td>" +
									   "</tr>";
						}else{
							divCode =  "<tr class='row100 yes'>" + 
										   "<td class='column100 column1 sq' data-column='column1'></td>" +
										   "<td class='column100 column2' data-column='column2'><input type='text' class='pTextbox' value="+ code +"></td>" +
										   "<td class='column100 column3' data-column='column3'>"+ codeName +"</td>" + 
										   "<td class='column100 column4 nv' data-column='column4'>2</td>" +
										   "<td class='column100 column5' data-column='column5'></td>" +
										   "<td class='column100 column6 nl' data-column='column6'></td>" +
										   "<td style='display:none'><input type='hidden' name='diseaseNo' class='dno' value="+ codeNo +"></td>" +
										   "<td class='insertValue' style='display:none'>0<input type='hidden' value='"+codeNo+"'></td>" +
									   "</tr>";
						}
						$("#diseaseTable tbody").children(".yes").last().after(divCode);
						$("#searchDivArea").css("display", "none");
						$(".pReset").val("");
					});
					
				});
			</script>
			
			
			<!-- 처방 영역 -->
			<div id="prescriptionArea" class="areaA" name="prescription">
				<div id="prescriptionH">
					<h3 class="valueH">&nbsp;처방</h3>
					<input type='hidden' id="preCodeInput" name="preCodeInput" value='0'>
				</div>
				<div class="container-table100">
					<div class="table100 ver3 m-b-110">
						<table id="prescriptionTable">
							<thead>
								<tr class="r1">
									<th>처방코드</th>
									<th>처방명칭</th>
									<th>총투여</th>
									<th>횟수</th>
									<th>일수</th>
									<th>급여구분</th>
									<th>전달부서</th>
									<th>단가</th>
									<th>야간</th>
									<th>응급</th>
								</tr>							
							</thead>
							<tbody>
								<tr class='row100'>
									<td class='' data-column='column1'></td>
									<td class='' data-column='column2'></td>
									<td class='' data-column='column3'></td>
									<td class='' data-column='column4'></td>
									<td class='' data-column='column5'></td>
									<td class='' data-column='column6'></td>
									<td class='' data-column='column7'></td>
									<td class='' data-column='column8'></td>
									<td class='' data-column='column9'><input type="checkbox"></td>
									<td class='' data-column='column10'><input type="checkbox"></td>
								</tr>
								<tr class='row100'>
									<td class='' data-column='column1'></td>
									<td class='' data-column='column2'></td>
									<td class='' data-column='column3'></td>
									<td class='' data-column='column4'></td>
									<td class='' data-column='column5'></td>
									<td class='' data-column='column6'></td>
									<td class='' data-column='column7'></td>
									<td class='' data-column='column8'></td>
									<td class='' data-column='column9'><input type="checkbox"></td>
									<td class='' data-column='column10'><input type="checkbox"></td>
								</tr>
								<tr class='row100'>
									<td class='' data-column='column1'></td>
									<td class='' data-column='column2'></td>
									<td class='' data-column='column3'></td>
									<td class='' data-column='column4'></td>
									<td class='' data-column='column5'></td>
									<td class='' data-column='column6'></td>
									<td class='' data-column='column7'></td>
									<td class='' data-column='column8'></td>
									<td class='' data-column='column9'><input type="checkbox"></td>
									<td class='' data-column='column10'><input type="checkbox"></td>
								</tr>
								<tr class='row100'>
									<td class='' data-column='column1'></td>
									<td class='' data-column='column2'></td>
									<td class='' data-column='column3'></td>
									<td class='' data-column='column4'></td>
									<td class='' data-column='column5'></td>
									<td class='' data-column='column6'></td>
									<td class='' data-column='column7'></td>
									<td class='' data-column='column8'></td>
									<td class='' data-column='column9'><input type="checkbox"></td>
									<td class='' data-column='column10'><input type="checkbox"></td>
								</tr>
								<tr class='row100'>
									<td class='' data-column='column1'></td>
									<td class='' data-column='column2'></td>
									<td class='' data-column='column3'></td>
									<td class='' data-column='column4'></td>
									<td class='' data-column='column5'></td>
									<td class='' data-column='column6'></td>
									<td class='' data-column='column7'></td>
									<td class='' data-column='column8'></td>
									<td class='' data-column='column9'><input type="checkbox"></td>
									<td class='' data-column='column10'><input type="checkbox"></td>
								</tr>
								<tr class='row100'>
									<td class='' data-column='column1'></td>
									<td class='' data-column='column2'></td>
									<td class='' data-column='column3'></td>
									<td class='' data-column='column4'></td>
									<td class='' data-column='column5'></td>
									<td class='' data-column='column6'></td>
									<td class='' data-column='column7'></td>
									<td class='' data-column='column8'></td>
									<td class='' data-column='column9'><input type="checkbox"></td>
									<td class='' data-column='column10'><input type="checkbox"></td>
								</tr>
								<tr class='row100'>
									<td class='' data-column='column1'></td>
									<td class='' data-column='column2'></td>
									<td class='' data-column='column3'></td>
									<td class='' data-column='column4'></td>
									<td class='' data-column='column5'></td>
									<td class='' data-column='column6'></td>
									<td class='' data-column='column7'></td>
									<td class='' data-column='column8'></td>
									<td class='' data-column='column9'><input type="checkbox"></td>
									<td class='' data-column='column10'><input type="checkbox"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>
	
			<!-- 버튼 영역 -->
			<div id="btnArea">
				<button type="button" class="btnF" onclick="patientsBtn(1);">보류</button>
				<button type="button" class="btnF" onclick="patientsBtn(2);">초기화</button>
				<button type="button" class="btnF" onclick="patientsBtn(3);" >저장</button>
			</div>		
		</form>
		<script>
			function patientsBtn(num){
				
				if(num==1){
					var dnoArray = new Array();
					// 새로 추가한 상병 insert 하는 부분
			        $(".insertValue").each(function(i){
						//console.log($(".insertValue").eq(i).text());
			            var dn = $(".insertValue").eq(i).children().val();
			            
			         	//console.log(dn);
			            dnoArray.push(dn);      
			        });
			        var dnoList = dnoArray.join(",");
					//console.log(dnoList);
					$("#dnoInput").val(dnoList);
					
					var preArray = new Array();
					// 새로 추가한 처방 insert 하는 부분
					$(".insertPreValue").each(function(i){
						//console.log($(".insertPreValue").eq(i).text());
			            var pn = $(".insertPreValue").eq(i).children().val();
			            
			         	console.log(pn);
			            preArray.push(pn);      
			        });
			        var preList = preArray.join(",");
					//console.log(dnoList);
					$("#preCodeInput").val(preList);
					
					$("#mediForm").attr("action", "stayUpdatePatients.me");
					$("#mediForm").submit();
				}else if(num==2){
					var mDate = $("#medicalDate").val();
					console.log(mDate);
					location.href="medicalMain.me?receiptDate="+mDate;
				}else if(num==3){
					var dnoArray = new Array();
					// 새로 추가한 상병 insert 하는 부분
			        $(".insertValue").each(function(i){
						//console.log($(".insertValue").eq(i).text());
			            var dn = $(".insertValue").eq(i).children().val();
			            
			         	//console.log(dn);
			            dnoArray.push(dn);      
			        });
			        var dnoList = dnoArray.join(",");
					//console.log(dnoList);
					$("#dnoInput").val(dnoList);
					
					var preArray = new Array();
					// 새로 추가한 처방 insert 하는 부분
					$(".insertPreValue").each(function(i){
						//console.log($(".insertPreValue").eq(i).text());
			            var pn = $(".insertPreValue").eq(i).children().val();
			            
			         	console.log(pn);
			            preArray.push(pn);      
			        });
			        var preList = preArray.join(",");
					//console.log(dnoList);
					$("#preCodeInput").val(preList);
					
					$("#mediForm").attr("action", "completePatients.me");
					$("#mediForm").submit();
				}
			};
				
			
		</script>
		<script>
			var areaA = $('.areaA');
			var valueH = $('.valueH');
			areaA.click(function(){
				// 상병 코드 div display:none 처리 부분
				$("#searchDivArea").css("display", "none");
				// 처방 코드 div display:none 처리 부분
				$("#divPrescriptionArea").css("display", "none");
				// 테두리 색 바꿔주는 부분
				// 클릭한 div class에 transColor 넣어줌
				$(this).addClass('transColor');
				// 클릭하지 않은 div class에 transColor 지워줌
				areaA.not($(this)).removeClass('transColor');
				
				// 헤더 배경색 바꿔주는 부분
				$(this).find('.valueH').css('background', 'rgb(214, 242, 255)');
				areaA.not($(this)).find('.valueH').css('background', 'transparent');
			});
		</script>
		
		
		
		<!-- 처방 코드 입력시 나타나는 div 영역 -->
		<div class="container-table100">
			<div class="table100 ver3 m-b-110">
				<div id="divPrescriptionArea" style="display:none">
					<table id="prescriptionDivTable">
						<thead>
							<tr class="divTr">
								<th>사용자코드</th>
								<th>청구코드</th>
								<th>처방명칭</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
			</div>
		</div>	
		<script>
			$(document).ready(function(){
				var pdv = "";
				
				$.ajax({
					url:"divPrescriptionArea.pr",
					data:{
						
					},
					type:"post",
					success: function(divList){
						//console.log(divList);
						$.each(divList, function(i, obj){
							pdv += "<tr class='row100 pdb'>" + 
										"<td data-column='column1'>"+ obj.prescripUserCode +"</td>" +
										"<td data-column='column2'>"+ obj.prescripCode +"</td>" +
										"<td data-column='column3'>"+ obj.prescripName +"</td>" +
										"<td data-column='column4' style='display:none'>"+ obj.prescripInsup +"</td>" +
										"<td data-column='column5' style='display:none'>"+ obj.prescripGenep +"</td>";
								 pdv += "</td>" +
										"<td style='display:none'>"+ obj.prescripType +"</td>" +
								  "</tr>";

						});
						$("#prescriptionDivTable tbody").html(pdv);
						
					}, error: function(){
						console.log("ajax 처방 div 조회 실패");
					}
				});
				$(document).on("click", ".preTextbox", function(){
					resetText = $(this).find(".preTextbox");
					//console.log(resetText);
					$(".preTextbox").keyup(function() {
						$("#divPrescriptionArea").css("display", "block");
						
						var k = $(this).val();
						$("#prescriptionDivTable > tbody > tr").hide();
						var temp = $("#prescriptionDivTable > tbody > tr > td:nth-child(5n+1):contains('" + k + "')");
									
						$(temp).parent().show();
					});
				});				
			});
		</script>
		
	</div>
	
</body>
</html>
