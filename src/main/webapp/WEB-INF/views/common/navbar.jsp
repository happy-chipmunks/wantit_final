<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>wantit</title>
<style type="text/css">
	.dropDownSearch{
	position: absolute;
	top: 56px;
	left: 0;
	height: 480px;
	background-color: #343332;
	border-radius: 9px;
	width: 300px;
	display: none;
	z-index: 9999;
}

.desktopSearchApp{
	position: relative;
	display: inline-block;
	
}

.swTitle{
	font-family: 'Do Hyeon', sans-serif;
	font-size: 18px;
	text-align: center;
	padding-bottom: 10px;
}

.recentWords, .searchCates{
	font-family: 'Noto Sans KR', sans-serif;
	font-size: 12px;
	padding: 5px;
	cursor: pointer;
}

.searchArea{
/* 	height: 340px; */
/* 	border-bottom: 1px solid white; */
}

.searchFooter{
	top: 400px;
	border-top: 1px solid white;
}

.closeSearch{
 	width: 50px; 
 	height: 20px; 
	border: 0;
	background-color: transparent;
	font-family: 'Do Hyeon', sans-serif;
	font-size: 15px;
	right : 0;
	cursor: pointer;
}

#searchInput{
	font-family: 'Noto Sans KR', sans-serif;
}

.stHref{
	text-decoration: none;
}

.stHref:hover, .stHref:link, .stHref:visited,  .stHref:active{
	color : white;
}

</style>
<link href="/blog/css/styles.css" rel="stylesheet">
<!-- <link href="/blog/css/styles.css" rel="stylesheet"> -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
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
</head>
<style>
	#logoutBtn,#adminBtn {
    font-family: 'Noto Sans KR', sans-serif;
    margin-left: 10px;
    margin-right: 10px;
    background-color: #e8acef;
}

</style>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light navbar-fixed-top">
		<div class="container-fluid">
			<a class="navbar-brand brandName" href="${ contextPath }/home.do">
				<img alt="" src="${ contextPath }/resources/cateImage/wantitLogo.png">
			</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link mx-3"
						aria-current="page" href="${ contextPath }/wantingList.want">원팅</a>
					</li>
					<li class="nav-item"><a class="nav-link mx-3"
						href="${ contextPath }/fundingList.fund">펀딩</a></li>
					<li class="nav-item"><a class="nav-link mx-3"
						href="${ contextPath }/fundingComingSoon.fund">펀딩예정</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle mx-3" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							더보기 </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">공지사항</a></li>
							<li><a class="dropdown-item" href="#">이벤트</a></li>
							
						</ul>
					</li>
				</ul>
			</div>
			<div class="desktopSearchApp">
			
				<form id="searchForm" class="searchForm" action="${ contextPath }/search.do" method="get">
					<div class="searchArea">
						<input type="text" class="searchText" maxlength="13" id="searchInput" name="searchText" autocomplete="off">
						<div class="searchBtn" id="searchBtn">
							<i class="bi bi-search" id="searchIcon"></i>
						</div>
					</div>
				<div class="dropDownSearch" id="dropDownSearch">
					<div class="container" style="padding-top: 20px;">
						<div class="row searchArea">
							<div class="col-6" style="border-right: 1px solid white;">
								<div  class="swTitle">최근 검색어</div>
								<div class="recentWords">
									<%
										Cookie[] cookies = request.getCookies();
										for(Cookie cookie : cookies) {
									 		String ckName = cookie.getName();
									 		String value = cookie.getValue();
									 		
											if(!ckName.equals("JSESSIONID")) {
											
									 %>
									 
										<div style="padding-top: 2px; padding-bottom: 2px;">
											<a class="stHref" href="${ contextPath }/search.do?searchText=<%=value%>">
												<i class="bi bi-search" style="padding-bottom: 2px;"></i>
												<span class="sWord"><%=value %></span>
											</a>
											<i class="bi bi-x-lg deleteSW" style="float: right;"></i>
											<br>
										</div>	
									<%
											}
										}
									%>
									
								
								</div>
							</div>
							<div class="col-6">
								<div class="swTitle">카테고리</div>
								<div class="searchCates">테크·가전</div>
								<div class="searchCates">패션·잡화</div>
								<div class="searchCates">뷰티</div>
								<div class="searchCates">음식</div>
								<div class="searchCates">홈·리빙</div>
								<div class="searchCates">여행·레저</div>
								<div class="searchCates">스포츠</div>
								<div class="searchCates">캐릭터·굿즈</div>
								<div class="searchCates">베이비·키즈</div>
								<div class="searchCates">반려동물</div>
								<div class="searchCates">게임</div>
								<div class="searchCates">컬쳐·아티스트</div>
								<div class="searchCates">출판</div>
								<div class="searchCates">클래스·컨설팅</div>
							</div>
						</div>
						
					</div>
				</div>
				</form>
			</div>
				
				
				<c:if test="${ loginUser == null }">
				<button type="button" class="btn btn-outline-warning" id="loginBtn"
				onclick="location.href='${ contextPath }/loginenroll.me'">로그인/회원가입</button>
				</c:if>
				 
				&nbsp;&nbsp;&nbsp;   
				<c:if test="${ loginUser != null  && loginUser.memberNickname != '관리자'}">
						<a href="${contextPath}/myPageinfo.me"> 
							<img style="border-radius: 20px" onerror="this.src='/blog/image/userProfile.png'"
								src="https://github.com/mdo.png" width="40px" height="40px" />
						</a>
						<button type="button" class="btn" id="askManager"
							onclick="location.href='${contextPath}/'">관리자 문의</button>
						<button type="button" class="btn" id="openProject"
							onclick="location.href='${contextPath}/fundingWrite.fund'">프로젝트 오픈 신청
							</button>	
						&nbsp;&nbsp;
							<button type="button" class="btn" id="logoutBtn"
								onclick="location.href='${ contextPath }/logout.me'">로그아웃</button>
				</c:if>
				<c:if test="${ loginUser != null  && loginUser.memberNickname == '관리자' }">
					<button type="button" class="btn" id="adminBtn"
						onclick="location.href='${contextPath}/admin.ad'">관리자페이지</button>
						<button type="button" class="btn" id="logoutBtn"
								onclick="location.href='${ contextPath }/logout.me'">로그아웃</button>
				</c:if>
				
			

		</div>
	</nav>
	<script type="text/javascript">
			const body = document.querySelector('body');
			const searchInput = document.getElementById('searchInput');
			const dropDownSearch = document.getElementById('dropDownSearch');
			const closeSearchBtn = document.getElementById('closeSearchBtn');
			
			searchInput.addEventListener('click', function() {
				console.log(event.target);
				if(dropDownSearch.style.display == "block") {
					dropDownSearch.style.display = "none";
				} else {
					dropDownSearch.style.display = "block";
				}
			});
			
			const searchBtn = document.getElementById('searchBtn');
			searchBtn.addEventListener('click', function() {
				const searchInput = document.getElementById('searchInput');
				const searchForm = document.getElementById('searchForm');
				if(searchInput.value.trim() == "") {
					const exampleModalLabel = document.getElementById('exampleModalLabel');
	    			exampleModalLabel.innerText = "검색어를 입력해주세요.";
	    			
	    			$('#exampleModal').modal('show');
				} else {
					const inputVal = searchInput.value;
					let todayDate = new Date();
					todayDate.setDate(todayDate.getDate() + 1);
					document.cookie = inputVal + "=" + inputVal + "; path=/wantit; expires" + todayDate.toGMTString() + ";";
					searchForm.submit();
				}
			});
		
			const deleteSW = document.getElementsByClassName('deleteSW');
			for(const i of deleteSW) {
				i.addEventListener('click', function() {
						const sWord = i.parentNode.querySelector('.sWord').innerText;
						console.log(sWord);
						document.cookie = sWord + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
						i.parentNode.remove();
					
				});
			}
			
	</script>

</body>
</html>