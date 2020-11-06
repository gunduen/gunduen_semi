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
  <title>고객 회원가입</title>


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
			window.open("/login/CustomerIdCheckForm.jsp","chkForm","width=500, height=400, resizable=no, scrollbars=no");
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
	<style>
		body{
			width: 100%;
			height: 100%;
		}
		section{
     	   width : 100%;
     	   	height: 900px;
     	   }
     	table tr td:nth-child(2) {
			float: left;
		}
		table td:first-child {
			font-family: 'Do Hyeon', sans-serif;
			font-size: 1.2em;
			text-align: left;
		}
		.btn-outline-primary{
			font-family: 'Do Hyeon', sans-serif;
		}
	</style>
</head>
<body>
	<header id="header" class="fixed-top">
         <div class="container d-flex align-items-center">

            <h1 class="logo mr-auto">
               <a href="/index.jsp">GUNDUEN</a>
            </h1>
            <!-- Uncomment below if you prefer to use an image logo -->
            <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
            <nav class="nav-menu d-none d-lg-block">
               <ul>
                  <li><a href="/index.jsp">Home</a></li>
                  <li><a href="/notice/list">Notice</a></li>
                  <li><a href="/driverInfoPage/DriverInfoPage.jsp">Driver</a></li>
                  <li class="active"><a href="/qna/list">Q&A</a></li>
                  <li><a href="/review/list?reviewArea=서울">Review</a></li>
                  <li></li>
               </ul>
            </nav><!-- .nav-menu -->
            
            <!-- admin 로그인시 header -->
            <c:if
            test="${sessionScope.customer.adminCheck == 1 }">
            <a href="/admin/driverList" class="get-started-btn">마이페이지</a>
            <a href="/member/logout" class="logout-btn" onclick="return warning();">로그아웃</a>
                <script>
                   function warning(){
                      var question = confirm('정말 로그아웃하시겠어요?');
                      if(question){
                         return true;
                      }else{
                      return false;
                      }
                   }
                </script>
                &nbsp;&nbsp; <img src="../assets/img/happy.png" style="height: 40px">
         </c:if>
         
         <!-- 고객/기사 로그인시 header -->
         <c:if
            test="${sessionScope.customer.adminCheck < 1 }">
            <a href="/mypage/travel?customerId=${sessionScope.customer.customer_Id }" class="get-started-btn">마이페이지</a>
            <a href="/member/logout" class="logout-btn" onclick="return warning();">로그아웃</a>
                <script>
                   function warning(){
                      var question = confirm('정말 로그아웃하시겠어요?');
                      if(question){
                         return true;
                      }else{
                      return false;
                      }
                   }
                </script>
         </c:if>
            
            <c:if test="${sessionScope.driver ne null}">
               <a href="/DriverTravel/List?driverId=${sessionScope.driver.driverId }" class="get-started-btn">마이페이지</a>
            <a href="/member/logout" class="logout-btn" onclick="return warning();">로그아웃</a>
                <script>
                   function warning(){
                      var question = confirm('정말 로그아웃하시겠어요?');
                      if(question){
                         return true;
                      }else{
                      return false;
                      }
                   }
                </script>
            </c:if>
         <c:if test="${sessionScope.driver eq null && sessionScope.customer eq null}">
            <a href="/login/Customerlogin.jsp" class="get-started-btn">고객로그인</a>
            <a href="/login/DriverLogin.jsp" class="get-started-btn">기사로그인</a>
            &nbsp;&nbsp; <img src="../assets/img/smile.png" style="height: 40px">
         </c:if>
      </div>
   </header>
   <!-- End Header -->
	<!--  -->
	<section>
		<article style="text-align: center; margin-left: 250px;">
			<form action="/customer/enroll" name = "userInfo" class="form-inline" method="post" onsubmit="return checkValue();">
				<table style="margin: 0 auto;">
				<tr>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<img src="../img/MainPageImg/gunduen.png" style="width: 250px; height: 220px;"></td>
				</tr>
				<tr>
					<td width="100">아이디</td>
				</tr>
				<tr>
					<td width="150"><input type="text" name="userId" class="form-control" onkeydown="inputIdChk();" style="width: 255px;"> &nbsp;</td>
					<td><input type="button" value="중복확인" onclick="openIdChk();" class="btn btn-outline-primary btn-lg btn-block" style="float: left; width: 90px; height: 40px; font-size: 0.9em; text-align: center;"><input type="hidden" name="idCheck" value="idUncheck"></td>

				</tr>
				<tr>
					<td width="100">비밀번호</td>
				</tr>
				<tr>
					<td width="150"><input type="password" name="userPwd" class="form-control" onkeyup="pwChk();" style="width: 255px;"></td>
					<td width="250"><span id="pw_chk" style="font-family: 'Do Hyeon', sans-serif; font-size: 1.3em; float: left;"></span></td>
				</tr>
				<tr>
					<td width="150">비밀번호 확인</td>
				</tr>
				<tr>
					<td width="150"><input type="password" name="userPwdChk" class="form-control"  onkeyup="pwChk();" style="width: 255px;"></td>
				</tr>
				<tr>
					<td width="100">이름</td>
				</tr>
				<tr>
					<td width="150"><input type="text" name="userName" class="form-control" style="width: 255px;"></td>
				</tr>
				<tr>
					<td width="150">휴대폰 번호</td>
				</tr>
				<tr>
					<td width="300">
						<select name="firstPhone"  style="width: 70px;" class="form-control">
							<option value="010">010</option>
							<option value="010">016</option>
							<option value="010">017</option>
							<option value="010">019</option>
					</select>
					- <input type="text" size="4" name="secondPhone" id="secondPhone" class="form-control" style="width: 70px;" onkeypress="javascript:checkInputNum();" onkeydown="inputPhoneChk();" maxlength="4">
					- <input type="text" size="4" name="thirdPhone" id="thirdPhone" class="form-control" style="width: 70px;" onkeypress="javascript:checkInputNum();" onkeydown="inputPhoneChk();" maxlength="4">
					</td>
					<td>
						<input type="button" value="중복확인" onclick="openPhoneChk();" class="btn btn-outline-primary btn-lg btn-block" style="width: 90px; height: 40px; font-size: 0.9em; text-align: center;">
					</td>
					<td>
						<input type="hidden" name="phoneCheck" value="phoneUncheck">
					</td>
				</tr>
				<tr>
					<td width="150">이메일</td>
				</tr>
				<tr>
					<td width="300">
						<input type="text" name="emailId" style="width: 115px;" class="form-control">@
						<select name="emailTag" onkeydown="inputEmailChk();" class="form-control">
							<option value="@naver.com">네이버</option>
							<option value="@daum.net">다음</option>
							<option value="@google.com">구글</option>
							<option value="@iei.or.kr">kh정보교육원</option>
						</select>	
					</td>
					<td>
						<input type="button" value="중복확인" onclick="openEmailChk();" class="btn btn-outline-primary btn-lg btn-block" style="width: 90px; height: 40px; font-size: 0.9em; text-align: center;"><input type="hidden" name="emailCheck" value="emailUncheck">
					</td>
				</tr>
				<tr>
					<td width="150">주민등록번호</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="userRrnFirst" id="userRrnFirst" class="form-control" maxlength="6" style="width: 120px;"> -
						<input type="password" name="userRrnSecond" id="userRrnSecond" class="form-control" maxlength="7" style="width: 120px;">
					</td>
					<td>
						<input type="button" name="chk" value="검사" onclick="RrnValCheck();" class="btn btn-outline-primary btn-lg btn-block" style="width: 90px; height: 40px; font-size: 0.9em; text-align: center;">
					</td>
					<td>
						<input type="hidden" id="RrnCheck" name="RrnCheck" value="RrnUncheck">
					</td>
				</tr>
				<tr>
					<td>
						<span></span>
					</td>
				</tr>
				<tr>
					<td colspan="3"><br><input type="submit" class="btn btn-success btn-lg" value="회원가입하기" style="width: 400px;"></td>
				</tr>
			
				</table>
			</form>
		</article>
	</section>
	<div id="preloader"></div>
</body>
</html>