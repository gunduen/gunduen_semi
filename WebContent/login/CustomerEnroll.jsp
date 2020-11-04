<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <!-- <title>Mentor Bootstrap Template - Index</title> -->
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../assets/img/favicon.png" rel="icon">
  <link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="../assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="../assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="../assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="../assets/css/style.css" rel="stylesheet">
  
   <!-- Vendor JS Files -->
   <script src="../assets/vendor/jquery/jquery.min.js"></script>
   <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
   <script src="../assets/vendor/jquery.easing/jquery.easing.min.js"></script>
   <script src="../assets/vendor/php-email-form/validate.js"></script>
   <script src="../assets/vendor/waypoints/jquery.waypoints.min.js"></script>
   <script src="../assets/vendor/counterup/counterup.min.js"></script>
   <script src="../assets/vendor/owl.carousel/owl.carousel.min.js"></script>
   <script src="../assets/vendor/aos/aos.js"></script>
   
   <!-- Template Main JS File -->
   <script src="../assets/js/main.js"></script>
   
   <!-- Font -->
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
<!--keep -->
        .member {
                 font-size: 30px;
              color: black;
              margin: 0 auto;
              text-align:left;
              display: inline-block;
              font-family: "맑은 고딕";
           }
        
           article {
           width : 100%;
           text-align: center;
           
           }
           section{
           width : 100%;
              height: 800px;
           }
           
        
        body {
           
            width: 100%;
        }
        article h1, h4 {
            text-align: center;
            margin: 10px;
        }
        article form {
            text-align: center;
        }
        a:hover{
           color:#8aceff !important;
           font-weight: bold;
        }
</style>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
			if(!form.userId.value){
				alert('아이디를 입력해주세요.');
				return false;
			}
			if(form.idCheck.value == "idUncheck"){
				alert('아이디 중복체크란을 클릭해주세요.');
				return false;
			}
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
			if(form.phoneCheck.value=="phoneUncheck"){
				alert('휴대폰 번호 중복체크를 해주세요.');	
				return false;
			}
			if(!form.emailId.value){
				alert('이메일 아이디를 입력해주세요.');
				return false;
			}
			if(form.emailCheck.value=="emailUncheck"){
				alert('이메일 중복확인을 해주세요.');
				return false;
			}
			if(!form.userRrnFirst.value || !form.userRrnSecond){
				alert('주민번호를 정확히 입력해주세요.');
				return false;
			}
			if(form.RrnCheck.value=="RrnUncheck"){
				alert('주민번호체크란을 클릭해주세요.');
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
	<form action="/customer/enroll" name = "userInfo" method="post" onsubmit="return checkValue();">
	ID : <input type="text" name="userId" onkeydown="inputIdChk();"> <input type="button" value="중복확인" onclick="openIdChk();">
	<input type="hidden" name="idCheck" value="idUncheck"><br>
	PW : <input type="password" name="userPwd" onkeyup="pwChk();"><span id="pw_chk"></span><br>
	PW확인 : <input type="password" name="userPwdChk" onkeyup="pwChk();"><br> 
	이름 : <input type="text" name="userName"><br>
	휴대폰 번호  : <select name="firstPhone">
		<option value="010">010</option>
		<option value="010">016</option>
		<option value="010">017</option>
		<option value="010">019</option>
	</select>
	-<input type="text" size="4" name="secondPhone" id="secondPhone" onkeypress="javascript:checkInputNum();" onkeydown="inputPhoneChk();" maxlength="4">
	-<input type="text" size="4" name="thirdPhone" id="thirdPhone" onkeypress="javascript:checkInputNum();" onkeydown="inputPhoneChk();" maxlength="4">
	<input type="button" value="중복확인" onclick="openPhoneChk();"><input type="hidden" name="phoneCheck" value="phoneUncheck"><br>
	이메일 주소 : <input type="text" name="emailId">@
	<select name="emailTag" onkeydown="inputEmailChk();">
		<option value="@naver.com">네이버</option>
		<option value="@daum.net">다음</option>
		<option value="@google.com">구글</option>
		<option value="@iei.or.kr">kh정보교육원</option>
	</select><input type="button" value="중복확인" onclick="openEmailChk();"><input type="hidden" name="emailCheck" value="emailUncheck"><br>
	주민등록번호 : <input type="text" name="userRrnFirst" id="userRrnFirst" maxlength="6">-
	<input type="password" name="userRrnSecond" id="userRrnSecond" maxlength="7"><input type="button" name="chk" value="검사" onclick="RrnValCheck();">
	<input type="hidden" id="RrnCheck" name="RrnCheck" value="RrnUncheck"><br>
	<input type="submit" value="회원가입하기">
	</form>
	
	<script src="assets/js/main.js"></script>
</body>
</html>