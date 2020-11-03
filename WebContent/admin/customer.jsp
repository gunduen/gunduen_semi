<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin - 고객 관리</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	function kickOutChk(){
		var question = confirm('정말 회원탈퇴 시키겠습니까?');
		if(question){
			return true;
		}else{
			return false;
		}
	
	}
</script>
</head>
<body>
<ul style="border:1px solid black;width:100px;list-style:none;padding:0;margin:0;">
	<li onClick="location.href='/admin/driverList'">기사 회원 관리</li>
	<li onClick="location.href='/admin/customerList'">고객 회원 관리</li>
	<li onClick="location.href='/admin/travelList'">여행 예약 관리</li>
	<li onClick="location.href='/message/receiverList?receiver=${sessionScope.customer.customer_Id}'">쪽지 관리</li>
</ul>
<div>${ sessionScope.customer.customer_Id } 페이지입니다. </div>
<table border="1px solid black">
	<tr>
		
		<th>아이디</th>
		<th>이름</th>
		<th>핸드폰번호</th>
		<th>이메일</th>
		<th>주민등록번호</th>
		<th>회원 강제 탈퇴</th>
	</tr>
	<c:forEach items="${ CList }" var="customerList">
	 <c:if test="${customerList.adminCheck ne 1}"> <!--adminCheck 0인사람만 출력 -->
	 <tr>
	 	<td>${ customerList.customer_Id }</td>
	 	<td>${ customerList.customer_Name }</td>
	 	<td>${ customerList.customer_Phone }</td>
	 	<td>${ customerList.customer_Email }</td>
	 	<td>${ customerList.customer_Rrn }</td>
	 	<td><form action="/customer/kickout?customer_Id=${customerList.customer_Id}" method="post" onsubmit="return kickOutChk();"><input type="submit" value="회원 탈퇴"></form></td>
	 </c:if>
	 </c:forEach>
	 <!-- <script>
	 	function delCustomerfunc(cusId) {
	 		var real = confirm("정말로 탈퇴시키겠습니까?");
	 		if (real){
	 			location.href="/admin/customerdelete?customerId="+ cusId;
	 		} 
	 	}
	 </script> -->
</table>
	
</body>
</html>