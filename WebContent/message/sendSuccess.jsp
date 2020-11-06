<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="review.model.vo.Review"%>
<%@page import="comment.model.vo.Comment"%>
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
<title>전송 성공</title>
<style>
	#main {
		height : 400px; padding-top : 200px;
	}
	.title {
		text-align : center;
	}
</style>
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
					<li class="active"><a href="index.jsp">Home</a></li>
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
	<section id="main">
	<div class="title">쪽지 전송 성공 </div>
	<div class="title" >
	<a href="/message/receiverList?receiver=${ sessionScope.customer.customer_Id }">받은 쪽지함으로 이동</a>
	</div>
	</section>


	<!-- footer -->
    <%@include file="../include/includeFooter.jsp" %>
   
   <div id="preloader"></div>
</body>
</html>