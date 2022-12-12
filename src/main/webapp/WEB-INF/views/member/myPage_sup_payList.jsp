<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 서포터(펀딩)</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Bootstrap v5.1.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<style>
		@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
		*{font-family: 'NanumSquareNeo-Variable';}
		
		header{
			background: black;
		}
		
		.container{
			border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
		}
		
		div>ul>li{
			margin: auto;
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
		
		.card-text{margin: 0;}
		
    </style>

</head>
<body>
	<header class="p-3 text-bg-dark">
	    <div class="container" style="background: black;">
	      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
	        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
	          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
	        </a>
	
	        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
	         <!--  <li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>
	          <li><a href="#" class="nav-link px-2 text-white">Features</a></li>
	          <li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>
	          <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
	          <li><a href="#" class="nav-link px-2 text-white">About</a></li> -->
	        </ul>
	
	        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
	          <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
	        </form>
	
	        <div class="text-end">
	          <button type="button" class="btn btn-outline-light me-2">Login</button>
	          <button type="button" class="btn btn-secondary">Sign-up</button>
	        </div>
	      </div>
	    </div>
	</header>
	<br>
	<div class="container" style="background: black;">
    	<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 mx-auto">
          <li><a href="#" class="nav-link px-2 text-white">진행중인 펀딩</a></li>
          <li><a href="#" class="nav-link px-2 text-white">오픈예정 펀딩</a></li>
          <li><a href="#" class="nav-link px-2 text-white">원팅</a></li>
          <li><a href="#" class="nav-link px-2 text-white">프로젝트 오픈 신청</a></li>
          <li><a href="#" class="nav-link px-2 text-white">관리자 문의</a></li>
        </ul>
    </div>
    <br><br><br>
    <div class="container">
    	<div>
    		<h1 style="display: inline;"><b>마이페이지</b></h1>&nbsp;&nbsp;&nbsp;
    		<button class="btn" onclick="openPopup()"><img src="resources/메시지.png" style="width: 40px; height: 40px;"></button>
    	</div>
    	<hr>
    	<div class="text-end">
          <button type="button" class="btn btn-secondary">서포터</button>
          <button type="button" class="btn btn-secondary">크리에이터</button>
        </div>
       
    </div>

	<div class="row">
		<div class="col-3">
			<ul>
				<li style="width: 200px;"><img src="resources/기본프로필.png" style="width: 150px; height: 150px;">
	   				<h4><b>닉네임</b>님</h4>
	   				<p id="info">팔로워 0명<br>
	   				서포터<br>
	   				<button class="btn btn-sm" style="background-color: lightgray;">로그아웃</button>
	   				</p>
   				</li>
   				<li>
   					<p><button class="btn button"><b>내 정보</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button"><b>원팅</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button"><b>찜</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button"><b>문의</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button"><b>알림</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button"><b>팔로우</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button"><b>구매이력</b></button></p>
   				</li>
			</ul>
   		</div>
   	
   		<div class="col-8">
		<h4 align="left">구매이력</h4>
	      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">제목</p>
	              <p class="card-text">구매한 리워드 금액</p>
	              <p class="card-text" align="right">구매 날짜</p>
	            </div>
	          </div>
	        </div>
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body">
	              <p class="card-text">제목</p>
	              <p class="card-text">구매한 리워드 금액</p>
	              <p class="card-text" align="right">구매 날짜</p>
	            </div>
	          </div>
	        </div>
	        
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body" height="60px">
	              <p class="card-text">제목</p>
	              <p class="card-text">구매한 리워드 금액</p>
	              <p class="card-text" align="right">구매 날짜</p>
	            </div>
	          </div>
	        </div>
	
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body" height="60px">
	              <p class="card-text">제목</p>
	              <p class="card-text">구매한 리워드 금액</p>
	              <p class="card-text" align="right">구매 날짜</p>
	            </div>
	          </div>
	        </div>
	        
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body" height="60px">
	              <p class="card-text">제목</p>
	              <p class="card-text">구매한 리워드 금액</p>
	              <p class="card-text" align="right">구매 날짜</p>
	            </div>
	          </div>
	        </div>
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body" height="60px">
	              <p class="card-text">제목</p>
	              <p class="card-text">구매한 리워드 금액</p>
	              <p class="card-text" align="right">구매 날짜</p>
	            </div>
	          </div>
	        </div>
	
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body" height="60px">
	              <p class="card-text">제목</p>
	              <p class="card-text">구매한 리워드 금액</p>
	              <p class="card-text" align="right">구매 날짜</p>
	            </div>
	          </div>
	        </div>
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body" height="60px">
	              <p class="card-text">제목</p>
	              <p class="card-text">구매한 리워드 금액</p>
	              <p class="card-text" align="right">구매 날짜</p>
	            </div>
	          </div>
	        </div>
	        <div class="col">
	          <div class="card shadow-sm">
	            <svg class="bd-placeholder-img card-img-top" width="100%" height="140" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="35%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
	
	            <div class="card-body" height="60px">
	              <p class="card-text">제목</p>
	              <p class="card-text">구매한 리워드 금액</p>
	              <p class="card-text" align="right">구매 날짜</p>
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