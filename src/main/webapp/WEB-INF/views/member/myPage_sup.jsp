<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 서포터</title>
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
		
		textarea{
			height: 150px;
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
    		<button class="btn" onclick="openPopup()"><img src="${ contextPath }/resources/myPageImage/메시지.png" style="width: 40px; height: 40px;"></button>
    	</div>
    	<hr>
    	<div class="text-end">
          <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/myPageSuppoter.me'">서포터</button>
          <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/myPageCreator.me'">크리에이터</button>
        </div>
       
    </div>

	<div class="row">
		<div class="col-3">
			<ul>
				<li style="width: 200px;"><img src="${ contextPath }/resources/myPageImage/기본프로필.png" style="width: 150px; height: 150px;">
	   				<h4><b>닉네임</b>님</h4>
	   				<p id="info">팔로워 0명<br>
	   				서포터<br>
	   				<button class="btn btn-sm" style="background-color: lightgray;">로그아웃</button>
	   				</p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/myPageSupporter.me"><b>내 정보</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/myPageSupporterFunding.me"><b>펀딩</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/myPageSupporterWanting.me"><b>원팅</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/myPageSupporterDibs.me"><b>찜</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/myPageSupporterInquiry.me"><b>문의</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/myPageSupporterAlarm.me"><b>알림</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/myPageSupporterFollow.me"><b>팔로우</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="${contextPath}/myPageSupporterPayList.me"><b>구매이력</b></button></p>
   				</li>
			</ul>
   		</div>
   		<div class="col-8">
			<table align="center" style="text-align: center; height: 100%;" class="table">
				<tr>
					<th>아이디</th>
					<td colspan="2">아이디</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="2"><button class="btn btn-outline-secondary btn-sm">변경하기</button></td>
				</tr>
				<tr>
					<th>이름</th>
					<td colspan="2">이름</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td colspan="2">닉네임</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td colspan="2">생년월일</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="2">전화번호</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="2">이메일</td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="2">주소</td>
				</tr>
				<tr>
					<th colspan="3">배송지</th>
				</tr>
				<tr>
					<td>
						<select class="form-select" style="width: 70%;">
							<option>집</option>
							<option>회사</option>
						</select>
					</td>
					<td>수령인 이름</td>
					<td style="width: 300px;">수령인 전화번호</td>
				</tr>
				<tr>
					<td colspan="3">주소</td>
				</tr>
				<tr>
					<td colspan="2">
					<td>
						<button class="btn btn-secondary btn-sm">수정하기</button>
						<button class="btn btn-secondary btn-sm">탈퇴하기</button>
					</td>
				</tr>
			</table>
	    </div>
    	<hr>
    </div>
    
    <br>
	
	<script>
		function openPopup(){
			window.open("myPage_sup_message.jsp", "message", "width=500 height=300");
		}
	</script>
</body>
</html>