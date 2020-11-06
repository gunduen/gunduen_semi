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
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Mentor - v2.1.0
  * Template URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
<title>쪽지 보내기</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
 #title {
		font-family : 'Do Hyeon', sans-serif; font-size : 1.2em;
	}
	.get-started-btn {
		border : 1px solid white;
		float : right;
	}
</style>
<script>
	function checkValue(){
		var mInfo = document.sendMessageForm;
		
		if(mInfo.title.value==""){
			alert('제목을 입력해주세요');
			return false;
		}
		if(mInfo.userId.value==""){
			alert('쪽지를 보낼 아이디를 입력해주세요.');
			return false;
		}
		if(mInfo.idCheck.value=="idUncheck"){
			alert('보낼 아이디가 있는지 확인해주세요.');
			return false;
		}
		if (mInfo.contents.value =="") {
			alert('내용을 입력해주세요.');
			return false;
		}
	}
	//아이디 중복확인 클릭시 창을 띄우는 fucntion
	function openIdChk() {
		window.name = "parentForm";
		window.open("/message/IDCheckForm.jsp", "chkForm","width=500, height=300, resizable=no, scrollbars=no");
	}
	//사용하기 버튼 누르기 전까지는 계속 idUncheck
	function inputIdChk(){
		document.sendMessageForm.idCheck.value="idUncheck";
	}
</script>
</head>
<body>
	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
		<div class="container d-flex align-items-center">
			<h1 class="logo mr-auto">
				<a href="/index.jsp">GUNDUEN</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="/notice/list">Notice</a></li>
					<li><a href="/driverInfoPage/DriverInfoPage.jsp">Driver</a></li>
					<li><a href="/qna/list">Q&A</a></li>
					<li><a href="/review/list?reviewArea=서울">Review</a></li>
					<li></li>
				</ul>
			</nav>
			<!-- .nav-menu -->

			<!-- admin 로그인시 header -->
			<c:if test="${sessionScope.customer.adminCheck == 1 }">
				<a href="/admin/driverList" class="get-started-btn">마이페이지</a>
				<a href="/member/logout" class="logout-btn"
					onclick="return warning();">로그아웃</a>
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

			<!-- 고객/기사 로그인시 header -->
			<c:if test="${sessionScope.customer.adminCheck < 1 }">
				<a
					href="/mypage/travel?customerId=${sessionScope.customer.customer_Id }"
					class="get-started-btn">마이페이지</a>
				<a href="/member/logout" class="logout-btn"
					onclick="return warning();">로그아웃</a>
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
				<a
					href="DriverTravel/List?driverId=${sessionScope.driver.driverId }"
					class="get-started-btn">마이페이지</a>
				<a href="/member/logout" class="logout-btn"
					onclick="return warning();">로그아웃</a>
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

			&nbsp;&nbsp; <img src="../assets/img/happy.png" style="height: 40px">

		</div>
	</header>
	<!-- End Header -->
	
	<!--======= Main ======== -->
	<section id="wrap"  class="container-fluid" style="padding-left:150px; padding-right:150px;">
		<section class="main"class="row">
			<section id="detail-top">
		<article class="article">
		<div id="title">새 쪽지</div>
				<hr>
			<form action="/message/insert" name ="sendMessageForm" method="post" onsubmit="return checkValue();">
				
				<div class="message-title">
					<input type="text" id="subject" style="width : 100%;" placeholder="쪽지 제목" id="title" name="title">
				</div>
				<div class="message-title">
					<input type="text" id="receiver"style="width : 250px;" placeholder="받는 사람" id="userId" name="userId"><input type="button" class="get-started-btn" value="받는이찾기 " onclick="openIdChk();">
					<input type="hidden" name="idCheck" value="idUncheck">
				</div>
				<div class="message contents">
					<br>
					<textarea id="contents" style="width: 100%; height: 200px; resize:none; color:gray;"
						name="contents" id="contents"></textarea>
				</div>
				<br>
				<div class="message send">
					<input type="submit" class="get-started-btn" value="쪽지전송" id="btn2">
				</div>
			</form>
		</article>
			</section>
		</section>
	</section>

		<!-- footer -->
    <%@include file="../include/includeFooter.jsp" %>
   
   <div id="preloader"></div>
</body>
</html>