<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <link rel="stylesheet" href="resources/css/summernote-lite.min.css">
  <script src="resources/css/summernote-lite.min.js"></script>
  <script src="resources/css/summernote-ko-KR.js"></script>

  <style>
  	.fundingH5{ display: inline; }
  	
  	.funding-style{ 
			border-radius: 7px 7px 7px 7px / 7px 7px 7px 7px;
			border: 1px solid #EAEAEA;
		 }
		 
	@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
	body{ font-family: 'NanumSquareNeo-Variable' }
	
	.creator-info{
			    border: 1px solid #8c86c7;
		    	border-radius: 8px;
		    	padding: 16px;
		}
		
		.i{color: #8c86c7;}
		
		.btn{outline: 1px solid #8c86c7;}
  </style>


</head>

<body>
<div class="funding-header text-center">
  <p class="title-info" style="color: #8c86c7;">${ f.fundingCate }</p>
  <h2 class="title"><a href="#">${ f.fundingTitle }</a></h2>
</div>
<div class="container-fluid text-center funding-category">
  <div class="row">
    <div class="col-2 offset-2"><a class="tab-link" href="${ contextPath }/selectFundingBoard.fund?bId=${bId}&writerNo=${writerNo}">정보 </a></div>
    <div class="col-2"><a class="tab-link" href="${ contextPath }/fundingNotice.fund?bId=${bId}" style="font-weight: 1000px; color:black;">새소식 </a></div>
    <div class="col-2"><a class="tab-link" href="${ contextPath }/fundingReview.fund?bId=${bId}">리뷰 </a></div>
    <div class="col-2"><a class="tab-link" href="#">서포터 <span class="count-total"> ${ supCount }</span></a></div>
  </div>
</div>

<div class="container funding-content">
  <div class="row g-2">
    <!-- 왼쪽 사이드바 -->
    <div class="col-md-9">
      <div class="left-content">
		
		<div id="noticeTopbar">
	        <!-- 새소식 상단바 -->
	        <div class="container">
	          <div class="row notice-bar g-0">
	              <div class="col-9 notice-left">
	                <div class="notice">새소식<span class="notice-num"> ${ count }</span></div>
	              </div>
	              <div class="col-3 notice-right">
	              	<c:if test="${ fundingCreator eq login.memberId }">
	              		<button class="btn btn-info" onclick="noticeWrite()">새소식 작성</button>&nbsp;&nbsp;&nbsp;&nbsp;
	              	</c:if>
	                <select class="sort">
	                  <option value="recent-order">최신순</option>
	                  <option value="past-order">과거순</option>
	                </select>
	              </div>
	          </div>
	        </div>
	        <!-- 새소식 리스트 -->
	        <div class="container">
	        	<c:forEach items="${ fnList }" var="fn">
	        		<div class="notice-list">
	        				<input type="hidden" class="fundingNoticeNum" value="${ fn.fundingNoticeNum }">
	        				<input type="hidden" class="fundingNum" value="${ fn.fundingNum }">
	        				<input type="hidden" class="fundingNoticeWriter" value="${ fn.fundingNoticeWriter }">
			              <p class="notice-category fundingNoticeCategory">${ fn.fundingNoticeCategory }</p>
			              <p class="notice-title fundingNoticeTitle">${ fn.fundingNoticeTitle }</p>
			              <p class="notice-date fundingNoticeCreateDate">${ fn.fundingNoticeCreateDate }</p>
			          </div>
	        	</c:forEach>
	        </div>
	       </div>

		<!-- 새소식 작성하기 summernote -->
			<div class="container" style="text-align: center; display: none;" id="noticeWrite">
				<form action="${ contextPath }/insertFundingNotice.fund" method="POST" enctype="multipart/form-data"  id="formImage">
					<br>
					<h5 class="fundingH5">카테고리</h5><br><br>
					<select name="category" style="width: 200px;" class="funding-style">
						<option>FAQ</option>
						<option>리워드 발송</option>
						<option>이벤트</option>
						<option>리워드 안내</option>
						<option>교환/펀딩금 반환/AS</option>
						<option>기타</option>
					</select>
					
					<br><br>
					
					<input type="hidden" value="${ bId }" name="fundingNoticeNum" class="fundingNoticeNum">
					<input type="hidden" value="${ fundingCreator }" name="fundingNoticeWriter" class="fundingNoticeWriter">
					<h5 class="fundingH5">새소식 제목</h5><br><br>
					<input class="funding-style" placeholder="제목을 입력해 주세요" maxlength="40" name="fundingNoticeTitle" type="text" style="width: 500px;">
					<br><br>
					
					
					
					<h5 class="fundingH5">새소식 내용</h5><br>
						<div>펀딩 프로젝트의 새소식을 알려주세요.</div><br>
					    <div>
					    	<textarea id="summernote" name="fundingNoticeContent"></textarea>
					    </div>
					    <br>
					<button class="btn btn-primary">작성하기</button>&nbsp;&nbsp;<button class="btn btn-secondary" type="button" onclick="back()">취소</button>
				</form>
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

        <div class="container funding-buttons g-0">
<!--           <button class="btn-funding" data-bs-toggle="modal" data-bs-target="#funding-modal">펀딩하기</button> -->
		<c:if test="${ m != null }">
		 	<button class="btn-funding" style="background-color: #8c86c7;" onclick="location.href='${contextPath}/payView.pay?fundingNum=${ bId }'">펀딩하기</button>
		</c:if>
		<c:if test="${ m == null }">
		 	<button class="btn-funding" style="background-color: #8c86c7;" onclick="noLogin()">펀딩하기</button>
		</c:if>
          <div class="row g-1">
          <c:if test="${ !ok }">
          	<c:if test="${ m == null }">
            <div class="col-sm-6"><button onclick="noLogin()" class="btn-funding-small">
              <img src="${ contextPath }/resources/funding/찜X1.png"/>
              <span class="dips-count">${ dibsCount }</span></button>
            </div>
           </c:if>
           <c:if test="${ m != null }">
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
          </div>
        </div>
         <hr>
        
        <div>
        	<div class="container creator-info" style="text-align:center;">
        		<div class="mb-2">
	        		<a>
		        		<img class="me-3" src="${ contextPath }/resources/myPageImage/뉴프로필.png" width="50" height="50">
		        		<span style="font-size: 20px;">닉네임</span>
	        		</a>
        		</div>
        		<div class="mb-2">
<!--         			<span>만족도</span> -->
        			<span class="ps-3"><i class="bi bi-person-fill fs-4"></i>&nbsp;&nbsp;팔로워 0명</span>
        		</div>
        		<div>
        			<button class="btn"><i class="bi bi-chat-left-dots"></i>&nbsp;&nbsp;문의하기</button>&nbsp;&nbsp;&nbsp;&nbsp;
        			<button class="btn"><i class="bi bi-plus"></i>&nbsp;&nbsp;팔로우</button>
        		</div>
        	</div>
      	</div>
      </div>
  </div>
</div>
<br><br>


<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js" integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js" integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V" crossorigin="anonymous"></script> -->
  
  <script>
  		// 새소식 작성하기 보이게 하기
  		function noticeWrite(){
  			$('#noticeTopbar').hide();
  			$('#noticeWrite').show();
  		}
  		
  		// 새소식 작성하지 않기
  		function back(){
  			$('#noticeTopbar').show();
  			$('#noticeWrite').hide();
  		}
  	
  	// summernote
	      $('#summernote').summernote({
	    	  lang: "ko-KR",
	    	  placeholder: '펀딩 프로젝트 내용을 작성해주세요.',
	        tabsize: 2,
	        height: 550,
	        toolbar: [
	        	['fontname', ['fontname']],
	            ['fontsize', ['fontsize']],
	            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
	            ['color', ['forecolor','color']],
	            ['table', ['table']],
	            ['para', ['ul', 'ol', 'paragraph']],
	            ['height', ['height']],
	            ['insert',['picture']],
	            ['view', ['fullscreen', 'codeview' ,'help']]
	        ],
	        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
	        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
	        callbacks: {
	        	onImageUpload : function(files, editor, welEditable){		// 이미지 첨부하는 부분
	        		for(var i = 0; i < files.length; i++){
	        			sendFile(files[i], this);
	        		}
	        	}
	        }
   	 });
	 
      function sendFile(file, el){
      	var form_data = new FormData();
      	form_data.append('file', file);
      	$.ajax({
      		data: form_data,
      		type: "POST",
      		url: '${contextPath}/uploadSummernoteImageFile.fund',
      		cache: false,
      		contentType: false,
      		enctype: 'multipart/form-data',
      		processData: false,
      		success: function(img_name){
      			$(".spinner-border").css("display","none");
          		
          		console.log(img_name);
      			// 항상 업로드된 파일의 url이 있어야 한다.
      			$(el).summernote('editor.insertImage', "/funding-summernote/" + img_name);
      		}
      	});
      } 
		  
		  // 상세보기
		  window.onload = () =>{
    		var boards = document.getElementsByClassName('notice-list');
    		for(var board of boards){
    			board.addEventListener('click', function(){
    				const bId = this.querySelector('.fundingNum').value;
    				console.log(bId);	// 선택한 펀딩 게시글 번호를 가지고 오는가
    				const writer = this.querySelector('.fundingNoticeWriter').value;
    				console.log(writer);	// 선택한 펀딩 게시글 작성자 번호를 가지고 오는가
    				const fundingNoticeNum = this.querySelector('.fundingNoticeNum').value;
    				
    				location.href='${contextPath}/selectFundingNoticeBoard.fund?bId=' + bId + '&writer=' + writer + '&fundingNoticeNum=' + fundingNoticeNum;
    			});
    		}
    	}
		  
		  // 펀딩하기(로그인X)
		  function noLogin(){
			alert('로그인 후 이용해주세요.');
		}
  </script>
</body>
</html>