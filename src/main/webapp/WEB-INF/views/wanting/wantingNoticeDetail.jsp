<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>펀딩 상세페이지 - 새소식</title>

  <!-- CSS Files -->
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
  <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
  <link rel="stylesheet" href="resources/css/fundingMain.css" />
  <link rel="stylesheet" href="resources/css/fundingNotice.css" />

  <!-- icons fonts -->


</head>

<body>
<div class="funding-header text-center">
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

        <!-- 새소식 제목 -->
        <button class="to-list">< 목록으로 이동</button>
        <div class="notice-header">
          <p class="notice-category">리워드안내</p>
          <p class="notice-title">[깜짝 선물]2개 이상 펀딩시, 한정판 에코백 선물</p>
          <p class="notice-date">2022.12.09 13:56</p>
        </div>

        <div class="notice-content">
          <img class="notice-content-img" src="https://www.imagetalk.co.kr/wp-content/uploads/detail-page/general-design/general-design-087_01.jpg">
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
        <button onclick="" class="btn-funding">원팅하기</button>
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



<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script> -->
</body>
</html>