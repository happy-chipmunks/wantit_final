<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>펀딩 상세페이지</title>
  <!-- CSS Files -->
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
  <link rel="stylesheet" href="bootstrap.min.css" />
  <link rel="stylesheet" href="fundingMain.css" />
  <link rel="stylesheet" href="bootstrap-custom.css" />

  <!-- icons fonts -->

</head>
<body>
  <div class="funding-header text-center">
    <div class="background"></div>
    <p class="title-info">여행·레저</p>
    <h2 class="title"><a href="#">[곰표] 한정수량 곰표 침낭! 침낭을 패딩처럼 입고 뛰어다닐 수 있어요</a></h2>
  </div>
  <div class="container-fluid text-center funding-category">
    <div class="row">
      <div class="col-2 offset-2"><a class="tab-link" href="#">정보 </a></div>
      <div class="col-2"><a class="tab-link" href="#" style="font-weight: 1000px; color:black;">새소식 </a></div>
      <div class="col-2"><a class="tab-link" href="#">리뷰 </a></div>
      <div class="col-2"><a class="tab-link" href="#">서포터 <span class="count-total">4</span></a></div>
    </div>
  </div>

  <div class="container funding-content">
    <div class="row g-2">
      <!-- 왼쪽 사이드바 -->
      <div class="col-md-9">
      <div class="left-content">
        <!-- 대표 이미지-->
        <img src="https://cdn.wadiz.kr/ft/images/green001/2022/1118/20221118111401032_38.png/wadiz/format/jpg/quality/80/optimize">

        <!-- 안내사항 -->
        <div class="notification">
          <p>
            <strong>목표 금액</strong> <span>500,000원</span><br>
            <strong>펀딩 기간</strong> <span>2022.11.15-2022.12.30</span><br>
          </p>
          <p>
            100% 이상 모이면 펀딩이 성공되며, 펀딩 마감일까지 목표 금액이 100% 모이지 않으면 결제가 진행되지 않습니다.
          </p>
        </div>

        <div class="about-funding">
          <span class="icon"></span>
          <strong>크라우드펀딩 제대로 알고 펀딩하자</strong>
          <button class="more-button">자세히 알아보기</button>
        </div>

        <!-- 상품 상세설명 -->
        <div class="funding-detail">
          <p><strong>펀딩 이야기</strong></p>
          <img src="https://cdn.imweb.me/thumbnail/20210119/53c7002429e0d.jpg">
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
                <h5>펀딩이 완료되었습니다 !</h5>
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
              <button type="button" class="modal-funding-btn">다른 펀딩 둘러보기</button>
            </div>
            <div class="col-sm-4">
              <button type="button" class="modal-funding-btn">내 펀딩 목록보기</button>
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
            공유하기는 버튼이 떠야하나<br>
            카카오 / 네이버 / 페이스북 이런거
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
        <div class="modal-funding-right">
          <p class="dibs-message">
            신고가 완료되었습니다.<br>
            ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
          </p>
        </div>
      </div>
      <div class="modal-footer modal-dibs-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
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


  <!-- cursor -->
  <script type="module">
    import { fairyDustCursor } from 'https://unpkg.com/cursor-effects@latest/dist/esm.js'
    import { rainbowCursor } from 'https://unpkg.com/cursor-effects@latest/dist/esm.js'
  
    new fairyDustCursor();
    // new rainbowCursor();
  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>