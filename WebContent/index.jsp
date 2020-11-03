<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>

<title>메인페이지</title>
    <style>
        div{
            border: 1px solid black;
            box-sizing: border-box;
        }
        header {
            height: 150px;
        }
        nav {
            height: 100px;
        }
        article{
            height: 300px;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        #header1{
            width: 70%;
            float: left;
        }
        #header2{
            width: 10%;
            float: left;
        }
        #header3{
            width: 20$;
            float: left;
        }
        #menu {
            margin: 0;
            padding: 0;
            height: 100%;
            overflow: hidden;
        }
        #menu li {
            width: 25%;
            height: 100%;
            float: left;
            text-align: center;
            list-style: none;
            border: 1px solid black;
        }
        #left{
            float: left;
            width: 50%;
        }
        #right{
            float: right;
            width: 50%;
        }
        #right_top{
            width: 50%;
            height: 50%;
        }
        #right_bottom{
            width: 50%;
            height: 50%;
        }
        .btn3 {
            background-color: cornflowerblue;    
            border: none;
            color: white;
            padding: 15px 30px;
            text-align: center;
            
        }
        #rev2 {
            font-size: 30px;
            
        }
        
        <!-- -->
        *{margin:0;padding:0;}
	    ul,li{list-style:none;}
	    .slide{height:300px;overflow:hidden;}
	    .slide ul{width:calc(100% * 4);display:flex;animation:slide 8s infinite;} /* slide를 8초동안 진행하며 무한반복 함 */
	    .slide li{width:calc(100% / 4);height:300px;}
	    
	    @keyframes slide {
	      0% {margin-left:0;} /* 0 ~ 10  : 정지 */
	      10% {margin-left:0;} /* 10 ~ 25 : 변이 */
	      25% {margin-left:-100%;} /* 25 ~ 35 : 정지 */
	      35% {margin-left:-100%;} /* 35 ~ 50 : 변이 */
	      50% {margin-left:-200%;}
	      60% {margin-left:-200%;}
	      75% {margin-left:-300%;}
	      85% {margin-left:-300%;}
	      100% {margin-left:0;}
	      }
    </style>
</head>
<body>
    <c:if test="${sessionScope.driver ne null || sessionScope.customer ne null}">
		 <c:if test="${sessionScope.customer ne null }"> [고객 : ${sessionScope.customer.customer_Id }]님 환영합니다.</c:if>
		 <c:if test="${sessionScope.driver ne null }">[기사 : ${sessionScope.driver.driverId }]님 환영합니다.</c:if>
        <header>
            <div id="header1"></div>
            <div id="header2">
                <a href="/member/logout"><input type="button" onclick="return warning();" value="로그아웃"></a>
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
            </div>
            <div id="header3">
            <c:if
					test="${sessionScope.customer.adminCheck eq 1 }">
					<a href="/admin/driverList"><input type="button" value="마이페이지"></a>
				</c:if>
				<c:if
					test="${sessionScope.customer.adminCheck eq 0}">
					<a href="/myPage/CustomerMyPage.jsp"><input type="button" value="마이페이지"></a>
				</c:if>
				
				<%-- <a
						href="/mypage/travel?customerId=${sessionScope.customer.customer_Id }"><input
						type="button" value="마이페이지"></a>
 --%>


				<c:if test="${sessionScope.driver ne null}">
            	<a href="/myPage/DriverMyPage.jsp"><input type="button" value="마이페이지"></a>
            </c:if>
            </div>
        </header>
        <section>
            <nav>
                <ul id="menu">
                    <li><a href="/notice/list">공지사항</a></li>
                    <li><a href="#">기사소개</a></li>
                    <li><a href="/review/list?reviewArea=서울">사용자 후기</a></li>
                    <li><a href="/qna/list">Q&A</a></li>
                </ul>
            </nav>
            <article>
                <div id="rev1"><h3>Welcome to the Cloud</h3></div>
                <div id="rev2">
                    <img src="img/MainPageImg/cloud.PNG">근두운
                </div>
                 <a href="/travel/Travel.jsp"><div id="rev3"><input class="btn3" type="button" value="예약하기"></div></a>
            </article>
            <article>
                <div id="contents">
					<div id="left">
						<div class="slide">
							<ul>
								<li><img
									src="../Day_07_JS_JQuery/WebContent/img/DOM%EA%B5%AC%EC%A1%B0.JPG"></li>
								<li><img
									src="../Day_07_JS_JQuery/WebContent/img/KakaoTalk_Photo_2020-11-03-16-37-19.png"></li>
								<li><img
									src="../Day_07_JS_JQuery/WebContent/img/secure_coding.jpg"></li>
								<li></li>
							</ul>
						</div>
					</div>
					<div id="right">
                        <div id="right_top">행복한 택시여행 떠나 보실라우?</div>
                        <div id="right_bottom">근두운: 손오공이 근두운을 타고 팔도유람하듯 택시를 타고 자유롭게 여행할 수 있게 해주는 서비스, 어디든 떠날 수 있는 국내 자유여행</div>
                    </div>
                </div>
            </article>
        </section>
        <footer>
        </footer>
    </c:if>
    <c:if test="${sessionScope.driver eq null && sessionScope.customer eq null}">
        <header>
            <div id="header1"></div>
            <div id="header2">
                <a href="/login/Customerlogin.jsp"><input type="button" value="고객 로그인"></a>
                <a href="/login/DriverLogin.jsp"><input type="button" value="기사 로그인"></a>
            </div>
            
        </header>
        <section>
            <nav>
                <ul id="menu">
                    <li><a href="/notice/list">공지사항</a></li>
                    <li><a href="#">기사소개</a></li>
                    <li><a href="/review/list?reviewArea=서울">사용자 후기</a></li>
                    <li><a href="#">Q&A</a></li>
                </ul>
            </nav>
            <article>
                <div id="rev1"><h3>Welcome to the Cloud</h3></div>
                <div id="rev2">
                    <img src="img/MainPageImg/cloud.PNG">근두운
                </div>
                <div id="rev3"><input class="btn3" type="button" value="예약하기"></div>
            </article>
            <article>
                <div id="contents">
					<div id="left">
						<div class="slide">
							<ul>
								<li><img
									src="https://t1.daumcdn.net/cfile/blog/216CB83A54295C1C0E?original" width="500px;" height="300px;"></li>
								<li><img
									src="https://i.pinimg.com/originals/b7/2f/0b/b72f0b16f4a84cc8e649f6bce9048bc8.jpg"  width="500px;" height="300px;"></li>
								<li><img
									src="https://dispatch.cdnser.be/cms-content/uploads/2019/09/09/50e20ad4-f940-4f93-830b-8501146b4488.jpg"  width="500px;" height="300px;"></li>
								<li><img src="https://dispatch.cdnser.be/cms-content/uploads/2019/09/09/4657b750-ce06-4136-91af-40d922a327c6.jpg" width="500px;" height="300px;"></li>
							</ul>
						</div>
					</div>
					<div id="right">
                        <div id="right_top">행복한 택시여행 떠나 보실라우?</div>
                        <div id="right_bottom">근두운: 손오공이 근두운을 타고 팔도유람하듯 택시를 타고 자유롭게 여행할 수 있게 해주는 서비스, 어디든 떠날 수 있는 국내 자유여행</div>
                    </div>
                </div>
            </article>
        </section>
        <footer>
        </footer>
    </c:if>
</body>
</html>