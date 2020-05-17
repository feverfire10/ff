<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel=" shortcut icon" href="resources/images/logo2.png">
<link rel="icon" href="resources/images/logo2.png">
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/JavaScript" src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
	<jsp:include page="user/userLoginForm.jsp"/>	
	
	<!-- <div id="userPage">
		사용자화면
	</div>
	<div id="test">
		test
	</div> -->
	<script>
		$("#userPage").click(function(){
			location.href="userPage.me";
		});
		$("#test").click(function(){
			location.href="test.me";
		});
	</script>
</body>
</html>