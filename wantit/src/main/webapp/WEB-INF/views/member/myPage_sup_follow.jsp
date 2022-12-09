<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 서포터(팔로우)</title>
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
		
		input, textarea{
			width: 550px;
		}
		
		.info{
			font-size: 15px;
		}
		
		.button{
			background-color: lightgray; width: 100px; height: 35px;
		}
		
		.button:hover{
			background-color: #666666;
			color: white;
			transition: background 0.7s ease-in-out;
		}
		
		.button2:hover{
			background-color: #E0FFFF;
			transition: background 0.7s ease-in-out;
		}
		
		.switch {
		  position: relative;
		  display: inline-block;
		  width: 60px;
		  height: 34px;
		  vertical-align:middle;
		}
		
		.switch input {display:none;}
		
		.slider {
		  position: absolute;
		  cursor: pointer;
		  top: 0;
		  left: 0;
		  right: 0;
		  bottom: 0;
		  background-color: #ccc;
		  -webkit-transition: .4s;
		  transition: .4s;
		}
		
		.slider:before {
		  position: absolute;
		  content: "";
		  height: 26px;
		  width: 26px;
		  left: 4px;
		  bottom: 4px;
		  background-color: white;
		  -webkit-transition: .4s;
		  transition: .4s;
		}
		
		input:checked + .slider {
		  background-color: #2196F3;
		}
		
		input:focus + .slider {
		  box-shadow: 0 0 1px #2196F3;
		}
		
		input:checked + .slider:before {
		  -webkit-transform: translateX(26px);
		  -ms-transform: translateX(26px);
		  transform: translateX(26px);
		}
		
		.slider.round {
		  border-radius: 34px;
		}
		
		.slider.round:before {
		  border-radius: 50%;
		}
		
		.follow, .follow2, .follow3, .follow4, .follow5, .follow6{
			margin:0px;
			display:inline-block;
			font-size:15px;
			font-weight:bold;
		}
		
		ul{text-align: center; list-style: none;}
		
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
    		<img src="resources/메시지.png" style="width: 40px; height: 40px;">
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
    					<div style="height: 110px;">
					      <div class="row g-0 mb-3 h-75">
					        <div class="col-auto d-none d-lg-block">
					           <svg class="bd-placeholder-img rounded-circle" width="60" height="60" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 100x100" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">100x100</text></svg>
					        </div>
					        <div class="col p-4 d-flex flex-column position-static" style="text-align: left;">
					          <h5 style="display: inline">팔로우 중인 계정 명</h5>
					          <div align="right">
					          	<label class="switch">
								  <input type="checkbox" id="check">
								  <span class="slider round"></span>
								</label>
								<p class="follow">팔로잉</p><p style="display:none;" class="follow">팔로우</p>
					          </div>
					        </div>
					      </div>
					     </div>
						   
						 <div style="height: 110px;">
					      <div class="row g-0 mb-3 h-75">
					        <div class="col-auto d-none d-lg-block">
					           <svg class="bd-placeholder-img rounded-circle" width="60" height="60" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 100x100" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">100x100</text></svg>
					        </div>
					        <div class="col p-4 d-flex flex-column position-static" style="text-align: left;">
					          <h5>팔로우 중인 계정 명</h5>
					          <div align="right">
					          	<label class="switch">
								  <input type="checkbox" id="check2">
								  <span class="slider round"></span>
								</label>
								<p class="follow2">팔로잉</p><p style="display:none;" class="follow2">팔로우</p>
					          </div>
					        </div>
					      </div>
					     </div>
					     
					     <div style="height: 110px;">
					      <div class="row g-0 mb-3 h-75">
					        <div class="col-auto d-none d-lg-block">
					           <svg class="bd-placeholder-img rounded-circle" width="60" height="60" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 100x100" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">100x100</text></svg>
					        </div>
					        <div class="col p-4 d-flex flex-column position-static" style="text-align: left;">
					          <h5>팔로우 중인 계정 명</h5>
					          <div align="right">
					          	<label class="switch">
								  <input type="checkbox" id="check3">
								  <span class="slider round"></span>
								</label>
								<p class="follow3">팔로잉</p><p style="display:none;" class="follow3">팔로우</p>
					          </div>
					        </div>
					      </div>
					     </div>
					     
					     <div style="height: 110px;">
					      <div class="row g-0 mb-3 h-75">
					        <div class="col-auto d-none d-lg-block">
					           <svg class="bd-placeholder-img rounded-circle" width="60" height="60" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 100x100" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">100x100</text></svg>
					        </div>
					        <div class="col p-4 d-flex flex-column position-static" style="text-align: left;">
					          <h5>팔로우 중인 계정 명</h5>
					          <div align="right">
					          	<label class="switch">
								  <input type="checkbox" id="check4">
								  <span class="slider round"></span>
								</label>
								<p class="follow4">팔로잉</p><p style="display:none;" class="follow4">팔로우</p>
					          </div>
					        </div>
					      </div>
					     </div>
					     
					     <div style="height: 110px;">
					      <div class="row g-0 mb-3 h-75">
					        <div class="col-auto d-none d-lg-block">
					           <svg class="bd-placeholder-img rounded-circle" width="60" height="60" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 100x100" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">100x100</text></svg>
					        </div>
					        <div class="col p-4 d-flex flex-column position-static" style="text-align: left;">
					          <h5>팔로우 중인 계정 명</h5>
					          <div align="right">
					          	<label class="switch">
								  <input type="checkbox" id="check5">
								  <span class="slider round"></span>
								</label>
								<p class="follow5">팔로잉</p><p style="display:none;" class="follow5">팔로우</p>
					          </div>
					        </div>
					      </div>
					     </div>
					     
					     <div style="height: 110px;">
					      <div class="row g-0 mb-3 h-75">
					        <div class="col-auto d-none d-lg-block">
					           <svg class="bd-placeholder-img rounded-circle" width="60" height="60" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 100x100" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#777"/><text x="50%" y="50%" fill="#777" dy=".3em">100x100</text></svg>
					        </div>
					        <div class="col p-4 d-flex flex-column position-static" style="text-align: left;">
					          <h5>팔로우 중인 계정 명</h5>
					          <div align="right">
					          	<label class="switch">
								  <input type="checkbox" id="check6">
								  <span class="slider round"></span>
								</label>
								<p class="follow6">팔로잉</p><p style="display:none;" class="follow6">팔로우</p>
					          </div>
					        </div>
					      </div>
					     </div>
					     
						  <br>
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
    	<hr>
    </div>
    
    <br>
	
	

	<script>
		$("input:checkbox[id='check']").prop("checked", true);
		$("input:checkbox[id='check2']").prop("checked", true);
		$("input:checkbox[id='check3']").prop("checked", true);
		$("input:checkbox[id='check4']").prop("checked", true);
		$("input:checkbox[id='check5']").prop("checked", true);
		$("input:checkbox[id='check6']").prop("checked", true);
	
		var check = $("input:checkbox[id='check']");
		check.click(function(){
			$(".follow").toggle();
		});
		
		var check = $("input:checkbox[id='check2']");
		check.click(function(){
			$(".follow2").toggle();
		});
		
		var check = $("input:checkbox[id='check3']");
		check.click(function(){
			$(".follow3").toggle();
		});
		
		var check = $("input:checkbox[id='check4']");
		check.click(function(){
			$(".follow4").toggle();
		});
		
		var check = $("input:checkbox[id='check5']");
		check.click(function(){
			$(".follow5").toggle();
		});
		
		var check = $("input:checkbox[id='check6']");
		check.click(function(){
			$(".follow6").toggle();
		});
	</script>

</body>
</html>