<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 크리에이터(광고 의뢰)</title>
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
		
		p{
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
		
		ul{text-align: center; list-style: none;}
		
		tr{height: 50px;}
		
		.fileRegiBtn label {
			display: inline-block; 
			padding: .5em .75em; 
			color: #ffffff; 
			font-size: inherit; 
			line-height: normal; 
			vertical-align: middle; 
			background-color: #6495ED; 
			cursor: pointer; 
			border: 1px solid #ebebeb; 
			border-bottom-color: #e2e2e2; 
			border-radius: .25em;
		}
		
		.fileRegiBtn input[type="file"]{
			position: absolute; 
			width: 1px; 
			height: 1px; 
			padding: 0; 
			margin: -1px; 
			overflow: hidden; 
			clip:rect(0,0,0,0); 
			border: 0;
		}
		
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
	   				크리에이터<br>
	   				<button class="btn btn-sm" style="background-color: lightgray;">로그아웃</button>
	   				</p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/"><b>내 정보</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/"><b>펀딩</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/"><b>문의</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/"><b>알림</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/"><b>팔로우</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/"><b>광고 의뢰</b></button></p>
   				</li>
			</ul>
   		</div>
   		<div class="col-1"></div>
   		<div class="col-6">
   			<div class="container">
				<h4 align="left"><b>광고 의뢰</b></h4>
				<h6>광고는 상단 롤링 배너에 게시됩니다.<br> 배너는 메인페이지, 펀딩페이지, 원팅페이지에 게시됩니다.</h6>
				<br>
				<h5><b>광고할 프로젝트 선택하기</b></h5>
	    		<select class="form-select" style="width: 425px;">
	    			<option>[푸드] 백종원이 인정한 터키식 디저트 카이막</option>
	    		</select>
	    		<br>
	    		<h5><b>광고할 상품 선택 & 기간 설정</b></h5>
	    		선택하신 프로젝트의 광고 진행 기간을 설정해주세요.<br>
	    		<input type="date" style="width: 200px;"> ~ 
	    		<input type="date" style="width: 200px;">
	    		
	    		<div>
	    		<br>
	    			<h5><b>소재 등록하기</b></h5>
	    			<div class="selectCover" style="padding-left: 0;">
					 	<img id="cover" style="width: 200px; height: 200px;" src="resources/대체이미지.png"/>
					</div>
			        <div class="form-group" style="margin: 8px 0 8px;">
						<input id="fileName" class="form-control" value="파일선택" disabled="disabled" style="width:30%; display: inline;">
								<div class="fileRegiBtn">
									<label for="myFileUp">파일등록하기</label>
									<input type="file" id="myFileUp">
								</div>
					</div>
				</div>
				<br>
				<h5><b>메인 카피</b></h5>
				한 줄 당 띄어쓰기 포함 최대 32자(최대 2줄) 줄바꿈 사용 가능, 특수문자 사용 불가
				<textarea style="resize: none; height:" maxlength="32"></textarea>
				<br>
				<button class="btn btn-secondary">광고 신청하기</button>
			</div>    		
		</div>
	</div>
    	<hr>
    
    <br>
	
	

	<script>
		function readURL(input) {
	        if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	                $('#cover').attr('src', e.target.result);        //cover src로 붙여지고
	                $('#fileName').val(input.files[0].name);    //파일선택 form으로 파일명이 들어온다
	            }
	          reader.readAsDataURL(input.files[0]);
	        }
	    }
	
		$("#myFileUp").change(function(){
	        readURL(this);
	    });
		
		function openPopup(){
			window.open("myPage_sup_message.jsp", "message", "width=500 height=300");
		}
	</script>

</body>
</html>