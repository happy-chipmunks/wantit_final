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
	background-color: lightgray;
	display: grid;
	margin: auto;
	margin-top: 50px;
	padding: 40px;
	align-items: center;
	justify-content: center;
	width: 100%;
}

.form-floating {
	margin-left: 30px;
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

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
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

.replyContent {
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
	width: 100px;
	height: 100px;
	background-color: #cbcbcb;
	text-align: center;
	line-height: 100px;
}

.textForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
}

.btnWrap {
	width: 100%;
}

.right {
	float: right;
	margin-right: 400px;
	margin-left: 100px;
	line-height: 50px;
	text-align: center;
	border-radius: 20px;
	width: 150px;
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

.image-box {
	width: 400px;
	height: 250px;
	overflow: hidden;
	margin: 0 auto;
	float: left;
	margin-left: 25px;
}

.image-thumbnail {
	width: 100%;
	height: 100%;
	object-fit: cover;
}

.content {
	float: right;
	width: 700px;
	height: 250px;
	margin-right: 200px;
}
</style>

<!-- Custom styles for this template -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
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
							href="${ contextPath }/projectManage.ad"> <span
								data-feather="file" class="align-text-bottom"></span> <br>
								<br> 프로젝트 승인 / 거절
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
					<h1 class="h2">프로젝트 관리</h1>
				</div>

				<table class="table" style="height: auto;">
					<thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">프로젝트 번호</th>
							<th scope="col">프로젝트 명</th>
							<th scope="col">구분</th>
							<th scope="col">상태</th>
							<th scope="col">상세보기</th>
						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach var="m" items="${mList }" varStatus="r">
							<tr>
								<th scope="row">${ r.count }</th>
								<td><c:if
										test="${ m.fundingNum != null && m.division == 'F'}">
									${ m.fundingNum }
								</c:if> <c:if
										test="${ m.wanting.wantingNum != null && m.division == 'W'}">
									${ m.fundingNum }
								</c:if></td>
								<td><c:if
										test="${ m.fundingTitle != null && m.division == 'F' }">
									${ m.fundingTitle }
								</c:if> <c:if test="${ m.fundingTitle != null && m.division == 'W'}">
									${ m.fundingTitle }
								</c:if></td>
								<td><c:if
										test="${ m.division == 'F' && ( m.confirm == 'N' || m.confirm == 'Y' || m.confirm == 'X' || m.confirm == 'C' || m.confirm == 'R') }">
									펀딩
								</c:if> <c:if
										test="${ m.division == 'W' && ( m.confirm == 'X' || m.confirm == 'Y' || m.confirm == 'S' || m.confirm == 'F' || m.confirm == 'C' || m.confirm == 'R')}">
									원팅
								</c:if> <c:if test="${ m.confirm == 'E' && m.division == 'F'}">
									펀딩 수정
								</c:if> <c:if
										test="${ (m.confirm == 'E' || m.confirm == 'D') && m.division == 'W' }">
									원팅 수정 / 삭제
								</c:if></td>
								<td><c:if
										test="${ ( m.confirm == 'E' || m.confirm == 'N' ) && (m.division == 'W' || m.division == 'F')}">
									미처리
								</c:if> <c:if test="${  (m.confirm == 'X' || m.confirm == 'D') && m.division == 'W' }">
									미처리
								</c:if> <c:if
										test="${ m.confirm == 'C' && (m.division == 'W' || m.division == 'F') }">
									수정승인
								</c:if> <c:if
										test="${ m.confirm == 'R' && (m.division == 'W' || m.division == 'F') }">
									수정거절
								</c:if> <c:if test="${ m.confirm == 'Y' && m.division == 'F' }">
									승인완료
								</c:if> <c:if test="${ m.confirm == 'X' && m.division == 'F' }">
									승인거절
								</c:if> <c:if test="${ m.confirm == 'S' && m.division == 'W' }">
									삭제승인
								</c:if> <c:if test="${ m.confirm == 'F' && m.division == 'W'}">
									삭제거절
								</c:if> <c:if test="${ m.confirm == 'Y' && m.division == 'W'}">
									원팅개설
								</c:if></td>
								<td><c:if
										test="${ (m.confirm == 'N' || m.confirm == 'E' || m.confirm == 'D') && (m.division == 'W' || m.division == 'F') }">
										<button class="btn btn-primary answerBtn" type="button"
											value="${ r.index }">내용확인</button>
									</c:if> <c:if test="${ m.confirm == 'X' && m.division == 'W' }">
										<button class="btn btn-primary answerBtn" type="button"
											value="${ r.index }">내용확인</button>
									</c:if> <c:if
										test="${ (m.confirm == 'Y' || m.confirm == 'C' || m.confirm == 'R' || m.confirm == 'S' || m.confirm == 'F') && (m.division == 'W' || m.division == 'F') }">
									확인완료
								</c:if> <c:if test="${ m.confirm == 'X' && m.division == 'F' }">
									확인완료
								</c:if></td>

							</tr>
						</c:forEach>
					</tbody>
				</table>

				<c:forEach var="m" items="${ mList }" varStatus="r">
					<div
						class="shadow p-3 mb-5 bg-body rounded myForm myForm${ r.index }">
						<form action="${contextPath }/projectManage.ad" method="post"
							class="answerForm">
							<fieldset>
								<h3>
									<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${ m.fundingTitle }
								</h3>

								<div class="textForm">
									<c:if test="${ m.confirm == 'E' && m.division == 'F'}">
										<div id="editContent">
										${ m.fundingEdit.fundingEditContent}
											</div>
									</c:if>
									<c:if test="${ m.confirm == 'E' && m.division == 'W'}">
										<div id="editContent">
											${ m.fundingEdit.fundingEditContent}
										</div>
									</c:if>
									<c:if test="${ m.confirm != 'E' && (m.division == 'F' || m.division == 'W')}">
										${ m.fundingContent}
									</c:if>	
								</div>
								<br>
								<c:if test="${ m.confirm != 'X' || m.division != 'W' }">
								<button type="button"
									class="btn btn-primary btn-lg right cancel"
									style="display: inline-block; float: right;">취소</button>
								</c:if>
								<c:if
									test="${ m.confirm == 'N' && m.division == 'F'}">
									<button type="button"
										class="btn btn-primary btn-lg confirmP right"
										style="display: inline-block; float: left;"
										data-bs-toggle="modal" data-bs-target="#confirmP">
										<span style="display: none">${m.fundingNum }</span> <input
											type="hidden" name="division" class="division"
											value="${m.division }"> 승인
									</button>
								</c:if>
								<c:if test="${ m.confirm == 'E' }">
									<div id="sendEdit" style="display: none;">
										<span>${m.fundingNum }</span> <input
											type="hidden" name="division" class="division"
											value="${m.division }">
										<input type="hidden" name="content" class="content" value="${m.fundingEdit.fundingEditContent }">
									</div>
									<button type="button"
										class="btn btn-primary btn-lg confirmE right"
										style="display: inline-block; float: left;"
										data-bs-toggle="modal" data-bs-target="#confirmE">
										승인</button>
								</c:if>
								<c:if test="${ m.confirm == 'D' }">
									<div id="sendDelete" style="display: none;">
										<span>${m.fundingNum }</span> <input name="division"
											class="division" value="${m.division }">
									</div>
									<button type="button"
										class="btn btn-primary btn-lg confirmD right"
										style="display: inline-block; float: left;"
										data-bs-toggle="modal" data-bs-target="#confirmD">승인</button>
								</c:if>
							</fieldset>
						</form>
					</div>
				</c:forEach>

				<div id="confirmP" class="modal fade" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">게시글 승인</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>정말 프로젝트를 승인하시겠습니까?</p>
							</div>
							<div class="modal-footer">
								<form action="${contextPath }/refuseProject.ad" method="post"
									id="refuseSubmit">
									<button type="button" class="btn btn-sm btn-outline-secondary"
										id="modalRefuseBtn">거절</button>
									<input type="hidden" name="id"> <input type="hidden"
										name="type">
								</form>
								<form action="${contextPath }/confirmProject.ad" method="post"
									id="confirmSubmit">
									<button id="modalConfirmButton" type="button"
										class="btn btn-sm btn-outline-danger">승인</button>
									<input type="hidden" name="id"> 
									<input type="hidden" name="type">
								</form>
							</div>
						</div>
					</div>
				</div>

				<!--  펀딩 수정 승인 -->
				<div id="confirmE" class="modal fade" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">게시글 수정 승인</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>정말 수정된 프로젝트를 승인하시겠습니까?</p>
							</div>
							<div class="modal-footer">
								<form action="${contextPath }/refuseEditProject.ad"
									method="post" id="editRefuseSubmit">
									<button type="button" class="btn btn-sm btn-outline-secondary"
										id="modalEditRefuseBtn">거절</button>
									<input type="hidden" name="id"> <input type="hidden"
										name="type">
								</form>
								<form action="${contextPath }/confirmEditProject.ad" method="post" id="editConfirmSubmit">
									<button id="modalEditConfirmButton" type="button"
										class="btn btn-sm btn-outline-danger">승인</button>
									<input type="hidden" name="id"> 
									<input type="hidden" name="type">
									<input type="hidden" name="content">
									<textarea id="content" style="display: none;" name="fundingContent"></textarea>
								</form>
							</div>
						</div>
					</div>
				</div>

				<!--  원팅 삭제 승인 -->
				<div id="confirmD" class="modal fade" tabindex="-1">
					<div class="modal-dialog modal-dialog-centered">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title">게시글 삭제 승인</h5>
								<button type="button" class="btn-close" data-bs-dismiss="modal"
									aria-label="Close"></button>
							</div>
							<div class="modal-body">
								<p>정말 프로젝트 삭제를 승인하시겠습니까?</p>
							</div>
							<div class="modal-footer">
								<form action="${contextPath }/refuseDeleteProject.ad"
									method="post" id="refuseDeleteSubmit">
									<button type="button" class="btn btn-sm btn-outline-secondary"
										id="modalDeleteRefuseBtn">거절</button>
									<input type="hidden" name="id"> <input type="hidden"
										name="type">
								</form>
								<form action="${contextPath }/confirmDeleteProject.ad"
									method="post" id="refuseConfirmSubmit">
									<button id="modalDeleteConfirmButton" type="button"
										class="btn btn-sm btn-outline-danger">승인</button>
									<input type="hidden" name="id"> <input type="hidden"
										name="type">
									<textarea id="content" style="display: none;"
										name="fundingContent"></textarea>

								</form>
							</div>
						</div>
					</div>
				</div>

				<nav aria-label="Standard pagination example" style="float: right;">
					<ul class="pagination">
						<li class="page-item"><c:url var="goBack" value="${ loc }">
								<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
							</c:url> <a class="page-link" href="${ goBack }" aria-label="Previous">
								<span aria-hidden="true">&laquo;</span>
						</a></li>
						<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
							<c:url var="goNum" value="${ loc }">
								<c:param name="page" value="${ p }"></c:param>
							</c:url>
							<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
						</c:forEach>
						<li class="page-item"><c:url var="goNext" value="${ loc }">
								<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
							</c:url> <a class="page-link" href="${ goNext }" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>


			</main>
		</div>
	</div>


	<script>
		$(document).ready(function() {
			$('.myForm').hide();
		});
	
		$('.answerBtn').click(function() {
			const num = $(this).val();
			
			$('.myForm' + num).toggle();
			
		});
		
		$('.cancel').click(function() {
			const num = $(this).val();

			$('.myForm' + num).hide();
		});
		
		$('label').css('display', 'inline-block');
			 
		const btns = $(".confirmP");
		for(const btn of btns) {
			btn.addEventListener("click", function(){
				const id = $(this).find("span").text();
				$("input[name=id]").val(id);
				const division = $(this).find("input").val();
				$("input[name=type]").val(division);
				console.log(id);
				console.log($("input[name=type]").val(division));
			});
		}
		
		const btns2 = $(".confirmE");
		for(const btn2 of btns2) {
			btn2.addEventListener("click", function(){
				const id = $('#sendEdit').find("span")[0].innerText;
				$("input[name=id]").val(id);
				const division = $('#sendEdit').find("input[name=division]").val();
				$("input[name=type]").val(division);
				const content = document.getElementById('editContent');
				$("input[name=content]").val(content.innerHTML);
				
				
				console.log($("input[name=id]").val(id));
				console.log($("input[name=type]").val(division));
				console.log($("input[name=content]").val(content.innerHTML));
			});
		}
		
		const btns3 = $(".confirmD");
		for(const btn3 of btns3) {
			btn3.addEventListener("click", function(){
				const id = $('#sendDelete').find("span").text();
				$("input[name=id]").val(id);
				const division = $('#sendDelete').find("input[name=division]").val();
				$("input[name=type]").val(division);
				
				console.log($("input[name=id]").val(id)[0]);
				console.log($("input[name=type]").val(division));
				console.log($('#sendDelete').find("input[name=title]").val());
		
			});
		}
		
		$("#modalConfirmButton").on("click", function(){
 			$("#confirmSubmit").submit();
		});
		
		$("#modalRefuseBtn").on("click", function(){
 			$("#refuseSubmit").submit();
			console.log("df");
		});
		
		$("#modalEditConfirmButton").on("click", function(){
 			$("#editConfirmSubmit").submit();
		});
		
		$("#modalEditRefuseBtn").on("click", function(){
 			$("#editRefuseSubmit").submit();
		});
		
		$("#modalDeleteConfirmButton").on("click", function(){
 			$("#refuseConfirmSubmit").submit();
		});
		
		$("#modalDeleteRefuseBtn").on("click", function(){
 			$("#refuseDeleteSubmit").submit();
		});
	</script>




</body>
</html>
