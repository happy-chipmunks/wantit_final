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
	  
	<!-- kakao map -->
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d6a7c5e2b95f01e1fdfee7c815cc918&libraries=services"></script>

	<!-- kakao share -->
	<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.1.0/kakao.min.js"
	  integrity="sha384-dpu02ieKC6NUeKFoGMOKz6102CLEWi9+5RQjWSV0ikYSFFd8M3Wp2reIcquJOemx" crossorigin="anonymous"></script>
	<script>
	  Kakao.init('9d6a7c5e2b95f01e1fdfee7c815cc918'); // 사용하려는 앱의 JavaScript 키 입력
	</script>
	
	
	

</head>
<body>
<div class="funding-header text-center">
  <div class="background"></div>
  <p class="title-info">함께 만들어나가는 원팅</p>
  <h2 class="title"><a href="#">${ wanting.wantingTitle }</a></h2>
</div>
<div class="container-fluid text-center funding-category">
  <div class="row">
    <div class="col-2 offset-3"><a class="tab-link" href="#wanting-story">원팅 이야기</a></div>
    <div class="col-2"><a class="tab-link" href="#shop-info">가게 정보</a></div>
    <div class="col-2"><a class="tab-link" onclick="location.href='${ contextPath }/wantingNotice.want?wantingNum='+ ${ wanting.wantingNum }">참여자 <span class="count-total">${ wanting.wantingCount }</span></a></div>
  </div>
</div>

  <div class="container funding-content">
    <div class="row g-2">
      <!-- 왼쪽 사이드바 -->
      <div class="col-md-9">
      <div class="left-content">
        <!-- 대표 이미지-->
        <img src="${ contextPath }/resources/wanting/${thumbnail.imageRename}">

        <!-- 원팅 요약 -->
        <p>${ wanting.wantingSummary }</p>

        <!-- 안내사항 -->
        <div class="notification">
          <p>
            <strong>목표 인원</strong> 
            <c:if test="${ wanting.wantingLevel == 1 }">100명</c:if>
            <c:if test="${ wanting.wantingLevel == 2 }">500명</c:if>
            <c:if test="${ wanting.wantingLevel == 3 }">1000명</c:if><br>
            <strong>원팅 시작일</strong> <span>${ wanting.wantingCreateDate }</span><br>
          </p>
          <p>
            원팅 달성목표를 달성하면 가게에 연락이 갑니다. 펀딩으로 만나고 싶다면 원팅에 참여하세요!
          </p>
        </div>

        <div class="about-funding">
          <span class="icon"></span>
          <strong>원팅! 제대로 알고 참여하자</strong>
          <button class="more-button" data-bs-toggle="modal" data-bs-target="#modal-about-wanting">자세히 알아보기</button>
        </div>

        <!-- 상품 상세설명 -->
        <div class="funding-detail">
          <p class="funding-detail-title" id="shop-info"><strong>가게 정보</strong></p>
          <div id="map" style="width:100%; height:400px;"></div>
          <p class="funding-detail-title" id="wanting-story"><strong>원팅 이야기</strong></p>
          ${ wanting.wantingContent }
        </div>
     </div>
     </div>

      <!-- 오른쪽 사이드바 -->
	<div class="col-md-3 right-content">
    <div class="state-box">
      <p class="remaining-day"><strong>${ wanting.wantingDaysCount }일 지났어요</strong></p>
      <div class="rate-bar"><em style="width:${ wanting.wantingCount }%;"></em></div>
      <p class="achievement-rate"><strong>${ wanting.wantingCount }</strong>명의 서포터</p>
      <p class="total-supporter"><strong>${ wanting.wantingCount }</strong>% 달성</p>
<!--       <p class="total-amount"><strong>52,700,000</strong>원 펀딩</p> -->
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
 	  <button id="wanting-send-btn" class="btn-funding" data-bs-toggle="modal" data-bs-target="#reject-modal"
 	  onclick="location.href='${ contextPath }/rejectUpdateWanting.want?wantingNum=' + ${ wanting.wantingNum }" style="margin-bottom: 10px;">원팅 수정 거절하기</button>
 	  <button id="wanting-send-btn" class="btn-funding" data-bs-toggle="modal" data-bs-target="confirm-modal"
 	  onclick="location.href='${ contextPath }/confirmUpdateWanting.want?wantingNum=' + ${ wanting.wantingNum }">원팅 수정 승인하기</button>
 	  
    </div>
  </div>
  
  
  
  
	<!-- 모달 -->
	<!-- 만약 쓴다면 존재하는 모달 -->
	<div class="modal fade" id="reject-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel"> </h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        <div class="container-fluid g-0">
	          <div class="row g-0">
	              <div class="modal-wanting-right">
	                <p class="dibs-message">
	                  원팅 수정 요청을 거절했습니다.<br>
	                </p>
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

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d6a7c5e2b95f01e1fdfee7c815cc918&libraries=services"></script>
<script>
    // 원팅 가게 정보 지도 ========================================
	var shopAddress = "${wanting.wantingShopAddress}";
	console.log(shopAddress);

	if(shopAddress != null){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = { // 지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표 (위도, 경도)
			level: 3 // 지도의 레벨 (확대, 축소 정도)
		}; 
	
	// 지도 생성 및 객체 리턴
	var map = new kakao.maps.Map(mapContainer, mapOption);
	// 주소를 위도 경도 좌표로 변환하는 객체를 생성
	var geocoder = new kakao.maps.services.Geocoder();
	// 주소로 좌표 검색
	geocoder.addressSearch(shopAddress, function(result, status) {
		// 정상적으로 검색을 완료 했으면
		if (status === kakao.maps.services.Status.OK) {
			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
			// 결과값으로 받은 위치를 마커로 표시
			var marker = new kakao.maps.Marker({
				map: map,
				position: coords
			});
	        // 인포윈도우로 장소에 대한 설명을 표시
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div style="width:150px;text-align:center;padding:6px 0;">${wanting.wantingShopName}</div>'
	        });
	        infowindow.open(map, marker);
	        // 지도의 중심을 결과값으로 받은 위치로 이동시키기
			map.setCenter(coords);
		} 
	});  
	}
	
	
    // 원팅 공유하기 ========================================
    function shareTwitter() {
        var sendText = "함께 만들어나가는 원팅! 자세히 알아보기"; // 전달할 텍스트
        var sendUrl = "http://localhost:8080/wantit/selectWanting.want?wantingNum=" + wantingNum; // 전달할 URL
        window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
    }
    function shareFacebook() {
        var sendUrl = "http://localhost:8080/wantit/selectWanting.want?wantingNum=" + wantingNum; // 전달할 URL
        window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
    }
    
    // 원팅 공유하기 - 카카오톡 ========================================
	Kakao.Share.createDefaultButton({
    container: '#kakaotalk-sharing-btn',
    objectType: 'feed',
    content: {
      title: '${ wanting.wantingTitle }',
      description: '함께 만들어나가는 원팅',
      imageUrl:
		'https://ifh.cc/g/YhQM37.png',
      link: {
        // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
        webUrl: 'http://localhost:8080/wantit/selectWanting.want?wantingNum=${ wanting.wantingNum }',
      },
    },
    buttons: [
      {
        title: '원잇 사이트로 이동',
        link: {
          webUrl: 'http://localhost:8080/wantit/home.do',
        },
      },
    ],
  	});
	
</script>



  <!-- special effect -->
  <!-- cursor -->
  <script type="module">
    import { fairyDustCursor } from 'https://unpkg.com/cursor-effects@latest/dist/esm.js'
    import { rainbowCursor } from 'https://unpkg.com/cursor-effects@latest/dist/esm.js'
  
    new fairyDustCursor();
    // new rainbowCursor();
  </script>

  <!-- confetti -->
  <script src="https://cdn.jsdelivr.net/npm/js-confetti@0.8.0/dist/js-confetti.browser.js"></script>
  <script>
	const jsConfetti = new JSConfetti()
	function wowConfetti() {
		jsConfetti.addConfetti({
			emojis: ['🦄', '⚡️', '✨', '💫'],
			confettiRadius: 40,
			
		});
	}
	//document.querySelector('.btn-funding').addEventListener('click', wowConfetti)
  </script>
  

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script>
</body>
</html>