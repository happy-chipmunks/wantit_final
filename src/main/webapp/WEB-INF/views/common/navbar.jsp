<%@page import="java.net.URLEncoder"%>
<%@page import="java.net.URLDecoder"%>
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
<!-- <link href="/blog/css/styles.css" rel="stylesheet"> -->
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
	
<link rel="icon" href="${ contextPath }/resources/favicon/다람쥐-복사본.ico" type="image/x-icon" sizes="16x16">
</head>
<style>
	#logoutBtn,#adminBtn {
    font-family: 'Noto Sans KR', sans-serif;
    margin-left: 10px;
    margin-right: 10px;
    background-color: #8c86c7;
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
					<li class="nav-item"><a class="nav-link mx-3" 
						href="${ contextPath }/noticeEvent.do">공지사항/이벤트</a>
													
						</ul>
					</li>
				</ul>
			</div>
			<div class="desktopSearchApp">
			
				<form id="searchForm" class="searchForm" action="${ contextPath }/search.do" method="get">
					<div class="searchArea">
						<input type="text" class="searchText" maxlength="13" id="searchInput" name="searchText" autocomplete="off" onkeyup="if(window.event.keyCode == 13){setSearchCookie()}">
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
										//저장된 쿠키들 가져오기
										Cookie[] cookies = request.getCookies();
										if(cookies != null) {
											
											//쿠키의 value를 가져오는데, 세션 유지위해 필요한 JSESSIONID 쿠키 제외하고
											//나머지 쿠키들의 value들을 가져와 뷰에 뿌림
											for(Cookie cookie : cookies) {
										 		String ckName = cookie.getName();
										 		
										 		//쿠키 저장시 한글을 encoding하기 때문에 encoding된 문자열을 decode 해줌
										 		String value = URLDecoder.decode(cookie.getValue(), "UTF-8");
										 		
										 		//쿠키 값이 JSESSIONID인걸 제외한 나머지 쿠키들을 뷰에 뿌려줌
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
						<c:if test="${image == null }">
								<img style="border-radius: 20px"
								src="${contextPath}/resources//myPageImage/뉴프로필.png" width="50px" height="50px" />
						</c:if>
						 <c:if test="${image != null }">
							<img style="border-radius: 20px" 
								src="${contextPath}/resources/member/${ image }" width="50px" height="50px" />
						</c:if>		 
						</a>
		
						<!-- 알림 -------------------------->
						<div class="dropdown-center">
						<c:if test="${ !empty alarmList }">
							<img src="resources/wanting/notification-y.png" style="width:35px; margin: 10px;" class="dropdown-toggle "data-bs-toggle="dropdown" aria-expanded="false"/>
						</c:if>
						<c:if test="${ empty alarmList }">
							<img src="resources/wanting/notification-n.png" style="width:35px; margin: 10px;" class="dropdown-toggle"data-bs-toggle="dropdown" aria-expanded="false"/>
						</c:if>
						  <ul class="dropdown-menu dropdown-menu-end">
						  	<c:if test="${ empty alarmList }">
								<li><a class="dropdown-item" href="#">새 알람이 없습니다.</a></li>
							</c:if>
							<c:forEach items="${ alarmList }" var="a">
								<c:if test="${ a.alarmBoardCate == 1}">
							    	<li><a class="dropdown-item alarm-item" onclick="location.href='${ contextPath }/selectFundingBoard.fund?bId=${ a.alarmBoardId }&alarmNum=${ a.alarmNum }'">${ a.alarmMsg }</a></li>
								</c:if>
								<c:if test="${ a.alarmBoardCate == 4}">
									<input type="hidden" id="wanting-alarmNum" value="${ a.alarmNum }">
							    	<li><a class="dropdown-item alarm-item" onclick="location.href='${ contextPath }/selectWanting.want?wantingNum=${ a.alarmBoardId }&alarmNum=${ a.alarmNum }'">${ a.alarmMsg }</a></li>
								</c:if>
								<c:if test="${ a.alarmBoardCate == 0}">
							    	<li><a class="dropdown-item alarm-item" onclick="location.href='${ contextPath }/myPageSupporterAlarm.me?alarmNum=${ a.alarmNum }'">${ a.alarmMsg }</a></li>
								</c:if>
						    </c:forEach>
						    <li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" onclick="location.href='${ contextPath }/myPageSupporterAlarm.me'">더보기</a></li>
							
						  </ul>
						</div>
										
<!-- 						<button type="button" class="btn" id="askManager" -->
<%-- 							onclick="location.href='${contextPath}/'">관리자 문의</button> --%>
							<button type="button" class="btn" id="logoutBtn"
								onclick="location.href='${ contextPath }/logout.me'">로그아웃</button>
				</c:if>
				<c:if test="${ loginUser != null  && loginUser.memberNickname == '관리자' }">
					<button type="button" class="btn" id="adminBtn"
						onclick="location.href='${contextPath}/memberManage.ad'">관리자페이지</button>
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
			
			/* 검색버튼을 눌렀을 때 검색값을 쿠키에 저장하는 함수 실행 */
			const searchBtn = document.getElementById('searchBtn');
			searchBtn.addEventListener('click', function() {
				setSearchCookie();
			});
			
			/* 검색할 단어 입력 후 엔터버튼을 눌렀을 때 쿠키에 저장하는 함수 실행 */
			searchInput.addEventListener('keyup', function(event) {
				if(event.keyCode === 13) {
					setSearchCookie();
				}
			});
			
			const searchCates = document.getElementsByClassName('searchCates');
			for(const i of searchCates) {
				i.addEventListener('click', function() {
					const cate = this.innerText;
					location.href = '${ contextPath }/search.do?searchCate=' + cate;
				});
			}
			
			/* 검색한 단어 쿠키값으로 저장하는 함수 */
			function setSearchCookie() {
				/* 검색한 단어 가져오고, 쿠키 저장후 controller 호출하기 위해 form도 가져옴 */
				const searchInput = document.getElementById('searchInput');
				const searchForm = document.getElementById('searchForm');
				
				const inputVal = searchInput.value;
				
				/* 쿠키 유지시간 설정하기 */
				let todayDate = new Date();
				
				/* 유지기간은 24시간 */
				todayDate.setDate(todayDate.getDate() + 1);
				
				/* 쿠키는 name =value 형식으로 저장, 쿠키 접근범위 path로 설정, expires로 유지기간 설정 */
				document.cookie = encodeURIComponent(inputVal) + "=" + encodeURIComponent(inputVal) 
													+ "; path=/wantit; expires" + todayDate.toGMTString() + ";";
													
				/* controller 호출 */
				searchForm.submit();
				
			}
		
			/* 뷰에 뿌려진 최근 검색어 삭제 */
			const deleteSW = document.getElementsByClassName('deleteSW');
			for(const i of deleteSW) {
				i.addEventListener('click', function() {
						/* 검색어 값 가져오기 */
						const sWord = i.parentNode.querySelector('.sWord').innerText;
						
						/* 저장되어 있는 쿠키의 유지기간을 과거로 설정하면 쿠키가 지워짐 */
						document.cookie = sWord + '=; expires=Thu, 01 Jan 1970 00:00:01 GMT;';
						
						/* 뷰에 있던 검색어 지우기 */
						i.parentNode.remove();
				});
			}
			
// 			
	</script>

</body>
</html>