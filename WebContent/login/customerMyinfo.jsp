<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import="customer.model.vo.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
	function RrnValCheck(){
		var num1 = document.getElementById("userRrnFirst");
		var num2 = document.getElementById("userRrnSecond");
		
		var arrNum1 = new Array();
		var arrNum2 = new Array();
		
		for(var i=0; i<num1.value.length;i++){
			arrNum1[i] = num1.value.charAt(i);
		}
		for(var i=0; i<num2.value.length;i++){
			arrNum2[i] = num2.value.charAt(i);
		}
		
		var tempSum = 0;
		for(var i=0; i<num1.value.length;i++){
			tempSum += arrNum1[i] * (2+i);
		}
		
		for(var i=0; i<num2.value.length-1;i++){
			if(i>=2){
				tempSum += arrNum2[i] * i;
				
			}else{
				tempSum += arrNum2[i] * (8+i);
			}
		}
		
		if((11-(tempSum%11))%10 != arrNum2[6]){
			alert('올바른 주민번호가 아닙니다. 다시 입력해주세요.');
			num1.value="";
			num2.value="";
			num1.focus();
			return false;
		}else{
			alert('올바른 주민번호입니다.');
			document.getElementById("RrnCheck").value = "RrnCheck";
		}
		
	}
		function checkInputNum(){
    		if ((event.keyCode < 48) || (event.keyCode > 57)){
       		 	event.returnValue = false;
    		}
		}
		function checkValue(){
			var form = document.userInfo;
			
			if(!form.userPwd.value){
				alert('비밀번호를 입력해주세요.');
				return false;
			}
			if(form.userPwd.value != form.userPwdChk.value){
				alert('비밀번호를 동일하게 입력해주세요.');
				return false;
			}
			if(!form.userName.value){
				alert('이름을 입력해주세요.');
				return false;
			}
			if(!form.secondPhone.value || !form.thirdPhone.value){
				alert('번호를 정확히 입력해주세요.');
				return false;
			}
			if(!form.emailId.value){
				alert('이메일 아이디를 입력해주세요.');
				return false;
			}
			
		}
		
		function openIdChk(){
			window.name = "parentForm";
			window.open("/login/CustomerIdCheckForm.jsp","chkForm","width=500, height=300, resizable=no, scrollbars=no");
		}
		function openPhoneChk(){
			window.name = "parentForm";
			window.open("/login/CustomerPhoneCheckForm.jsp","chkForm","width=500, height=300, resizable=no, scrollbars=no");
		}
		function openEmailChk(){
			window.name = "parentForm";
			window.open("/login/CustomerEmailCheckForm.jsp","chkForm", "width=500, height=300, resizable=no, scrollbars=no");
		}
		
		
		function inputIdChk(){
			document.userInfo.idCheck.value = "idUncheck";
		}
		function inputPhoneChk(){
			document.userInfo.phoneCheck.value ="phoneUncheck";
		}
		function inputEmailChk(){
			document.userInfo.emailCheck.value ="emailUncheck";
		}
		
		function pwChk(){
			var password = $("input[name='userPwd']").val();
			var passwordChk = $("input[name='userPwdChk']").val();
			if(password!=passwordChk){
				$("#pw_chk").css("color","red");
				$("#pw_chk").text('비밀번호가 다릅니다.');
			}else if(password=='' && passwordChk==''){
				$("#pw_chk").css("color","red");
				$("#pw_chk").text('비밀번호를 입력해주세요.');
			}else if(password == passwordChk){
				$("#pw_chk").css("color","green");
				$("#pw_chk").text('비밀번호가 일치합니다.');
			}
		}
	</script>
	<!--  -->
	<form action="/customer/update" name = "userInfo" method="post" onsubmit="return checkValue();">
	ID : <input type="text" name="userId" value="${customer.customer_Id }" readonly> 
	<input type="hidden" name="idCheck" value="idUncheck"><br>
	PW : <input type="password" name="userPwd" onkeyup="pwChk();" value="${customer.customer_Pwd }"><span id="pw_chk"></span><br>
	PW확인 : <input type="password" name="userPwdChk" onkeyup="pwChk();"><br> 
	이름 : <input type="text" name="userName" value="${customer.customer_Name }" readonly><br>
	휴대폰 번호  : <select name="firstPhone">
		<option value="010" selected>010</option>
		<option value="010">016</option>
		<option value="010">017</option>
		<option value="010">019</option>
	</select>
	<c:set var = "string1" value="${customer.customer_Phone }" />
	<c:set var = "secondNumber" value="${fn:substring(string1, 4, 8) }" />
	<c:set var = "thirdNumber" value="${fn:substring(string1, 9, 13) }" />
	-<input type="text" size="4" name="secondPhone" id="secondPhone" value="${secondNumber }" onkeypress="javascript:checkInputNum();" onkeydown="inputPhoneChk();" maxlength="4">
	-<input type="text" size="4" name="thirdPhone" id="thirdPhone" value="${ thirdNumber}" onkeypress="javascript:checkInputNum();" onkeydown="inputPhoneChk();" maxlength="4">
	<input type="button" value="중복확인" onclick="openPhoneChk();"><input type="hidden" name="phoneCheck" value="phoneUncheck"><br>
	
	이메일 주소 : <input type="text" name="emailId" value="${fn:substringBefore( customer.customer_Email, '@') }">@
	<select name="emailTag" onkeydown="inputEmailChk();">
		<option value="@naver.com">네이버</option>
		<option value="@daum.net">다음</option>
		<option value="@google.com">구글</option>
		<option value="@iei.or.kr">kh정보교육원</option>
	</select><input type="button" value="중복확인" onclick="openEmailChk();"><input type="hidden" name="emailCheck" value="emailUncheck"><br>
	
	주민등록번호 : <input type="text" name="userRrnFirst" id="userRrnFirst" maxlength="6" value="${fn:substringAfter( customer.customer_Rrn, '-') }">-
	<input type="password" name="userRrnSecond" id="userRrnSecond" maxlength="7" value="${fn:substringBefore( customer.customer_Rrn, '-') }"><input type="button" name="chk" value="검사" onclick="RrnValCheck();">
	<input type="hidden" id="RrnCheck" name="RrnCheck" value="RrnUncheck"><br>
	<input type="submit" value="회원정보수정">
	</form>
	
	<script src="assets/js/main.js"></script>

	<%-- <script>
	function checkValue() {
		var form = document.userInfo;
		if (!form.userName.value) {
			alert('이름을 입력해주세요.');
			return false;
		}
		if (!form.userPwd.value) {
			alert('비밀번호를 입력해주세요.');
			return false;
		}
		if (!form.userPwdChk.value) {
			alert('비밀번호 확인란을 입력해주세요.');
			return false;
		}
		if (form.userPwd.value != form.userPwdChk.value) {
			alert('비밀번호를 동일하게 입력해주세요.');
			return false;
		}
	}
	
	function phoneChk() {
		var phoneChk = $("input[name='phoneCheck']").val();
		if (!password.contains('-')){
			alert("번호를 정확하게 입력해주세요");
			return false;
		}
	}
	</script>
	
	<form action="/customer/update" method="post" name="customerInfo" onsubmit="return checkValue();">
		<div id="title">회원정보 수정</div>
		<table >
			<tr><th>ID</th>
				<td><input type="text" value="${customer.customer_Id }" name="userId" readonly></td>
				<td></td>
			</tr>
			<tr><th>이름</th>
				<td><input type="text" placeholder="내용을 입력해주세요" name="userName" value="${customer.customer_Name }" readonly></td>
				<td></td>
			</tr>
			<tr><th>Password</th>
				<td><input type="password" placeholder="내용을 입력해주세요" name="userPwd"></td>
				<td><div id="pwdchk"></div></td>
			</tr>
			<tr><th>Password Check</th>
				<td><input type="password" placeholder="내용을 입력해주세요" name="userPwdChk"></td>
				<td><div id="pwdchk"></div></td>
			</tr>
			<tr><th>Phone</th>
				<td><input type="text" placeholder=" '-'를 함께 입력해주세요" name="phoneCheck" value="${customer.customer_Phone }"></td>
				<td><input type="button" value="변경" class="btn" onclick="phoneChk();"></td>
			</tr>
			<tr><th>E-mail</th>
				<td><input type="text" placeholder="이메일을 입력해주세요" name="emailCheck" value="${customer.customer_Email }"></td>
				<td><input type="button" value="변경" class="btn" onclick="emailChk();"></td>
			</tr>
		</table>
		<div id="btn">
			<input type="submit" value="수정완료" class="btn"> <input
				type="reset" value="수정취소" class="btn">
		</div>
	</form> --%>
	
</body>
</html>