<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!Doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>Dashboard Template · Bootstrap v5.2</title>
<link rel="stylesheet" href="resources/css/main.css">
	<link rel="canonical"
		href="https://getbootstrap.com/docs/5.2/examples/dashboard/">





<!-- <link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet"> -->

<style>
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

#body {
	font-family: 'NanumSquareNeo-Variable';
}

.textForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
}

.form-popup {
	border-radius: 20px 20px 20px 20px/20px 20px 20px 20px;
	background-color: #FAE4FF;
	display: grid;
	margin: auto;
	margin-top: 50px;
	padding: 40px;
	align-items: center;
	justify-content: center;
	width: 100%;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.joinInfo {
	background-color: white;
	width: 100%;
	height: 100px;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
}

#boxWrap {
	width: auto;
	height: auto;
}

#boxWrap : after {
	content: "";
	display: block;
	clear: both;
}

#boxWrap p+p {
	margin-left: 5px;
}

#boxWrap .original {
	float: left;
	padding: 20px;
	width: 100px;
	height: 100px;
	background-color: #cbcbcb;
	text-align: center;
	line-height: 100px;
}

.btnWrap {
	width: 100%;
}

.table {
	vertical-align: middle;
	text-align: center;
}

.find-btn {
	text-align: center;
}

.find-btn1 {
	display: inline-block;
}

.wiwidth {
	width: 400px;
}
/* 섹션 크기 */
.bg-light {
	padding-bottom: 75px;
}

.flex-fill.mx-xl-5.mb-2 {
	margin: 0 auto;
	width: 700px;
	padding-right: 7rem;
	padding-left: 7rem;
}
/* 입력창 */
.container.py-4 {
	margin: 0 auto;
	width: 503px;
}
/* 가입하기 */
.d-grid.gap-2 {
	padding-top: 30px;
}

#homehref {
	text-decoration: none;
	display: inline;
}
</style>


<!-- Custom styles for this template -->
<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body id="body">
	
	<header>
		<jsp:include page="../common/navbar.jsp"></jsp:include>
	</header>

	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position" style="height: 1000px;">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/admin.ad"> <span data-feather="home"
								class="align-text-bottom"></span> <br> <br> 사이트 관리
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/projectManage.ad"> <span
								data-feather="file" class="align-text-bottom"></span> <br>
								<br> 프로젝트 승인 / 거절
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/fundingManage.ad"> <span
								data-feather="file" class="align-text-bottom"></span> <br>
							<br> 펀딩 신고 관리
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/reviewManage.ad"> <span
								data-feather="shopping-cart" class="align-text-bottom"></span> <br>
								<br> 리뷰 신고 관리
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/noticeManage.ad"> <span
								data-feather="users" class="align-text-bottom"></span> <br>
								<br> 공지사항 관리
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/inquiryManage.ad"> <span
								data-feather="bar-chart-2" class="align-text-bottom"></span> <br>
								<br> 문의 관리
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/adManage.ad"> <span
								data-feather="layers" class="align-text-bottom"></span> <br>
								<br> 광고의뢰 관리
						</a>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/memberManage.ad"> <span
								data-feather="layers" class="align-text-bottom"></span> <br>
								<br> 회원 관리
						</a></li>
					</ul>
				</div>
			</nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div
					class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
					<h1 class="h2" style="display: inline;">회원관리</h1><button class="btn btn-secondary" onclick="openPopup()">사업자 승인</button>

				</div>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">회원번호</th>
							<th scope="col">회원명</th>
							<th scope="col">아이디</th>
							<th scope="col">닉네임</th>
							<th scope="col">주소</th>
							<th scope="col">핸드폰번호</th>
							<th scope="col">회원상태</th>
							<th scope="col">상태</th>

						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach var="m" items="${mList }" varStatus="r">
							<tr class="member">
								<th scope="row">${r.count }</th>
								<td>${ m.memberName }</td>
								<td>${ m.memberId }</td>

								<td>${ m.memberNickname }</td>
								<td>${ m.memberAddress }</td>
								<td>${ m.memberPhone }</td>

								<td><c:if test="${m.memberStatus == 'Y' }">
										<div class="btn-group">
											<button type="button"
												class="btn btn-sm btn-outline-danger dropdown-toggle"
												data-bs-toggle="dropdown" aria-expanded="false">
												정상회원</button>
											<ul class="dropdown-menu">
												<li><a class="dropdown-item deleteMemberButton"
													data-bs-toggle="modal" data-bs-target="#deleteMemberModal">
														회원탈퇴<span style="display: none">${m.memberId }</span>
												</a></li>
											</ul>
										</div>
									</c:if> <c:if test="${m.memberStatus eq 'N' }">
										<button type="button"
											class="btn btn-sm btn-outline-secondary dropdown-toggle"
											data-bs-toggle="dropdown" aria-expanded="false" disabled>
											탈퇴회원</button>
									</c:if></td>
								<c:if test="${ m.memberType == 'supportor' }">
									<td>서포터</td>
								</c:if>
								<c:if test="${ m.memberType == 'creator' }">
									<td>크리에이터</td>
								</c:if>
								<c:if test="${ m.memberType == 'admin' }">
									<td>관리자</td>
								</c:if>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div id="deleteMemberModal" class="modal fade" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">회원탈퇴</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>정말 회원을 탈퇴시키시겠습니까?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-sm btn-outline-secondary"
									data-bs-dismiss="modal">탈퇴취소</button>
								<form action="${contextPath }/deleteMember.ad" method="post">
									<input type="hidden" name="id">
									<button id="modalDeleteButton" type="button"
										class="btn btn-sm btn-outline-danger">회원탈퇴</button>
								</form>
							</div>
						</div>
					</div>
				</div>

				<nav aria-label="Standard pagination example" style="float: right;">
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
						<li class="page-item"><c:url var="goNext" value="${ loc }">
								<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
							</c:url> 
							
							<a class="page-link" href="${ goNext }" aria-label="Next"> 
								<span aria-hidden="true">&raquo;</span>
							</a>
						</li>
					</ul>
				</nav>
			</main>
		</div>
	</div>

	<script>
	window.onload=()=>{
		console.log("권진한 바보");
	}
	const trs = $(".member");
	for(const tr of trs) {
		// 회원 상세정보 조회
		tr.addEventListener("click", function(){
				console.log($(this).find());
		});
	}
	//회원 탈퇴 정보 넘기기
	const btns = $(".deleteMemberButton");
	for(const btn of btns) {
		btn.addEventListener("click", function(){
			const id = $(this).find("span").text();
			$("input[name=id]").val(id);
			console.log($("input[name=id]").val(id));
		});
		
		// 크리에이터 승인
		 function openPopup(){
				var url = "adminCreatorApproval.ad";
				var name="creatorApproval";
				window.open(url, name, "width=700 height=800");
			}
	}
	
	// 회원 탈퇴
	$("#modalDeleteButton").on("click", function(){
		$("form").submit();
	});
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"
		integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"
		integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha"
		crossorigin="anonymous"></script>
<!-- 	<script src="dashboard.js"></script> -->
</body>
</html>
