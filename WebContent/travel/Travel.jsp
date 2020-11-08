<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<link
   href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
   rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="../assets/vendor/bootstrap/css/bootstrap.min.css"
   rel="stylesheet">
<link href="../assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="../assets/vendor/boxicons/css/boxicons.min.css"
   rel="stylesheet">
<link href="../assets/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="../assets/vendor/owl.carousel/assets/owl.carousel.min.css"
   rel="stylesheet">
<link href="../assets/vendor/animate.css/animate.min.css"
   rel="stylesheet">
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
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
   src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"
   src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=0g63w7xmeu&submodules=geocoder"></script>
<meta charset="UTF-8">
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link
   href="https://fonts.googleapis.com/css2?family=Gamja+Flower&display=swap"
   rel="stylesheet">
<script
   src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a8e5007416460a5bee56aaba2bb1ea6d&libraries=services"></script>



<title>예약하기</title>
<style>
section {
   width: 100%;
   height: 1000px;
}

.btn {
   box-shadow: 0 5px 10px 0 rgba(0, 0, 0, 0.3);
   color: #fff;
   background-color: #a3d4f7;
   /*  background-image: linear-gradient(to left, #6753fc, #5b98ff); */
   border: 0px;
   /* color: white; */
   padding: 10px 30px;
   text-align: center;
   border: 1px solid gray;
}

#article0 {
   text-align: center;
}

#article1 {
   text-align: center;
}

#article2 {
   text-align: center;
}

form {
   text-align: center;
}

h1 {
   font-family: 'Do Hyeon', sans-serif;
}

h2 {
   font-family: 'Do Hyeon', sans-serif;
}

#package_Date {
   padding-left: 20px;
}

.hawi {
   float: left;
   text-align: center;
   border: 1px solid white;
}

#sido {
   height: 35px;
}

#roadAddr {
   height: 35px;
}

.wrap1 {
   display: table;
   margin: 0 auto;
   vertical-align: middle;
}

p {
   font-family: 'Do Hyeon', sans-serif;
}

#aa {
   width: 200px;
}

#addrSearchBtn {
   color: #fff;
   background-color: #a3d4f7;
}

#logo {
   width: 100px;
   height: 130px;
}

#btnqq {
   height: 55px;
   width: 972px;
   text-align: center;
}
</style>
</head>
<body>
   <header>
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
                  <li><a href="/notice/list">Notice</a></li>
                  <li><a href="/driver/autoMyinfo?area=서울">Driver</a></li>
                  <li><a href="/qna/list">Q&A</a></li>
                  <li><a href="/review/list?reviewArea=서울">Review</a></li>
                  <li></li>
               </ul>
            </nav>
            <!-- .nav-menu -->

            <!-- admin 로그인시 header -->
            <c:if test="${sessionScope.customer.adminCheck == 1 }">
               <a href="/admin/driverList" class="get-started-btn">마이페이지</a>
               <a href="/member/logout" class="logout-btn"
                  onclick="return warning();">로그아웃</a>
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
            &nbsp;&nbsp; <img src="../assets/img/happy.png"
                  style="height: 40px">
            </c:if>

            <!-- 고객/기사 로그인시 header -->
            <c:if test="${sessionScope.customer.adminCheck < 1 }">
               <a href="/myPage/CustomerMyPage.jsp" class="get-started-btn">마이페이지</a>
               <a href="/member/logout" class="logout-btn"
                  onclick="return warning();">로그아웃</a>
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
            &nbsp;&nbsp; <img src="../assets/img/happy.png"
                  style="height: 40px">
            </c:if>

            <c:if test="${sessionScope.driver ne null}">
               <a href="/myPage/DriverMyPage.jsp" class="get-started-btn">마이페이지</a>
               <a href="/member/logout" class="logout-btn"
                  onclick="return warning();">로그아웃</a>
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
            &nbsp;&nbsp; <img src="../assets/img/happy.png"
                  style="height: 40px">
            </c:if>
            <c:if
               test="${sessionScope.driver eq null && sessionScope.customer eq null}">
               <a href="/login/Customerlogin.jsp" class="get-started-btn">고객로그인</a>
               <a href="/login/DriverLogin.jsp" class="get-started-btn">기사로그인</a>
            &nbsp;&nbsp; <img src="../assets/img/smile.png"
                  style="height: 40px">
            </c:if>

         </div>
      </header>
      <!-- End Header -->
   </header>
   <section>
      <article id="article0">
         <a href=""><img src="../img/MainPageImg/gunduen.png" id="logo"></a>
      </article>
      <form name="form" action="/travel/pay.jsp" method="post">
         <article id="article1">
            <h1>예약하기</h1>
         </article>
         <article id="article2">

            <div id="addsearch">
               <input id="addrSearchBtn" type="button" onclick="addSearch();"
                  value="픽업장소 선택" class="btn btn-default"> <br> <br>
            </div>
         </article>



         <div class="wrap1">

            <article>


               <div class="hawi">

                  <input type="text" id="sido" name="sido" class="form-control"
                     style="width: 200px; display: inline-block;" placeholder="시도"
                     value="${sido }"><br>
               </div>
               <div class="hawi">
                  <input type="text" id="roadAddr" name="roadAddr"
                     class="form-control" style="width: 200px; display: inline-block;"
                     placeholder="도로명주소" value="${address }"><br>

               </div>
               <div class="hawi">
                  <select class="form-control" id="bb" name="package_Item"
                     style="height: 35px">
                     <option value="3시간 : 80,000원">3시간 : 80,000원</option>
                     <option value="5시간 : 120,000원">5시간 : 120,000원</option>
                     <option value="종일권(10시간) : 180,000원">종일권(10시간) :
                        180,000원</option>
                  </select><br>
               </div>
               <div class="hawi">
                  <input class="form-control" type="date" name="package_Date"
                     id="package_Date" value="${packageDate }" style="height: 35px"><br>
               </div>


               <div class="hawi">
                  <select class="form-control" name="driverName" id="aa"
                     style="height: 35px">
                     <c:forEach items="${tList }" var="driver">
                        <option value="${driver.driverName}+${driver.driverId}">${driver.driverName }</option>
                     </c:forEach>
                  </select>
               </div>
				
               <%-- <div class="hawi">
               <select class="form-control" name="driverId" id="aa" style="height: 35px">
                  <c:forEach items="${tList }" var="driver">
                     <option value="${driver.driverId}">${driver.driverName }</option>
                  </c:forEach>
                  </select>
               </div> --%>



               <!-- <select id="aa" name="driverName">
               <option value="서이석">서이석</option>
               <option value="김재혁">김재혁</option>
            </select><br> -->




            </article>


            <div id="map" style="width: 100%; height: 350px; margin-top: 10px;"></div>
            <br> <br>
            <div class="hawi">
               <input type="hidden" name="coordx" value="${coordx}"> <input
                  type="hidden" name="coordy" value="${coordy }"> <input
                  class="btn btn-default" type="submit" value="예약 및 결제 하기"
                  id="btnqq" onclick="return question();">
            </div>
            <br> <br> <br> <br>


            <article id="article4">

               <!-- <div> -->
               <h2>예약 변경 및 취소</h2>
               변경 가능한 요금 제도 - 예약시간 기준 24시간 전까지 위약금 없이 변경, 취소 할 수 있습니다.<br>
               24시간이 지난 이후에는 추가 요금이 적용 됩니다.<br> 고객이 노쇼하는(오지 않는) 경우에는
               예약금(50,000원)이 반환 불가합니다.
               <!-- </div> -->


               <br> <br> <br> <br>

            </article>

         </div>
      </form>

   </section>



   <script>
      var date = new Date();
      var year = date.getFullYear();
      var month = new String(date.getMonth() + 1);
      var day = new String(date.getDate() + 7);

      // 한자리수일 경우 0을 채워준다. 
      if (month.length == 1) {
         month = "0" + month;
      }
      if (day.length == 1) {
         day = "0" + day;
      }

      var Today = year + "-" + month + "-" + day;

      var coords = '${coords }';
      var sido = '${sido }';
      var roadAddr = '${address }';
      var packageDate = '${packageDate }';

      /* $("#package_Date").datepicker({dateFormat : "yy-mm-dd",minDate : 0}).val() */
      $("#package_Date").attr("min", Today);

      function addSearch() {
         new daum.Postcode({
            // 주소 찾기  API가 한 일은 주소검색창 팝업 띄어주고
            // 검색결과 항목을 선택했을 때 선택한 값에 대한 데이터를 보내주는 역할
            // 자바스크립트 객체(복습)
            oncomplete : function(data) {
               // 팝업에서 검색결과 항목을 클릭을 하면 그 때의 데이터가 data 매개변수로
               // 넘어오고 console.log로 그 data를 출력해봄
               // 내가 선택한 input태그에 api서버가 응답한 값을 셋팅을 해줌
               sido = data.sido;
               roadAddr = data.address;
               $("#roadAddr").val(roadAddr);
               $("#sido").val(sido);
               //location.href="/travel/travelList?sido="+sido+"&address="+roadAddr;
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
               // 예제를 참고하여 다양한 활용법을 확인해 보세요.
               geocoder.addressSearch(data.address, function(results,
                     status) {
                  // 정상적으로 검색이 완료됐으면
                  if (status === daum.maps.services.Status.OK) {
                     var result = results[0]; //첫번째 결과의 값을 활용
                     // 해당 주소에 대한 좌표를 받아서
                     coords = new daum.maps.LatLng(result.y, result.x);
                     // 지도를 보여준다.
                     mapContainer.style.display = "block";
                     map.relayout();
                     // 지도 중심을 변경한다.
                     map.setCenter(coords);
                     // 마커를 결과값으로 받은 위치로 옮긴다.
                     marker.setPosition(coords)
                  }
               });
            }
         }).open();
      }
      var mapContainer = document.getElementById('map'), // 지도를 표시할 div
      mapOption = {
         center : new daum.maps.LatLng('${coordx}', '${coordy}'), // 지도의 중심좌표
         level : 1
      // 지도의 확대 레벨
      };
      //지도를 미리 생성
      var map = new daum.maps.Map(mapContainer, mapOption);
      //주소-좌표 변환 객체를 생성
      var geocoder = new daum.maps.services.Geocoder();
      //마커를 미리 생성
      var marker = new daum.maps.Marker({
         position : new daum.maps.LatLng('${coordx}', '${coordy}'),
         map : map
      });
      var geocoder = new kakao.maps.services.Geocoder();
      var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
      infowindow = new kakao.maps.InfoWindow({
         zindex : 1
      }); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
      kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
         coords = mouseEvent.latLng;
         searchDetailAddrFromCoords(mouseEvent.latLng, function(result,
               status) {
            if (status === kakao.maps.services.Status.OK) {
               var detailAddr = !!result[0].road_address ? '<div>도로명주소 : '
                     + result[0].road_address.address_name + '</div>'
                     : '';
               detailAddr += '<div>지번 주소 : '
                     + result[0].address.address_name + '</div>';
               var content = '<div class="bAddr">'
                     + '<span class="title">법정동 주소정보</span>'
                     + detailAddr + '</div>';
               // 마커를 클릭한 위치에 표시합니다 
               marker.setPosition(mouseEvent.latLng);
               marker.setMap(map);
               // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
               infowindow.setContent(content);
               infowindow.open(map, marker);
               $("#roadAddr").val(result[0].road_address.address_name);
               // 해당 주소에 대한 좌표를 받아서
            }
         });
      });
      // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
      kakao.maps.event.addListener(map, 'idle', function() {
         searchAddrFromCoords(map.getCenter(), displayCenterInfo);
      });
      function searchAddrFromCoords(coords, callback) {
         // 좌표로 행정동 주소 정보를 요청합니다
         geocoder.coord2RegionCode(coords.getLng(), coords.getLat(),
               callback);
      }
      function searchDetailAddrFromCoords(coords, callback) {
         // 좌표로 법정동 상세 주소 정보를 요청합니다
         geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
      }
      // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
      function displayCenterInfo(result, status) {
         if (status === kakao.maps.services.Status.OK) {
            var infoDiv = document.getElementById('centerAddr');
            for (var i = 0; i < result.length; i++) {
               // 행정동의 region_type 값은 'H' 이므로
               if (result[i].region_type === 'H') {
                  infoDiv.innerHTML = result[i].address_name;
                  break;
               }
            }
         }
      }
      $("#package_Date").on(
            "change keyup paste",
            function() {
               packageDate = $("#package_Date").val();
               if (roadAddr != 0 && sido != 0 && coords != 0
                     && packageDate != 0) {
                  location.href = "/travel/travelList?package_Date="
                        + packageDate + "&address=" + roadAddr
                        + "&sido=" + sido + "&coords=" + coords;
               } else {
                  alert("주소 검색을 해주세요");
                  return false;
               }
            });
      function question() {
         if (roadAddr != 0 && sido != 0 && coords != 0 && packageDate != 0
               && roadAddr != null && sido != null && coords != null
               && packageDate != null) {
            var question = confirm("입력하신 내용으로 예약을 하시겠습니까?");
            if (question) {
               return true;
            } else {
               return false;
            }
         } else {
            var quest = alert("모든 내용을 입력해주세요");
            if (quest) {
               return false;
            } else {
               return false;
            }
         }
      }
   </script>
   <div id="preloader"></div>
</body>
<footer></footer>
</html>