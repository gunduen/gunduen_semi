<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
   
   <!-- Font -->
  
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//숫자만 입력되게 하는 function
	function checkInputNum(){
    	if ((event.keyCode < 48) || (event.keyCode > 57)){
       	 	event.returnValue = false;
    	}
	}

	function checkSize(inputImage){
		if(inputImage.files && inputImage.files[0].size> (3*1024*1024)){
		alert('3MB를 초과합니다. 다시 확인해주세요');
		inputImage.value=null;
		}
	}
 
	//주민등록번호가 올바른지에 대한 체크
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
	//요소값을 입력하지않고 회원가입하기 버튼을 누르면 넘어가지 못하게하는 function
	function checkValue(){
		var driverInfo = document.driverEnrollForm;
		
		if(!driverInfo.userId.value){
			alert('아아디를 입력해주세요.');
			return false;
		}
		if(driverInfo.idCheck.value == "idUncheck"){
			alert('아이디 중복체크란을 클릭해주세요.');
			return false;
		}
		if(!driverInfo.userPwd.value){
			alert('비밀번호를 입력해주세요.');
			return false;
		}
		if(driverInfo.userPwd.value != driverInfo.userPwdChk.value){
			alert('비밀번호가 다릅니다. 확인해주세요');
			return false;
		}
		if(!driverInfo.userName.value){
			alert('이름을 입력해주세요.');
			return false;
		}
		if(!driverInfo.secondPhone.value || !driverInfo.thirdPhone.value){
			alert('전화번호를 전부 입력해주세요.');
			return false;
		}
		if(driverInfo.phoneCheck.value == "phoneUncheck"){
			alert('휴대폰번호 중복체크를 해주세요.');
			return false;
		}
		
		if(!driverInfo.emailId.value){
			alert('이메일 아이디를 입력해주세요.');
			return false;
		}
		if(driverInfo.emailCheck.value=="emailUncheck"){
			alert('이메일 중복확인을 해주세요.');
			return false;
		}
		
		if(!driverInfo.homeNum.value){
			alert('집 주소를 등록해주세요.');
			return false;
		}
		if(!driverInfo.userRrnFirst.value || !driverInfo.userRrnSecond.value){
			alert('주민번호를 전부 입력해주세요.');
			return false;
		}
		if(driverInfo.RrnCheck.value == "RrnUncheck"){
			alert('주민번호 체크란을 클릭해주세요.');
			return false;
		}
		if(!driverInfo.driverInfo.value){
			alert('게시판에 올라갈 자기소개를 적어주세요.');
			return false;
		}
		
		
		<!--LicenseFile,BLicenseFile ,DriverInfoFile  -->
		if(!driverInfo.LicenseFile.value){
			alert('택시운전자격증 사진을 첨부해주세요.');
			return false;
		}
		if(!driverInfo.BLicenseFile.value){
			alert('사업자등록증 사진을 첨부해주세요.');
			return false;
		}
		if(!driverInfo.DriverInfoFile.value){
			alert('자기소개용 사진을 첨부해주세요.');
			return false;
		}
		
	}
	//아이디 중복확인 클릭시 창을 띄우는 fucntion
	function openIdChk(){
		window.name = "parentForm";
		window.open("/login/DriverIdCheckForm.jsp", "chkForm","width=500, height=300, resizable=no, scrollbars=no");
	}
	
	function openPhoneChk(){
		window.name = "parentForm";
		window.open("/login/DriverPhoneCheckForm.jsp", "chkForm", "width=500, height=300, resizable=no, scrollbars=no");
	}
	
	function openEmailChk(){
		window.name = "parentForm";
		window.open("/login/DriverEmailCheckForm.jsp", "chkForm", "width=500, height=300, resizable=no scrollbars=no");
	}
	
	//사용하기 버튼 누르기 전까지는 계속 idUncheck
	function inputIdChk(){
		document.driverEnrollForm.idCheck.value="idUncheck";
	}
	function inputPhoneChk(){
		document.driverEnrollForm.phoneCheck.value="phoneUncheck";
	}
	function inputEmailChk(){
		document.driverEnrollForm.emailCheck.value="emailUncheck";
	}
	//주소값 API
	var roadAddress;
	var homeNum;
	function DaumPostCode(){
		 new daum.Postcode({
	            oncomplete: function(data) {
	            	roadAddress = data.address;
	            	homeNum = data.zonecode;	
	            	$("#homeNum").val(homeNum);
	            	$("#roadAddress").val(roadAddress);
	            }
	        }).open();
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
	header{
		width: 100%;
		height: 7%;
	}
	section{
		width: 100%;
		height: 1300px;
	}
	table td:first-child {
			font-family: 'Do Hyeon', sans-serif;
			font-size: 1.2em;
			text-align: left;
		}
	table tr td:nth-child(2) {
		float: left;
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
   <!-- End Header --><br><br><br>
	<section>
		<article style="text-align: center; margin-left: 250px;">
			<form action="/driver/enroll" name="driverEnrollForm" class="form-inline" method="post" enctype="multipart/form-data" onsubmit="return checkValue();">
				<table style="margin : 0 auto;">
				<tr>
					<td width="100">아이디</td>
				</tr>
				<tr>
				<td>
					<div class="form-group">
						<div class="input-group">
							<input type="text" name="userId" class="form-control" onkeydown="inputIdChk();" style="width: 255px;">
						</div>
						<div class="input-group">
							<input type="button" value="중복확인" onclick="openIdChk();" class="btn btn-outline-primary btn-lg btn-block" style="float: left; width: 90px; height: 40px; font-size: 0.9em; text-align: center; margin-left: 5px;"><input type="hidden" name="idCheck" value="idUncheck">
						</div>
					</div>
				</td>
				</tr>
				<tr>
					<td width="100">비밀번호</td>				
				</tr>
				<tr>
					<td width="150"><input type="password" class="form-control" style="width: 255px;" name="userPwd" onkeyup="pwChk();"></td>
					<td width="250"><span id="pw_chk" style="font-family: 'Do Hyeon', sans-serif; font-size: 1.3em; float: left;"></span></td>
				</tr>
				<tr>
					<td width="150">비밀번호 확인</td>
				</tr>
				<tr>
					<td width="150"><input type="password" class="form-control" name="userPwdChk" onkeyup="pwChk();" style="width: 255px;"></td>
				</tr>
				
				<tr>
					<td width="100">이름</td>
				</tr>
				<tr>
					<td width="150"><input type="text" class="form-control" name="userName" style="width: 255px;"></td>
				</tr>
				<tr>
					<td width="150">휴대폰 번호</td>
				</tr>
				<tr>
					<td width="300">
						<div class="form-group">
							<div class="input-group">
								<select name="firstPhone" style="width: 80px;" class="form-control">
							<option value="010">010</option>
							<option value="010">016</option>
							<option value="010">017</option>
							<option value="010">019</option>
						</select>-<input type="text" size="4" name="secondPhone" class="form-control" style="width: 80px;" id="secondPhone" onkeypress="javascript:checkInputNum();" onkeydown="inputPhoneChk();" maxlength="4">-<input type="text" size="4" name="thirdPhone" class="form-control" style="width: 80px;" id="thirdPhone" onkeypress="javascript:checkInputNum();" onkeydown="inputPhoneChk();" maxlength="4">
							</div>
							<div class="input-group">
								<input type="button" value="중복확인" onclick="openPhoneChk();"class="btn btn-outline-primary btn-lg btn-block" style="width: 90px; height: 40px; font-size: 0.9em; text-align: center; margin-left: 5px;"><input type="hidden" name="phoneCheck" value="phoneUncheck">
							</div>
						</div>
						
					</td>
					<td>
						
					</td>
				</tr>
				<tr>
					<td>이메일</td>
				</tr>
				<tr>
					<td width="300">
						<div class="form-group">
							<div class="input-group">
								<input type="text" name="emailId" style="width: 115px;" class="form-control">
							</div>@
							<div class="input-group">
								<select name="emailTag" onkeydown="inputEmailChk();" class="form-control">
									<option value="@naver.com">네이버</option>
									<option value="@daum.net">다음</option>
									<option value="@google.com">구글</option>
									<option value="@iei.or.kr">kh정보교육원</option>
								</select>
							</div>
							<div class="input-group">
								<input type="button" value="중복확인" onclick="openEmailChk();" class="btn btn-outline-primary btn-md btn-block" style="width: 90px; height: 40px; font-size: 0.9em; margin-left:5px; text-align: center;"><input type="hidden" name="emailCheck" value="emailUncheck">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td width="150">자택 주소</td>
				</tr>
				<tr>
					<td width="150">
						<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control" id="homeNum" name ="homeNum" placeholder="우편번호" style="width: 120px;">
							</div>
							<input type="button" onclick="DaumPostCode()" style="width: 130px; font-size: 0.9em; text-align: center; margin-left: 10px;"class="btn btn-outline-primary btn-lg btn-block" value="우편번호 찾기">
							
						</div>
						
					</td>
				</tr>
				<tr>
					<td width="150">
						<div class="form-group">
							<div class="input-group">
								<input type="text" id="roadAddress" class="form-control" name="roadAddress"  placeholder="도로명주소" style="width: 255px;">
							</div>
							<div class="input-group">
								<input type="text" id="dAddress" class="form-control" name="dAddress" placeholder="상세주소" style="width: 255px;"> 
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td width="150">담당 지역</td>
				</tr>
				<tr>
					<td>
					<select name="area" class="form-control" style="width: 100px;">
						<option value="서울">서울</option>
						<option value="부산">부산</option>
						<option value="대구">대구</option>
						<option value="인천">인천</option>
						<option value="광주">광주</option>
						<option value="대전">대전</option>
						<option value="울산">울산</option>
						<option value="세종">세종</option>
						<option value="경기">경기</option>
						<option value="강원">강원</option>
						<option value="충남">충남</option>
						<option value="전북">전북</option>
						<option value="전남">전남</option>
						<option value="경북">경북</option>
						<option value="경남">경남</option>
						<option value="제주">제주</option>
					</select>
					</td>
				</tr>
				<tr>
					<td width="150">
						주민등록번호
					</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<div class="input-group">
								<input type="text" id= "userRrnFirst" class="form-control" name="userRrnFirst" maxlength="6" style="width: 120px;">
							</div>
							-
							<div class="input-group">
								<input type="password" id="userRrnSecond" class="form-control" name="userRrnSecond" maxlength="7" style="width: 120px;">
							</div>
							<div class="input-group">
								<input type="button" name="chk" class="btn btn-outline-primary btn-md btn-block" style="margin-left: 5px;"  value="검사" onclick="RrnValCheck();">
								<input type="hidden"  id="RrnCheck" name="RrnCheck" value="RrnUncheck">
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td width="150">자기소개</td>
				</tr>
				<tr>
					<td>
						<div class="form-group">
							<div class="input-group">
								<textarea rows="5" cols="30" name="driverInfo"  class="form-control" placeholder="간단한 자기소개를 입력해주세요" style="resize: none;"></textarea>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td>택시 운전 자격증(3MB 제한)</td>
				</tr>
				<tr>
					<td><input type="file" name="LicenseFile" onchange="checkSize(this)"></td>
				</tr>
				<tr>
					<td>사업자등록증 자격증(3MB 제한)</td>
				</tr>
				<tr>
					<td><input type="file" name="BLicenseFile" onchange="checkSize(this)"></td>
				</tr><tr>
					<td> 소개용 사진(3MB 제한)</td>
				</tr>
				<tr>
					<td><input type="file" name="DriverInfoFile" onchange="checkSize(this)"></td>
				</tr>
				<tr>
					<td><input type="submit" value="회원가입하기" class="btn btn-success btn-lg" style="width: 100%;"></td>
				</tr>
				
	        
	
	</table>
	</form>
		</article>
	</section>
	<div id="preloader"></div>
</body>
</html>