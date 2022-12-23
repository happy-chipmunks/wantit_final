<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>
    .ttable1 {
		
        margin: auto;
		margin-top: 50px;
        width:400px;
	}
    .ttable {
		display: grid;
        margin: auto;
		margin-top: 50px;
		padding: 40px;
        align-items: center;
        justify-content: center;
		width:800px;
	}
    .tttable {
        display: grid;
		margin: auto;
        align-items: center;
        justify-content: center;
        
		padding: 40px;
		width:700px;
	}
    @font-face {
          font-family: 'NanumSquareNeo-Variable';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
          font-weight: normal;
          font-style: normal;
      }
    *{font-family: 'NanumSquareNeo-Variable';}

.kane{
    border: 0;
    outline: 0;
}
.login-warn{
 margin-top: 30px;
 text-align: center;
 color : red;
}

</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/i18n/defaults-ko_KR.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/css/bootstrap-select.min.css">
	
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
	<br><br><br>
	<br><br><br>
    <h2 class="ttable" style="color: black; font-weight: bold;">Please check your ID</h2>
    
    
    <div class="tttable">
        
        
        <c:choose>                                                                          
            <c:when test="${empty chechIdresult}">                                                 
                <h3 style="text-align:center ">조회 결과가 없습니다.</h3>                                        
            </c:when>                                                                         
            <c:otherwise>                                                                     
                <h3 style="text-align:center ">ID : ${chechIdresult.memberId}</h3>                                           
            </c:otherwise>                                                                    
        </c:choose> 
        <br>
        <br>
        <c:choose>
        <c:when test="${empty chechIdresult}">
        <button type="button" class="btn btn-primary"  onclick="history.back()">
            <span>
                <span class="">확인</span>
            </span>
        </button>
        </c:when>
        <c:otherwise>
        <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/home.do'">
            <span>
                <span class="">확인</span>
            </span>
         </button>   
        </c:otherwise> 
       </c:choose>
        
        <br><br>
        <div>
        <c:choose>
        <c:when test="${empty chechIdresult}">
            &nbsp;&nbsp;&nbsp;  아직 회원이 아니신가요?
        <button type="button" class="btn btn-link" onclick="location.href='${contextPath}/memberenroll.me'">회원가입하기</button>
        <button type="button" class="btn btn-link" onclick="location.href='${contextPath}/home.do'">홈으로 돌아가기</button>
        </c:when>
        <c:otherwise>
        &nbsp;&nbsp;&nbsp;   로그인하러 가실건가요? 
        <button type="button" class="btn btn-link" onclick="location.href='${contextPath}/loginenroll.me'">로그인 하기</button>
        <button type="button" class="btn btn-link" onclick="location.href='${contextPath}/home.do'">비밀번호 찾기</button>
        </c:otherwise>
        </c:choose>
        </div>									   	
    </div>
    
    
    
    <br><br><br>
    <br><br><br>
    
    <div class="h4 pb-2 mb-4 text-danger border-bottom" style="color: lightgray;"></div>

    
    
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script>
    
    </script>
  
</body>
</html>
