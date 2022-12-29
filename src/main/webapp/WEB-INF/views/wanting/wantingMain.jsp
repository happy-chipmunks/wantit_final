<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>원팅 상세페이지</title>
  <!-- CSS Files -->
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
  <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
  <link rel="stylesheet" href="resources/css/bootstrap-custom.css" />
  <link rel="stylesheet" href="resources/css/wantingMain.css" />
  
  <!-- icons fonts -->

</head>
<body>
<div class="funding-header text-center">
  <div class="background"></div>
  <p class="title-info">함께 만들어나가는 원팅</p>
  <h2 class="title"><a href="#">${ wanting.wantingTitle }</a></h2>
</div>
<div class="container-fluid text-center funding-category">
  <div class="row">
    <div class="col-2 offset-2"><a class="tab-link" href="#">정보 </a></div>
    <div class="col-2"><a class="tab-link" href="#" style="font-weight: 1000px; color:black;" onclick="location.href='${ contextPath }/wantingNotice.want'">새소식 </a></div>
    <div class="col-2"><a class="tab-link" href="#">리뷰 </a></div>
    <div class="col-2"><a class="tab-link" href="#">서포터 <span class="count-total">${ wanting.wantingCount }</span></a></div>
  </div>
</div>

  <div class="container funding-content">
    <div class="row g-2">
      <!-- 왼쪽 사이드바 -->
      <div class="col-md-9">
      <div class="left-content">
        <!-- 대표 이미지-->
        <img src="${ contextPath }/resources/wanting/${thumbnail.imageRename}">

        <!-- 안내사항 -->
        <div class="notification">
          <p>
            <strong>목표 인원</strong> <span>500명</span><br>
            <strong>원팅 시작일</strong> <span>${ wanting.wantingCreateDate }</span><br>
          </p>
          <p>
            100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다.
          </p>
        </div>

        <div class="about-funding">
          <span class="icon"></span>
          <strong>원팅! 제대로 알고 참여하자</strong>
          <button class="more-button">자세히 알아보기</button>
        </div>

        <!-- 상품 상세설명 -->
        <div class="funding-detail">
          <p class="funding-detail-title"><strong>원팅 이야기</strong></p>
          ${ wanting.wantingContent } 여기는 서머노트 자리.
          <img src="${ contextPath }/resources/wanting/${thumbnail.imageRename}">
        </div>
     </div>
     </div>

      <!-- 오른쪽 사이드바 -->
	<div class="col-md-3 right-content">
    <div class="state-box">
      <p class="remaining-day"><strong>${ wanting.wantingDaysCount }일 지났어요</strong></p>
      <div class="rate-bar"><em></em></div>
      <p class="achievement-rate"><strong>10540</strong>% 달성</p>
      <p class="total-amount"><strong>52,700,000</strong>원 펀딩</p>
      <p class="total-supporter"><strong>${ wanting.wantingCount }</strong>명의 서포터</p>
    </div>
    
    <div class="container goal-box">
      <div class="row g-0">
        <div class="col-3"><strong>1차 달성 목표</strong></div>
        <div class="col-9"><p class="goal-amount">500명</p></div>
      </div>
      <div class="row g-0">
        <div class="col-3"><strong>원팅 시작일</strong></div>
        <div class="col-9"><p class="fundint-period">${ wanting.wantingCreateDate }
        </p></div>
      </div>
      <div class="row g-0">
        <div class="col-3"><strong>결제</strong></div>
        <div class="col-9"><p class="perchase-procedure">목표금액 달성시 2023.01.30에 결제 진행</p></div>
      </div>
    </div>

    <div class="container funding-buttons g-0">
    
<%-- 		<input type="hidden" class="memberId" value="${ loginUser.memberId }"> --%>
	  <input type="hidden" id="wantingNum" value="${ wanting.wantingNum }">
	  <c:if test="${ empty loginUser }">
	  	<button id="need-login-btn" class="btn-funding" data-bs-toggle="modal" data-bs-target="#login-modal">원팅 참여하기</button>
      </c:if>
	  <c:if test="${ !empty loginUser }">
	  	<c:if test="${ wantingYN }">
	  		<button id="wanting-send-btn" class="btn-funding" data-bs-toggle="modal" data-bs-target="" disabled>원팅에 참여했습니다.</button>
      	</c:if>
	  	<c:if test="${ !wantingYN }">
	  		<button id="wanting-send-btn" class="btn-funding" data-bs-toggle="modal" data-bs-target="#wanting-modal">원팅 참여하기</button>
      	</c:if>
      </c:if>
      <div class="row g-1">
        <div class="col-sm-12"><button onclick="" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#share-modal">
          <img src="resources/wanting/share.png"/>
          <span class="dips-count">원팅을 다른 사람에게 공유해보세요</span></button>
        </div>
        <button class="btn" onclick="location.href='${ contextPath }/editWanting.want'">원팅수정</button>
        <button class="btn" onclick="location.href='${ contextPath }/deleteWanting.want'">원팅삭제</button>
      </div>
    </div>
  </div>
  
  
  
  
	<!-- 모달 -->
	<!-- 펀딩하기 완료 -->
	<div class="modal fade" id="wanting-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel"> </h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="container-fluid g-0">
	          <div class="row g-0">
	            <div class="col-md-5">
	              <img class="thumbnail" src="${ contextPath }/resources/wanting/${thumbnail.imageRename}"/>
	            </div>
	            <div class="col-md-7">
	              <div class="modal-funding-right">
	                <h5>원팅이 완료되었습니다 !</h5>
	                <p class="modal-funding-title">[서울시 용답동] 나정순 할매 쭈꾸미 택배 전국 배송</p>
	                <p class="modal-funding-store">업체이름(가게이름)</p>
	                <div class="modal-funding-status">
	                  현재 <span class="modal-funding-goal">100</span>명 중 <span class="modal-funding-amount">${ wanting.wantingCount }</span>명이 모였어요.
	                  원팅 달성 시 알림이 갑니다.
	                </div>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	      <div class="modal-footer modal-funding-footer">
	        <div class="container">
	          <div class="row g-2">
	            <div class="col-sm-4">
	              <button type="button" class="modal-funding-btn">다른 원팅 둘러보기</button>
	            </div>
	            <div class="col-sm-4">
	              <button type="button" class="modal-funding-btn">내 원팅 목록보기</button>
	            </div>
	            <div class="col-sm-4">
	              <button type="button" class="modal-funding-btn" data-bs-dismiss="modal">닫기</button>
	            </div>
	          </div>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>


	<!-- 공유하기 완료 -->
	<div class="modal fade" id="share-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel"> </h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="modal-funding-right">
				<ul class="sns">
				    <li class="facebook">
				    <a href="#n" onclick="fn_sendFB('facebook');return false;" class="facebook" target="_self" title="페이스북 새창열림"><span class="skip">페이스북</span></a>
				    </li>
				    <li class="twitter">
				    <a href="#n" onclick="fn_sendFB('twitter');return false;" class="twitter" target="_self" title="트위터 새창열림"><span class="skip">트위터</span></a>
				    </li>
				    <li class="band">
				    <a href="#n" onclick="fn_sendFB('band');return false;" class="band" target="_self" title="네이버밴드 새창열림"><span class="skip">네이버밴드</span></a>
				    </li>
				</ul>
	        </div>
	      </div>
	      <div class="modal-footer modal-dibs-footer">
	        <div class="container">
	          <div class="row g-2">
	            <div class="col-sm-4">
	              <button type="button" class="modal-funding-btn">다른 펀딩 둘러보기</button>
	            </div>
	            <div class="col-sm-4">
	              <button type="button" class="modal-funding-btn">내 찜 목록보기</button>
	            </div>
	            <div class="col-sm-4">
	              <button type="button" class="modal-funding-btn" data-bs-dismiss="modal">닫기</button>
	            </div>
	          </div>
	     	 </div>
	      </div>
		</div>
	  </div>
	</div>
	
	<!-- 신고하기 완료 -->
	<div class="modal fade" id="login-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel"> </h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="container-fluid g-0">
	          <div class="row g-0">
	            <div class="col-md-7">
	              <div class="modal-funding-right">
	                <p class="dibs-message">
	                  로그인이 필요합니다.<br>
	                </p>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	      <div class="modal-footer modal-dibs-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="location.href='${contextPath}/loginenroll.me'">로그인</button>
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
	
    </div>
  </div>

<script>
    document.getElementById('wanting-send-btn').addEventListener('click',function(){
    	const wantingNum = parseInt(document.getElementById('wantingNum').value);
//     	const input = document.querySelectorAll('input');
// 		const memberId = input[0].value;
// 		const wantingNum = parseInt(input[0].value);
		console.log(wantingNum);
// 		location.href  = '${contextPath}/attendWanting.want?memberId=' + memberId +'wantingNum='+ wantingNum;
		location.href = '${contextPath}/attendWanting.want?wantingNum='+ wantingNum;
	});
    
    
</script>


  <!-- cursor -->
  <script type="module">
    import { fairyDustCursor } from 'https://unpkg.com/cursor-effects@latest/dist/esm.js'
    import { rainbowCursor } from 'https://unpkg.com/cursor-effects@latest/dist/esm.js'
  
    new fairyDustCursor();
    // new rainbowCursor();
  </script>

  <script src="https://cdn.jsdelivr.net/npm/js-confetti@0.8.0/dist/js-confetti.browser.js"></script>
  <script>
	const jsConfetti = new JSConfetti()
	function wowConfetti() {
		jsConfetti.addConfetti({
			emojis: ['🦄', '⚡️', '✨', '💫'],
			confettiRadius: 40,
			
		});
	}
	document.querySelector('.btn-funding').addEventListener('click', wowConfetti)
  </script>
  
  

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>