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
<title>메세지 디테일</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<style>
	#detail-top {
		padding-bottom : 0px;
	}
	#detail-bottom {
		padding-top : 0px;
	}
	#title {
		font-family : 'Do Hyeon', sans-serif; font-size : 1.2em;
	}
	#detail-bottom {
		height : 200px;
	}
	#return {
		padding : 0px;
	}
	#btn1 {
		border : 1px solid white;
		float : right;
	}
	.get-started-btn {
		border : 1px solid white;
	}
</style>
<script>
	function delfunc(id) {
		var con = confirm( '정말로 삭제하시겠습니까?');
		if (con){
			location.href="/message/delete?messageNo="+ ${detail.message_No} + "&userId=" + id;
		}
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
					<li><a href="/driver/autoMyinfo?area=서울">Driver</a></li>
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
				<div id="title">${ detail.message_Subject }</div>
				<div id="subtext">보낸이 : ${ detail.sender } / 받는이 : ${detail.receiver} 
			/ 보낸 날짜 : ${ detail.message_Date }</div>
			</section>
			<hr>
			<section id="detail-bottom">
			<div>${ detail.message_Contents }</div>
			</section>
			<section id="return">
				<a href="/message/receiverList?receiver=${sessionScope.customer.customer_Id} " class="get-started-btn-gray">게시판으로</a>
				<!-- 고객 로그인 -->
				<c:if test="${sessionScope.customer ne null && sessionScope.driver eq null}">
					<!-- 받은 쪽 -->
					<c:if test="${sessionScope.customer.customer_Id eq detail.receiver}">
							<input type="button" value="답장하기" class="get-started-btn" onclick="location.href='/message/resendForm?receiver=${sessionScope.customer.customer_Id}&sender=${detail.sender}'" />
							<input type="button" value="삭제" id="btn1" class="logout-btn" onclick="delfunc('${sessionScope.customer.customer_Id}');" />
					</c:if>
					
					
				</c:if>
				
				<!-- 기사 로그인 -->
				<c:if test="${sessionScope.customer eq null && sessionScope.driver ne null}">
					<!-- 받은 쪽 -->
					<c:if test="${sessionScope.driver.driverId eq detail.receiver}">
							<input type="button" value="답장하기" class="get-started-btn" onclick="location.href='/message/resendForm?receiver=${sessionScope.customer.customer_Id}&sender=${detail.sender}'" />
							<input type="button" value="삭제" id="btn1" class="logout-btn" onclick="delfunc('${sessionScope.driver.driverId}');" />
					</c:if>
					
				</c:if>
				
			</section>
		</section>
	</section>

		<!-- footer -->
    <%@include file="../include/includeFooter.jsp" %>
   
   <div id="preloader"></div>
</body>
</html>
