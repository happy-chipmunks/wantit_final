<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 쪽지함</title>
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
		
    </style>

</head>
<body>
	<div class="container mt-3" style="width: 700px; height: 300px;">
		<img src="resources/myPageImage/메시지.png" width="60px">&nbsp;&nbsp;&nbsp;&nbsp;<h2 style="display: inline">쪽지함</h2>
		<br><br>
		<div style="height: 450px">
			
				<table class="table" id="messageList">
					<tr>
						<th>문의 번호</th>
						<th>제목</th>
						<th>보낸이</th>
						<th>보낸날짜</th>
						<th>답변 여부</th>
					</tr>
					<c:if test="${ pi.maxPage > 0  }">
						<c:forEach items="${ senderMsgList }" var="sml">
								<tr>
									<td>${ sml.messageCode }</td>
									<td>${ sml.messageTitle }</td>
									<td>${ sml.sender }</td>
									<td>${ sml.messageDate }</td>
									<td>
										<c:if test="${ fn:contains(sml.replyStatus, 'N') }">
											<button class="btn" style="background-color:#8c86c7;" disabled>답변 대기</button>
										</c:if>
										<c:if test="${ fn:contains(sml.replyStatus, 'Y') }">
											<button class="btn" style="background-color:#8c86c7;" data-bs-toggle="modal" data-bs-target="#see">문의보기</button>
										</c:if>
									</td>
								</tr>
								<!-- 문의보기 모달 -->
								<form>
									<div class="modal fade font" id="see" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
									  <div class="modal-dialog modal-dialog-centered">
											<div class="modal-content">
											  	<div class="modal-header">
											        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">문의</h1>
											        <button type="button" class="btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
											    </div>
											 	<div class="modal-body" style="text-align: left">
											 			카테고리
											 			<select id="cate" class="form-select">
										   					<option>${ sml.messageCate }</option>
										   				</select>
												    	제목<input type="text" class="form-control input" id="title" value="${ sml.messageTitle }" readonly>
														내용<textarea id="content" class="form-control" style="resize:none; height:100%;" readonly>${ sml.messageContent }</textarea>
												      	<br>
												 </div>
												 <div class="modal-footer pt-2">
												 	${ sml.replyDate } | 문의 답변<textarea readonly class="form-control" style="resize:none; height:200px;">${ sml.replyContent }</textarea>
											      	<button type="button" class="btn btn-secondary btn-inquiry close" data-bs-dismiss="modal">닫기</button>
												 </div>
									    	</div> 
									  </div>
									</div>
								</form>
						</c:forEach>
					</c:if>
				</table>
				<c:if test="${ pi.maxPage == 0 }">
						<div class="mx-auto my-auto" style="text-align:center;">
			      			쪽지함이 비었습니다.
			      		</div>
		      	</c:if>
			
		</div>
		<c:if test="${ pi.maxPage > 0 }">
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
	      </c:if>
	</div>
	
	
	<script>
// 	window.onload=()=>{
// 		document.getElementById('sendBtn').addEventListener('click', () => {
// 			const input = document.getElementsByClassName('input');
// 			console.log(input[2].value);
// 			$.ajax({
// 				url: '',
// 				data: {messageTitle:input[0].value,
// 					   messageContent:input[1].value,
// 				},
// 				success: (data) => {
// 					$('#modal2').modal('hide')
// 					 input[0].value = '';
// 					 input[1].value = ''; 
// 					 location.reload();
// 				},
// 				error: (data) => {
// 					console.log(data);
// 				}
// 			});
// 		});
// 	}
	</script>
</body>
</html>