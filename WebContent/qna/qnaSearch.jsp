<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  디렉티브(태그라이브러리) 작성 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>

<head>
<meta charset="UTF-8">
<title>근두운 QnA - 목록</title>
	<style>
	    section
	    {
	        text-align: center;
	    }
	    article>table
	    {
            border: 1px solid black;
            width: 60%;
            margin: auto;
            text-align: center;
            margin-bottom: 20px;
        }
	    a
	    {
	        text-decoration-line: none;
	    }
	    #write
	    {
	        float: right;
	    }
	    th
	    {
	        background-color: lightgray;
	        height: 40px;
	    }
	    #dfdf{
	    text-align : center;
	    }
	    #qna:hover{
	    background : yellow;
	    }
	    tr {
	    height : 50px;
	    }
	</style>
	<script>
	function check() {
		var test = document.getElementById('search').value;
		if(test == "" || test == null || test == " ") {
			alert("검색어를 입력해주세요.");
			return false;
		}
		else return true;
	}
    </script>
</head>
	<body>
	<header>
        <nav>
            
        </nav>
    </header>
    <section>
        <h1>Q&amp;A</h1>
        <h5>빠른 시일내에 답변드리도록 노력하겠습니다.</h5>
        <article>
            <table>
                <tr>
                    <th>글번호</th>
                    <th>제목</th>
                    <th>작성자</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>답변여부</th>
                </tr>
                <c:forEach items="${qList }" var="qna"  varStatus="status" >
                	<tr id="qna" onClick="location.href='/qna/detail?qnaNoticeNo=${qna.qnaNoticeNo }'">
                		<%-- <td>${qna.qnaNoticeNo }</td> --%>
                		<td>${pageNum - status.index }</td>
                		<td>${qna.qnaNoticeSubject }</td>
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
        <br><br>
        <article>
            <c:if test="${ sessionScope.customer.customer_Id ne null || sessionScope.driver.driverId ne null }">
        		<a href="qnaWrite.html"><input type="button" id="write" value="글쓰기" name="글쓰기"></a><br>
        	</c:if>
        </article>
        <article>
        <form action="/qna/search" method="get" onsubmit="return check()">
            <select id="type" name="type">
           		<option value="QNANOTICE_SUBJECTS">제목</option>
                <option value="QNANOTICE_CONTENTS">내용</option>
                <option value="CUSTOMER_ID">작성자(고객)</option>
                <option value="DRIVER_ID">작성자(기사)</option>
             </select>
            <input type="text" id="search" name="search" size="50" placeholder="검색어를 입력하세요">
            <input type="submit" value="검색">
            </form>
            </article>
    </section>
    <aside>
    
    </aside>
    <footer>
    
    </footer>
	</body>
</html>