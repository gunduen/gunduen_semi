<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>휴대폰 중복 체크 페이지</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<script src="//code.jquery.com/jquery.min.js"></script>
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
		
		<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
		<!-- Font -->
		<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<style>
	#wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
        #useBtn{
             visibility:hidden;
             
        }
		#title, #phoneNum, #chk , #cancelBtn, #useBtn, #msg{
		font-family: 'Do Hyeon', sans-serif;
		}
		#phoneNum, #chk , #cancelBtn, #useBtn, #msg{
			font-size : 1.1em;
		}
		
	
</style>
<script>
	var httpRequest = null; //getXMLHttpRequest()함수로 생성한 객체를 저장하기위해 선언한 변수.
	
	function getXMLHttpRequest(){
		if(window.ActiveXObject){
			//Msxml2.XMLTTP -> 먼저 시도
			try{
				httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
				
			}catch(e){
				try{
					httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
					
				}catch(e1){
					httpRequest = null;}
			}
	
		}else if(window.XMLHttpRequest){
			//IE 제외하고 파이어폭스 등 브라우저에서 HTTPREQUEST구하기
			httpRequest = new XMLHttpRequest();
		}
		return httpRequest;
			
	}
	var numArr = new Array();
	function pValue(){
        document.getElementById("phoneNum").value = opener.document.driverEnrollForm.firstPhone.value+"-"+opener.document.driverEnrollForm.secondPhone.value+"-"+opener.document.driverEnrollForm.thirdPhone.value;

    }
    
    // 아이디 중복체크
    function phoneCheck(){

        var phoneNum = document.getElementById("phoneNum").value;

        console.log(phoneNum.length);
        
        if (!phoneNum) {
            alert("휴대폰 번호를 입력하지 않았습니다.");
            document.getElementById("cancelBtn").style.visibility='visible';
            document.getElementById("useBtn").style.visibility='hidden';
            document.getElementById("msg").innerHTML ="";
            document.getElementById("phoneNum").style.border = '3px solid red';
            return false;
        } 
        else if(phoneNum.length!=13){ 
            alert("휴대폰번호를 전부 입력해주세요.");
            document.getElementById("useBtn").style.visibility='hidden';
            document.getElementById("msg").innerHTML ="";
            document.getElementById("phoneNum").style.border = '3px solid red';
            return false;
        }else{
            var param="phoneNum="+phoneNum;
            httpRequest = getXMLHttpRequest();
            httpRequest.onreadystatechange = callback;
            httpRequest.open("POST", "/driver/phoneCheck", true);    
            httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
            httpRequest.send(param);
            
        }
    }
    
    function callback(){
        if(httpRequest.readyState == 4){
            // 결과값을 가져온다.
            var resultText = httpRequest.responseText;
            if(resultText == 0){
                alert("사용할수없는 번호입니다.");
                document.getElementById("cancelBtn").style.visibility='visible';
                document.getElementById("useBtn").style.visibility='hidden';
                document.getElementById("msg").innerHTML ="";
                document.getElementById("phoneNum").style.border = '3px solid red';

            } 
            else if(resultText == 1){
            	$("#phoneNum").attr('readonly',true);
                document.getElementById("cancelBtn").style.visibility='hidden';
                document.getElementById("useBtn").style.visibility='visible';
                document.getElementById("msg").innerHTML = "사용 가능한 번호입니다.";
                document.getElementById("phoneNum").style.border = '3px solid green';
            }
        }
    }
    
    // 사용하기 클릭 시 부모창으로 값 전달 
    function sendCheckValue(){
    	numArr = document.getElementById("phoneNum").value;
    	
    	var firstPhone = numArr[0]+numArr[1]+numArr[2];
        var secondPhone = numArr[4]+numArr[5]+numArr[6]+numArr[7];
        var thirdPhone = numArr[9]+numArr[10]+numArr[11]+numArr[12];
        
        if(firstPhone != '010' && firstPhone != '016' && firstPhone != '017' && firstPhone != '019'){
        	$("#phoneNum").attr('readonly',false);
        	document.getElementById("cancelBtn").style.visibility='visible';
            document.getElementById("useBtn").style.visibility='hidden';
            document.getElementById("msg").innerHTML ="";
            document.getElementById("phoneNum").style.border = '3px solid red';
        	alert('첫 번호를 제대로 입력해주세요.');
        	history.back();
        }else if(numArr[3]!='-' || numArr[8]!='-'){
        	$("#phoneNum").attr('readonly',false);
        	document.getElementById("cancelBtn").style.visibility='visible';
            document.getElementById("useBtn").style.visibility='hidden';
            document.getElementById("msg").innerHTML ="";
            document.getElementById("phoneNum").style.border = '3px solid red';
        	alert('제대로 번호를 입력해주세요(- 포함)');
        	history.back();
        }else if(!(secondPhone>=0000 && secondPhone<=9999)){
        	$("#phoneNum").attr('readonly',false);
        	document.getElementById("cancelBtn").style.visibility='visible';
            document.getElementById("useBtn").style.visibility='hidden';
            document.getElementById("msg").innerHTML ="";
            document.getElementById("phoneNum").style.border = '3px solid red';
        	alert('제대로 번호를 입력해주세요(- 포함)');
        	history.back();
        }else if(!(thirdPhone>=0000 && thirdPhone<=9999)){
        	$("#phoneNum").attr('readonly',false);
        	document.getElementById("cancelBtn").style.visibility='visible';
            document.getElementById("useBtn").style.visibility='hidden';
            document.getElementById("msg").innerHTML ="";
            document.getElementById("phoneNum").style.border = '3px solid red';
        	alert('제대로 번호를 입력해주세요(- 포함)');
        	history.back();
        }else{
        	 // 중복체크 결과인 idCheck 값을 전달한다.
            opener.document.driverEnrollForm.phoneCheck.value ="phoneCheck";
            console.log(opener.document.driverEnrollForm.phoneCheck.value);
            // 회원가입 화면의 ID입력란에 값을 전달
            opener.document.driverEnrollForm.firstPhone.value = firstPhone;
            opener.document.driverEnrollForm.secondPhone.value = secondPhone;
            opener.document.driverEnrollForm.thirdPhone.value = thirdPhone;
            
            
            opener.document.driverEnrollForm.secondPhone.readOnly = true;
            opener.document.driverEnrollForm.thirdPhone.readOnly = true;
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }   
        }
        
    }    



</script>
</head>
<body onload="pValue();">
<div id="wrap">
    <br>
    <b><font size="4" color="gray">휴대폰번호 중복체크</font></b>
    <hr size="1" width="460">
    <br>
        <form id="checkForm">
            <div class="col-xs-2"></div>
            <div class="col-xs-6"><input type="text" class="form-control" id="phoneNum" maxlength="13"></div>
            <div class="col-xs-4"><input type="button" class="btn btn-default" value="중복확인" onclick="phoneCheck()" id="chk" style="float: left;" ></div>
            <br>
            <div class="col-xs-12"><div id="msg"></div></div>
            <br>
            <div class="col-xs-12"><input id="cancelBtn" type="button" class="btn btn-danger" value="취소" onclick="window.close()"></div>
       		<br>
       		<div class="col-xs-12"><input id="useBtn" type="button" value="사용하기" class= "btn btn-info" onclick="sendCheckValue()"></div>
        </form>
        
        
    </div>
   
</body>
</html>
