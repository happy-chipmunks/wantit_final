<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!Doctype html>
<html lang="en">
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
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
.adsModal {
	background-color: white;
	width: 100%;
	height: 100px;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
}
.textForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
	
}
.textForm1 {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	align-items: center;
	justify-content: center;
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
.image{
	margin-left: 50px;
}
</style>


<!-- Custom styles for this template -->

<script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body id="body">





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
					<h1 class="h2">광고관리</h1>

				</div>
				<table class="table" style="height: auto;">
					<thead>
						<tr>
							<th scope="col">광고번호</th>
							<th scope="col">펀딩번호</th>
							<th scope="col">펀딩제목</th>
							<th scope="col">의뢰날짜</th>
							<th scope="col">처리상태</th>

						</tr>
					</thead>
					<tbody class="table-group-divider">
						<c:forEach var="m" items="${mList }" varStatus="r">
						<tr>
							<th scope="row">${ m.adsNum }</th>
							<td>${ m.fundingNum }</td>
							<td>${ m.fundingTitle }</td>
							<td>${ m.adsCreateDate }</td>
							<td>
								<c:if test="${ m.adsStatus == 'N' }">
									<button class="btn btn-primary answerBtn" type="button" value="${ r.index }">미처리</button>
								</c:if>
								<c:if test="${ m.adsStatus == 'Y' && m.confirm =='Y'}">
									광고승인
								</c:if>
								<c:if test="${ m.adsStatus == 'Y' && m.confirm =='N'}">
									광고거절
								</c:if>
							</td>

						</tr>
						</c:forEach>
					</tbody>
				</table>
				
				<c:forEach var="m" items="${ mList }" varStatus="r">
					<div class="shadow p-3 mb-5 bg-body rounded myForm myForm${ r.index }">
						<form action="${contextPath }/adManage.ad" method="post">
						<fieldset>
							<h1>
								<br>&nbsp;&nbsp;&nbsp;&nbsp;광고 처리
							</h1>
							<br>
								<div class="textForm">
									<textarea name="adsModal" class="adsModal" style="height: 50px;" readonly>펀딩 제목 : ${ m.fundingTitle }</textarea>
								</div>
							<br>
								<c:forEach var="i" items="${ iList }">
									<c:if test="${ m.fundingNum == i.imageBoardId }">
										<div class="textForm1">
											광고 내용<br><br><br>
												<img src="${ contextPath }/resources/member/${ i.imageRename }" width="1400px;" height="700px;">
										</div>
										<input type="hidden" name="imageNum" id = "imageNum" value="${ i.imageNum }">
									</c:if>									
								</c:forEach>
								<br>
								<div class="textForm">
									<textarea name="adsModal" class="adsModal" style="height: 50px;" readonly>의뢰 금액 : ${ m.adsPrice }</textarea>
								</div>
								<br>
								
								<div class="textForm">
									<textarea name="adsModal" class="adsModal" style="height: 50px;" readonly>광고 의뢰 기간 : ${ m.adsStart } ~ ${ m.adsEnd }</textarea>
								</div>
							
							<br>
							<button type="button"
								class="btn refuse btn-primary btn-lg right" value="${ r.index }">
							<span style="display: none">${ m.adsNum }</span>
							<input type="hidden" name="boardId" class="boardId" value="${ m.fundingNum }" >	
								거절</button>
							<button type="button" class="btn confirm btn-primary btn-lg right" value="${ r.index }">
							<span style="display: none">${ m.adsNum }</span>
							<input type="hidden" name="boardId" class="boardId" value="${ m.fundingNum }" >
							승인</button>
						</fieldset>
					</form>
				</div>
				</c:forEach>				
				
				
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
	
		$('label').css('display', 'inline-block');
		
		
		$(document).on("click", ".refuse", function(){
            const adsNum = this.children[0].innerText;
            const boardId = this.children[1].value;
            	
            
            location.href = '${contextPath}/refuseAd.ad?adsNum='+adsNum+'&boardId='+boardId;
            
    	});
		
		$(document).on("click", ".confirm", function(){
            const adsNum = this.children[0].innerText;
            const boardId = this.children[1].value;
      		const imageNum = $(this).parent().parent().find("#imageNum").val()
			
			console.log(adsNum);
            console.log(boardId);
            console.log(imageNum);
            location.href = '${contextPath}/confirmAd.ad?adsNum='+adsNum+'&boardId='+boardId+ '&imageNum=' + imageNum;
            
    	});
		
	</script>

	


</body>
</html>
