<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
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
	border: 0.5px solid rgb(220, 220, 220);
	width: 200px;
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
	background: aquamarine;
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
#title{font-size: 20px;}
#checkbox{margin-left:71px;}
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
			<legend><h2>사용자 정보</h2></legend>
			<div class="userLeft">
				<form action="userInsert.me" method="post">
					<table>
						<tr>
							<th>*사용자코드</th>
							<td></td>
							<th>*사용자암호</th>
							<td></td>
						</tr>
						<tr></tr><tr></tr>
						<tr>
							<th>담당자명</th>
							<td></td>
							<th>*소속과목</th>
							<td></td>
						</tr>
						<tr></tr><tr></tr>
						<tr>
							<th>사원번호</th>
							<td></td>
							<th>면허번호</th>
							<td></td>
						</tr>
						<tr></tr><tr></tr>
						<tr>
							<th>이메일</th>
							<td></td>
							<th>주민번호</th>
							<td></td>
						</tr>
						<tr></tr><tr></tr>
						<tr>
							<th>적용일자</th>
							<td></td>
							<th>의사여부</th>
							<td></td>
						</tr>
						<tr></tr><tr></tr>
						<tr>
							<th>만료일자</th>
							<td></td>
						</tr>
					</table>
				</form>
				<div style="margin-top: 30px;">
					<button type="button" id="btns" class="newUser">신규등록</button>
					<button type="button" id="btns" class="updateUser">사용자수정</button>
					<button type="button" id="btns" class="deleteUser">사용자삭제</button>
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
						<td><input style="zoom:1.5;" id="checkbox" type="checkbox" name="" value="" checked></td>
					</tr>
					<tr>
						<th>외래접수</th>
						<td><input style="zoom:1.5;" id="checkbox" type="checkbox" name="" value="" checked></td>
					</tr>
					<tr>
						<th>외래진료</th>
						<td><input style="zoom:1.5;" id="checkbox" type="checkbox" name="" value="" checked></td>
					</tr>
					<tr>
						<th>환자조회</th>
						<td><input style="zoom:1.5;" id="checkbox" type="checkbox" name="" value="" checked></td>
					</tr>
					<tr>
						<th>지원부서</th>
						<td><input style="zoom:1.5;" id="checkbox" type="checkbox" name="" value="" checked></td>
					</tr>
					<tr>
						<th>통계</th>
						<td><input style="zoom:1.5;" id="checkbox" type="checkbox" name="" value="" checked></td>
					</tr>
					<tr>
						<th>진단서</th>
						<td><input style="zoom:1.5;" id="checkbox" type="checkbox" name="" value="" checked></td>
					</tr>
					<tr>
						<th>메신저</th>
						<td><input style="zoom:1.5;" id="checkbox" type="checkbox" name="" value="" checked></td>
					</tr>
				</table>
				<br>
			</div>
		</fieldset>
		<br><br>
		<div>
			<div style="float: left; width:40px; height:40px; background:aquamarine"></div>
			<div style="float:left; margin-left:15px; margin-top: 1.5px; font-size:27px;">사용자 정보 조회</div>
			<div style="float:left; margin-left:70px;">
				<input style="float: left;zoom:1.5; margin-top: 9px;" type="checkbox" name="" value="">
				<p style="float:left; font-size: 18px; margin-top:9px; ">만료된 ID 정보 조회</p>
			</div>
			<div id="searchUser" style="float:right; margin-left:70px; display:none;">
				<input class="searchUser1" type="text" placeholder="사용자 정보 입력">
				<button type=button class="searchUser2">검색</button>
			</div>
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
					</tr>
				</thead>
				<tbody>
					
					<c:forEach items="${ list }" var="u">
						<tr>
							<td>${ u.userNo }</td>
							<td>${ u.userCode }</td>
							<td>${ u.userName }</td>
							<td>${ u.userLicense }</td>
							<td>${ u.userDepartment }</td>
							<td>${ u.userDoctor }</td>
							<td>${ u.userApplicationDate }</td>
							<td>${ u.userExpirationDate }</td>
						</tr>
					</c:forEach>
				</tbody>			
			</table>
			
			<!--  <div id="pagingArea">
                <ul class="pagination">
                	
                	<c:choose>
                		<c:when test="${ pi.currentPage eq 1 }">
	                    	<li class="page-item disabled"><a class="page-link" href="">Previous</a></li>
                		</c:when>
                		<c:otherwise>
                			<li class="page-item"><a class="page-link" href="userList.me?currentPage=${ pi.currentPage-1 }">Previous</a></li>
                		</c:otherwise>
                	</c:choose>
                    
                    <%-- <% for(int p=startPage; p<=endPage; p++) %> --%>
                    <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p"> 
                    	
                    	<c:choose>
                    		<c:when test="${ pi.currentPage ne p }">
                    			<li class="page-item"><a class="page-link" href="userList.me?currentPage=${ p }">${ p }</a></li>
                    		</c:when>
                    		<c:otherwise>
                    			<li class="page-item disabled"><a class="page-link" href="">${ p }</a></li>
                    		</c:otherwise>
                    	</c:choose>
                    	
                    </c:forEach>
                    
                    <c:choose>
                    	<c:when test="${ pi.currentPage eq pi.maxPage }">
                    		<li class="page-item disabled"><a class="page-link" href="">Next</a></li>
                    	</c:when>
                    	<c:otherwise>
	                    	<li class="page-item"><a class="page-link" href="userList.me?currentPage=${pi.currentPage+1}">Next</a></li>
                    	</c:otherwise>
                    </c:choose>
                
                </ul>
            </div> -->
		</div>
		<script>
			$(function(){
				$("#userList tbody tr").click(function(){
					location.href
				});
			});
		</script>
	</div>
</body>
</html>