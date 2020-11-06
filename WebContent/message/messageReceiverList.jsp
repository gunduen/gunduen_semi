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
<title>받는 쪽지함</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
	<style>
		#main-top {
			padding-bottom:0px;
		}
		.title {width : 50%; float:left; font-family : 'Do Hyeon', sans-serif; font-size : 1.2em;}
		.side { width : 250px;float: right;}
		#main-top ul {
		width : 100%;
			list-style : none;
			padding-left : 0px;
			margin-bottom:0px;
		}
		#main-top ul li {width : 48%; float : left; margin-right : 0px; text-align : center;}
		#main-bottom {
			height L 500px;
			padding-top : 0px;
		}
		.get-started-btn {
			border : 1px solid white;
			float:right;
		}
		.table-hover tbody tr:hover td {
  		background-color : #a3d4f7;
  		color : white;
  	}
  	#main-btn {
  		padding-top : 0px;
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


<!--  ======= Main ========= -->
<section id="wrap"  class="container-fluid" style="padding-left:150px; padding-right:150px;">
<!-- 고객 -->

<c:if test="${sessionScope.customer ne null && sessionScope.driver eq null }">
<section id="main-top">
		<div class="title">[${ sessionScope.customer.customer_Id }]님의 쪽지함</div>
		<div class="side">
			<ul>
				<li><a href="/message/receiverList?receiver=${ sessionScope.customer.customer_Id }">받은
						쪽지함</a></li>
				<li><a href="/message/senderList?sender=${ sessionScope.customer.customer_Id }">보낸
						쪽지함</a></li>
			</ul>
		</div>
</section>
</c:if>
<!-- 기사 -->
<c:if test="${sessionScope.customer eq null && sessionScope.driver ne null}">
<section class="main-top">
		<div class="title">[${ sessionScope.driver.driverId }]님의 쪽지함입니다.</div>
		<div class="side">
			<ul>
				<li><a href="/message/receiverList?receiver=${ sessionScope.driver.driverId }">받은
						쪽지함</a></li>
				<li><a href="/message/senderList?sender=${ sessionScope.driver.driverId }">보낸
						쪽지함</a></li>
			</ul>
		</div>
</section>
</c:if>
<hr>
<section id="main-bottom">
	<table class="table table-hover">
		<thead>
			<th>보낸 이</th>
			<th>제목</th>
			<th>보낸 날짜</th>
			<th>받는 이</th>
		</thead>
		<tbody>
		<c:forEach items="${ receiverList }" var="Rmessage" varStatus="index">
			<tr onClick="location.href='/message/select?messageNo=${Rmessage.message_No}'">
				<td>${ Rmessage.sender }</td>
				<td>${ Rmessage.message_Subject}</td>
				<td>${ Rmessage.message_Date }</td>
				<td>${ Rmessage.receiver }</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="5" align="center">${ pageNavi }
		</tr>
		</tbody>
	</table>
</section>
<section id="main-btn">
	<a href="/message/sendform"><input type="submit" value="쪽지 쓰기" class="get-started-btn"></a>
</section>
</section>


	<!-- footer -->
    <%@include file="../include/includeFooter.jsp" %>
   
   <div id="preloader"></div>
</body>
</html>