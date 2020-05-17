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
       background: aquamarine;
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
.userOuter{
	width:1300px;
	margin: auto;
}
.userLeft{
	width: 560px;
	float: left;
}
.userRight{
	width: 500px;
	float: right;
	margin-right: 50px;
}
.userLeft table{
	border-collapse: separate;
	border-spacing: 5px;
}
.userLeft th{
	border: 0.5px solid rgb(220, 220, 220);
	background: rgb(220, 220, 220);
	font-size: 12px;
	width: 90px;
	height: 25px;
	border-radius: 3px 5px 8px 10px;
}
.userLeft td{
	width: 200px;
}
.userLeft input{
	width:100%;
	border:0;
}
#btns{
	width: 120px;
	height: 40px;
	font-size: 17px;
	font-weight: bold;
	float:right;
	margin-right: 55px;
	background: rgb(220, 220, 220);
	border-radius: 7px 7px 7px 7px;
}
#btns:hover{
	cursor:pointer;
	background: rgb(200, 200, 200);
}
.powerTitle{
	margin: auto;
	background: rgb(1,153,220);
	width: 350px;
	height: 30px;
	font-size: 20px;
	text-align: center;
	border-radius: 8px 8px 8px 8px;
}
.userRight table{
	border-collapse: collapse;
	margin: auto;
}
.userRight th,td{
	border: 0.5px solid rgb(220, 220, 220);
	width: 230px;
	margin: auto;
}
/*  */
#title{font-size: 20px;}
#checkbox{margin-left:71px;}
#checkbox2{margin-left:71px;}
#checkbox3{margin-left:71px;}
#checkbox4{margin-left:71px;}
#checkbox5{margin-left:71px;}
#checkbox6{margin-left:71px;}
#checkbox7{margin-left:71px;}
#checkbox8{margin-left:71px;}
#checkbox1{margin-left:71px;}
#checkbox21{margin-left:71px;}
#checkbox31{margin-left:71px;}
#checkbox41{margin-left:71px;}
#checkbox51{margin-left:71px;}
#checkbox61{margin-left:71px;}
#checkbox71{margin-left:71px;}
#checkbox81{margin-left:71px;}
#checkbox:hover{cursor:pointer;}
#searchUser{
	width:400px;
	height:40px;
	border: 0.5px solid aquamarine;
}
.searchUser1{
	font-size:16px;
	width:275px;
	padding:10px;
	border:0px;
	outline:none;
	float:left;
}
.searchUser2{
	width:100px;
	height:100%;
	border:0px;
	background:aquamarine;
	outline:none;
	float:right;
}
.searchUser2:hover{cursor:pointer;}
#pagingArea{width:fit-content;margin:auto;}
#userList{border-collapse: collapse;}
#userList th{
	border:1px solid;
	width:162.5px;
}
#userList td{
	text-align:center;
}
#reset :hover{cursor:pointer;}
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
	<div class="userOuter">
		<fieldset>
			<legend><h2 id="reset">사용자 정보</h2></legend>
				<form id="enrollForm" action="userInsert.me" method="post" >
					<div class="userLeft">
							<table id="selectUser">
								<tr>
									<th>*사용자코드</th>
									<td><input type="text" id="userCode" name="userCode" required></td>
									<th>*사용자암호</th>
									<td><input type="text" id="userPassword" name="userPassword" required></td>
								</tr>
								<tr></tr><tr></tr>
								<tr>
									<th>담당자명</th>
									<td><input type="text" id="userName" name="userName"></td>
									<th>*소속과목</th>
									<td><input type="text" id="userDepartment" name="userDepartment" required></td>
								</tr>
								<tr></tr><tr></tr>
								<tr>
									<th>사원번호</th>
									<td><input type="text" id="userNo" name="userNo" readonly></td>
									<th>면허번호</th>
									<td><input type="text" id="userLicense" name="userLicense"></td>
								</tr>
								<tr></tr><tr></tr>
								<tr>
									<th>주민번호</th>
									<td><input type="text" id="userSocialNo" name="userSocialNo"></td>
									<th>이메일</th>
									<td><input type="text" id="userEmail" name="userEmail"></td>
								</tr>
								<tr></tr><tr></tr>
								<tr>	
									<th>의사여부 (Y/N)</th>
									<td><input type="text" id="userDoctor" name="userDoctor"></td>
									<th>등록날짜</th>
									<td><input type="text" id="userApplicationDate" name="userApplicationDate" readonly></td>
								</tr><tr></tr><tr></tr>
								<tr>	
									<th>만료날짜</th>
									<td><input type="text" id="userExpirationDate" name="userExpirationDate" readonly></td>
									<th style="display:none;"></th>
									<td style="display:none;"><input type="text" id="userStatus" name="userStatus" readonly></td>
								</tr>
							</table>
							
							<div style="margin-top: 30px;">
								<button type="submit" id="btns" class="newUser">신규등록</button>
								<button type="submit" id="btns" class="updateUser">사용자수정</button>
								<button type="button" id="btns" class="deleteUser" onclick="removeCheck()">사용자삭제</button>
							</div>
						</div>
						<div class="userRight">
							<div class="powerTitle">프로그램 사용권한</div>
							<br>
							<table>
								<tr id="title">
									<th>프로그램</th>
									<th>사용권한</th>
								</tr>
								<tr>
									<th>마스터</th>
									<td><input style="zoom:1.5;" id="checkbox" type="checkbox" name="powerMaster" value="Y"></td>
								</tr>
								<tr>
									<th>외래접수</th>
									<td><input style="zoom:1.5;" id="checkbox2" type="checkbox" name="powerReceipt" value="Y"></td>
								</tr>
								<tr>
									<th>외래진료</th>
									<td><input style="zoom:1.5;" id="checkbox3" type="checkbox" name="powerClinic" value="Y"></td>
								</tr>
								<tr>
									<th>환자조회</th>
									<td><input style="zoom:1.5;" id="checkbox4" type="checkbox" name="powerList" value="Y"></td>
								</tr>
								<tr>
									<th>지원부서</th>
									<td><input style="zoom:1.5;" id="checkbox5" type="checkbox" name="powerSub" value="Y"></td>
								</tr>
								<tr>
									<th>통계</th>
									<td><input style="zoom:1.5;" id="checkbox6" type="checkbox" name="powerResult" value="Y"></td>
								</tr>
								<tr>
									<th>진단서</th>
									<td><input style="zoom:1.5;" id="checkbox7" type="checkbox" name="powerSheet" value="Y"></td>
								</tr>
								<tr>
									<th>메신저</th>
									<td><input style="zoom:1.5;" id="checkbox8" type="checkbox" name="powerMessage" value="Y"></td>
								</tr>
							</table>
							<br>
						</div>
					</form>
					
					<form id="updateForm" action="userUpdate.me" method="post" style="display:none;">
					<div class="userLeft">
							<table id="selectUser">
								<tr>
									<th>*사용자코드</th>
									<td><input type="text" id="userCode1" name="userCode" required></td>
									<th>*사용자암호</th>
									<td><input type="text" id="userPassword1" name="userPassword" required></td>
								</tr>
								<tr></tr><tr></tr>
								<tr>
									<th>담당자명</th>
									<td><input type="text" id="userName1" name="userName"></td>
									<th>*소속과목</th>
									<td><input type="text" id="userDepartment1" name="userDepartment" required></td>
								</tr>
								<tr></tr><tr></tr>
								<tr>
									<th>사원번호</th>
									<td><input type="text" id="userNo1" name="userNo" readonly></td>
									<th>면허번호</th>
									<td><input type="text" id="userLicense1" name="userLicense"></td>
								</tr>
								<tr></tr><tr></tr>
								<tr>
									<th>주민번호</th>
									<td><input type="text" id="userSocialNo1" name="userSocialNo"></td>
									<th>이메일</th>
									<td><input type="text" id="userEmail1" name="userEmail"></td>
								</tr>
								<tr></tr><tr></tr>
								<tr>	
									<th>의사여부 (Y/N)</th>
									<td><input type="text" id="userDoctor1" name="userDoctor"></td>
									<th>등록날짜</th>
									<td><input type="text" id="userApplicationDate1" name="userApplicationDate" readonly></td>
								</tr><tr></tr><tr></tr>
								<tr>	
									<th>만료날짜</th>
									<td><input type="text" id="userExpirationDate1" name="userExpirationDate" readonly></td>
									<th style="display:none;"></th>
									<td style="display:none;"><input type="text" id="userStatus" name="userStatus" readonly></td>
								</tr>
							</table>
							
							<div style="margin-top: 30px;">
								<button type="submit" id="btns" class="newUser">신규등록</button>
								<button type="submit" id="btns" class="updateUser">사용자수정</button>
								<button type="button" id="btns" class="deleteUser" onclick="removeCheck()">사용자삭제</button>
							</div>
						</div>
						<div class="userRight">
							<div class="powerTitle">프로그램 사용권한</div>
							<br>
							<table>
								<tr id="title">
									<th>프로그램</th>
									<th>사용권한</th>
								</tr>
								<tr>
									<th>마스터</th>
									<td><input style="zoom:1.5;" id="checkbox1" type="checkbox" name="powerMaster" value="Y"></td>
								</tr>
								<tr>
									<th>외래접수</th>
									<td><input style="zoom:1.5;" id="checkbox21" type="checkbox" name="powerReceipt" value="Y"></td>
								</tr>
								<tr>
									<th>외래진료</th>
									<td><input style="zoom:1.5;" id="checkbox31" type="checkbox" name="powerClinic" value="Y"></td>
								</tr>
								<tr>
									<th>환자조회</th>
									<td><input style="zoom:1.5;" id="checkbox41" type="checkbox" name="powerList" value="Y"></td>
								</tr>
								<tr>
									<th>지원부서</th>
									<td><input style="zoom:1.5;" id="checkbox51" type="checkbox" name="powerSub" value="Y"></td>
								</tr>
								<tr>
									<th>통계</th>
									<td><input style="zoom:1.5;" id="checkbox61" type="checkbox" name="powerResult" value="Y"></td>
								</tr>
								<tr>
									<th>진단서</th>
									<td><input style="zoom:1.5;" id="checkbox71" type="checkbox" name="powerSheet" value="Y"></td>
								</tr>
								<tr>
									<th>메신저</th>
									<td><input style="zoom:1.5;" id="checkbox81" type="checkbox" name="powerMessage" value="Y"></td>
								</tr>
							</table>
							<br>
						</div>
					</form>
			
		</fieldset>
		<br><br>
		<div>
			<div style="float: left; width:40px; height:40px; background:rgb(1,153,220)"></div>
			<div style="float:left; margin-left:15px; margin-top: 1.5px; font-size:27px;">사용자 정보 조회</div>
			<!--<div style="float:left; margin-left:70px;">
				<input style="float: left;zoom:1.5; margin-top: 9px;" type="checkbox" name="" value="" checked>
				<p style="float:left; font-size: 18px; margin-top:9px; ">ID 정보 조회</p>
			</div>
			<div style="float:left; margin-left:70px;">
				<input style="float: left;zoom:1.5; margin-top: 9px;" type="checkbox" name="" value="">
				<p style="float:left; font-size: 18px; margin-top:9px; ">만료된 ID 정보 조회</p>
			</div>
			<div id="searchUser" style="float:right; margin-left:70px; display:none;">
				<input class="searchUser1" type="text" placeholder="사용자 정보 입력">
				<button type=button class="searchUser2">검색</button>
			</div>  -->
		</div>
		<div style="width:100%; height:500px; margin-top:80px;">
			<table id="userList" align="center">
				<thead>
					<tr>
						<th>사용자코드</th>
						<th>담당자명</th>
						<th>사원번호</th>
						<th>면허번호</th>
						<th>소속과목</th>
						<th>의사여부</th>
						<th>적용일자</th>
						<th>종료일자</th>
						<th style="display:none"></th>
						<th style="display:none"></th>
						<th style="display:none"></th>
						<th style="display:none"></th>
						<th style="display:none"></th>
						<th style="display:none"></th>
						<th style="display:none"></th>
						<th style="display:none"></th>
						<th style="display:none"></th>
						<th style="display:none"></th>
						<th style="display:none"></th>
					</tr>
				</thead>
				<tbody>
					
					<c:forEach items="${ list }" var="u">
						<tr>
							<td>${ u.userCode }</td>
							<td>${ u.userName }</td>
							<td>${ u.userNo }</td>
							<td>${ u.userLicense }</td>
							<td>${ u.userDepartment }</td>
							<td>${ u.userDoctor }</td>
							<td>${ u.userApplicationDate }</td>
							<td>${ u.userExpirationDate }</td>
							<td style="display:none">${ u.userSocialNo }</td>
							<td style="display:none">${ u.userPassword }</td>
							<td style="display:none">${ u.powerMaster }</td>
							<td style="display:none">${ u.powerReceipt }</td>
							<td style="display:none">${ u.powerClinic }</td>
							<td style="display:none">${ u.powerList }</td>
							<td style="display:none">${ u.powerSub }</td>
							<td style="display:none">${ u.powerResult }</td>
							<td style="display:none">${ u.powerSheet }</td>
							<td style="display:none">${ u.powerMessage }</td>
							<td style="display:none">${ u.userEmail }</td>
						</tr>
					</c:forEach>
				</tbody>			
			</table>
	
		</div>
		<script>
		var aaaa="";
			$("#reset").click(function(){
				location.href = "userList.me";
			});
			
			$(".deleteUser").click(function(){
				location.href="userDelete.me?aaaa="+aaaa;
			});
			
		/* 	$(".updateUser").click(function(){
				location.href="userUpdate.me";
			}); */
			
			$(function(){
				
				$("#userList tbody tr").click(function(){
					$("#enrollForm").attr("style","display:none");
					$("#updateForm").attr("style","display:block");
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
					console.log(aaaa);
					var userCode = td.eq(0).text();
					aaaa = userCode;
					console.log(aaaa);
					var userName = td.eq(1).text();
					var userNo = td.eq(2).text();
					var userLicense = td.eq(3).text();
					var userDepartment = td.eq(4).text();
					var userDoctor = td.eq(5).text();
					var userApplicationDate = td.eq(6).text();
					var userExpirationDate = td.eq(7).text();
					var userSocialNo = td.eq(8).text();
					var userPassword = td.eq(9).text();
					var powerMaster = td.eq(10).text();
					var powerReceipt = td.eq(11).text();
					var powerClinic = td.eq(12).text();
					var powerList = td.eq(13).text();
					var powerSub = td.eq(14).text();
					var powerResult = td.eq(15).text();
					var powerSheet = td.eq(16).text();
					var powerMessage = td.eq(17).text();
					var userEmail = td.eq(18).text();
					
					$("#userCode").val(userCode).attr('readonly',true);
					$("#userPassword").val(userPassword);
					$("#userName").val(userName);
					$("#userNo").val(userNo);
					$("#userLicense").val(userLicense);
					$("#userDepartment").val(userDepartment);
					$("#userDoctor").val(userDoctor);
					$("#userApplicationDate").val(userApplicationDate);
					$("#userExpirationDate").val(userExpirationDate);
					$("#userSocialNo").val(userSocialNo).attr('readonly',true);
					$("#userPassword").val(userPassword);
					$("#userEmail").val(userEmail);
					if(powerMaster =="Y"){
						$("#checkbox").attr("checked",true);
					}else{
						$("#checkbox").attr("checked",false);
					}
					if(powerReceipt =='Y'){
						$("#checkbox2").attr('checked',true);
					}else{
						$("#checkbox2").attr("checked",false);
					}
					if(powerClinic =='Y'){
						$("#checkbox3").attr('checked',true);
					}else{
						$("#checkbox3").attr("checked",false);
					}
					if(powerList =='Y'){
						$("#checkbox4").attr('checked',true);
					}else{
						$("#checkbox4").attr("checked",false);
					}
					if(powerSub =='Y'){
						$("#checkbox5").attr('checked',true);
					}else{
						$("#checkbox5").attr("checked",false);
					}
					if(powerResult =='Y'){
						$("#checkbox6").attr('checked',true);
					}else{
						$("#checkbox6").attr("checked",false);
					}
					if(powerSheet =='Y'){
						$("#checkbox7").attr('checked',true);
					}else{
						$("#checkbox7").attr("checked",false);
					}
					if(powerMessage =='Y'){
						$("#checkbox8").attr('checked',true);
					}else{
						$("#checkbox8").attr("checked",false);
					}
					
					$("#userCode1").val(userCode).attr('readonly',true);
					$("#userPassword1").val(userPassword);
					$("#userName1").val(userName);
					$("#userNo1").val(userNo);
					$("#userLicense1").val(userLicense);
					$("#userDepartment1").val(userDepartment);
					$("#userDoctor1").val(userDoctor);
					$("#userApplicationDate1").val(userApplicationDate);
					$("#userExpirationDate1").val(userExpirationDate);
					$("#userSocialNo1").val(userSocialNo).attr('readonly',true);
					$("#userPassword1").val(userPassword);
					$("#userEmail1").val(userEmail);
					if(powerMaster =="Y"){
						$("#checkbox1").attr("checked",true);
					}else{
						$("#checkbox1").attr("checked",false);
					}
					if(powerReceipt =='Y'){
						$("#checkbox21").attr('checked',true);
					}else{
						$("#checkbox21").attr("checked",false);
					}
					if(powerClinic =='Y'){
						$("#checkbox31").attr('checked',true);
					}else{
						$("#checkbox31").attr("checked",false);
					}
					if(powerList =='Y'){
						$("#checkbox41").attr('checked',true);
					}else{
						$("#checkbox41").attr("checked",false);
					}
					if(powerSub =='Y'){
						$("#checkbox51").attr('checked',true);
					}else{
						$("#checkbox51").attr("checked",false);
					}
					if(powerResult =='Y'){
						$("#checkbox61").attr('checked',true);
					}else{
						$("#checkbox61").attr("checked",false);
					}
					if(powerSheet =='Y'){
						$("#checkbox71").attr('checked',true);
					}else{
						$("#checkbox71").attr("checked",false);
					}
					if(powerMessage =='Y'){
						$("#checkbox81").attr('checked',true);
					}else{
						$("#checkbox81").attr("checked",false);
					}
				});
			});
		</script>
	</div>
</body>
</html>