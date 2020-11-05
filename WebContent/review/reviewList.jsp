<%@page import="review.model.vo.Review"%>
<%@page import="travel.model.vo.Travel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <!-- <title>Mentor Bootstrap Template - Index</title> -->
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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
  ======================================================== --> <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <!-- <title>Mentor Bootstrap Template - Index</title> -->
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

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
  <style>
   	section {
  		border : 1px solid black;
  	}
  	/*
  	#menu {
  		position : absolute;
  		margin-top : 50px;
  		margin-left : 50px;
  	}
  	#content {
  		padding-top : 150px;
  		padding-left : 50px;
  		height : 630px;
  		margin-left : 150px;
  	}
  	<!-- -->
  	#menu nav {
  		text-align : center;
  		padding-left : 0;
  		width : 100px;
  		list-style : none;
  		background-color : lightgray;
  	}
  	#menu li:first-child{
  		color : white;
  		background-color : blue;
  	} */
  	
  </style>
</head>
<body>
 	<!-- ======= Header ======= -->
	<header id="header" class="fixed-top">
		<div class="container d-flex align-items-center">
			<h1 class="logo mr-auto">
				<a href="index.jsp">GUNDUEN</a>
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

	<!-- ======= main ========= -->
	<section id="wrap" class="col-md-12">
		<section class="main">
			<%-- <c:if  test="${ sessionScope.review ne null}"> --%>
			<div id="left">
				<nav class="nav-menu d-none d-lg-block">
					<nav id="navigator">
						<ul>
							<li>지역</li>
							<li><a href="/review/list?reviewArea=서울">서울</a></li>
							<li><a href="/review/list?reviewArea=부산">부산</a></li>
							<li><a href="/review/list?reviewArea=대구">대구</a></li>
							<li><a href="/review/list?reviewArea=인천">인천</a></li>
							<li><a href="/review/list?reviewArea=광주">광주</a></li>
							<li><a href="/review/list?reviewArea=대전">대전</a></li>
							<li><a href="/review/list?reviewArea=울산">울산</a></li>
							<li><a href="/review/list?reviewArea=세종">세종</a></li>
							<li><a href="/review/list?reviewArea=경기">경기</a></li>
							<li><a href="/review/list?reviewArea=강원">강원</a></li>
							<li><a href="/review/list?reviewArea=충남">충남</a></li>
							<li><a href="/review/list?reviewArea=충북">충북</a></li>
							<li><a href="/review/list?reviewArea=전남">전남</a></li>
							<li><a href="/review/list?reviewArea=전북">전북</a></li>
							<li><a href="/review/list?reviewArea=경남">경남</a></li>
							<li><a href="/review/list?reviewArea=경북">경북</a></li>
							<li><a href="/review/list?reviewArea=제주">제주</a></li>
					</nav>
				</nav>
			</div>
			<div id="right">
				<div id="title">후기 게시판</div>
				<c:if test="${fn:length(RList) == 0 }">
					<div>후기 게시물이 존재하지 않습니다.</div>
				</c:if>
				<c:if test="${fn:length(RList) > 0}">
					<table border="1">
						<tr>
							<th>작성자</th>
							<th>게시글</th>
							<th>지역</th>
							<th>날짜</th>
						</tr>
						<c:forEach items="${ RList }" var="review">
							<tr onclick="selnumFunc(${review.reviewNo});">
								<td>${review.customerId }</td>
								<td>${review.reviewSubject }</td>
								<td>${review.reviewArea }</td>
								<td>${review.reviewDate }</td>
							</tr>
							<script>
					 function selnumFunc(num) {
						 location.href="/review/select?reviewNo="+ num;
					 }
					</script>
						</c:forEach>
						<tr>
							<td colspan="4" align="center">${ pageNavi }
						</tr>
					</table>
				</c:if>
				${fn:length(rTravel) }
				<!-- 글쓰기 버튼  -->
				<c:if test="${fn:length(rTravel) == 0 }">
					<div></div>
				</c:if>
				<c:if test="${fn:length(rTravel) > 0}">
					<!-- https://okky.kr/article/187911 -->
					<c:if
						test="${ sessionScope.customer ne null || ( sessionScope.driver ne null)}">
						<button type="button" id="btn1"
							onclick="location.href='/review/form'">글쓰기</button>
					</c:if>
				</c:if>
			</div>
		</section>
	</section>
	<!-- End Main -->
	
	
	<!-- footer -->
    <%@include file="../include/includeFooter.jsp" %>
   
   <div id="preloader"></div>
</body></html>
