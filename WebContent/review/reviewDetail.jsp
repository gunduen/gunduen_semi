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
<title>후기 디테일</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
    	window.onload = function() {
    		var flag = '${checkReview }';
    		if(flag != '' && flag == 'false') {
    			alert("Review End!!");
    		}
    	};	
    </script>
    <style>
    	#title {
    		padding-bottom : 0px;
    	}
    	#subject {
    		font-size : 1.2em;
    	}
    	#commentContents{
    		width: 100%; height: 100px; resize: none;
    	}
    	#form-top {
    		padding-bottom : 0px;
    	}
    	#subject {
    		width : 300px;
    		float:left;
    		font-weight : bold;
    	}
    	#userId, #date {
    		text-align : center;
    		display : inline-block;
    		margin-top : 5px;
    		width : 130px;
    		font-size : 0.8em;
    		float:right;
    	}
    	#form-bottom {
    		padding-top : 10px;
    		padding-left : 10px;
    	}
    	#buttonwrap {
    		text-align : right;
    		padding-bottom : 30px;
    	}
    	#buttonwrap>div {
    		float : left;
    		text-align :left;
    	}
    	#btn1, #btn2 {
    		border : 1px solid white;
    	}
    	#commentBtn {text-align : right;}
    	.get-started-btn-gray-sm { border : 1px solid white; }
    	.get-started-btn-gray-sm-del { border : 1px solid white; }
    	#pageNaviForm { text-align : center; color : #A4A4A4;}
    	#page {color:black;}
    	#contents { float:left;border-left-style:1px solid black;}
    	#formwrap {
    		padding-top : 0px;
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

	
	
	<!-- 후기 상세 -->
	<section id="wrap" class="container-fluid" style="padding-left:130px; padding-right:130px;">
		<section class="main" class="row">
			<section id="formwrap">
				<%-- <div>예약번호 : ${review.package_Code }</div> --%>
				<section id="form-top">
					<div id="subject">${ review.reviewSubject }</div>
					<div id="userId">작성자 : ${ review.customerId} </div>
					<div id="date">작성날짜 : ${review.reviewDate }</div>
				</section>
			<hr>
				<section id="form-bottom">
				<div id="contents">${ review.reviewContents }</div>
				</section>
			</section>
			<section id="buttonwrap">
					<div>
						<a href="/review/list?reviewArea=서울" class="get-started-btn-gray">게시판으로</a>
					</div>
				<c:if
					test="${sessionScope.customer ne null && (sessionScope.customer.customer_Id eq review.customerId) }">
					<button type="button" id="btn1" class="logout-btn" onclick="delfunc();">삭제</button>
					<button type="button" id="btn2" class="get-started-btn" onclick="updatefunc(${review.reviewNo});">수정</button>
					<script>
						function updatefunc(num) {location.href="/review/modifyForm?reviewNo="+num;}
					</script>
				</c:if>
			</section>
			<hr>
			<!-- 댓글 -->
			<!-- 로그인 안했을 때  -->
			<c:if
				test="${ sessionScope.customer eq null && (sessionScope.driver eq null)}">
				<form action="/comment/insert?reviewNo=${ review.reviewNo }">
					<div>댓글</div>
					<textarea  id="commentContents" name="commentContents"
						placeholder="로그인 후 이용해주세요" readonly></textarea>
				</form>
			</c:if>

			<c:if
				test="${sessionScope.customer ne null || (sessionScope.driver ne null)}">
				<!-- 고객 댓글입니다!! -->
				<c:if
					test="${ (sessionScope.customer ne null) && (sessionScope.driver eq null)}">
					<form action="/comment/insert?reviewNo=${ review.reviewNo }">
						<div>댓글</div>
						<%-- <div>나의 아이디 ' ${ sessionScope.customer.customer_Id } '</div> --%>
						<input type="hidden" name="customerId" value="${ sessionScope.customer.customer_Id }">
						<input type="hidden" name="driverId" value="${ sessionScope.driver.driverId }">
						<input type="hidden" name="reviewNo" value="${ review.reviewNo }">
						<textarea id="commentContents" name="commentContents"></textarea>
						<div id="commentBtn">
							<input type="submit" value="댓글입력"  class="get-started-btn-gray-sm">
						</div>
					</form>
				</c:if>
				<!-- 기사 댓글입니다.  -->
				<c:if
					test="${ (sessionScope.customer eq null) && (sessionScope.driver ne null)}">
					<form action="/comment/insert?reviewNo=${ review.reviewNo }">
						<div>댓글</div>
						<%-- <div>나의 아이디 ' ${ sessionScope.driver.driverId } '</div> --%>
						<input type="hidden" name="customerId" value="${ sessionScope.customer.customer_Id }">
						<input type="hidden" name="driverId" value="${ sessionScope.driver.driverId }">
						<input type="hidden" name="reviewNo" value="${ review.reviewNo }">
						<textarea  id="commentContents" name="commentContents"></textarea>
						<div id="commentBtn">
							<input type="submit" value="댓글입력" class="get-started-btn-gray-sm ">
						</div>
					</form>
				</c:if>
			</c:if>


			<hr>

			<c:forEach items="${ CList }" var="comments" varStatus="index">
				<table>
					<tr class="comList"
						style=" width: 800px; text-align:center;ist-style: none; padding: 0 0;">
						<c:if test="${comments.customerId ne null }">
							<td style="width: 80px; float: left; padding-top:5px; border-right-style:1px solid lightray; position:relative;">${comments.customerId }</td>
						</c:if>
						<c:if test="${comments.customerId eq null }">
							<td style=" width: 80px; float: left; padding-top:5px; position:relative;">${comments.driverId }</td>
						</c:if>
						<td id="date" style="width: 100px; height:30px; float:left;margin-top:0px;padding-top:8px; position:relative;margin-left:30px;">${comments.commentDate }</td>
						<td id="contents" style=" width: 500px; height:30px;  padding-top:3px; padding-rop:0px; position:relative;">${comments.commentContents }</td>
						<c:if
							test="${comments.customerId eq sessionScope.customer.customer_Id }">
							<td><button type="button" onClick="delComfunc(${comments.commentNo});" class="get-started-btn-gray-sm-del" style="margin-left:60px;">삭제</button></td>
						</c:if>
						<c:if test="">
						<td></td>
						</c:if>
					</tr>

				</table>
			</c:forEach>
			<br>
			<div id="pageNaviForm">
				<td id="page" colspan="3" align="center">${ pageNavi }</td>
			</div>

			<script>
				function delfunc() {
					var con = confirm("정말로 삭제하시겠습니까?");
					if (con) {
						location.href="/review/delete?reviewNo="+${review.reviewNo}+"&package_Code="+${review.package_Code};
						
					}
				}
				function delComfunc(num) {
					var con = confirm("정말로 삭제하시겠습니까?");
					if (con) {
						location.href="/comment/delete?commentNo="+num + "&reviewNo=" +${review.reviewNo};
					}
					/* if (con) {
						location.href="/comment/delete?commentNo="+${comments.commentNo}+"&?reviewNo="+${reviewOne.reviewNo};
					} */
				}
			</script>
		</section>
	</section>
	
	<!-- footer -->
    <%@include file="../include/includeFooter.jsp" %>
   
   <div id="preloader"></div>
</body>
</html>