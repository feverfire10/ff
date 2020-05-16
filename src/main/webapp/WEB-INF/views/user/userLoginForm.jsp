<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="//ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/latest/css/bootstrap.min.css" rel="stylesheet">
<title>Insert title here</title>
<!-- alertifyJS -->
<script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<style>
*:focus{outline: none;}
#main{
	width:1300px;
	margin: auto;
}
p{
	text-align: center;
}
#login-form > div {
    margin: 15px 0;
}
.form-control {
	width:300px;
	height:60px;
	margin-top:5px;
}
</style>
</head>
<body>
	<p><img src="resources/images/logo33.png" style="width:300px;height:300px;margin-top:150px;margin-right:25px;"></p>
	<div class="container">
	    <div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
	        <div class="panel panel-success">
	            <div class="panel-body">
	                <form action="userLogin.me" method="post" id="login-form" style="margin-left: 380px;">
	                    <div>
	                        <input type="text" class="form-control" name="userCode" placeholder="Username" autofocus>
	                    </div>
	                    <div>
	                        <input type="password" class="form-control" name="userPassword" placeholder="Password">
	                    </div>
	                    <div>
	                        <button type="submit" style="background:rgb(1,153,220); border:0;" class="form-control btn btn-primary">로그인</button>
	                    </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
</body>
</html>