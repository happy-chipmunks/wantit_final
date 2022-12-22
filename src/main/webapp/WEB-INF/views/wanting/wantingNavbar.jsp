<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>원팅 상단바</title>
  <!-- CSS Files -->
  <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
  <link rel="stylesheet" href="resources/css/bootstrap-custom.css" />
  <link rel="stylesheet" href="resources/css/wantingMain.css" />
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
      <div class="col-2"><a class="tab-link" href="#" style="font-weight: 1000px; color:black;" onclick="location.href='${ contextPath }/wantingNotice.want'">새소식 </a></div>
      <div class="col-2"><a class="tab-link" href="#">리뷰 </a></div>
      <div class="col-2"><a class="tab-link" href="#">서포터 <span class="count-total">4</span></a></div>
    </div>
  </div>
</body>
</html>