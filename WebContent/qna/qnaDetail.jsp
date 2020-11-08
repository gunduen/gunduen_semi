<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!--  디렉티브(태그라이브러리) 작성 -->
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
<title>근두운 QnA - 상세보기</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"></script>
<style>
    section
    {
        text-align: center;
    }
    article>table
    {
        width: 100%;
        border: 1px solid black;
        box-sizing: border-box;
    }
    a
    {
        text-decoration-line: none;
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
        <h1>근두운 Q&amp;A</h1>
        <h5>빠른 시일내에 답변드리도록 노력하겠습니다.</h5>
        <article>
        <br>
            <h3>Question</h3>
            <div id="div_content">
                <div style="font-size:20px;word-break:break-all; margin: 0px auto; width:60%; border:5px solid #d9efff">
                	<b>Q : ${content.qnaNoticeSubject }</b>
                </div>
                <br>
                <textarea style="font-size:20px; resize:none; word-break:break-all; margin: 0px auto; width: 60%; height: 270px; background-color:#d9efff; border:none" readonly>${content.qnaNoticeContent }</textarea>
                <br>
            </div>
            <h3>Answer</h3>
            <div id="div_answer">
                <div id="answer_title" style="font-size:20px;word-break:break-all; margin: 0px auto; width:60%; border:5px solid #d9efff">
                	<b>A : ${answer.answerTitle }</b>
                	</div>
                <br>
                <textarea style="font-size:20px; resize:none; word-break:break-all; margin: 0px auto; width: 60%; height: 270px; background-color:#d9efff; border:none" readonly>${answer.answerContents }</textarea>
                <br>
            </div>
        </article>
        <br>
        <article>
        
	        <!-- 로그인 아이디와 게시글 아이디 확인  -->
        	<c:if test="${ sessionScope.customer.customer_Id == content.customerId }">
        		<a href="/qna/updateform?qnaNo=${content.qnaNoticeNo }"><input class="get-started-btn" style="border:none; width:106px;" type="button" value="수정"></a>
        		<a href="/qna/delete?qnaNo=${content.qnaNoticeNo }"><input class="logout-btn" style="border:none; width:106px; margin-left:10px" type="button" value="삭제" onclick="return del();"></a>
        		
        	</c:if>
        	<!-- 관리자인지 확인  -->
        	<c:if test="${ sessionScope.customer.adminCheck == 1 }">
        	<form action="/qna/qnaReplyWrite.jsp" method="post" style="display:inline">
        		<input name = qnaNoticeNo type="hidden" value=${content.qnaNoticeNo }>
        		<input name ="replyCheck" type="hidden" value="complete">
        		<input type="submit" class="get-started-btn" style="border:none" value="답변등록">
        		</form>
        		
        		<form action="/qna/replyupdateform?qnaNo=${content.qnaNoticeNo }" method="post" style="display:inline">
        		<input name = qnaNoticeNo type="hidden" value=${content.qnaNoticeNo }>
        		<input type="submit" class="get-started-btn" style="border:none; margin-left:10px" value="답변수정">
        		</form>
        		
        		<form action="/qna/replydelete?qnaNo=${content.qnaNoticeNo }" method="post" style="display:inline" onsubmit="return replydel();">
        		<input name = qnaNoticeNo type="hidden" value=${content.qnaNoticeNo }>
        		<input name ="replyCheck" type="hidden" value="wait">
        		<input type="submit" class="get-started-btn" style="border:none; margin-left:10px" value="답변삭제" >
        		</form><br><br>
        		<a href="/qna/updateform?qnaNo=${content.qnaNoticeNo }"><input class="get-started-btn" style="border:none; width:106px;" type="button" value="수정"></a>
        		<a href="/qna/delete?qnaNo=${content.qnaNoticeNo }"><input class="logout-btn" style="border:none; width:106px; margin-left:10px;" type="button" value="삭제" onclick="return del();"></a>
        	</c:if>
            <a href="/qna/list"><input class="get-started-btn" style="border:none; background-color:#d8d8d8; margin-left:10px;" type="button" value="목록으로"></a>
        </article>
    </section>
    <aside>
    
    </aside>
    <footer>
    	<%@include file="../include/includeFooter.jsp" %>
    </footer>
    <script>
		function del() {
			return confirm("정말로 삭제하시겠습니까?")
			}
		
		function replydel() {
			return confirm("정말로 삭제하시겠습니까?")
			}
	</script>
	<div id="preloader"></div>
</body>
</html>