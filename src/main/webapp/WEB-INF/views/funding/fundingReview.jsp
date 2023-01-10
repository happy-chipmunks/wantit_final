<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../common/navbar.jsp"></jsp:include>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>펀딩 상세페이지 - 후기</title>

  <!-- CSS Files -->
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="resources/css/bootstrap.min.css"/>
  <link rel="stylesheet" href="resources/css/fundingMain.css"/>
  <link rel="stylesheet" href="resources/css/fundingNotice.css"/>
  <link rel="stylesheet" href="resources/css/fundingReview.css"/>
  <link rel="stylesheet" href="resources/css/bootstrap-custom.css"/>

<style>
	@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
	body{ font-family: 'NanumSquareNeo-Variable' }
	
	.creator-info{
			    border: 1px solid #8c86c7;
		    	border-radius: 8px;
		    	padding: 16px;
		}
		
		.i{color: #8c86c7;}
		
		.btn{outline: 1px solid #8c86c7;}
		
		#reportIcon{color: red;}
</style>


</head>

<body>
<div class="funding-header text-center">
  <p class="title-info" style="color: #8c86c7;">${ f.fundingCate }</p>
  <h2 class="title"><a href="#">${ f.fundingTitle }</a></h2>
</div>
<div class="container-fluid text-center funding-category">
  <div class="row">
    <div class="col-2 offset-2"><a class="tab-link" href="${ contextPath }/selectFundingBoard.fund?bId=${fundingNum}&writerNo=${writerNo}">정보 </a></div>
    <div class="col-2"><a class="tab-link" href="${ contextPath }/fundingNotice.fund?bId=${fundingNum}">새소식 </a></div>
    <div class="col-2"><a class="tab-link" href="#" style="font-weight: 1000px; color:black;">리뷰 </a></div>
    <div class="col-2"><a class="tab-link" href="${ contextPath }/fundingSupportor.fund?bId=${f.fundingNum}">서포터 <span class="count-total">${ supCount }</span></a></div>
  </div>
</div>

<div class="container funding-content">
  <div class="row g-2">
    <!-- 왼쪽 사이드바 -->
    <div class="col-md-9">
      <div class="left-content">

        <!-- 후기 상단바 -->
        <div class="container">
          <div class="row notice-bar g-0">
              <div class="col-9 notice-left">
                <div class="notice">리뷰<span class="notice-num"> ${ revCount }</span></div>
              </div>
              <div class="col-3 notice-right">
<!--                 <select class="sort"> -->
<!--                   <option value="recent-order">최신순</option> -->
<!--                   <option value="past-order">과거순</option> -->
<!--                 </select> -->
              </div>
          </div>
        </div>
        <!-- 후기 리스트 -->
        <div class="accordion accordion-flush" id="accordionFlushExample">
        <c:forEach items="${ rv }" var="rv">
        	<c:if test="${ rv.reviewStatus == 'Y' }"></c:if>
        	<c:forEach items="${ ps }" var="ps">
	          <div class="accordion-item">
	            <h2 class="accordion-header" id="flush-headingOne">
	              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
	                <div class="review-list">
	                  <strong>옵션 : </strong>
	                  <span class="review-option">
	                  		<c:if test="${ rv.reviewer eq ps.buyerName }">
	                  			${ ps.rewardBuyList }
	                  		</c:if>
	                  </span>
	                  <c:forEach items="${ reviewerNick }" var="nick">
	                  		<c:if test="${ rv.reviewer eq nick.memberId }">
	                  			<span class="review-nickname" >> ${ nick.memberNickname }</span>
<%-- 	                  			<input id="reviewerId" type="hidden" value="${ rv.reviewer }"> --%>
	                  		</c:if>
	                  </c:forEach>
	                  <p class="review-content">
	                    ${ fn:substring(rv.reviewContent, 0, 10) }
	                  </p>
	                  <p class="review-date"><i class="bi bi-star-fill"></i> ${ rv.reviewRating }</p>
	                 </div>  
	               </button>
	            </h2>
	            <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
	              <div class="accordion-body review-content-detail">
	                ${ rv.reviewContent }
	                <button class="btn btn-sm" style="float: right; display: block;" data-bs-toggle="modal" data-bs-target=".report"><i id="reportIcon" class="bi bi-patch-exclamation-fill"></i>&nbsp;&nbsp;신고하기</button>
	              </div>
	            </div>
	          </div>
	          
	          <!-- 리뷰 신고하기 모달 -->
				<form action="${ contextPath }/reportReview.fund?reviewNum=${rv.reviewNum}&reviewer=${rv.reviewer}" method="POST">
					<div class="modal fade font report" id="report" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
					  <div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">
							  	<div class="modal-header">
							        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">리뷰 신고</h1>
							        <button type="button" class="btn-close close" data-bs-dismiss="modal" aria-label="Close"></button>
							    </div>
							 	<div class="modal-body" style="text-align: left">
							 			신고 카테고리
							 			<select name="reportCate" id="cate" class="form-select">
						   					<option>스팸홍보/도배</option>
						   					<option>음란물</option>
						   					<option>불법정보 포함</option>
						   					<option>미성년자 유해성</option>
						   					<option>욕설/혐오</option>
						   					<option>개인정보 노출</option>
						   					<option>불쾌한 표현</option>
						   				</select>
										내용<textarea name="reportContent" id="content" class="form-control" style="resize:none; height:200px;"></textarea>
								      	<br>
								 </div>
								 <div class="modal-footer pt-2">
									<button class="btn btn-primary btn-report">보내기</button>&nbsp;
							      	<button type="button" class="btn btn-secondary btn-inquiry close" data-bs-dismiss="modal">취소</button>
								 </div>
					    	</div> 
					  </div>
					</div>
				</form>
          </c:forEach>
         </c:forEach>
          
          
          <br><br><br><br><br><br><br><br>
          <c:if test="${ pi.maxPage > 0  }">
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
			</c:if>
        </div>
      </div>
    </div>

    <!-- 오른쪽 사이드바 -->
    <div class="col-md-3 right-content font">
        <div class="state-box">
          <jsp:useBean id="now" class="java.util.Date"/>
          <fmt:parseNumber value="${ now.time / (1000*60*60*24) }" integerOnly="true" var="nowFmtTime" scope="request"/>
           <fmt:parseNumber value="${ f.fundingEnd.time / (1000*60*60*24) }" integerOnly="true" var="feFmtTime" scope="request"/>
          <p class="remaining-day"><strong>${feFmtTime - nowFmtTime + 1 }일 남음</strong></p>
          <div style="height: 2px; width: 100%; background-color: gray;"><span id="progressBar" style="display: block; background-color: #8c86c7; height: 2px; width: 26%;"></span></div>
          <fmt:formatNumber value="${ f.currentMoney / f.targetMoney }" type="percent" var="percentage"/>
          <input type="hidden" value="${ percentage }" id="progressBarPercent">
          <p class="achievement-rate"><strong>${ percentage }</strong> 달성</p>
          <p class="total-amount"><strong class="toLocaleMoney">${ f.currentMoney }</strong>원 펀딩</p>
          <p class="total-supporter"><strong>${ supCount }</strong>명의 서포터</p>
        </div>
        
        <div class="container goal-box">
          <div class="row g-0">
            <div class="col-3"><strong>목표금액</strong></div>
            <div class="col-9"><p class="goal-amount toLocaleMoney">${ f.targetMoney }</p></div>
          </div>
          <div class="row g-0">
            <div class="col-3"><strong>펀딩 기간</strong></div>
            <div class="col-9"><p class="fundint-period">${ f.fundingStart } ~ ${ f.fundingEnd }
            </p></div>
          </div>
          <div class="row g-0">
            <div class="col-3"><strong>결제</strong></div>
            <div class="col-9"><p class="perchase-procedure">목표금액 달성시 ${ f.fundingEnd }에 결제 진행</p></div>
          </div>
        </div>

        <div class="container funding-buttons g-0">
<!--           <button class="btn-funding" data-bs-toggle="modal" data-bs-target="#funding-modal">펀딩하기</button> -->
		<c:if test="${ m != null }">
		 	<button class="btn-funding" style="background-color: #8c86c7;" onclick="location.href='${contextPath}/payView.pay?fundingNum=${ bId }'">펀딩하기</button>
		</c:if>
		<c:if test="${ m == null }">
		 	<button class="btn-funding" style="background-color: #8c86c7;" onclick="noLogin()">펀딩하기</button>
		</c:if>
          <div class="row g-1">
          <c:if test="${ !ok }">
          	<c:if test="${ m == null }">
            <div class="col-sm-6"><button onclick="noLogin()" class="btn-funding-small">
              <img src="${ contextPath }/resources/funding/찜X1.png"/>
              <span class="dips-count">${ dibsCount }</span></button>
            </div>
           </c:if>
           <c:if test="${ m != null }">
            <div class="col-sm-6"><button onclick="location.href='${contextPath}/insertDibs.fund?fundingNum=${ f.fundingNum }&id=${ id }&writerNo=${writerNo}'" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#dibs-modal">
              <img src="${ contextPath }/resources/funding/찜X1.png"/>
              <span class="dips-count">${ dibsCount }</span></button>
            </div>
            </c:if>
           </c:if>
           <c:if test="${ ok }">
            <div class="col-sm-6"><button onclick="location.href='${contextPath}/deleteDibs.fund?fundingNum=${ f.fundingNum }&id=${ id }&writerNo=${writerNo}'" class="btn-funding-small">
              <img src="${ contextPath }/resources/funding/찜1.png"/>
              <span class="dips-count">${ dibsCount }</span></button>
            </div>
           </c:if>
            <div class="col-sm-6"><button onclick="" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#share-modal"><img src="resources/wanting/share.png"/>공유하기</button></div>
<!--             <div class="col-sm-4"><button onclick="" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#report-modal">신고하기</button></div> -->
          </div>
        </div>
         <hr>
        
        <div>
        	<div class="container creator-info" style="text-align:center;">
        		<div class="mb-2" id="goToInfo">
	        		<a>
		        		<c:if test="${ ci != null }">
		        			<img style="border-radius: 70%" class="me-3" src="${ contextPath }/resources/member/${ci.imageRename}" width="60" height="60""> 
		        		</c:if>
	        			<c:if test="${ ci == null }">
		        			<img class="me-3" src="${ contextPath }/resources/myPageImage/뉴프로필.png" width="60" height="60">
		        		</c:if>
		        		<span style="font-size: 20px;">${ creator.creatorName }</span>
		        		<input type="hidden" value="${ creator.creatorNum }" id="creatorNum">
	        		</a>
        		</div>
        		<div class="mb-2">
        			<i class="bi bi-star-fill" style="color: #e8acef;"></i>
        			<span class="dohyeonFont">평점 -</span>
        			<c:if test="${ reviewAverage != 'NaN' }">
        			<span class="dohyeonFont">${ reviewAverage } (${ reviewCount }개)</span>
        			</c:if>
        			<c:if test="${ reviewAverage == 'NaN' }">
        			<span class="dohyeonFont">0.0 (${ reviewCount }개)</span>
        			</c:if>
        			<br>
        			<i class="bi bi-piggy-bank-fill" style="color: #e8acef;"></i>
        			<span  class="dohyeonFont">누적액수 - </span>
        			<span class="dohyeonFont" id="ta">${ totalAmount }</span>
        			<br>
        			<i class="bi bi-people-fill" style="color: #e8acef;"></i>
        			<span  class="dohyeonFont">서포터수 - </span>
        			<span class="dohyeonFont">${ totalSupCount }</span>
        			<br><br>
        			<span>기업형태 : </span>
        			<c:if test="${ creator.businessType eq 'N'.charAt(0) }"><span>개인기업</span></c:if>
        			<c:if test="${ creator.businessType eq 'Y'.charAt(0) }"><span>단체기업</span></c:if>
        			<br>
        			<span>대표자 이름 : </span>
        			<span>${ creator.managerName }</span>
        			<br>
        			<span>이메일 : </span>
        			<span>${ creator.managerEmail }</span>
        			<br>
        			<span>대표전화 : </span>
        			<span>${ creator.managerPhone }</span>
        			<br>
        			<span>사업자등록번호 : </span>
        			<span>${ creator.businessNumber }</span>
        		</div>
<!--         		<div class="mb-2"> -->
<!-- <!--         			<span>만족도</span> --> 
<!--         			<span class="ps-3"><i class="bi bi-person-fill fs-4"></i>&nbsp;&nbsp;팔로워 0명</span> -->
<!--         		</div> -->
        		<div>
        			<c:if test="${ yn }">
        				<button class="btn btn-creator" data-bs-toggle="modal" data-bs-target="#inquiry"><i class="bi bi-chat-left-dots"></i>&nbsp;&nbsp;문의하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
<!--         				<button class="btn btn-creator" id="follow"><i class="bi bi-plus"></i>&nbsp;&nbsp;팔로우</button> -->
        			</c:if>
        			<c:if test="${ !yn }">
        				<button class="btn btn-creator"><i class="bi bi-chat-left-dots"></i>&nbsp;&nbsp;문의하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
<!--         				<button class="btn btn-creator"><i class="bi bi-plus"></i>&nbsp;&nbsp;팔로우</button> -->
        			</c:if>
        		</div>
        	</div>
      	</div>
      </div>
  </div>
</div>
<br><br>

	

<script>
	function noLogin(){
		alert('로그인 후 이용해주세요.');
	}
	
	changeMoney();
	function changeMoney() {
		const targetMoney = document.getElementsByClassName('toLocaleMoney');
		for(const span of targetMoney) {
			const before = parseInt(span.innerText);
			span.innerText = " " + before.toLocaleString() + "원";
		}
	}
	
	const progressBar = document.getElementById('progressBar');
	const progressBarPercent = document.getElementById('progressBarPercent');
	const percent = parseInt(progressBarPercent.value.substring(0, progressBarPercent.value.length-1));
	if(percent >= 100) {
		progressBar.style.width = "100%";
	} else {
		progressBar.style.width = percent + "%";
	}
	window.onload=()=> {
		const ta = document.getElementById('ta');
		const before = parseInt(ta.innerText);
		ta.innerText = before.toLocaleString() + "원";
	}
	
	// 문의하기 버튼 눌렀을 때 테두리 돌려줘잉
	$(document).ready(function(){ //이 코딩 필수
		$("#inquiryBtn").click(function() {
	
			$("#inquiryBtn").css({ //이렇게도 쓸 수 있으며 제일 낫다
				"border":"1px solid #8c86c7"
			});	
		});
	});
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>