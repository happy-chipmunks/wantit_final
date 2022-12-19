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
<link href="/blog/css/styles.css" rel="stylesheet">
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
			<a class="navbar-brand brandName" href="${ contextPath }/home.do">WANT
				IT</a>
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

			<form class="searchForm">
				<div class="searchArea">
					<input type="text" class="searchText" maxlength="13">
					<button type="submit" class="searchBtn">
						<i class="bi bi-search" id="searchIcon"></i>
					</button>
				</div>


			</form>
				
				<c:if test="${ loginUser == null }">
				<button type="button" class="btn btn-outline-warning" id="loginBtn"
				onclick="location.href='${ contextPath }/loginenroll.me'">로그인/회원가입</button>
				</c:if>
<<<<<<< HEAD
				<c:if test="${ loginUser != null}">
						<a href= "${contextPath}/myPageinfo.me"><!-- "/blog/user?cmd=profileUpload" -->   
=======
				<c:if test="${ loginUser != null  && loginUser.memberNickname != '관리자'}">
						<a href="/blog/user?cmd=profile	Upload"> 
>>>>>>> 아내돈
							<img style="border-radius: 20px" onerror="this.src='/blog/image/userProfile.png'"
								src="https://github.com/mdo.png" width="40px" height="40px" />
						</a>
						<button type="button" class="btn" id="askManager"
							onclick="location.href='${contextPath}/'">관리자 문의</button>
						<button type="button" class="btn" id="openProject"
							onclick="location.href='${contextPath}/fundingWrite.fund'">프로젝트
							오픈 신청</button>	
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
				
			<!-- <span class="myInfo"></span> <span class="myAlarm"> <i
				class="bi bi-bell" id="alarmIcon"></i>
			</span> -->

		</div>
	</nav>


</body>
</html>