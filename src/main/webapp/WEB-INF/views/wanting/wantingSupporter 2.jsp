<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>원팅 상세페이지 - 서포터</title>

  <!-- CSS Files -->
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
  <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
  <link rel="stylesheet" href="resources/css/wantingMain.css" />
  <link rel="stylesheet" href="resources/css/wantingSupporter.css" />

  <!-- icons fonts -->

</head>

<body>
    <!-- 상단바 -->
    
    <div class="container funding-content">
      <div class="row g-2">
        <!-- 왼쪽 사이드바 -->
        <div class="col-md-9">
          <div class="left-content">
    
            <!-- 새소식 상단바 -->
            <div class="container">
              <div class="row notice-bar g-0">
                  <div class="col-12 notice-left">
                    <div class="notice">참여하는 서포터<span class="notice-num"> ${ wanting.wantingCount }</span></div>
                  </div>
              </div>
            </div>

            <!-- 새소식 리스트 -->
            <div class="container">
                <ul class="">
                <c:if test="${ empty memberList }">
                    <div class="wanting-supporter-content wantng-supporter-list"
                    style="width: 100%; height: 400px; border: none; align-items: center; text-align: center; margin: auto; padding: 0;">
                        <span>원팅에 참여한 서포터가 없습니다. <br> 첫 참여자가 되어보세요!</span>
                    </div>
                </c:if>
                <c:if test="${ !empty memberList }">
					<c:forEach items="${ memberList }" var="m">
	                    <li class="">
	                        <a href="" class="wantng-supporter-list">
	                            <span class="supporter-profile">
	                                <img src="coffee.jpg"/>
	                            </span>
	                            <div class="wanting-supporter-content">
	                                <span>${ m.memberNickname }</span>
	                                <span>님이 <strong>원팅</strong>에 참여했습니다.</span>
	                                <!-- <svg viewBox="0 0 40 40" focusable="false" role="presentation" class="supporter-list-icon" aria-hidden="true">
	                                    <path d="M28 20L15 33l-1.4-1.4L25.2 20 13.6 8.4 15 7l13 13z"></path>
	                                </svg> -->
	                            </div>
	                        </a>
	                    </li>
					</c:forEach><br><br><br><br><br><br>
				</c:if>
                </ul>
            </div>
    


      </div>
    </div>


    <!-- 오른쪽 사이드바 -->
	<div class="col-md-3 right-content">
    <div class="state-box">
      <p class="remaining-day"><strong>20일 남음</strong></p>
      <div class="rate-bar"><em></em></div>
      <p class="achievement-rate"><strong>10540</strong>% 달성</p>
      <p class="total-amount"><strong>52,700,000</strong>원 펀딩</p>
      <p class="total-supporter"><strong>1,282</strong>명의 서포터</p>
    </div>
    
    <div class="container goal-box">
      <div class="row g-0">
        <div class="col-3"><strong>목표금액</strong></div>
        <div class="col-9"><p class="goal-amount">1,000,000원</p></div>
      </div>
      <div class="row g-0">
        <div class="col-3"><strong>펀딩 기간</strong></div>
        <div class="col-9"><p class="fundint-period">2022.12.08 ~ 2023.01.29
        </p></div>
      </div>
      <div class="row g-0">
        <div class="col-3"><strong>결제</strong></div>
        <div class="col-9"><p class="perchase-procedure">목표금액 달성시 2023.01.30에 결제 진행</p></div>
      </div>
    </div>

    <div class="container funding-buttons g-0">
      <button class="btn-funding" data-bs-toggle="modal" data-bs-target="#funding-modal">펀딩하기</button>
      <div class="row g-1">
        <div class="col-sm-4"><button onclick="" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#dibs-modal">
          <img src="resources/img/heart.png"/>
          <span class="dips-count">5</span></button>
        </div>
        <div class="col-sm-4"><button onclick="" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#share-modal">공유하기</button></div>
        <div class="col-sm-4"><button onclick="" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#report-modal">신고하기</button></div>
      </div>
    </div>
  </div>
  
  
  
  
	<!-- 모달 -->
	<!-- 펀딩하기 완료 -->
	<div class="modal fade" id="funding-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	              <img class="thumbnail" src="https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=768,574"/>
	            </div>
	            <div class="col-md-7">
	              <div class="modal-funding-right">
	                <h5>원팅이 완료되었습니다 !</h5>
	                <p class="modal-funding-title">[서울시 용답동] 나정순 할매 쭈꾸미 택배 전국 배송</p>
	                <p class="modal-funding-store">업체이름(가게이름)</p>
	                <div class="modal-funding-status">
	                  현재 <span class="modal-funding-goal">100</span>명 중 <span class="modal-funding-amount">45</span>명이 모였어요.
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

	<!-- 찜하기 완료 -->
	<div class="modal fade" id="dibs-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel"> </h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="modal-funding-right">
	          <p class="dibs-message">
	            찜하기가 완료되었습니다.<br>
	            마이페이지 찜하기 모아보기에서 확인하실 수 있습니다.
	          </p>
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
	          <p class="dibs-message">
	            공유하기는 나중에 할게요.<br>
	            마이페이지 찜하기 모아보기에서 확인하실 수 있습니다.
	          </p>
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
	<div class="modal fade" id="report-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
	                  신고가 완료되었습니다.<br>
	                </p>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	      <div class="modal-footer modal-dibs-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	      </div>
	    </div>
	  </div>
	</div>
  
  </div>
</div>

</body>
</html>