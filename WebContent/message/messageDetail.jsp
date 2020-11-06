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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
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
</style>
<script>
	function delfunc() {
		var con = confirm( "정말로 삭제하시겠습니까?");
		if (con){location.href="/message/delete?messageNo="+ ${detail.message_No}};
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
	
	<!--======= Main ======== -->
	<section id="wrap"  class="container-fluid" style="padding-left:150px; padding-right:150px;">
		<section class="main"class="row">
			<section id="detail-top">
				<div id="title">${ detail.message_Subject }</div>
				<div id="subtext">보낸이 ${ detail.sender } / 받는이 ${detail.receiver} / ${detail.message_No}
			/ 보낸 날짜 ${ detail.message_Date }</div>
			</section>
			<hr>
			<section id="detail-bottom">
			<div>${ detail.message_Contents }</div>
			</section>
			<section id="return">
				<a href="/message/receiverList?receiver=${sessionScope.customer.customer_Id} " class="get-started-btn-gray">게시판으로</a>
				<c:if test="${sessionScope.customer ne null && sessionScope.driver eq null}">
					<!-- 받은 쪽 -->
					<c:if test="${sessionScope.customer.customer_Id eq detail.receiver}">
							<button type="button" id="btn1" class="logout-btn" onclick="delfunc();">삭제</button>
					</c:if>
					
					
				</c:if>
				<c:if test="${sessionScope.customer eq null && sessionScope.driver ne null}">
					<!-- 받은 쪽 -->
					<c:if test="${sessionScope.driver.driverId eq detail.receiver}">
							<button type="button" id="btn1" class="logout-btn" onClick="delfunc();">삭제</button>
							
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

<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
	/* div {
		border: 1px solid none;
		box-sizing: border-box;
	}

	body {
		width: 1800px;
		height: 1080px;
	}
	
	header {
		width: 100%;
		height: 10%;
		border: 1px solid black;
		text-align: center;
		box-sizing: border-box;
	}
	
	section {
		width: 100%;
		height: 50%;
		border: 1px solid black;
		box-sizing: border-box;
		text-align: center;
	}
	
	nav {
		border: 1px solid black;
		height: 50px;
		background-color: skyblue;
	}
	
	nav a {
		color: white;
		font-size: 1.2em;
		text-decoration: none;
	}
	
	#menu {
		margin: 0;
		padding: 0;
		height: 100%;
		overflow: hidden;
		border: 1px solid black;
		width: 1600px;
		margin: 0 auto;
	}
	
	#menu li {
		width: 25%;
		height: 100%;
		float: left;
		text-align: center;
		list-style: none;
		line-height: 50px;
		vertical-align: middle;
	}
	
	#menu li:hover {
		background-color: steelblue;
	}
	
	.article:first-of-type {
		float: left;
		background-color: lightblue;
		height: 90%;
	}
	
	.article:last-of-type {
		width: 80%;
		float: left;
		margin: 20px 50px;
		text-align: left;
	}
	
	.side ul {
		padding: 0 30px;
	}
	
	.side ul li {
		list-style: none;
		height: 40px;
		font-size: 1.2em;
		margin: 15% 0;
	}
	
	.side ul li>a {
		color: white;
	}
	
	.side ul li>a:hover {
		color: blue;
		text-decoration: none;
	}
	
	.btn1 {
		background-color: cornflowerblue;
		border: none;
		color: white;
		padding: 0 20px;
		text-align: center;
	}
	
	#title {
		font-size: 2em;
		text-align: left;
	}
	
	.send {
		width: 1030px;
		text-align: right;
	}
	
	.contents {
		height: 230px;
		font-size: 1.2em;
	}
	
	#btn2, #btn3 {
		background-color: cornflowerblue;
		border: none;
		color: white;
		padding: 0 20px;
		text-align: center;
	}
	
	footer {
		width: 100%;
		height: 10%;
		border: 1px solid black;
		text-align: center;
		line-height: 100px;
	} */
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
	
	<!-- ====== Main ====== -->
	<section>
		<nav>
			<ul id="menu">
				<li><a href="/noticeList.html">공지사항</a></li>
				<li><a href="/driverList.html">기사소개</a></li>
				<li><a href="/reviewList.html">사용자 후기</a></li>
				<li><a href="/qnaList.html">Q&A</a></li>
			</ul>
		</nav>
		<section class="article ">
			<div class="side">
				<ul>
					<li><a href="messageForm.html"><input type="submit"
							value="쪽지 쓰기" class="btn1"></a></li>
					<li><a href="#">받은 쪽지함</a></li>
					<li><a href="#">보낸 쪽지함</a></li>
				</ul>
			</div>
		</section>
		<section class="article">
			<h2>제목 : ${ detail.message_Subject }</h2>
			<h6>글번호 : ${ detail.message_No } / 보낸 이 : ${ detail.sender } / 받는 이 : ${detail.receiver}
				작성일 : ${ detail.message_Date }</h6>
			<h3>${ detail.message_Contents }</h3>
		</section>
		<br><br><br><br><br>
		<c:if test="${ detail.receiver eq sessionScope.customer.customer_Id }">
		<div><button id="btn1" onclick="location.href='/message/delete?messageNo=${detail.message_No}'">삭제</button></div>
		</c:if>
	</section>
	<!-- END MAIN -->

	<!-- footer -->
    <%@include file="../include/includeFooter.jsp" %>
   
   <div id="preloader"></div>
</body>
</html> --%>