<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>쪽지 보내기</title>
<style>
div {
	border: 1px solid none;
	box-sizing: border-box;
}

body {
	width: 1800px;
	height: 1080px;
}

header {
	width: 100%;
	height: 10%;
	border: 1px solid black;
	text-align: center;
	box-sizing: border-box;
}

section {
	width: 100%;
	height: 50%;
	border: 1px solid black;
	box-sizing: border-box;
	text-align: center;
}

nav {
	border: 1px solid black;
	height: 50px;
	background-color: skyblue;
}

nav a {
	color: white;
	font-size: 1.2em;
	text-decoration: none;
}

#menu {
	margin: 0;
	padding: 0;
	height: 100%;
	overflow: hidden;
	border: 1px solid black;
	width: 1600px;
	margin: 0 auto;
}

#menu li {
	width: 25%;
	height: 100%;
	float: left;
	text-align: center;
	list-style: none;
	line-height: 50px;
	vertical-align: middle;
}

#menu li:hover {
	background-color: steelblue;
}

.article:first-of-type {
	float: left;
	background-color: lightblue;
	height: 90%;
}

.article:last-of-type {
	width: 80%;
	float: left;
	margin: 20px 50px;
	text-align: left;
}

.side ul {
	padding: 0 30px;
}

.side ul li {
	list-style: none;
	height: 50px;
	font-size: 1.2em;
	margin: 15% 0;
}

.side ul li>a {
	color: white;
}

.side ul li>a:hover {
	color: blue;
	text-decoration: none;
}

.btn1 {
	background-color: cornflowerblue;
	border: none;
	color: white;
	padding: 0 20px;
	text-align: center;
}

#title {
	font-size: 2em;
	text-align: left;
}

.send {
	width: 1030px;
	text-align: right;
}

#btn2 {
	background-color: cornflowerblue;
	border: none;
	color: white;
	padding: 0 20px;
	text-align: center;
}

footer {
	width: 100%;
	height: 10%;
	border: 1px solid black;
	text-align: center;
	line-height: 100px;
}
</style>
<script>
	function checkValue(){
		var mInfo = document.sendMessageForm;
		
		if(mInfo.title.value==""){
			alert('제목을 입력해주세요');
			return false;
		}
		if(mInfo.userId.value==""){
			alert('쪽지를 보낼 아이디를 입력해주세요.');
			return false;
		}
	
		if(mInfo.idCheck.value=="idUncheck"){
			alert('보낼 아이디가 있는지 확인해주세요.');
			return false;
		}
		if (mInfo.contents.value =="") {
			alert('내용을 입력해주세요.');
			return false;
		}
	}
	//아이디 중복확인 클릭시 창을 띄우는 fucntion
	function openIdChk() {
		window.name = "parentForm";
		window.open("/message/IDCheckForm.jsp", "chkForm","width=500, height=300, resizable=no, scrollbars=no");
	}
	//사용하기 버튼 누르기 전까지는 계속 idUncheck
	function inputIdChk(){
		document.sendMessageForm.idCheck.value="idUncheck";
	}
</script>
</head>
<body>
	<header>
		<div id="title">header</div>
	</header>
	<section>
		<nav>
			<ul id="menu">
				<li><a href="/noticeList.html">공지사항</a></li>
				<li><a href="/driverList.html">기사소개</a></li>
				<li><a href="/reviewList.html">사용자 후기</a></li>
				<li><a href="/qnaList.html">Q&A</a></li>
			</ul>
		</nav>
		<article class="article ">
			<div class="side">
				<ul>
					<li><a href="messageForm.html"><input type="submit"
							value="쪽지 쓰기" class="btn1"></a></li>
					<c:if test="${sessionScope.customer ne null && (sessionScope.driver eq null) }">
					<li><a href="/message/receiverList?receiver=${ sessionScope.customer.customer_Id}">받은 쪽지함</a></li>
					<li><a href="/message/senderList?sender=${ sessionScope.customer.customer_Id }">보낸 쪽지함</a></li>
					</c:if>
					<c:if test="${sessionScope.customer eq null  && (sessionScope.driver ne null) }">
					<li><a href="/message/receiverList?receiver=${ sessionScope.driver.driverId}">받은 쪽지함</a></li>
					<li><a href="/message/senderList?sender=${ sessionScope.driver.driverId }">보낸 쪽지함</a></li>
					</c:if>
				</ul>
			</div>
		</article>
		<article class="article">
		<div id="title">새 쪽지</div>
				<hr>
			<form action="/message/insert" name ="sendMessageForm" method="post" onsubmit="return checkValue();">
				
				<div class="message title">
					제목 <input type="text" placeholder="쪽지 제목" style="width: 850px;" id="title" name="title">
				</div>
				<div class="message title">
					받는 사람 <input type="text" placeholder="받는 사람" style="width: 800px;" id="userId" name="userId"><input type="button" value="받는이찾기 " onclick="openIdChk();">
					<input type="hidden" name="idCheck" value="idUncheck">
				</div>
				<br>
				<div class="message contents">
					내용 <br>
					<textarea style="width: 1030px; height: 200px"
						placeholder="쪽지 내용을 입력해주세요" name="contents" id="contents">
            </textarea>
				</div>
				<br>
				<div class="message send">
					<input type="submit" value="쪽지전송" id="btn2">
				</div>
			</form>
		</article>
	</section>

	<footer>
		<span id="copyright">Copyright 2020 CLOUD All rights reserved</span>
	</footer>
</body>
</html>