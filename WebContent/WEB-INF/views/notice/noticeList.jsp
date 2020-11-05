<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
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

    <title>근두운 - 공지사항 리스트</title>
    <style>
        article h1, h4 {
            text-align: center;
            margin: 10px;
        }
        #title {
            background-color: #a3d4f7;
            height: 40px;
        }
        #notice {
            border: 1px solid white;
            width: 60%;
            margin: auto;
            text-align: center;
            margin-bottom: 20px;
        }
        tr {
            height: 50px;
        }
        input[type="button"] {
            font-size: 15px;
        }
        #pagination
        {
        	display: block;
        	text-align:center;
        	text-decoration-line: none;
        	color: #a3d4f7;
        }
        .button
        {
        	text-align: right;
        	margin : 0 50px 0 0;
        }
        section
        {
        	text-align:center;
        }
        #check:hover
        {
        	background: #d9efff;
        }
        #subject
        {
        	width:60%;
        }
    </style>
    <script>
    	function check() {
    		var str = document.getElementById('search').value;
    		
    		if(str == "" || str == null || str == " ") {
    			alert("검색 내용을 입력해주세요.");
    			return false;
    		}
    		return true;
    	}
    </script>
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
				<a href="/member/logout" class="logout-btn"	onclick="return warning();">로그아웃</a>
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

			<!-- 고객 로그인시 header -->
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
			<!-- 기사 로그인시 header -->
			<c:if test="${sessionScope.driver ne null}">
				<a href="/myPage/DriverMyPage.jsp" class="get-started-btn">마이페이지</a>
				<a href="/member/logout" class="logout-btn"	onclick="return warning();">로그아웃</a>
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

	<!-- ======= Main ======= -->
	        <section id="main">
	            <br><br>
	            <article>
	                <h1 onClick="location.href='/notice/list'" style="font-size: 30px;">공지사항</h1>
	            </article>
	            <br>
	            <article>
	                <table id="notice" class="table" style="width:60%;">
	                    <tr id="title">
	                        <th>글번호</th>
	                        <th id="subject">제목</th>
	                        <th>작성자</th>
	                        <th>작성일</th>
	                        <th>조회수</th>
	                    </tr>
	                    <c:forEach items="${ nList }" var="notice" varStatus="status">
		                    <tr id="check" onClick="location.href='/notice/plusHits?notice_No=${ notice.notice_No }'">
		                        <td>${ pageNum-status.index }</td>
								<c:choose>
									<c:when test="${fn:length(notice.notice_Subject) > 20}">
										<td>
											<c:out value="${fn:substring(notice.notice_Subject,0,21)}" />
											<c:out value=".." />
										</td>
									</c:when>
									<c:otherwise>
										<td><c:out value="${ notice.notice_Subject }" /></td>
									</c:otherwise>
								</c:choose>
		                        <%-- ${ notice.notice_Subject } --%>
								<td>${ notice.customer_Id }</td>
		                        <td>${ notice.notice_Date }</td>
		                        <td>${ notice.notice_Hits }</td>
		                    </tr>
	                    </c:forEach>
	                </table>
	            </article>
	            <br>
	            <article style="display:inline;">
	            	<span id="pagination">
	            		<span align="center">${ pageNavi }</span>
	            		<c:if test="${ sessionScope.customer.adminCheck == 1 }">
			            	<a href="/notice/writeform"><input id="noticeWrite" class="get-started-btn" type="submit" style="border:none;" value="글쓰기" name="글쓰기"></a>
				        </c:if>
	            	</span>
		        </article>
	            <article>
	            	<br>
	            	<%-- <tr>
	            	<c:if test="${ sessionScope.customer.adminCheck == 1 }">
		            	<a href="/notice/writeform"><input id="noticeWrite" class="get-started-btn" type="submit" style="border:none;" value="글쓰기" name="글쓰기"></a>
			        </c:if>
			        </tr> --%>
	            </article>
	            <br><br>
	            <article>
	            	<form action="/notice/search" method="get" onSubmit="return check();">
	            		<select name="type" style="height:30px;">
	            			<option value="NOTICE_SUBJECT">제목</option>
	            			<option value="NOTICE_CONTENTS">내용</option>
	            		</select>
	            		<input type="text" id="search" name="search" size="50" placeholder="검색어를 입력하세요">
	            		<input class="get-started-btn" style="border:none;" type="submit" value="검색">
	            	</form>
	            </article>
	        </section><!-- End Main -->
	        
	        <%@include file="/include/includeFooter.jsp" %>        
    </body>
</html>