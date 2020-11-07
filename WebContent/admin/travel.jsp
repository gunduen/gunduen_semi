<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<!-- <title>Mentor Bootstrap Template - Index</title> -->
<meta content="" name="descriptison">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="../assets/img/favicon.png" rel="icon">
<link href="../assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="../assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="../assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="../assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="../assets/vendor/animate.css/animate.min.css"
	rel="stylesheet">
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
<title>admin - 기사 관리</title>
<meta charset="utf-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	function approveChk() {
		var question = confirm('정말 승인 하시겠습니까?');
		if (question) {
			return true;
		} else {
			return false;
		}

	}
	function kickOutChk() {
		var question = confirm('정말 탈퇴 시겠습니까?');
		if (question) {
			return true;
		} else {
			return false;
		}

	}
</script>
<style>
#mypage {
	width: 35%;
	height: 100%;
	float: left;
	line-height: 250px;
}

section {
	width: 100%;
	height: 100%;
	border: 1px solid white;
	box-sizing: border-box;
}

#navi {
	width: 100%;
	height: 100%;
	border: 1px solid white;
	box-sizing: border-box;
	float: left;
	padding-top : 20px; padding-left:70px;
	padding-bottom:0px;
}

#contents {
	width: 100%;
	height: 100%;
	border: 1px solid white;
	box-sizing: border-box;
	float: left;
	padding: 0px;
}

#mypageList {
	width: 100%;
	height: 100%;
}

#navi #navigator a {
	text-decoration: none;
	display: white;
	margin-right : 20px;
}

#navigator {
	width: 100%;
	height: 100%;
}

#navigator li {
	text-align: center;
	line-height: 70px;
	list-style: none;
	border: 1px solid white;
	height: 20%;
	box-sizing: border-box;
	float : left;
}

#mybooking {
	border: 1px solid white;
	width: 100%;
	height: 10%;
}

#mybookinglist {
	border: 1px solid white;
	width: 100%;
	height: 90%;
	padding: 0;
}

#mybooking p {
	font-size: 1.6em;
	font-weight: bold;
}

#mybookinglist table {
	margin: 0 auto;
}

#mybookinglist table thead tr th {
	text-align: center;
	font-size: 19px;
}

#mybookinglist table thead tr td {
	text-align: center;
	font-size: 15px;
}

#travel:hover {
	background: #d9efff;
}

#main {
	width: 100%;
	height: 80%;
	border: 1px solid black;
}

#mainNav {
	width: 100%;
	height: 20%;
	border: 1px solid black;
}

#mainNav li {
	border: 1px solid white;
	float: left;
	list-style: none;
	width: 20%;
	height: 100%;
	line-height: 30px;
}
.table tr th {
	 padding:0px;
	 font-size : 1.2em;
	 text-align:center;
}
.table tr td {
	padding:0px;
}
</style>
</head>
<body>
	<header>
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
                &nbsp;&nbsp; <img src="../assets/img/happy.png"
						style="height: 40px">
				</c:if>

				<!-- 고객/기사 로그인시 header -->
				<c:if test="${sessionScope.customer.adminCheck < 1 }">
					<a
						href="/mypage/travel?customerId=${sessionScope.customer.customer_Id }"
						class="get-started-btn">마이페이지</a>
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
				</c:if>

				<c:if test="${sessionScope.driver ne null}">
					<a
						href="/DriverTravel/List?driverId=${sessionScope.driver.driverId }"
						class="get-started-btn">마이페이지</a>
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
				</c:if>
				<c:if
					test="${sessionScope.driver eq null && sessionScope.customer eq null}">
					<a href="/login/Customerlogin.jsp" class="get-started-btn">고객로그인</a>
					<a href="/login/DriverLogin.jsp" class="get-started-btn">기사로그인</a>
            &nbsp;&nbsp; <img src="../assets/img/smile.png"
						style="height: 40px">
				</c:if>
			</div>
		</header>
		<!-- End Header -->
	</header>
	<br>
	<br>
	<section>
		<section id="navi">
			<nav class="nav-menu d-none d-lg-block">
				<nav id="navigator">
					<ul>
						<li><a href="/admin/driverList">기사 회원 관리</a></li>
						<li><a href="/admin/customerList">고객 회원 관리</a></li>
						<li class="active"><a href="/admin/travelList">여행 예약 관리</a></li>
						<li><a href="/message/receiverList?receiver=${sessionScope.customer.customer_Id }">쪽지 관리</a></li>
					</ul>
				</nav>
			</nav>

		</section>
		<section id="contents">

			<section id="mybookinglist">
				<table class="table" style="width: 90%; height: 30px;">

					<tr>

						<th>여행예약코드</th>
						<th>지역</th>
						<th>이용권</th>
						<th>픽업장소</th>
						<th>예약한 날짜</th>
						<th>여행 예정 날짜</th>
						<th>여행 완료 여부</th>
						<th>고객 아이디</th>
						<th>기사 이름</th>
					</tr>
					<c:forEach items="${ travelList}" var="travelList">
						<tr>
							<td>${ travelList.package_Code }</td>
							<td>${ travelList.package_Area }</td>
							<td>${ travelList.package_Utilization }</td>
							<td>${ travelList.package_Pickup }</td>
							<td>${ travelList.package_Date }</td>
							<td>${ travelList.package_TravelDate }</td>
							<c:if test="${ travelList.package_Confirm == 1}">
								<td>미완료</td>
							</c:if>
							<c:if test="${ travelList.package_Confirm > 1}">
								<td>완료</td>
							</c:if>
							<td>${ travelList.customer_Id }</td>
							<td>${ travelList.driver_Name }</td>
					</c:forEach>
				</table>
			</section>
		</section>
	</section>

	<footer>
		<%@include file="../include/includeFooter.jsp"%>
	</footer>
=======
<div>${ sessionScope.customer.customer_Id } 페이지입니다. </div>
<table border="1px solid black">
	<tr>
		
		<th>여행예약코드</th>
		<th>지역</th>
		<th>이용권</th>
		<th>픽업장소</th>
		<th>예약한 날짜</th>
		<th>여행 예정 날짜</th>
		<th>여행 완료 여부</th>
		<th>고객 아이디</th>
		<th>기사 이름</th>
	</tr>
	<c:forEach items="${ travelList}" var="travelList">
	 <tr>
	 	<td>${ travelList.package_Code }</td>
	 	<td>${ travelList.package_Area }</td>
	 	<td>${ travelList.package_Utilization }</td>
	 	<td>${ travelList.package_Pickup }</td>
	 	<td>${ travelList.package_Date }</td>
	 	<td>${ travelList.package_TravelDate }</td>
	 	<c:if  test="${ travelList.package_Confirm == 1}">
	 	<td> 미완료 </td>
	 	</c:if>
	 	<c:if  test="${ travelList.package_Confirm > 1}">
	 	<td> 완료 </td>
	 	</c:if>
	 	<td>${ travelList.customer_Id }</td>
	 	<td>${ travelList.driver_Name }</td>
	 </c:forEach>
</table>
>>>>>>> refs/remotes/origin/1106hanhyeon
</body>
</html>