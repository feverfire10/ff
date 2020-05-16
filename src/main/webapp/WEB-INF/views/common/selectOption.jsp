<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>

<link rel=" shortcut icon" href="resources/images/logo2.png">
<link rel="icon" href="resources/images/logo2.png">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.userOuter{
	width:1300px;
	margin: auto;
}
.onlyAdmin{margin-left:1220px;}
.key{width:80px;}
.first{
	float:left;
	width: 300px;
	height: 500px;
	/*background: rgb(1,153,220);*/
	color: rgb(1,153,220);
}
.second{
	float:left;
	width: 300px;
	height: 500px;
	margin-left:200px;
	color: rgb(1,153,220);
}
.third{
	float:right;
	width: 300px;
	height: 500px;
	color: rgb(1,153,220);
}
h1{
	text-align: center;
}
div :hover{
	cursor:pointer;
	
}
div img{
	height:100%;
	width:100%;
	object-fit:cover;
	
	transform:scale(1.0);
	transition:transform .5s;
}
div img:hover{
	transform:scale(1.5);
	transition:transform .5s;
}
</style>
</head>
<body>
	<!-- ㅁㅇㄴㅁㄴㅇ -->
	<div class="userOuter">
		<br><br>
		<c:if test="${ userLogin.powerMaster eq 'Y' }">
			<a href="userList.me" class="onlyAdmin" id="key">
				<img src="resources/images/key.png" class="key">	
			</a>
		</c:if>
		<br><br><br>
		<c:if test="${ userLogin.powerReceipt eq 'Y' }">
			<div class="first" id="first">
			<p><img src="resources/images/logo33.png" style="width:300px;height:300px;margin-top:100px;margin-right:25px;"></p>
			<h1>원무</h1>
		</div>
		</c:if>
		<c:if test="${ userLogin.powerReceipt eq 'N' }">
			<div class="first" id="noFirst">
			<p><img src="resources/images/logo33.png" style="width:300px;height:300px;margin-top:100px;margin-right:25px;"></p>
			<h1>원무</h1>
		</div>
		</c:if>
		<c:if test="${ userLogin.powerClinic eq 'Y' }">
			<div class="second" id="second">
			<p><img src="resources/images/logo33.png" style="width:300px;height:300px;margin-top:100px;margin-right:25px;"></p>
			<h1>진료</h1>
		</div>
		</c:if>
		<c:if test="${ userLogin.powerClinic eq 'N' }">
			<div class="second" id="noSecond">
			<p><img src="resources/images/logo33.png" style="width:300px;height:300px;margin-top:100px;margin-right:25px;"></p>
			<h1>진료</h1>
		</div>
		</c:if>
		<c:if test="${ userLogin.powerSub eq 'Y' }">
			<div class="third" id="third">
			<p><img src="resources/images/logo33.png" style="width:300px;height:300px;margin-top:100px;margin-right:25px;"></p>
			<h1>지원</h1>
		</div>
		</c:if>
		<c:if test="${ userLogin.powerSub eq 'N' }">
			<div class="third" id="noThird">
			<p><img src="resources/images/logo33.png" style="width:300px;height:300px;margin-top:100px;margin-right:25px;"></p>
			<h1>지원</h1>
		</div>
		</c:if>
	</div>
	<div style="display:none;">
         <input type='date' id="nowDate" name=receiptDate>   
      </div>
      
	<script>
	$(function(){
        document.getElementById("nowDate").value = new Date().toISOString().substring(0, 10);                  
     });

		$("#first").click(function(){
			location.href = "patientsInfo.me";
		});
		
	     $("#second").click(function(){
	         var mDate = $("#nowDate").val();
	         console.log(mDate);
	         location.href = "medicalMain.me?receiptDate="+mDate;
	      });
	     
		$("#third").click(function(){
			location.href = "supportMain.me";
		});
		
		$("#noFirst").click(function(){
			window.alert("권한이 없습니다!!");
		});
		
		$("#noSecond").click(function(){
			window.alert("권한이 없습니다!!");
		});
		
		$("#noThird").click(function(){
			window.alert("권한이 없습니다!!");
		});
	</script>
</body>
</html>