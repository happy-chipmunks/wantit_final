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

.aa:hover{
	font-weight:bold;
	
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
								class="align-text-bottom"></span> <br>
							<br> 사이트 관리
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
					<h1 class="h2">리뷰 신고 관리</h1>
				</div>

				<table class="table">
					<thead>
						<tr>
						
							<th scope="col">번호</th>
							<th scope="col">신고리뷰번호</th>
							<th scope="col">신고카테고리</th>
							<th scope="col">신고자</th>
							<th scope="col">신고접수일</th>
							<th scope="col">게시글 이동</th>
							<th scope="col">처리</th>
							
						</tr>
					</thead>
					<tbody class="table-group-divider">
					<c:forEach var="r" items="${rList }" varStatus="m">
						<tr class="review">
								<th scope="row">${m.count }</th>
								<td>${ r.reviewNum }</td>
								<td>${ r.reportCate }</td>
								<td>${ r.reporter }</td>
								<td>${ r.reportDate }</td>
								<td><a href="${ contextPath }/memberManage.ad" style="color: black; text-decoration-line: none;" class="aa">${ r.reportContent }</a></td>
								<td><c:if test="${ r.review.reviewStatus == 'Y' }">
										<div class="btn-group">
											<button type="button"
												class="btn btn-sm btn-outline-danger dropdown-toggle"
												data-bs-toggle="dropdown" aria-expanded="false">
												게시글 상태</button>
											<ul class="dropdown-menu">
												<li>
													<a class="dropdown-item deleteReviewButton"
														data-bs-toggle="modal" data-bs-target="#deleteMemberModal">
															게시글 삭제
														<span style="display: none">${ r.reviewNum }</span>
													</a>
												</li>
											</ul>
										</div>
									</c:if> 
									<c:if test="${ r.review.reviewStatus == 'N' }">
										<button type="button"
											class="btn btn-sm btn-outline-secondary dropdown-toggle"
											data-bs-toggle="dropdown" aria-expanded="false" disabled>
											삭제된 글</button>
									</c:if>
								</td>
								
							</tr>
	
					</c:forEach>
					</tbody>
				</table>
				
				<div id="deleteMemberModal" class="modal fade" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">게시글 삭제</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>정말 게시글을 삭제시키시겠습니까?</p>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-sm btn-outline-secondary"
									data-bs-dismiss="modal">삭제취소</button>
								<form action="${contextPath }/deleteReview.ad" method="post">
									<input type="hidden" name="id">
									<button id="modalDeleteReviewButton" type="button"
										class="btn btn-sm btn-outline-danger">게시글삭제</button>
								</form>
							</div>
						</div>
					</div>
				</div>
				
				
				
				
				<nav aria-label="Standard pagination example" style="float: right;">
					<ul class="pagination">
						<li class="page-item">
							<c:url var="goBack" value="${ loc }">
								<c:param name="page" value="${ piR.currentPage-1 }"></c:param>
							</c:url> 
							<a class="page-link" href="${ goBack }" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
							</a>
						</li>
						<c:forEach begin="${ piR.startPage }" end="${ piR.endPage }" var="p">
							<c:url var="goNum" value="${ loc }">
								<c:param name="page" value="${ p }"></c:param>
							</c:url>
							<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
						</c:forEach>
						<li class="page-item"><c:url var="goNext" value="${ loc }">
								<c:param name="page" value="${ piR.currentPage+1 }"></c:param>
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
	
		const trs = $(".review");
		for(const tr of trs) {
			// 회원 상세정보 조회
			tr.addEventListener("click", function(){
					console.log($(this).find());
			});
		}
		//회원 탈퇴 정보 넘기기
		const btns = $(".deleteReviewButton");
		for(const btn of btns) {
			btn.addEventListener("click", function(){
				const id = $(this).find("span").text();
				$("input[name=id]").val(id);
				console.log($("input[name=id]").val(id));
			});
		}
		
		// 회원 탈퇴
		$("#modalDeleteReviewButton").on("click", function(){
			$("form").submit();
		});
		
	</script>



</body>
</html>
