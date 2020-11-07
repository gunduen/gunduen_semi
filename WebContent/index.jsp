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

<title>Welcome to the Cloud</title>
    <style>
        div{
            border: 1px solid none;
            box-sizing: border-box;
        }
        <!-- -->
        *{margin:0;padding:0;}
	    ul,li{list-style:none;}
	    .slide{width : 500px; height:300px;overflow:hidden;}
	    .slide ul{width:calc(100% * 4);display:flex;animation:slide 8s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
	    .slide li{width:calc(100% / 4);height:300px;}
	    
	    @keyframes slide {
	      0% {margin-left:0;} /* 0 ~ 15  : 정지 */ 
	      13% {margin-left:0;}
	      15% {margin-left:0;} /* 15 ~ 25 : 변이 */
	      25% {margin-left:-100%;} /* 25 ~ 40 : 정지 */
	      40% {margin-left:-100%;} /* 40 ~ 50 : 변이 */ 
	      50% {margin-left:-200%;} /* 50 ~ 65 : 정지 */ 
	      60% {margin-left:-200%;} /* 65 ~ 75 */
	      75% {margin-left:-300%;}
	      85% {margin-left:-300%;}
	      100% {margin-left:0;}
	      }
    </style>
    <script>
    	function driverChk() {
    		var driver = '${sessionScope.driver.driverId}';
    		if (driver != "") {
           	 alert('기사는 여행을 예약하실 수 없습니다. 고객으로 로그인해주세요.');
           	 return false;
            }    		
    	}
    </script>
</head>
<body>
    <c:if test="${sessionScope.driver ne null || sessionScope.customer ne null}">
		 <c:if test="${sessionScope.customer ne null }"> [고객 : ${sessionScope.customer.customer_Id }]님 환영합니다.</c:if>
		 <c:if test="${sessionScope.driver ne null }">[기사 : ${sessionScope.driver.driverId }]님 환영합니다.</c:if>
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
				
				&nbsp;&nbsp;
				<img src="../assets/img/happy.png" style="height: 40px">

			</div>
		</header><!-- End Header -->
        
        <!-- ======= Hero Section ======= -->
		<section id="hero"
			class="d-flex justify-content-center align-items-center">
			<div class="container position-relative" data-aos="zoom-in"
				data-aos-delay="100">
				<h1>
					Welcome to the Cloud<br>
				</h1>
				<h2>근두운에 오신걸 환영합니다^^</h2>
				<a href="/travel/Travel.jsp" class="btn-get-started" onclick="return driverChk();">예약하기 
					<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-cloud"
					fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			            <path fill-rule="evenodd"
										d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383zm.653.757c-.757.653-1.153 1.44-1.153 2.056v.448l-.445.049C2.064 6.805 1 7.952 1 9.318 1 10.785 2.23 12 3.781 12h8.906C13.98 12 15 10.988 15 9.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 4.825 10.328 3 8 3a4.53 4.53 0 0 0-2.941 1.1z"> 
			            </path>
        			</svg>
				</a>
			</div>
		</section>
		<!-- End Hero -->
        
        <!-- ======= Main ======= -->
		<section id="main" class="d-flex justify-content-center align-items-center">
		    <div class="container position-relative" data-aos="zoom-in" data-aos-delay="100">
				<div id="left">
					<div class="slide">
						<ul>
							<li><img
								src="../img/index/img1.jpg"
								width="500px;" height="300px;"></li>
							<li><img
								src="https://i.pinimg.com/originals/b7/2f/0b/b72f0b16f4a84cc8e649f6bce9048bc8.jpg"
								width="500px;" height="300px;"></li>
							<li><img
								src="https://dispatch.cdnser.be/cms-content/uploads/2019/09/09/50e20ad4-f940-4f93-830b-8501146b4488.jpg"
								width="500px;" height="300px;"></li>
							<li><img
								src="https://dispatch.cdnser.be/cms-content/uploads/2019/09/09/4657b750-ce06-4136-91af-40d922a327c6.jpg"
								width="500px;" height="300px;"></li>
						</ul>
					</div>
				</div>
				<div id="right" >
					<div id="right_top">행복한 택시여행 떠나 보실라우?</div>
					<div id="right_bottom">근두운: 손오공이 근두운을 타고 팔도유람하듯 택시를 타고 자유롭게
						여행할 수 있게 해주는 서비스, 어디든 떠날 수 있는 국내 자유여행</div>
				</div>
			</div>
		</section>
		<!-- End Main -->
        
        <!-- ======= Footer ======= -->
        <footer id="footer">

			<div class="footer-top">
				<div class="container">
					<div class="row">

						<div class="col-lg-3 col-md-6 footer-contact">
							<h3>Gunduen</h3>
							<p>
								120 Namdaemun-ro <br> Seoul, Jung-Gu<br> South Korea <br>
								<br> <strong>Phone:</strong> +82 10 9999 9999<br> <strong>Email:</strong>
								gunduen@iei.co.kr<br>
							</p>
						</div>
						<div class="container d-md-flex py-4">

							<div class="mr-md-auto text-center text-md-left">
								<div class="copyright">
									&copy; Copyright <strong><span>Gunduen</span></strong>. All
									Rights Reserved
								</div>
								
								<div class="credits">
									<!-- All the links in the footer should remain intact. -->
									<!-- You can delete the links only if you purchased the pro version. -->
									<!-- Licensing information: https://bootstrapmade.com/license/ -->
									<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/ -->
									Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</footer>
        <!-- End Footer -->
    </c:if>
    <c:if test="${sessionScope.driver eq null && sessionScope.customer eq null}">
        
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
				</nav><!-- .nav-menu -->
				<a href="../login/Customerlogin.jsp" class="get-started-btn">고객로그인</a>
				<a href="../login/DriverLogin.jsp" class="get-started-btn">기사로그인</a>
				&nbsp;&nbsp;
				<img src="../assets/img/smile.png" style="height: 40px">

			</div>
		</header><!-- End Header -->
        
        <!-- ======= Hero Section ======= -->
		<section id="hero"
			class="d-flex justify-content-center align-items-center">
			<div class="container position-relative" data-aos="zoom-in"
				data-aos-delay="100">
				<h1>
					Welcome to the Cloud<br>
				</h1>
				<h2>근두운에 오신걸 환영합니다^^</h2>
				<a href="/travel/Travel.jsp" class="btn-get-started" onclick="return loginCheck();">예약하기 
					<svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-cloud"
					fill="currentColor" xmlns="http://www.w3.org/2000/svg">
			            <path fill-rule="evenodd"
										d="M4.406 3.342A5.53 5.53 0 0 1 8 2c2.69 0 4.923 2 5.166 4.579C14.758 6.804 16 8.137 16 9.773 16 11.569 14.502 13 12.687 13H3.781C1.708 13 0 11.366 0 9.318c0-1.763 1.266-3.223 2.942-3.593.143-.863.698-1.723 1.464-2.383zm.653.757c-.757.653-1.153 1.44-1.153 2.056v.448l-.445.049C2.064 6.805 1 7.952 1 9.318 1 10.785 2.23 12 3.781 12h8.906C13.98 12 15 10.988 15 9.773c0-1.216-1.02-2.228-2.313-2.228h-.5v-.5C12.188 4.825 10.328 3 8 3a4.53 4.53 0 0 0-2.941 1.1z"> 
			            </path>
        			</svg>
				</a>
			</div>
		</section>
		<!-- End Hero -->
        
        <!-- ======= Main ======= -->
		<section id="main"
			class="d-flex justify-content-center align-items-center" style="padding-left:80px;">
			<div class="container position-relative" data-aos="zoom-in"
				data-aos-delay="100" style="margin:0 auto;">
				<div class="slide" style="float : left;">
					<ul>
						<li><img
							src="../img/index/img1.jpg"
							width="500px;" height="300px;"></li>
						<li><img
							src="../img/index/img2.jpg"
							width="500px;" height="300px;"></li>
						<li><img
							src="../img/index/img3.jpg"
							width="500px;" height="300px;"></li>
						<li><img
							src="../img/index/img4.jpg"
							width="500px;" height="300px;"></li>
					</ul>

				</div>
				<div id="right" style="height:300px; float : left; text-align:center; padding-left:100px; padding-top:100px;">
					<div id ="intro"style=" width : 100%; float : left;">
					<div id="right_top"><b>행복한 택시여행</b> 떠나 보실라우?</div>
					<div id="right_bottom">근두운: 손오공이 근두운을 타고 <b>팔도유람하듯 택시를 타고</b><br> 자유롭게
						여행할 수 있게 해주는 서비스, <br><p style="color:#0f9aff;font-weight:bold;">어디든 떠날 수 있는 국내 자유여행 근두운</p></div>
					</div>
				</div>
			</div>
		</section>
		<script>
		function loginCheck() {
         var userId = '${sessionScope.customer.customerId }';
         var driver = '${sessionScope.driver.driverId }';
         if(userId == "") {
            alert("로그인후 이용해주세요!");
            return false;
         }
      }
		</script>
		<!-- End Main -->
		
        <!-- ======= Footer ======= -->
        <footer id="footer">

			<div class="footer-top">
				<div class="container">
					<div class="row">

						<div class="col-lg-3 col-md-6 footer-contact">
							<h3>Gunduen</h3>
							<p>
								120 Namdaemun-ro <br> Seoul, Jung-Gu<br> South Korea <br>
								<br> <strong>Phone:</strong> +82 10 9999 9999<br> <strong>Email:</strong>
								gunduen@iei.co.kr<br>
							</p>
						</div>
						<div class="container d-md-flex py-4">

							<div class="mr-md-auto text-center text-md-left">
								<div class="copyright">
									&copy; Copyright <strong><span>Gunduen</span></strong>. All
									Rights Reserved
								</div>
								<div class="credits">
									<!-- All the links in the footer should remain intact. -->
									<!-- You can delete the links only if you purchased the pro version. -->
									<!-- Licensing information: https://bootstrapmade.com/license/ -->
									<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/ -->
									Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</footer>
        <!-- End Footer -->
    </c:if>
    <div id="preloader"></div>
	
	<!-- Vendor JS Files -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/vendor/counterup/counterup.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	
	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>
	
	<script>
	</script>
</body>
</html>
