<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <link rel="stylesheet" href="resources/css/fundingMain.css" />
  <link rel="stylesheet" href="resources/css/bootstrap-custom.css" />
  
  <!-- icons fonts -->

</head>
<body>
<!-- 상단바 -->
<jsp:include page="wantingNavbar.jsp"></jsp:include>

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
      <jsp:include page="wantingRightbar.jsp"></jsp:include>
    
    </div>
  </div>



  <!-- cursor -->
  <script type="module">
    import { fairyDustCursor } from 'https://unpkg.com/cursor-effects@latest/dist/esm.js'
    import { rainbowCursor } from 'https://unpkg.com/cursor-effects@latest/dist/esm.js'
  
    new fairyDustCursor();
    // new rainbowCursor();
  </script>
  <script>
	const jsConfetti = new JSConfetti()
	function wowConfetti() {
		jsConfetti.addConfetti({
		});
	}
	document.querySelector('.btn-funding').addEventListener('click', wowConfetti)
  </script>
  
  

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>