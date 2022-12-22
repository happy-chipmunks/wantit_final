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

        <!-- 새소식 상단바 -->
        <div class="container">
          <div class="row notice-bar g-0">
              <div class="col-9 notice-left">
                <div class="notice">새소식<span class="notice-num"> 6</span></div>
              </div>
              <div class="col-3 notice-right">
                <select class="sort">
                  <option value="recent-order">최신순</option>
                  <option value="past-order">과거순</option>
                </select>
              </div>
          </div>
        </div>
        <!-- 새소식 리스트 -->
        <div class="container">
          <div class="notice-list" onclick="location.href='${ contextPath }/wantingNoticeDetail.want'">
              <p class="notice-category">리워드안내</p>
              <p class="notice-title">[깜짝 선물]2개 이상 펀딩시, 한정판 에코백 선물</p>
              <p class="notice-date">하루 전</p>
          </div>
          <div class="notice-list">
            <p class="notice-category">리워드안내</p>
            <p class="notice-title">[깜짝 선물]2개 이상 펀딩시, 한정판 에코백 선물</p>
            <p class="notice-date">하루 전</p>
          </div>
          <div class="notice-list">
            <p class="notice-category">리워드안내</p>
            <p class="notice-title">[깜짝 선물]2개 이상 펀딩시, 한정판 에코백 선물</p>
            <p class="notice-date">하루 전</p>
          </div>
          <div class="notice-list">
            <p class="notice-category">리워드안내</p>
            <p class="notice-title">[깜짝 선물]2개 이상 펀딩시, 한정판 에코백 선물</p>
            <p class="notice-date">하루 전</p>
          </div>
          <div class="notice-list">
            <p class="notice-category">리워드안내</p>
            <p class="notice-title">[깜짝 선물]2개 이상 펀딩시, 한정판 에코백 선물</p>
            <p class="notice-date">하루 전</p>
          </div>
          <div class="notice-list">
            <p class="notice-category">리워드안내</p>
            <p class="notice-title">[깜짝 선물]2개 이상 펀딩시, 한정판 에코백 선물</p>
            <p class="notice-date">하루 전</p>
          </div>
          <div class="notice-list">
            <p class="notice-category">리워드안내</p>
            <p class="notice-title">[깜짝 선물]2개 이상 펀딩시, 한정판 에코백 선물</p>
            <p class="notice-date">하루 전</p>
          </div>
        </div>

      </div>
    </div>

    <!-- 오른쪽 사이드바 -->
    <jsp:include page="wantingRightbar.jsp"></jsp:include>

  </div>
</div>

</body>
</html>