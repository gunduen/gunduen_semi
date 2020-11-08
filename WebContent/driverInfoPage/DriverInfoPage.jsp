<%@page import="driver.model.vo.Driver"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta content="width=device-width, initial-scale=1.0" name="viewport">

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
<meta charset="UTF-8">
<title>기사 자기소개 게시판</title>
    <style>
    	section {
  			border : 1px solid white;
 	 	}
       /*  /* header{
            height: 150px;
        }
        section{
            height: 700px;
        }
        footer{
            height: 150px;
        } 
        .tablinks {
            width: 100px;
            overflow: hidden;
            border: 1px solid #ccc;
            background-color: #f1f1f1;
            border: none;
            outline: none;
            cursor: pointer;
            padding: 14px 16px;
            font-size: 17px;
        }
        ul button:hover{
            background-color: #ddd;
        }
        ul button:active{
            background-color: #ccc;
        }
        ul{
            width: 25%;
            height: 100%;
            text-align: left;
            list-style: none;
        } */
        #wrap {
  		margin-top : 20px;
  	}
  	#tableDriver {
  		border-radius: 5em;
  		border: 1px solid #a3d4f7;
  	}
  	
  	
  	#driver tr td:nth-child(2){
  		text-align: left;
  		 font-family: 'Do Hyeon', sans-serif;
  		 font-size: 1.3em;
  	}
  	
  	#nav-menu {
  		
  	}
  	#left {
  		margin-top :50px;
  		padding-top : 0px;
  		border-radius : 1.1em;
  	}
  	#nav-menu ul {
  		list-style: none; padding-left: 0px; text-align: center; float: left; width:100%;
  		background-color : #FAFAFA;border-radius : 1.1em;
	}
  	#nav-menu a {
  		color : black;
  	}
  	#nav-menu ul li:first-child {
  		color : white;
  		background : #a3d4f7;
  		padding-top : 4px;
  		height : 30px;
  	}
  	#nav-menu ul li {
  		padding-top : 4px;
  		height : 30px;
  	}
  	#nav-menu li:hover{
  		background : #a3d4f7;
  		color : white;
  	}
  	.table-hover tbody tr:hover td {
  		background-color : #a3d4f7;
  		color : white;
  	}
  	.table-hover tbody tr:last-child:hover td {
  		background-color : white;
  	}
  	.main {
  		padding-top : 30px;
  	}
  	.table tbody>tr {
  		height : 30px;
  	}
        
        
        
    </style>
    <script>
    $(document).ready(function(){
    	$(".tablinks").click(function(){
    		location.href='/driver/autoMyinfo?area='+$(this).text();
    	});
    });
    	

    	
    </script>
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
                  <li><a href="/driverInfoPage/DriverInfoPage.jsp">Driver</a></li>
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
   
    	<section id="wrap" class="container-fluid" style="padding-left:80px; padding-right:80px;">
		<section class="main" class="row">
			<%-- <c:if  test="${ sessionScope.review ne null}"> --%>
			<section id="left" class="col-sm-auto"
				style="width: 100px; border: 1px solid white; float: left; padding-left:0px; padding-right:0px; padding-bottom:0px;">
				<nav id="nav-menu">
					<ul id="navi">
						<li>지역</li>
						<li class="tablinks">서울</li>
						<li class="tablinks">부산</li>
						<li class="tablinks">대구</li>
						<li class="tablinks">인천</li>
						<li class="tablinks">광주</li>
						<li class="tablinks">대전</li>
						<li class="tablinks">울산</li>
						<li class="tablinks">세종</li>
						<li class="tablinks">경기</li>
						<li class="tablinks">강원</li>
						<li class="tablinks">충남</li>
						<li class="tablinks">충북</li>
						<li class="tablinks">전남</li>
						<li class="tablinks">전북</li>
						<li class="tablinks">경남</li>
						<li class="tablinks">경북</li>
						<li class="tablinks">제주</li>
					</ul>
				</nav>
			</section>

			
						
						
						
						
						
					
						
						
			<section id="right"
				style="margin: border: 1px solid white; width: 1300px;  height: 650px; text-align:center; padding-left : 200px;padding-top : 25px;">
				<div id="title"  style="font-family: 'Do Hyeon', sans-serif; font-size:1.9em; width: 100%; height: 7%; box-sizing: border-box;">기사 소개 게시판</div>
				<div id="contents" style="font-family: 'Do Hyeon', sans-serif; width: 100%; height: 86%; box-sizing: border-box;" >
				<br>
				<div id="firstCol" style="width: 100%; height: 50%;">

						<c:choose>
        					<c:when test="${dList ne null}">
						
        						<c:forEach items="${dList}" var="list">
        						
									<div id="contents_1" style="width: 50%; height: 100%; box-sizing: border-box; float: left;">
        							<div style="width: 100%; height : 70%;  margin: 0 auto;" id="tableDriver">
        								<table id="driver" style="width: 95%; height:100%; margin: 0 auto;">
        									<tr>
        										<td><img src="../img/driverImage/${list.driverInfoImage}" class="img-circle" style="width: 100px; height: 100px;"></td>
        											<td style="width: 800px;font-size: 1.7em;"><p>${list.driverName} 기사님</p>
        												<p>${list.driverSelfInfo} </p><p><p>담당 지역 : ${list.driverArea }</p></td>
        							
        									</tr>
        								</table>
        							</div>
        						</div>
        						</c:forEach>
		        		</c:when>
						<c:when test="${dList eq null}">
							<p>존재하지않음</p>
						</c:when>
		        	</c:choose>
					</div>

     
<!-- 				<c:choose>
        		<c:when test="${dList ne null}">
						
        				<c:forEach items="${dList}" var="list">

        				<div style="width: 500px;  margin: 0 auto;" id="tableDriver">
        				<table id="driver" style="width: 100%;" >
        					<tr>
        						<td><img src="../img/driverImage/${list.driverInfoImage}" class="img-circle" style="width: 100px; height: 100px;"></td>
        						<td style="width: 800px;font-size: 1.7em;"><p>${list.driverName} 기사님</p>
        							<p>${list.driverSelfInfo} 정신나갈거같애~ 정신나갈거같애~ 정신나갈거같애~ 정신나갈거같애~ 정신나갈거같애~ 정신나갈거같애~ 정신나갈거같애~ 정신나갈거같애~ 정신나갈거같애~ 정신나갈거같애~</p><p><p>담당 지역 : ${list.driverArea }</p></td>
        							
        					</tr>
        					</table>
        					</div>
        					</c:forEach>

        		
        			
        			   
        		
        		</c:when>
				<c:when test="${dList eq null}">
					<p>존재하지않음</p>
				</c:when>
				
        	</c:choose> -->
`

        

        		
				</div>
				<div id="navi" style="width: 100%; height: 7%; box-sizing: border-box;line-height: -50px; margin: 0 auto;">
					<div id="nav1" style="width: 25%;height: 100%; margin: 0 auto;">
						${pageNavi}
				
					</div>
				
				</div>
			</section>
			
		</section>
	</section>
	<!-- End Main -->
	
	
	<!-- footer -->
    <%@include file="../include/includeFooter.jsp" %>
   
   <div id="preloader"></div>
</body>
</html>