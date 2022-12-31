<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<jsp:include page="../common/navbar.jsp"/>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 크리에이터(펀딩)</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Bootstrap v5.1.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/navbar.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">

	<style>
		@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
		.col-8{font-family: 'NanumSquareNeo-Variable';}
		
		
		
		.container{
			border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
		}
		
		 div>ul>li{
			margin: auto;
			margin-left: 10px;
		    margin-right: 10px;
		    font-family: 'Do Hyeon', sans-serif;
		} 
		
		h1{display: inline;}
		
		p{
			font-size: 14px;
		}
		
		.button{
			background-color: lightgray; width: 100px; height: 35px;
		}
		
		.button:hover{
			background-color: #666666;
			color: white;
			transition: background 0.7s ease-in-out;
		}
		
		ul{list-style: none; text-align: center;}
		
    </style>

</head>
<body>
    <br><br><br>
    <div class="container">
    	<div>
    		<h1 style="display: inline;"><b>마이페이지</b></h1>&nbsp;&nbsp;&nbsp;
    		<button class="btn" onclick="openPopup()"><img src="resources/메시지.png" style="width: 40px; height: 40px;"></button>
    	</div>
    	<hr>
    	<div class="text-end">
          <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/myPageSuppoterFunding.me'">서포터</button>
          <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/myPageCreatorFunding.me'">크리에이터</button>
        </div>
       
    </div>

	<div class="row">
		<div class="col-3" style="align-self;">
			<ul>
				<li style="width: 200px; margin: auto;"><img src="${ contextPath }/resources/myPageImage/기본프로필.png" style="width: 150px; height: 150px;">
	   				<h4><b>닉네임</b>님</h4>
	   				<p id="info">팔로워 0명<br>
	   				크리에이터<br>
	   				<button class="btn btn-sm" style="background-color: lightgray;">로그아웃</button>
	   				</p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageCreatorFunding.me'"><b>진행중인펀딩</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageCreatorFunding.me'"><b>오픈예정펀딩</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageCreatorAds.me'"><b>펀딩오픈신청</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageCreatorInquiry.me'"><b>관리자문의</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageCreatorAds.me'"><b>광고 의뢰</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageCreatorAlarm.me'"><b>오픈알림</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageCreatorFollow.me'"><b>팔로우</b></button></p>
   				</li>
			</ul>
   		</div>
   	
   		<div class="col-8">
		<h4 align="left">나의 펀딩 | 진행 중인 펀딩 <button onclick="location.href='${contextPath}/fundingWrite.fund'" type="button" class="btn" style="align: right; background-color: #D6C7ED;">펀딩 신청</button></h4>
	      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">혼란스런 맘이겠지 상상조차 못할 거야</p>
	            </div>
	          </div>
	        </div>
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">홀린 듯 날 따라와</p>
	            </div>
	          </div>
	        </div>
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">사실 보고 싶단 말에 조금 흔들려~</p>
	            </div>
	          </div>
	        </div>
	
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">1도 없어 예전의 느낌</p>
	            </div>
	          </div>
	        </div>
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">바ㅣ바이바이</p>
	            </div>
	          </div>
	        </div>
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">내 몸이 확 머리가 휙 돌아가 어때 지금 기분이</p>
	            </div>
	          </div>
	        </div>
	
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">그래 알겠지 알겠지 넌 날 혹하게 해</p>
	            </div>
	          </div>
	        </div>
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">화려한 주인공처럼 그저 하던대로 해</p>
	            </div>
	          </div>
	        </div>
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">슬픈 엔딩이라도오오</p>
	            </div>
	          </div>
	        </div>
	      </div><br>
	      <nav aria-label="Standard pagination example" class="nav justify-content-center">
        	<ul class="pagination">
	            <li class="page-item">
	            	<c:url var="goBack" value="${ loc }">
	            		<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
	            	</c:url>
	            	<a class="page-link" href="${ goBack }" aria-label="Previous">
	            		<span aria-hidden="true">&laquo;</span>
	              	</a>
	            </li>
	            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	            	<c:url var="goNum" value="${ loc }">
	            		<c:param name="page" value="${ p }"></c:param>
	            	</c:url>
	            	<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
	            </c:forEach>
	            <li class="page-item">
	            	<c:url var="goNext" value="${ loc }">
	            		<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
	            	</c:url>
	            	<a class="page-link" href="${ goNext }" aria-label="Next">
	            		<span aria-hidden="true">&raquo;</span>
	            	</a>
	            </li>
	    	</ul>
        </nav>
	    </div>
	  </div>
	  <br>
		  
	</div>
</div>
    
    <br>
	
	<script>
	function openPopup(){
		window.open("myPage_sup_message.jsp", "message", "width=500 height=300");
	}
	</script>

</body>
</html>