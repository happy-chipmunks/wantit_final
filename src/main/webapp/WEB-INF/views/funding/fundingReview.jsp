<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
  <link rel="stylesheet" href="resources/css/bootstrap-custom.css" />



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
    <div class="col-2"><a class="tab-link" href="${ contextPath }/fundingNotice.fund">새소식 </a></div>
    <div class="col-2"><a class="tab-link" href="#" style="font-weight: 1000px; color:black;">후기 </a></div>
    <div class="col-2"><a class="tab-link" href="#">서포터 <span class="count-total">4</span></a></div>
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
                <div class="notice">후기<span class="notice-num"> 8</span></div>
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
          <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingOne">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                <div class="review-list">
                  <strong>옵션 : </strong>
                  <span class="review-option">1번 발마칸 코트 네이비</span>
                  <span class="review-nickname">> 퐁당퐁당님</span>
                  <p class="review-content">
                    여기저기 입으려고 산 코트인데 10글자만 나왔으면
                  </p>
                  <p class="review-date">하루 전</p>
                 </div>  
               </button>
            </h2>
            <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
              <div class="accordion-body review-content-detail">
                여기저기 입으려고 산 코트이고 10퍼센트 세일하길래 큰맘 먹고 질렀습니다.  단점이라고는 목 부분 살짝 까슬거리는 거 빼곤 없습니다. 나머지는 다 장점입니다. 탄탄하고 품 넓어서 핏이 좋
                습니다. 무겁다고 하는데 입어보면 그런거 잘 모르겠네요. 키 180 몸무게 87 기준으로 L사이즈 딱 입니다.
                제목이 아니라 아예 바뀌었으면 좋겠는데 나중에 할까?
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingTwo">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                <div class="review-list">
                  <strong>옵션 : </strong>
                  <span class="review-option">3번 사과떡볶이 쌀떡볶이</span>
                  <span class="review-nickname">> 아뇨아뇨님</span>
                  <p class="review-content">
                    해링턴 블루종 모카프라푸치노
                  </p>
                  <p class="review-date">2012.4.5 03:25</p>
                 </div> 
              </button>
            </h2>
            <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
              <div class="accordion-body review-content-detail">
                여기저기 입으려고 산 코트이고 10퍼센트 세일하길래 큰맘 먹고 질렀습니다.  단점이라고는 목 부분 살짝 까슬거리는 거 빼곤 없습니다. 나머지는 다 장점입니다. 탄탄하고 품 넓어서 핏이 좋
                습니다. 무겁다고 하는데 입어보면 그런거 잘 모르겠네요. 키 180 몸무게 87 기준으로 L사이즈 딱 입니다.
                제목이 아니라 아예 바뀌었으면 좋겠는데 나중에 할까?
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingThree">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                <div class="review-list">
                  <strong>옵션 : </strong>
                  <span class="review-option">2번 장미 떡볶이 코트</span>
                  <span class="review-nickname">> 닉네임님</span>
                  <p class="review-content">
                    시그니처 텀블러 터틀넥
                  </p>
                  <p class="review-date">2022.10.28 12:34</p>
                 </div> 
              </button>
            </h2>
            <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
              <div class="accordion-body review-content-detail">
                여기저기 입으려고 산 코트이고 10퍼센트 세일하길래 큰맘 먹고 질렀습니다.  단점이라고는 목 부분 살짝 까슬거리는 거 빼곤 없습니다. 나머지는 다 장점입니다. 탄탄하고 품 넓어서 핏이 좋
                습니다. 무겁다고 하는데 입어보면 그런거 잘 모르겠네요. 키 180 몸무게 87 기준으로 L사이즈 딱 입니다.
                제목이 아니라 아예 바뀌었으면 좋겠는데 나중에 할까?
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingFour">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFour" aria-expanded="false" aria-controls="flush-collapseFour">
                <div class="review-list">
                  <strong>옵션 : </strong>
                  <span class="review-option">5번 쌀떡볶이 볶음둥이</span>
                  <span class="review-nickname">> 닉네임님</span>
                  <p class="review-content">
                    마감시간이 분명 11시랬는데 말이지
                  </p>
                  <p class="review-date">2022.10.28 12:34</p>
                 </div> 
              </button>
            </h2>
            <div id="flush-collapseFour" class="accordion-collapse collapse" aria-labelledby="flush-headingFour" data-bs-parent="#accordionFlushExample">
              <div class="accordion-body review-content-detail">
                여기저기 입으려고 산 코트이고 10퍼센트 세일하길래 큰맘 먹고 질렀습니다.  단점이라고는 목 부분 살짝 까슬거리는 거 빼곤 없습니다. 나머지는 다 장점입니다. 탄탄하고 품 넓어서 핏이 좋
                습니다. 무겁다고 하는데 입어보면 그런거 잘 모르겠네요. 키 180 몸무게 87 기준으로 L사이즈 딱 입니다.
                제목이 아니라 아예 바뀌었으면 좋겠는데 나중에 할까?
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingFive">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseFive" aria-expanded="false" aria-controls="flush-collapseFive">
                <div class="review-list">
                  <strong>옵션 : </strong>
                  <span class="review-option">1번 사과떡볶이 밀떡</span>
                  <span class="review-nickname">> 닉네임님</span>
                  <p class="review-content">
                    사과떡볶이 한정수량 판매
                  </p>
                  <p class="review-date">2022.10.28 12:34</p>
                 </div> 
              </button>
            </h2>
            <div id="flush-collapseFive" class="accordion-collapse collapse" aria-labelledby="flush-headingFive" data-bs-parent="#accordionFlushExample">
              <div class="accordion-body review-content-detail">
                여기저기 입으려고 산 코트이고 10퍼센트 세일하길래 큰맘 먹고 질렀습니다.  단점이라고는 목 부분 살짝 까슬거리는 거 빼곤 없습니다. 나머지는 다 장점입니다. 탄탄하고 품 넓어서 핏이 좋
                습니다. 무겁다고 하는데 입어보면 그런거 잘 모르겠네요. 키 180 몸무게 87 기준으로 L사이즈 딱 입니다.
                제목이 아니라 아예 바뀌었으면 좋겠는데 나중에 할까?
              </div>
            </div>
          </div>
          <div class="accordion-item">
            <h2 class="accordion-header" id="flush-headingSix">
              <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseSix" aria-expanded="false" aria-controls="flush-collapseSix">
                <div class="review-list">
                  <strong>옵션 : </strong>
                  <span class="review-option">7번 어묵떡볶이</span>
                  <span class="review-nickname">> 닉네임님</span>
                  <p class="review-content">
                    2달을 기다려야 받을 수 있는 품절템
                  </p>
                  <p class="review-date">2022.10.28 12:34</p>
                 </div> 
              </button>
            </h2>
            <div id="flush-collapseSix" class="accordion-collapse collapse" aria-labelledby="flush-headingSix" data-bs-parent="#accordionFlushExample">
              <div class="accordion-body review-content-detail">
                여기저기 입으려고 산 코트이고 10퍼센트 세일하길래 큰맘 먹고 질렀습니다.  단점이라고는 목 부분 살짝 까슬거리는 거 빼곤 없습니다. 나머지는 다 장점입니다. 탄탄하고 품 넓어서 핏이 좋
                습니다. 무겁다고 하는데 입어보면 그런거 잘 모르겠네요. 키 180 몸무게 87 기준으로 L사이즈 딱 입니다.
                제목이 아니라 아예 바뀌었으면 좋겠는데 나중에 할까?
              </div>
            </div>
          </div>
          
          <br><br><br><br><br><br><br><br>
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



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>