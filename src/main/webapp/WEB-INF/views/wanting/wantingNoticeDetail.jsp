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
  <link rel="stylesheet" href="resources/css/wantingMain.css" />
  <link rel="stylesheet" href="resources/css/wantingNotice.css" />

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
      
        <!-- 새소식 제목 -->
        <button class="to-list">< 목록으로 이동</button>
        <div class="notice-header">
          <p class="notice-category">리워드안내</p>
          <p class="notice-title">[깜짝 선물]2개 이상 펀딩시, 한정판 에코백 선물</p>
          <p class="notice-date">2022.12.09 13:56</p>
        </div>
        <!-- 새소식 내용 -->
        <div class="notice-content">
          <img class="notice-content-img" src="https://www.imagetalk.co.kr/wp-content/uploads/detail-page/general-design/general-design-087_01.jpg">
        </div>

      </div>
    </div>

    <!-- 오른쪽 사이드바 -->
    <jsp:include page="wantingRightbar.jsp"></jsp:include>
    
  </div>
</div>



<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script> -->
</body>
</html>