<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
   
   <!-- Font -->
   
    <title>고객 로그인</title>
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
       <%@include file="../include/includeHeader.jsp" %>
        <section>
            <article>
            <br><br><br><br>
                <div id="wrap" class="col-md-12" style="width: 100%;">
                    <h4 style="font-family: 'Do Hyeon', sans-serif;">고객 로그인 페이지</h4>
                    <a href="#" target="_blank"><img src="../img/MainPageImg/gunduen.png" style="width: 200px; height: 200px;" id="logo"></a>
                   <div class="col-md-2" style="margin: 0 auto;">
                      <form class="form-horizontal" action="/customer/login" method="post">
                         <input type="text" name="userId" id="userId" class="form-control" placeholder="아이디를 입력하세요."><br>
                         <input type="password" name="userPwd" style="margin-top: -10px;" class="form-control" id="userPwd" placeholder="비밀번호를 입력하세요.">
                         <br>
                         <input type="submit" class="btn btn-outline-primary btn-lg btn-block" style="margin-top: -10px; font-family: 'Do Hyeon', sans-serif;" value="로그인" ><br>
                          <a href="/login/CustomerEnroll.html"><input type="button" class="btn btn-outline-primary btn-lg btn-block" style="margin-top: -10px; font-family: 'Do Hyeon', sans-serif;" value="회원가입"></a><br>
                          <a href="CustomerFindId.jsp" style="color: #a3d4f7;" id="hoverA">아이디 찾기</a> / 
                          <a href="CustomerFindPw.jsp" style="color: #a3d4f7;" id="hoverA">비밀번호 찾기</a>
                   </form>
                   </div>
                </div>
           
           

               <!-- 
                    <div class="form-group">
                       <label>아이디 : <input type="text" name="userId" id="userId" placeholder="아이디를 입력하세요."></label>
                    </div><br>
                      <label>비밀번호 : <input type="password" name="userPwd" id="userPwd" placeholder="비밀번호를 입력하세요."></label><br>
                    
                </form>
                 --> 
                
            </article>
         
        </section>
   <%@include file="../include/includeFooter.jsp" %>
   
   <div id="preloader"></div>
    </body>
</html>