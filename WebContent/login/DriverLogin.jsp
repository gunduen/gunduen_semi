<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
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
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
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
   <script>
   		function loginChk(){
   			var form = document.dForm;
   			
   			if(form.userId.value==''){
   				alert('아이디를 입력해주세요');
   				return false;
   			}
   			if(form.userPwd.value==''){
   				alert('비밀번호를 입력해주세요');
   				return false;
   			}
   		}
   </script>

     <title>기사 로그인</title>
    <style>
        <!--keep -->
        .member {
       	   	 font-size: 30px;
          	 color: black;
         	  margin: 0 auto;
         	  text-align:left;
         	  display: inline-block;
         	  font-family: "맑은 고딕";
           }
        
     	   article {
     	   width : 100%;
     	   text-align: center;
     	   
     	   }
     	   section{
     	   width : 100%;
     	   	height: 800px;
     	   }
     	   
        
        body {
           
            width: 100%;
        }
        article h1, h4 {
            text-align: center;
            margin: 10px;
        }
        article form {
            text-align: center;
        }
        a:hover{
        	color:#8aceff !important;
        	font-weight: bold;
        }
        
        
    </style>
	</head>
    <body>
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
        <section>
            <article>
            <br><br><br><br>
                <div id="wrap" class="col-md-12" style="width: 100%;">
                    <h3 style="font-family: 'Do Hyeon', sans-serif;">기사 로그인 페이지</h3>
                    <a href="#" target="_blank"><img src="../img/MainPageImg/gunduen.png" style="width: 200px; height: 200px;" id="logo"></a>
                	<div class="col-md-2" style="margin: 0 auto;">
                		<form class="form-horizontal" name="dForm" action="/driver/login" method="post" onsubmit="return loginChk();">
                			<input type="text" name="userId" id="userId" class="form-control" placeholder="아이디를 입력하세요."><br>
                			<input type="password" name="userPwd" style="margin-top: -10px;" class="form-control" id="userPwd" placeholder="비밀번호를 입력하세요.">
                			<br>
                			<input type="submit" class="btn btn-outline-primary btn-lg btn-block" style="margin-top: -10px; font-family: 'Do Hyeon', sans-serif;" value="로그인" ><br>
		                    <a href="/login/DriverEnroll.jsp"><input type="button" class="btn btn-outline-primary btn-lg btn-block" style="margin-top: -10px; font-family: 'Do Hyeon', sans-serif;" value="회원가입"></a><br>
		                    <a href="DriverFindId.jsp" style="color: #a3d4f7;" id="hoverA">아이디 찾기</a> / 
		                    <a href="DriverFindPw.jsp" style="color: #a3d4f7;" id="hoverA">비밀번호 찾기</a>
                	</form>
                	</div>
                </div>
            </article>
        </section>

	
	<div id="preloader"></div>
    </body>
</html>