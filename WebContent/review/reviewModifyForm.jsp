<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="review.model.vo.Review"%>
<%@page import="travel.model.vo.Travel"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>

<head>
    <title>후기 등록</title>
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
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <style>
           section {
	  	}
       btn2 {
       	border : 1px solid none;
       }
       #wrap {
  		margin-top : 0px;
  		padding-top : 0px;
	  	}
	  	#main {
	  		margin-top :50px;
	  		padding-top : 0px;
	  		border-radius : 1.1em;
	  	}
	  	.update {
	  		width: 100%;
	  		text-align : right;
	  	}
	  	#btn2 {
	  		
	  		margin-right : 0px;
	  	}
	  	#contents {
  		width: 100%; height: 200px; resize: none;
  		}
  		#main {
  		/* 	margin-top : 20px; */
  		}
    </style>
    <script>
    function checkValue(){
		var mInfo = document.modifyMessageForm;
		
		if(mInfo.subject.value==""){
			alert('제목을 입력해주세요');
			return false;
		}
		if (mInfo.contents.value =="") {
			alert('내용을 입력해주세요.');
			return false;
		}
	}
    </script>
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
                  <li><a href="/driver/autoMyinfo?area=서울">Driver</a></li>
                  <li><a href="/qna/list">Q&A</a></li>
                  <li class="active"><a href="/review/list?reviewArea=서울">Review</a></li>
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
                &nbsp;&nbsp; <img src="../assets/img/happy.png" style="height: 40px">
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
   <!-- End Header -->

   	
    <!-- main -->
	<section id="wrap" class="container-fluid" style="padding-left: 130px; padding-right: 130px;">
		<section id="main" class="row">
			<section id="titlewrap" style="width:100%; padding-bottom : 0px; padding-top:100px;">
				<div id="title"
					style="font-family: 'Do Hyeon', sans-serif; font-size: 1.7em;">후기글
					수정</div>
					<hr>
			</section>
			<section id="formwrap" style=" width:100%; padding-top:20px; padding-bottom:0px;">
				<form action="/review/update" name="modifyMessageForm" method="post">
					<div class="message title">
						<input type="text" style="width: 100%;" name="subject" value="${review.reviewSubject }">
					</div>
					 <div>
					 </div>
					 <c:if test="${fn:length(travelList) > 0}">
					 <select name="area">
					<c:forEach items="${travelList }" var="travel">
					지역<option value="${travel.package_Area }">${travel.package_Area } - '날짜 : ${ travel.package_TravelDate }'</option>
					
					</c:forEach>
					</select>
					</c:if>
					<c:if test="${fn:length(travelList) == 0 }">
					</c:if>
					<input type="hidden" name="reviewNo" value="${review.reviewNo }">
					<input type="hidden" name="packageCode" value="${review.package_Code }">
					<div class="message contents">
						<textarea id="contents" name="contents">${review.reviewContents }</textarea>
					</div>
					<br>
					<div class="message update">
						<input type="submit" value="수정" id="btn2" class="get-started-btn" style="border : 1px solid white;">
					</div>
				</form>
			</section>
		</section>
    </section>

   <!-- footer -->
    <%@include file="../include/includeFooter.jsp" %>
    <div id="preloader"></div>
</body>

</html>