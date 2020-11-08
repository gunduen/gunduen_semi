<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ page import="customer.model.vo.Customer" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<title>회원 정보 수정</title>
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
	<style>
		#wrap {
			margin:0 auto;
			text-align : center;
		}
		#formwrap {
			padding-top : 0px;
		}
		.get-started-btn {
			border : 1px solid white;
			margin-left : 0px;
		}
		#btn{
			padding-right:100px;
			text-align : center;
		}
	</style>
</head>
<body>
	
	<!--  -->
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
                  <li><a href="/qna/list">Q&A</a></li>
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
   
   <section>
		<article style="margin-left: 200px;">
			<form action="/customer/update" name = "userInfo" class="form-inline" method="post" onsubmit="return checkValue();">
				<table style="margin: 0 auto; margin-top:50px;">
				
				<tr>
					<td width="100">아이디</td>
				</tr>
				<tr>
					<td width="150"><input type="text" name="userId" class="form-control" value="${customer.customer_Id }" style="width: 255px;" readonly> &nbsp;</td>
				</tr>
				<tr>
					<td width="100">비밀번호</td>
				</tr>
				<tr>
					<td width="150"><input type="password" name="userPwd" class="form-control" onkeyup="pwChk();"  value="${customer.customer_Pwd }" style="width: 255px;"></td>
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
					<td width="150"><input type="text" name="userName" class="form-control"  value="${customer.customer_Name }" style="width: 255px;"></td>
				</tr>
				<tr>
					<td width="150">휴대폰 번호</td>
				</tr>
				<tr>
				<c:set var = "string1" value="${customer.customer_Phone }" />
				<c:set var = "secondNumber" value="${fn:substring(string1, 4, 8) }" />
				<c:set var = "thirdNumber" value="${fn:substring(string1, 9, 13) }" />
					<td width="300">
						<select name="firstPhone"  style="width: 70px;" class="form-control">
							<option value="010">010</option>
							<option value="010">016</option>
							<option value="010">017</option>
							<option value="010">019</option>
					</select>
					- <input type="text" size="4" name="secondPhone" id="secondPhone" class="form-control" value="${secondNumber }" style="width: 70px;" onkeypress="javascript:checkInputNum();" onkeydown="inputPhoneChk();" maxlength="4">
					- <input type="text" size="4" name="thirdPhone" id="thirdPhone" class="form-control" value="${ thirdNumber}" style="width: 70px;" onkeypress="javascript:checkInputNum();" onkeydown="inputPhoneChk();" maxlength="4">
					</td>
					<td>
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
						<input type="text" name="emailId" style="width: 115px;" class="form-control" value="${fn:substringBefore( customer.customer_Email, '@') }">@
						<select name="emailTag" onkeydown="inputEmailChk();" class="form-control">
							<option value="@naver.com">네이버</option>
							<option value="@daum.net">다음</option>
							<option value="@google.com">구글</option>
							<option value="@iei.or.kr">kh정보교육원</option>
						</select>	
					</td>
					<td>
					</td>
				</tr>
				<tr>
					<td width="150">주민등록번호</td>
				</tr>
				<tr>
					<td>
						<input type="text" name="userRrnFirst" id="userRrnFirst" class="form-control" maxlength="6" style="width: 120px;"  value="${fn:substringBefore( customer.customer_Rrn, '-') }"> -
						<input type="password" name="userRrnSecond" id="userRrnSecond" class="form-control" maxlength="7" style="width: 120px;" value="${fn:substringAfter( customer.customer_Rrn, '-') }">
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
					<td colspan="3" id="btn"><br><input type="submit" class="get-started-btn" value="정보수정"> <input type="reset" class="get-started-btn" value="취소"></td>
				</tr>
			
				</table>
			</form>
		</article>
	</section>
   
<%--   <section id="wrap" class="d-flex justify-content-center align-items-center" >
		
 		<section id="formwrap" >
		<a href="#" target="_blank"><img src="../img/MainPageImg/gunduen.png" style="width: 150px; height: 150px;" id="logo"></a>
		<form action="/customer/update" name = "userInfo" id="form" method="post" onsubmit="return checkValue();">
		<table>
		<tr>
		<td>ID : </td><td><input type="text" name="userId" value="${customer.customer_Id }" readonly> </td>
		</tr>
		<tr>
		<td>PW : </td><td><input type="password" name="userPwd" onkeyup="pwChk();" value="${customer.customer_Pwd }"><span id="pw_chk"></span><br></td>
		</tr>
		<tr>
		<td>PW확인 : </td><td><input type="password" name="userPwdChk" onkeyup="pwChk();"><br></td>
		</tr>
		<tr>
		<td>이름 : </td><td><input type="text" name="userName" value="${customer.customer_Name }" readonly><br></td>
		</tr>
		<tr>
		<td>휴대폰 번호  : </td>
		<td><select name="firstPhone">
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
		</td></tr>
		<tr>
		<td>이메일 주소 : </td><td><input type="text" name="emailId" value="${fn:substringBefore( customer.customer_Email, '@') }">@
		<select name="emailTag" onkeydown="inputEmailChk();">
			<option value="@naver.com">네이버</option>
			<option value="@daum.net">다음</option>
			<option value="@google.com">구글</option>
			<option value="@iei.or.kr">kh정보교육원</option>
		</select></td>
		<td><input type="button" value="중복확인" onclick="openEmailChk();"><input type="hidden" name="emailCheck" value="emailUncheck"><br>
		</td></tr>
		<tr>
		<td>주민등록번호 : </td><td><input type="text" name="userRrnFirst" id="userRrnFirst" maxlength="6" value="${fn:substringAfter( customer.customer_Rrn, '-') }">-
		<input type="password" name="userRrnSecond" id="userRrnSecond" maxlength="7" value="${fn:substringBefore( customer.customer_Rrn, '-') }"><input type="button" name="chk" value="검사" onclick="RrnValCheck();">
		<input type="hidden" id="RrnCheck" name="RrnCheck" value="RrnUncheck"><br>
		</tr>
		<input type="submit" value="회원정보수정">
		</table>
		</form>
		</section>
	</section> --%>
	
	<div id="preloader"></div>
	<script src="assets/js/main.js"></script>
	
</body>
</html>