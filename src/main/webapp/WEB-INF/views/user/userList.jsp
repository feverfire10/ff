<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel=" shortcut icon" href="resources/images/logo2.png">
<link rel="icon" href="resources/images/logo2.png">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#pagingArea{width:fit-content;margin:auto;}
#userList{border-collapse: collapse;}
#userList th{
	border:1px solid;
	width:162.5px;
}
</style>
</head>
<body>
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
							<td>${ u.userCode }</td>
							<td>${ u.userName }</td>
							<td>${ u.userNo }</td>
							<td>${ u.userLicense }</td>
							<td>${ u.userDepartment }</td>
							<td>${ u.userDoctor }</td>
							<td>${ u.userApplicationDate }</td>
							<td>${ u.userExpirationDate }</td>
						</tr>
					</c:forEach>
				</tbody>			
			</table>
			
			<div id="pagingArea">
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
            </div>
</body>
</html>