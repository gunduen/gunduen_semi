<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>보내는 사람이 존재하는가?</title>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
var httpRequest = null; //getXMLHttpRequest()함수로 생성한 객체를 저장하기위해 선언한 변수.

function getXMLHttpRequest(){
	if(window.ActiveXObject){
		try{
			httpRequest = new ActiveXObject("Msxml2.XMLHTTP");
			
		}catch(e){
			try{
				httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
				
			}catch(e1){
				httpRequest = null;}
		}

	}else if(window.XMLHttpRequest){
		httpRequest = new XMLHttpRequest();
	}
	return httpRequest;
		
}
function pValue() {
	document.getElementById("userId").value = opener.document.sendMessageForm.userId.value;
}
//아이디가 있는가없는가
function idCheck() {
	var id = document.getElementById("userId").value;
	var field = document.getElementById("field").value;
	console.log(id);
	console.log(field);
	if(!id) {
		alert("아이디를 입력하지 않았습니다.");
		document.getElementById("useBtn").style.visibility='hidden';
		document.getElementById("userId").style.border = '3px solid red';
		return false;
	} else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
        alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
        document.getElementById("useBtn").style.visibility='hidden';
        document.getElementById("userId").style.border = '3px solid red';
        return false;
    } else{
        var param="id="+id +"&field="+field;
        httpRequest = getXMLHttpRequest();
        httpRequest.onreadystatechange = callback;
        httpRequest.open("POST", "/message/idCheck", true);  
        httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
        httpRequest.send(param);
    }
}

function callback(){
    if(httpRequest.readyState == 4){
        // 결과값을 가져온다.
        var resultText = httpRequest.responseText;
        if(resultText == 0){
            alert("사용할수없는 아이디입니다.");
            document.getElementById("cancelBtn").style.visibility='visible';
            document.getElementById("useBtn").style.visibility='hidden';
            document.getElementById("msg").innerHTML ="";
            document.getElementById("userId").style.border = '3px solid red';
        } 
        else if(resultText == 1){ 
        	$("#userId").attr('readonly',true);
            document.getElementById("cancelBtn").style.visibility='hidden';
            document.getElementById("useBtn").style.visibility='visible';
            document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
            document.getElementById("userId").style.border = '3px solid green';
        }
    }
}

//사용하기 클릭 시 부모창으로 값 전달 
 function sendCheckValue(){
    // 중복체크 결과인 idCheck 값을 전달한다.
    opener.document.sendMessageForm.idCheck.value ="idCheck";
    console.log(opener.document.sendMessageForm.idCheck.value);
    console.log(document.getElementById("userId").value);
   
    // 회원가입 화면의 ID입력란에 값을 전달
    opener.document.sendMessageForm.userId.value = document.getElementById("userId").value;
    opener.document.sendMessageForm.userId.readOnly = true;
    if (opener != null) {
        opener.chkForm = null;
        self.close();
    }    
 }  
</script>
</head>
<body onload="pValue();">
<div id="wrap">
    <br>
    <b><font size="4" color="gray">받는사람이 있는사람인가요?</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm">
	        <select id="field" name="field">
	        	<option value="customer">고객</option>
	        	<option value="driver">기사</option>
	        </select>
            <input type="text" name="userId" id="userId">
            <input type="button" value="찾기" onclick="idCheck()">
        </form>
        <div id="msg"></div>
        <br>
        <input id="cancelBtn" type="button" value="취소" onclick="window.close()"><br>
        <input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
    </div>
</div>    
</body>
</html>