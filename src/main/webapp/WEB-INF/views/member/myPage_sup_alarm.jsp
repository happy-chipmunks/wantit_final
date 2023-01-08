<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<jsp:include page="../common/navbar.jsp"/>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 서포터(알림)</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Bootstrap v5.1.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<!-- css -->
<link rel="stylesheet" href="resources/css/myPage_sup_wantingList.css">


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
	<style>
		@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		} 
		
		 .table{font-family: 'NanumSquareNeo-Variable';}
		
		 .container{
			border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
		} 
		
		  div>ul>li{
			margin: auto;
			margin-left: 10px;
		    margin-right: 10px;
		    font-family: 'Do Hyeon', sans-serif;
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
		.circle-img {

	    object-fit: cover;
	
	    object-position: top; 
	
	    border-radius: 50%;
	
	    width: 100px; 
	
	    height: 100px;

		}
		
		td {
		vertical-align: middle;
		}
		
    </style>

</head>
<body>
	
    <br><br><br>
    <div class="container">
    	<div>
    		<h1 style="display: inline;"><b>마이페이지</b></h1>&nbsp;&nbsp;&nbsp;
    		<button class="btn" onclick="openPopup()"><img src="${ contextPath }/resources/myPageImage/메시지.png" style="width: 40px; height: 40px;"></button>
    	</div>
    	<hr>
    	<div class="text-end">
          <button type="button" class="btn btn-secondary" style="background-color: #AD699B;" onclick="location.href='${contextPath}/myPageSuppoterAlarm.me'">서포터</button>
          <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/myPageCreatorAlarm.me'">크리에이터</button>
        </div>
       
    </div>

	<div class="row">
		<div class="col-3" style="align-self;">
			<ul>
				<li style="width: 200px; margin: auto;">
				<c:if test="${image == null }">
				<img  id= "target_img" src="${ contextPath }/resources/myPageImage/뉴프로필.png" style="width: 150px; height: 150px;">
				</c:if>
				<c:if test="${image != null }">
    			<img  id="target_img" src="${contextPath}/resources/member/${ image }" style="width: 150px; height: 150px;" class="circle-img">
    			</c:if>
				
				<br><br>
	   				<h4><b>${ loginUser.memberName }</b>님</h4>
	   				<p id="info">팔로워 0명<br>
	   				서포터<br>
	   				<button class="btn btn-sm" style="background-color: lightgray;">로그아웃</button>
	   				</p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporter.me'"><b>내 정보</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterWanting.me'"><b>원팅</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterDibs.me'"><b>찜</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterInquiry.me'"><b>문의</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" style="background-color: #AD699B;" onclick="location.href='${contextPath}/myPageSupporterAlarm.me'"><b>알림</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterFollow.me'"><b>팔로우</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterPayList.me'"><b>구매이력</b></button></p>
   				</li>
   			</ul>
   		</div>
   	
   	<div class="col-8">
   		<h4 align="left" style="display: inline;"><b>알림</b>  </h4>
<!--     	<button class="btn button2">공지/이벤트</button> -->
<!-- 		<button class="btn button2">오픈예정</button> -->
<!-- 		<button class="btn button2">팔로잉</button> -->
		<hr>			
		<div class="container">	
			<table class="table">
			<thead id="thead">
				<tr>
					<th>   </th>
					<th>알림</th>
					<th>날짜</th>
					<th>상태</th>
				</tr>
 			</thead>		    	
    		<tbody id="tbody1">	
				<c:forEach items="${ alarmList }" var="a">
 				<tr>
 					<td>
 						<input type="hidden" id="alarm_board_cate" value="${ a.alarmBoardCate }">
 						<input type="hidden" id="alarm_board_id" value="${ a.alarmBoardId }">
 						
	    				<c:if test="${ a.alarmCheck.equals('N') }">
							<img src="resources/wanting/mail-upopen.png" style="width:20px; margin: 10px;"/>
	    				</c:if>
	    				<c:if test="${ a.alarmCheck.equals('Y') }">
							<img src="resources/wanting/mail-open.png" style="width:20px; margin: 10px;"/>
	    				</c:if>
 					</td>
    				<td>${ a.alarmMsg }</td>
    				<td>${ a.alarmDate }</td>
    				<td>
	    				<c:if test="${ a.alarmCheck.equals('N') }">미확인</c:if>
	    				<c:if test="${ a.alarmCheck.equals('Y') }">확인</c:if>
    				</td>
 				</tr>
 				</c:forEach>
 				<c:if test="${ empty alarmList }">
					<tr style="height: 600px; text-align: center; margin-bottom: 50px;">
						<td colspan="4">알림이 존재하지 않습니다.</td>
					</tr>
				</c:if>
 			</tbody>	
 			</table>
   		</div>
	</div>
	
		<c:if test="${ !empty alarmList }">
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
    <br>
	
	

	<script>
	function openPopup(){
		window.open("myPage_sup_message.me", "message", "width=700 height=600");
	}
	
	window.onload = () =>{
		const tbody1 =  document.getElementById('tbody1');
		const tds1 = tbody1.querySelectorAll('td');
		
		for(const td of tds1){
			td.addEventListener('click', function(){
				const input = this.parentElement.querySelectorAll('input');
				const alarmBoardCate = parseInt(input[0].value);
				const alarmBoardId = parseInt(input[1].value);
				
				console.log("보드아이디 : " + alarmBoardId);
				if(alarmBoardCate == 1) {
    				location.href='${contextPath}/selectFundingBoard.fund?bId=' + alarmBoardId + '&writerNo=' + writerNo; // 크리에이터 넘...을 가져와야함...
				}
				if(alarmBoardCate == 4) {
					location.href = '${contextPath}/selectWanting.want?wantingNum='+ alarmBoardId;
				}
			});
		}
	}
	
	
	
	</script>

</body>
</html>