<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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



  <!-- icons fonts -->


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
    <div class="col-2"><a class="tab-link" href="#">서포터 <span class="count-total">${ supCount }</span></a></div>
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
                <div class="notice">후기<span class="notice-num"> ${ revCount }</span></div>
              </div>
              <div class="col-3 notice-right">
                <select class="sort">
                  <option value="recent-order">최신순</option>
                  <option value="past-order">과거순</option>
                </select>
              </div>
          </div>
        </div>
        <!-- 후기 리스트 -->
        <div class="accordion accordion-flush" id="accordionFlushExample">
        <c:forEach items="${ rv }" var="rv">
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
	                  			<span class="review-nickname">> ${ nick.memberNickname }</span>
	                  		</c:if>
	                  </c:forEach>
	                  <p class="review-content">
	                    ${ fn:substring(rv.reviewContent, 0, 10) }
	                  </p>
	                  <p class="review-date">하루 전</p>
	                 </div>  
	               </button>
	            </h2>
	            <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
	              <div class="accordion-body review-content-detail">
	                ${ rv.reviewContent }
	              </div>
	            </div>
	          </div>
          </c:forEach>
         </c:forEach>
          
          
          <br><br><br><br><br><br><br><br>
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
        </div>
		





      </div>
    </div>

    <!-- 오른쪽 사이드바 -->
    <div class="col-md-3 right-content">
      <div class="state-box">
        <p class="remaining-day"><strong>20일 남음</strong></p>
        <div class="rate-bar"><em></em></div>
        <p class="achievement-rate"><strong>10540</strong>% 달성</p>
        <p class="total-amount"><strong>${ f.currentMoney }</strong>원 펀딩</p>
        <p class="total-supporter"><strong>${ supCount }</strong>명의 서포터</p>
      </div>
      
      <div class="container goal-box">
        <div class="row g-0">
          <div class="col-3"><strong>목표금액</strong></div>
          <div class="col-9"><p class="goal-amount">${ f.targetMoney }</p></div>
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
        <c:if test="${ m != null }">
		 	<button class="btn-funding" style="background-color: #8c86c7;" onclick="location.href='${contextPath}/payView.pay?fundingNum=${ fundingNum }'">펀딩하기</button>
		</c:if>
		<c:if test="${ m == null }">
		 	<button class="btn-funding" style="background-color: #8c86c7;" onclick="noLogin()">펀딩하기</button>
		</c:if>
        <div class="row g-1">
          <div class="col-sm-4"><button onclick="" class="btn-funding-small">
            <img src="resources/img/heart.png"/>
            <span class="dips-count">5</span></button>
          </div>
          <div class="col-sm-4"><button onclick="" class="btn-funding-small">공유하기</button></div>
          <div class="col-sm-4"><button onclick="" class="btn-funding-small">신고하기</button></div>
        </div>
      </div>
    </div>
  </div>
</div>

<script>
	function noLogin(){
		alert('로그인 후 이용해주세요.');
	}
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>