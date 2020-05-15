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
	
	<div class="userOuter">
		<br><br>
		<c:if test="${ userLogin.powerMaster eq 'Y' }">
			<a href="userList.me" class="onlyAdmin" id="key">
				<img src="resources/images/key.png" class="key">	
			</a>
		</c:if>
		<br><br><br>
		<div class="first" id="first">
			<p><img src="resources/images/logo3.png" style="width:300px;height:300px;margin-top:100px;margin-right:45px;"></p>
			<h1>원무</h1>
		</div>
		<div class="second" id="second">
			<p><img src="resources/images/logo3.png" style="width:300px;height:300px;margin-top:100px;margin-right:45px;"></p>
			<h1>진료</h1>
		</div>
		<div class="third" id="third">
			<p><img src="resources/images/logo3.png" style="width:300px;height:300px;margin-top:100px;margin-right:45px;"></p>
			<h1>지원</h1>
		</div>
	</div>
	
	<script>
		$("#first").click(function(){
			location.href = "patientsInfo.me";
		});
		
		$("#second").click(function(){
			location.href = "medicalMain.me";
		});
		
		$("#third").click(function(){
			location.href = "supportMain.me";
		});
	</script>
</body>
</html>