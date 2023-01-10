<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>펀딩 상세페이지 - 서포터</title>

  <!-- CSS Files -->
  <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous"> -->
  <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
  <link rel="stylesheet" href="resources/css/wantingMain.css" />
    <link rel="stylesheet" href="resources/css/fundingMain.css" />
  <link rel="stylesheet" href="resources/css/wantingSupporter.css" />

  <style>
  	@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
		body{font-family: 'NanumSquareNeo-Variable';}
		
		.creator-info{
			    border: 1px solid #8c86c7;
		    	border-radius: 8px;
		    	padding: 16px;
		}
  </style>

</head>

<body>
    <!-- 상단바 -->
    <div class="funding-header text-center font">
    <div class="background"></div>
    <p class="title-info" style="color: #8c86c7;">${ f.fundingCate }</p>
    <h2 class="title"><a href="#">${ f.fundingTitle }</a></h2>
  </div>
  <div class="container-fluid text-center funding-category font">
    <div class="row">
      <div class="col-2 offset-2"><a class="tab-link" href="${ contextPath }/selectFundingBoard.fund?bId=${f.fundingNum}&writerNo=${f.creatorNum}" style="font-weight: 1000px; color:gray;">정보 </a></div>
      <div class="col-2"><a class="tab-link" href="${ contextPath }/fundingNotice.fund?bId=${f.fundingNum}">새소식 </a></div>
      <div class="col-2"><a class="tab-link" href="${ contextPath }/fundingReview.fund?bId=${f.fundingNum}">리뷰 </a></div>
      <div class="col-2"><a class="tab-link" href="${ contextPath }/fundingSupportor.fund?bId=${f.fundingNum}" style="color:white;">서포터 ${ psListCount } <span class="count-total"></span></a></div>
    </div>
  </div>
    
    <div class="container funding-content">
      <div class="row g-2">
        <!-- 왼쪽 사이드바 -->
        <div class="col-md-9">
          <div class="left-content">
    
            <!-- 서포터 상단바 -->
            <div class="container">
              <div class="row notice-bar g-0">
                  <div class="col-12 notice-left">
                    <div class="notice">펀딩에 참여한 서포터<span class="notice-num"> ${ psListCount }</span></div>
                  </div>
              </div>
            </div>

            <!-- 서포터 리스트 -->
            <div class="container">
                <ul class="">
                <c:if test="${ empty psList }">
                    <div class="wanting-supporter-content wantng-supporter-list"
                    style="width: 100%; height: 400px; border: none; align-items: center; text-align: center; margin: auto; padding: 0;">
                        <span>펀딩에 참여한 서포터가 없습니다. <br> 첫 펀딩 참여자가 되어보세요!</span>
                    </div>
                </c:if>
                <c:if test="${ !empty psList }">
					<c:forEach items="${ member }" var="m">
	                    <li class="">
	                        <a href="" class="wantng-supporter-list">
	                            <span class="supporter-profile">
			                        <c:forEach items="${ memberImageList }" var="i">
			                        	<c:if test="${ m.memberId ne i.imageBoardId }">
											<img style="border-radius: 20px" src="${contextPath}/resources/myPageImage/뉴프로필.png" width="50px" height="50px" />
			                        	</c:if>
										<c:if test="${ m.memberId.equals(i.imageBoardId) and i.imageLevel == 0}">
											<img src="${ contextPath }/resources/member/${i.imageRename}">
										</c:if>
									</c:forEach>
	                            </span>
	                            <div class="wanting-supporter-content">
	                                <span>${ m.memberNickname }</span>
	                                <span>님이 <strong>펀딩</strong>에 참여했습니다.</span>
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
      <div class="col-md-3 right-content font">
        <div class="state-box">
          <jsp:useBean id="now" class="java.util.Date"/>
          <fmt:parseNumber value="${ now.time / (1000*60*60*24) }" integerOnly="true" var="nowFmtTime" scope="request"/>
           <fmt:parseNumber value="${ f.fundingEnd.time / (1000*60*60*24) }" integerOnly="true" var="feFmtTime" scope="request"/>
          <p class="remaining-day"><strong>${feFmtTime - nowFmtTime + 1 }일 남음</strong></p>
          <div style="height: 2px; width: 100%; background-color: gray;"><span id="progressBar" style="display: block; background-color: #8c86c7; height: 2px; width: 26%;"></span></div>
          <fmt:formatNumber value="${ f.currentMoney / f.targetMoney }" type="percent" var="percentage"/>
          <input type="hidden" value="${ percentage }" id="progressBarPercent">
          <p class="achievement-rate"><strong>${ percentage }</strong> 달성</p>
          <p class="total-amount"><strong class="toLocaleMoney">${ f.currentMoney }</strong>원 펀딩</p>
          <p class="total-supporter"><strong>${ supCount }</strong>명의 서포터</p>
        </div>
        
        <div class="container goal-box">
          <div class="row g-0">
            <div class="col-3"><strong>목표금액</strong></div>
            <div class="col-9"><p class="goal-amount toLocaleMoney">${ f.targetMoney }</p></div>
          </div>
          <div class="row g-0">
            <div class="col-3"><strong>펀딩 기간</strong></div>
            <div class="col-9"><p class="fundint-period">${ f.fundingStart } ~ ${ f.fundingEnd }
            </p></div>
          </div>
          <div class="row g-0">
            <div class="col-3"><strong>결제</strong></div>
            <div class="col-9"><p class="perchase-procedure">목표금액 달성시 ${ f.fundingEnd }에 결제 진행</p></div>
          </div>
        </div>

		<c:set value="<%= new java.util.Date() %>" var="today"></c:set>
		<fmt:formatDate value="${ today }" pattern="yyyy-MM-dd" var="fmtToday"/>
        <div class="container funding-buttons g-0">
<!--           <button class="btn-funding" data-bs-toggle="modal" data-bs-target="#funding-modal">펀딩하기</button> -->
		<c:if test="${ member != null && fmtToday > f.fundingStart}">
		 	<button class="btn-funding" style="background-color: #8c86c7;" onclick="location.href='${contextPath}/payView.pay?fundingNum=${ bId }'">펀딩하기</button>
		</c:if>
		<c:if test="${ member == null && fmtToday > f.fundingStart }">
		 	<button class="btn-funding" style="background-color: #8c86c7;" onclick="noLogin()">펀딩하기</button>
		</c:if>
		<c:if test="${ member != null && fmtToday < f.fundingStart}">
		 	<button class="btn-funding" style="background-color: #8c86c7;">오픈예정 알림신청</button>
		</c:if>
		<c:if test="${ member == null && fmtToday < f.fundingStart }">
		 	<button class="btn-funding" style="background-color: #8c86c7;" onclick="noLogin()">오픈예정 알림신청</button>
		</c:if>
          <div class="row g-1">
          <c:if test="${ !ok }">
          	<c:if test="${ member == null }">
            <div class="col-sm-6"><button onclick="noLogin()" class="btn-funding-small">
              <img src="${ contextPath }/resources/funding/찜X1.png"/>
              <span class="dips-count">${ dibsCount }</span></button>
            </div>
           </c:if>
           <c:if test="${ member != null }">
            <div class="col-sm-6"><button onclick="location.href='${contextPath}/insertDibs.fund?fundingNum=${ f.fundingNum }&id=${ login }&writerNo=${creatorNum}'" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#dibs-modal">
              <img src="${ contextPath }/resources/funding/찜X1.png"/>
              <span class="dips-count">${ dibsCount }</span></button>
            </div>
            </c:if>
           </c:if>
           <c:if test="${ ok }">
            <div class="col-sm-6"><button onclick="location.href='${contextPath}/deleteDibs.fund?fundingNum=${ f.fundingNum }&id=${ login }&writerNo=${creatorNum}'" class="btn-funding-small">
              <img src="${ contextPath }/resources/funding/찜1.png"/>
              <span class="dips-count">${ dibsCount }</span></button>
            </div>
           </c:if>
            <div class="col-sm-6"><button onclick="" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#share-modal"><img src="resources/wanting/share.png"/>공유하기</button></div>
<!--             <div class="col-sm-4"><button onclick="" class="btn-funding-small" data-bs-toggle="modal" data-bs-target="#report-modal">신고하기</button></div> -->
            <c:if test="${ !yn }">
            	<div><button class="btn-funding-edit" onclick="location.href='${contextPath}/fundingEdit.fund?fundingNum=${ f.fundingNum }'">펀딩 수정하기</button></div>
            </c:if>
          </div>
        </div>
        <hr>
        
        <div>
        	<div class="container creator-info" style="text-align:center;">
        		<div class="mb-2" id="goToInfo">
	        		<a>
		        		<img class="me-3" src="${ contextPath }/resources/myPageImage/뉴프로필.png" width="50" height="50">
		        		<span style="font-size: 20px;">${ creator.creatorName }</span>
		        		<input type="hidden" value="${ creator.creatorNum }" id="creatorNum">
	        		</a>
        		</div>
        		<div class="mb-2">
        			<i class="bi bi-star-fill" style="color: #e8acef;"></i>
        			<span class="dohyeonFont">평점 -</span>
        			<c:if test="${ reviewAverage != 'NaN' }">
        			<span class="dohyeonFont">${ reviewAverage } (${ reviewCount }개)</span>
        			</c:if>
        			<c:if test="${ reviewAverage == 'NaN' }">
        			<span class="dohyeonFont">0.0 (${ reviewCount }개)</span>
        			</c:if>
        			<br>
        			<i class="bi bi-piggy-bank-fill" style="color: #e8acef;"></i>
        			<span  class="dohyeonFont">누적액수 - </span>
        			<span class="dohyeonFont" id="ta">${ totalAmount }</span>
        			<br>
        			<i class="bi bi-people-fill" style="color: #e8acef;"></i>
        			<span  class="dohyeonFont">서포터수 - </span>
        			<span class="dohyeonFont">${ totalSupCount }</span>
        			<br><br>
        			<span>기업형태 : </span>
        			<c:if test="${ creator.businessType eq 'N'.charAt(0) }"><span>개인기업</span></c:if>
        			<c:if test="${ creator.businessType eq 'Y'.charAt(0) }"><span>단체기업</span></c:if>
        			<br>
        			<span>대표자 이름 : </span>
        			<span>${ creator.managerName }</span>
        			<br>
        			<span>이메일 : </span>
        			<span>${ creator.managerEmail }</span>
        			<br>
        			<span>대표전화 : </span>
        			<span>${ creator.managerPhone }</span>
        			<br>
        			<span>사업자등록번호 : </span>
        			<span>${ creator.businessNumber }</span>
        		</div>
<!--         		<div class="mb-2"> -->
<!-- <!--         			<span>만족도</span> -->
<!--         			<span class="ps-3"><i class="bi bi-person-fill fs-4"></i>&nbsp;&nbsp;팔로워 0명</span> -->
<!--         		</div> -->
        		<div>
        			<c:if test="${ yn }">
        				<button class="btn btn-creator" data-bs-toggle="modal" data-bs-target="#inquiry"><i class="bi bi-chat-left-dots"></i>&nbsp;&nbsp;문의하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
<!--         				<button class="btn btn-creator" id="follow"><i class="bi bi-plus"></i>&nbsp;&nbsp;팔로우</button> -->
        			</c:if>
        			<c:if test="${ !yn }">
        				<button class="btn btn-creator"><i class="bi bi-chat-left-dots"></i>&nbsp;&nbsp;문의하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
<!--         				<button class="btn btn-creator"><i class="bi bi-plus"></i>&nbsp;&nbsp;팔로우</button> -->
        			</c:if>
        		</div>
        	</div>
      	</div>
      	
      </div>
    </div>
  </div>
  
  
  
  
	<!-- 모달 -->


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
	
  
  </div>
</div>

	<script>
	window.onload=()=> {
		const ta = document.getElementById('ta');
		const before = parseInt(ta.innerText);
		ta.innerText = before.toLocaleString() + "원";
	}
	
	changeMoney();
	function changeMoney() {
		const targetMoney = document.getElementsByClassName('toLocaleMoney');
		for(const span of targetMoney) {
			const before = parseInt(span.innerText);
			span.innerText = " " + before.toLocaleString() + "원";
		}
	}
	
	const progressBar = document.getElementById('progressBar');
	const progressBarPercent = document.getElementById('progressBarPercent');
	const percent = parseInt(progressBarPercent.value.substring(0, progressBarPercent.value.length-1));
	if(percent >= 100) {
		progressBar.style.width = "100%";
	} else {
		progressBar.style.width = percent + "%";
	}
	
	// 펀딩 공유하기 ========================================
    function shareTwitter() {
        var sendText = "If You WANT IT, You Can Get It!"; // 전달할 텍스트
        let fundingNum = ${ f.fundingNum };
        let writerNo = ${ creatorNum };
        var sendUrl = "http://localhost:8080/wantit/selectFundingBoard.fund?bId=" + fundingNum + "&writerNo=" + writerNo; // 전달할 URL
        window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
    }
    function shareFacebook() {
        var sendUrl = "http://localhost:8080/wantit/selectFundingBoard.fund?bId=" + fundingNum + "&writerNo=" + writerNo; // 전달할 URL
        window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
    }
    
    // 원팅 공유하기 - 카카오톡 ========================================
	Kakao.Share.createDefaultButton({
    container: '#kakaotalk-sharing-btn',
    objectType: 'feed',
    content: {
      title: '${ f.fundingTitle }',
      description: '함께 만들어나가는 원팅',
      imageUrl:
		'${ contextPath }/resources/funding/${img.imageRename}',
      link: {
        // [내 애플리케이션] > [플랫폼] 에서 등록한 사이트 도메인과 일치해야 함
        webUrl: 'http://localhost:8080/wantit/selectFundingBoard.fund?bId=${f.fundingNum}&writerNo=${writerNum}',
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
</body>
</html>