<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
    <title>근두운 - 공지사항 수정</title>
    <style>
        #top {
            font-size: 30px;
            text-align: center;
        }
        form {
            text-align: center;
        }
        fieldset {
            width: 10%;
            margin: auto;
        }
        #bottom {
            text-align: right;
        }
    </style>
</head>
    <body>
        <header id="header" class="fixed-top">
		<div class="container d-flex align-items-center">

			<h1 class="logo mr-auto">
				<a href="../index.jsp">GUNDUEN</a>
			</h1>
			<!-- Uncomment below if you prefer to use an image logo -->
			<!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->
			<nav class="nav-menu d-none d-lg-block">
				<ul>
					<li><a href="../index.jsp">Home</a></li>
					<li class="active"><a href="/notice/list">Notice</a></li>
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
					function warning() {
						var question = confirm('정말 로그아웃하시겠어요?');
						if (question) {
							return true;
						} else {
							return false;
						}
					}
				</script>
				&nbsp;&nbsp; <img src="../assets/img/happy.png" style="height: 40px">
			</c:if>

			<!-- 고객/기사 로그인시 header -->
			<c:if test="${sessionScope.customer.adminCheck < 1 }">
				<a href="/myPage/CustomerMyPage.jsp" class="get-started-btn">마이페이지</a>
				<a href="/member/logout" class="logout-btn" onclick="return warning();">로그아웃</a>
				<script>
					function warning() {
						var question = confirm('정말 로그아웃하시겠어요?');
						if (question) {
							return true;
						} else {
							return false;
						}
					}
				</script>
				&nbsp;&nbsp; <img src="../assets/img/happy.png" style="height: 40px">
			</c:if>

			<c:if test="${sessionScope.driver ne null}">
				<a href="/myPage/DriverMyPage.jsp" class="get-started-btn">마이페이지</a>
				<a href="/member/logout" class="logout-btn"
					onclick="return warning();">로그아웃</a>
				<script>
					function warning() {
						var question = confirm('정말 로그아웃하시겠어요?');
						if (question) {
							return true;
						} else {
							return false;
						}
					}
				</script>
				&nbsp;&nbsp; <img src="../assets/img/happy.png" style="height: 40px">
			</c:if>
			<c:if test="${sessionScope.driver eq null && sessionScope.customer eq null}">
				<a href="/login/Customerlogin.jsp" class="get-started-btn">고객로그인</a>
				<a href="/login/DriverLogin.jsp" class="get-started-btn">기사로그인</a>
				&nbsp;&nbsp; <img src="../assets/img/smile.png" style="height: 40px">
			</c:if>

		</div>
	</header>
	<!-- End Header -->
	<br><br>
        <section>
            <article id="top">공지사항 수정</article>
            <br><br>
            
            <form action="/notice/update" method="post">
	            <input type="text" size="100" name="notice_Subject" value="${ notice.notice_Subject }"><br><br>
	            <textarea rows="20" style="resize:none" cols="100" name="notice_Contents">${ notice.notice_Contents }</textarea>
	            <br><br>
	            <input type="hidden" name="notice_No"value="${ notice.notice_No }">
	            <div align="center">
		            <input class="get-started-btn" style="border:none;" type="submit" value="수정" name="수정">
		            <input class="get-started-btn" style="border:none;" type="reset" value="취소" name="취소">
		            <a href="/notice/list"><input class="get-started-btn" style="border:none;" type="button" value="목록으로"></a>
		        </div> 
            </form>
        </section>
        <%@include file="/include/includeFooter.jsp" %>
    </body>
</html>