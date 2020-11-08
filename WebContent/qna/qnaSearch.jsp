<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  디렉티브(태그라이브러리) 작성 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<head>
<meta charset="UTF-8">
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
<title>근두운 QnA - 목록</title>
	<style>
	    section
	    {
	        text-align: center;
	    }
	    article>table
	    {
            border: 1px solid white;
            width: 60%;
            margin: auto;
            text-align: center;
            margin-bottom: 20px;
        }
	    a
	    {
	        text-decoration-line: none;
	    }
	    th
	    {
	        background-color: #a3d4f7;
	        height: 40px;
	    }
	    #dfdf{
	    text-align : center;
	    }
	    #qna:hover{
	    background : #d9efff;
	    }
	    tr {
	    height : 50px;
	    }
	    #title_th {
	    	width: 50%;
	    }
	</style>
	<script>
	function check() {
		var test = document.getElementById('search').value;
		if(test == "" || test == null || test == " ") {
			alert("검색어를 입력해주세요.");
			return false;
		}
		return true;
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
                  <li class="active"><a href="/qna/list">Q&A</a></li>
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
    </header>
    <br><br>
    <section>
        <h1>Q&amp;A</h1>
        <h5>빠른 시일내에 답변드리도록 노력하겠습니다.</h5>
        <article>
        <br>
            <table class="table" style="width:60%;">
                <tr>
                    <th>글번호</th>
                   	<th id="title_th">제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>답변여부</th>
                </tr>
                <c:forEach items="${qList }" var="qna"  varStatus="status" >
                	<tr id="qna" onClick="location.href='/qna/detail?qnaNoticeNo=${qna.qnaNoticeNo }'">
                		<%-- <td>${qna.qnaNoticeNo }</td> --%>
                		<td>${pageNum - status.index }</td>
                		<c:choose>
                           <c:when test="${fn:length(qna.qnaNoticeSubject) > 25}">
                              <td>
                                 <c:out value="${fn:substring(qna.qnaNoticeSubject,0,25)}" />
                                 <c:out value="..." />
                              </td>
                           </c:when>
                           <c:otherwise>
                              <td><c:out value="${ qna.qnaNoticeSubject }" /></td>
                           </c:otherwise>
                        </c:choose>
                		<c:choose>
                			<c:when test="${qna.customerId ne null }">
                				<td>${qna.customerId }</td>
                			</c:when>
                			<c:otherwise>
                				<td>${qna.driverId }</td>
                			</c:otherwise>
                		</c:choose>
                		<td>${qna.qnaNoticeDate }</td>
                		<td>${qna.qnaNoticeHits }</td>
                		<td>${qna.qnaNoticeCheck }</td>
                	</tr>
                </c:forEach>
            </table>
        </article>
        <tr id="dfdf">
                	<td colspan="4" align="center">
                	${pageNavi }
                	</td>
                </tr>
                <article style="margin-left:880px;">
        <c:if test="${ sessionScope.customer.customer_Id ne null || sessionScope.driver.driverId ne null }">
        		<a href="qnaWrite.jsp"><input class="get-started-btn" style="border:none; align:center;" type="button" id="write" value="질문등록" name="질문등록"></a>
        	</c:if>
        </article>
        <article>
        <form action="/qna/search" method="get" onsubmit="return check()">
            <select id="type" name="type" style="height:30px;">
           		<option value="QNANOTICE_SUBJECTS">제목</option>
                <option value="QNANOTICE_CONTENTS">내용</option>
                <option value="CUSTOMER_ID">작성자(고객)</option>
                <option value="DRIVER_ID">작성자(기사)</option>
             </select>
            <input type="text" id="search" name="search" size="50" placeholder="검색어를 입력하세요">
            <input type="submit" style="border:none;  margin-left:10px;" class="get-started-btn" value="검색">
            </form>
            </article>
    </section>
    <aside>
    
    </aside>
    <footer>
    	 <%@include file="../include/includeFooter.jsp" %>
    </footer>
    <div id="preloader"></div>
	</body>
</html>