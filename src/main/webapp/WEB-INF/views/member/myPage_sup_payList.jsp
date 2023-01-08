<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
	<jsp:include page="../common/navbar.jsp"/>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 서포터(펀딩)</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Bootstrap v5.1.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

<link rel="stylesheet" href="resources/css/myPage_sup_payList.css">
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
		
		.card-text{margin: 0;}
		.circle-img {

	    object-fit: cover;
	
	    object-position: top; 
	
	    border-radius: 50%;
	
	    width: 100px; 
	
	    height: 100px;

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
          <button type="button" class="btn btn-secondary" style="background-color: #AD699B;" onclick="location.href='${contextPath}/myPageSupporter.me'">서포터</button>
          <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/myPageCreator.me'">크리에이터</button>
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
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterAlarm.me'"><b>알림</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterFollow.me'"><b>팔로우</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" style="background-color: #AD699B;" onclick="location.href='${contextPath}/myPageSupporterPayList.me'"><b>구매이력</b></button></p>
   				</li>
			</ul>
   		</div>
   	
   		<div class="col-8">
		<h4 align="left" class="title">구매이력</h4>
	      <div class="row" style="padding-top: 10px;">
            <div class="col-2"></div>
            <div class="col-8">
            	<c:forEach begin="0" end="${ payScheduleList.size()-1 }" var="i">
            		<input type="hidden" value="${ payFundList[i].fundingNum }" id="fundNum${i}">
            		<input type="hidden" value="${ payFundList[i].creatorNum }" id="creatorNum${i}">
	                <div class="row payFundList">
	                    
	                    <c:forEach items="${ imageList }" var="image">
	                    	<c:if test="${ payFundList[i].fundingNum == Integer.parseInt(image.imageBoardId) }">
	                    	
		                   	 <div class="col-4 imageArea">
		                   	 	<img alt="" src="${ contextPath }/resources/funding/${ image.imageRename }" width="100%" height="100%">
		                   	 </div>
	                    	</c:if>
	                    </c:forEach>
	                    <div class="col-8">
	                        
	                        <div class="payFundTitle">${ payFundList[i].fundingTitle }</div>
	                      
	                        <div class="dateAndPayStatus">
	                        	<c:set value="${ fn:split(payScheduleList[i].customerUId, '_') }" var="splitArray"/>
	                            <span>펀딩 일시 : ${ splitArray[1] }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	                            <c:if test="${ payScheduleList[i].paymentStatus == 'paid' }">
		                            <span>결제 상태 : <span style="color: green;">성공</span></span>
	                            </c:if>
	                            <c:if test="${ payScheduleList[i].paymentStatus == 'null' && payScheduleList[i].scheduleStatus == 'scheduled'}">
		                            <span>결제 상태 : 대기</span>
	                            </c:if>
	                            <c:if test="${ payScheduleList[i].paymentStatus == 'null' && payScheduleList[i].scheduleStatus == 'revoked'}">
		                            <span>결제 상태 : <span style="color: orange;">취소</span></span>
	                            </c:if>
	                            <c:if test="${ payScheduleList[i].paymentStatus == 'failed' }">
		                            <span>결제 상태 : <span style="color: red;">실패</span></span>
	                            </c:if>
	                        </div>
	                        <form id="rePayOrReviewForm" method="post" class="rePayOrReviewForm">
	                        	<input type="hidden" value="${ payScheduleList[i].customerUId }" name="customerUId">
	                        	<input type="hidden" value="${ payScheduleList[i].merchantUId }" name="merchantUId">
	                        	<input type="hidden" value="${ payScheduleList[i].merchantName }" name="merchantName">
	                        	<input type="hidden" value="${ payScheduleList[i].buyerName }" name="buyerName">
	                        	<input type="hidden" value="${ payScheduleList[i].buyerTel }" name="buyerTel">
	                        	<input type="hidden" value="${ payScheduleList[i].buyerAddr }" name="buyerAddr">
	                        	<input type="hidden" value="${ payScheduleList[i].rewardBuyList }" name="rewardBuyList">
	                        	<input type="hidden" value="${ payScheduleList[i].cardNumber }" name="cardNumber">
	                        	<input type="hidden" value="${ payScheduleList[i].cardName }" name="cardName">
	                        	<input type="hidden" value="${ payScheduleList[i].amount }" name="amount">
	                        	<input type="hidden" value="${ payScheduleList[i].paymentStatus }" name="paymentStatus">
	                        	<input type="hidden" value="${ payScheduleList[i].scheduleStatus }" name="scheduleStatus">
	                        	<input type="hidden" value="${ payFundList[i].fundingTitle }" name="fundingTitle">
	                        	<input type="hidden" value="${ payFundList[i].fundingNum }" name="fundingNum">
		                        <div class="historyOrReview">
		                        	<span class="history" id="history" style="float: right;">결제내역</span>
		                            <c:if test="${ payScheduleList[i].paymentStatus == 'failed' }">
			                        	<span class="repayOrReview" id="repayOrReview" style="float: right;">재결제</span>
		                            </c:if>
		                            <c:if test="${ payScheduleList[i].paymentStatus == 'paid' && alreadyWriteReviewList[i] == false }">
			                        	<span class="repayOrReview" id="repayOrReview" style="float: right;">리뷰작성</span>
		                            </c:if>
		                        	
		                        </div>
	                        </form>
	                    </div>
	                </div>
            	</c:forEach>
                
               
	      <br>
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
	    </div>
	  </div>
	  <br>
		  
	</div>
</div>
    
    <br>
	
	<script>
	function openPopup(){
		window.open("myPage_sup_message.me", "message", "width=700 height=600");
	}
	
	const rePayOrReviewForm = document.getElementsByClassName('rePayOrReviewForm');
	const history = document.getElementsByClassName('history');
	const repayOrReview = document.getElementsByClassName('repayOrReview');
	
	
	const payFundTitle = document.getElementsByClassName('payFundTitle');
	const imageArea = document.getElementsByClassName('imageArea');
	
	for(let i=0 ; i<imageArea.length ; i++) {
			imageArea[i].addEventListener('click', function() {
				const fundNum = document.getElementById('fundNum' + i);
				const creatorNum = document.getElementById('creatorNum' + i);
				
				location.href = "${ contextPath }/selectFundingBoard.fund?bId=" + fundNum.value + "&writerNo=" + creatorNum.value;
			});
	}
	
	for(let i=0 ; i<history.length ; i++) {
		history[i].addEventListener('click', function() {
			rePayOrReviewForm[i].action =  "${contextPath}/seeMyPaySchedule.pay";
			rePayOrReviewForm[i].submit();
		});
	}
	
	for(let i=0 ; i<repayOrReview.length ; i++) {
		repayOrReview[i].addEventListener('click', function() {
			if(this.innerText == '재결제') {
				rePayOrReviewForm[i].action =  "${contextPath}/payAgain.pay";
				rePayOrReviewForm[i].submit();
			} else if(this.innerText == '리뷰작성') {
					let url = '${ contextPath }/reviewPage.me';
					let title = '리뷰작성';
					let status = 'width=1000, height=500, top=0, left=450';
					
					rePayOrReviewForm[i].target = title;
					rePayOrReviewForm[i].action = url;
					rePayOrReviewForm[i].method = 'post';
					 window.open(url, title, status);
					rePayOrReviewForm[i].submit();
			}
		});
	}
	
	
	</script>
	

</body>
</html>