<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		
		.mBtn{background-color: #747474;}
    </style>

</head>
<body>
	<div class="container mt-3" style="width: 500px; height: 300px;">
		<img src="resources/myPageImage/메시지.png" width="60px">&nbsp;&nbsp;&nbsp;&nbsp;<h2 style="display: inline">쪽지함</h2>
		<br><br>
		<div style="height: 450px">
			
				<table class="table" id="messageList">
					<tr onclick="$('.message').modal('show')">
						<th>문의 번호</th>
						<th>제목</th>
						<th>보낸이</th>
						<th>보낸날짜</th>
						<th>답변 여부</th>
					</tr>
					<c:if test="${ pi.maxPage > 0  }">
						<c:forEach items="${ msgList }" var="m">
							<tr>
								<td>${ m.messageCode }</td>
								<td>${ m.messageTitle }</td>
								<td>${ m.sender }</td>
								<td>${ m.messageDate }</td>
								<td>
									<c:if test="${ m.replyStatus == 'N' }">
										<button>답변하기</button>
									</c:if>
									<c:if test="${ m.replyStatus == 'Y' }">
										<button>문의보기</button>
									</c:if>
								</td>
							</tr>
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
	
	<!-- 쪽지함 -->
	<div class="modal fade message" id="modal" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			  	<div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">쪽지</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			    </div>
			 	<div class="modal-body" style="text-align: left">
				    	제목<input type="text" class="form-control" id="recipient-name" name="messageTitle" value="" readonly>
				    	내용<input class="form-control" style="height: 150px" name="messageContent" value="" readonly>
				      	<br>
				      	보낸 아이디 : <input value="" type="text" name="senderUsername" readonly style="border: none;">
				      	<input value="" type="hidden">
				 </div>
				 <div class="modal-footer">
					<button class="btn btn-primary" onclick="$('#modal2').modal('show')"><strong>답장하기</strong></button>
			      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
				 </div>
	    	</div> 
	  </div>
	</div>
	
	<!-- 답장하기 -->
	<div class="modal fade" id="modal2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
	  <div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
			  	<div class="modal-header">
			        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">쪽지</h1>
			        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			    </div>
			 	<div class="modal-body" style="text-align: left">
				    	제목<input type="text" class="form-control input" id="recipient-name" name="messageTitle">
				    	내용<input class="form-control input" style="height: 150px" name="messageContent">
				      	<br>
				      	<input value="" type="hidden" class="input">
				 </div>
				 <div class="modal-footer">
					<button class="btn btn-primary" id="sendBtn" ><strong>보내기</strong></button>
			      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
				 </div>
	    	</div> 
	  </div>
	</div>
	
	<script>
	window.onload=()=>{
		document.getElementById('sendBtn').addEventListener('click', () => {
			const input = document.getElementsByClassName('input');
			console.log(input[2].value);
			$.ajax({
				url: '',
				data: {messageTitle:input[0].value,
					   messageContent:input[1].value,
				},
				success: (data) => {
					$('#modal2').modal('hide')
					 input[0].value = '';
					 input[1].value = ''; 
					 location.reload();
				},
				error: (data) => {
					console.log(data);
				}
			});
		});
	}
	</script>
</body>
</html>