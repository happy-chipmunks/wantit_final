<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
	<jsp:include page="common/navbar.jsp"></jsp:include>
<head>
	<title>Home</title>
	
	<link rel="stylesheet" href="resources/css/main.css">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<style type="text/css">
		.remainDate{
			float: right;
		}
		
		.card-text, .wanting-text{
			text-overflow: ellipsis;
			white-space: normal;
			word-wrap : break-word;
			overflow : hidden;
			display: -webkit-box;
			-webkit-line-clamp : 2;
			-webkit-box-orient : vertical;
		}
		
		.fundName{
			text-overflow: ellipsis;
			white-space: normal;
			word-wrap : break-word;
			overflow : hidden;
			display: -webkit-box;
			-webkit-line-clamp : 2;
			-webkit-box-orient : vertical;
		}
		
 		.cate{ 
 		 	font-size: 14px; 
		} 
		
	</style>
</head>

<body>
    <!--배너광고, 이벤트-->
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel" style="height: 400px;" >
    	<div class="carousel-indicators">
    	<c:forEach begin="0" end="${ biList.size() - 1 }" var="i">
    		<c:if test="${ i == 0 }">
	    		 <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    		</c:if>
    		<c:if test="${ i != 0 }">
          		<button type="button" data-bs-target="#myCarousel" data-bs-slide-to="${ i }" aria-label="Slide ${ i+1 }"></button>
    		</c:if>
    	</c:forEach>
    	</div>
        <div class="carousel-inner" style="height: 400px;">
        	<c:forEach items="${ biList }" var="bi" varStatus="status">
        		<c:if test="${ status.index == 0 }">
		          <div class="carousel-item active">
		          	<a href="${contextPath}/selectFundingBoard.fund?bId=${ bannerFundList[status.index].fundingNum }&writerNo=${ bannerFundList[status.index].creatorNum }">
			            <img alt="" src="${ contextPath }/resources/member/${ bi.imageRename }">		 
<!-- 			            경로 bannerImage말고 member로 변경  -->
		          	</a>
		    
		          </div>
        		</c:if>
        		<c:if test="${ status.index != 0 }">
		          <div class="carousel-item">
		          	<a href="${contextPath}/selectFundingBoard.fund?bId=${ bannerFundList[status.index].fundingNum }&writerNo=${ bannerFundList[status.index].creatorNum }">
						<img alt="" src="${ contextPath }/resources/member/${ bi.imageRename }">		    
		          	</a>
		          </div>
        		</c:if>
        	</c:forEach>
          
          
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>


      <!--펀딩, 원팅-->
      <div class="container" style="margin-top: 20px; border-bottom: 1px solid white; padding-bottom: 20px;">
        <div class="row">
            <div class="col-md-8">
                <strong class="d-inline-block mb-2 mainTitle" style="font-size: 35px; color: #8c86c7; padding-left: 20px;">인기있는 펀딩 </strong>
<!-- 			테스트 구간 -->

<!--                 테스트구간 -->
                
            </div>
            <div class="col-md-4">
                <strong class="d-inline-block mb-2 mainTitle" style="font-size: 35px; padding-left: 20px;">원팅</strong>
            </div>

        </div>
        <!--펀딩-->
        <div class="row">
            <div class="col-md-8" style="padding: 30px;">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                	<c:forEach items="${ fundingProceedList }" var="fp" varStatus="status">
                	
	                    <div class="col cardDecoration">
	                    	<input type="hidden" value="${ fp.creatorNum }" class="writer">
	        				<input type="hidden" value="${ fp.fundingNum }" class="bId">
	                        <div class="card shadow-sm fundinglist">
	                        	<c:forEach items="${ fundingImageList }" var="fundImage">
	                        		<c:if test="${ fp.fundingNum == fundImage.imageBoardId }">
	                        			<img alt="" src="${ contextPath }/resources/funding/${ fundImage.imageRename }" width="100%" height="225">
	                        		</c:if>
	                        	</c:forEach>
	              
	                          <div class="card-body">
	                              <div style="padding-bottom: 10px;">
	                                  <span class="fundName">${ fp.fundingTitle }</span>
	                                  <span class="cate">${ fp.fundingCate }</span>
	                                  <span class="creatorName">${ fp.creatorNickname }</span>
	                              </div>
	                                <fmt:formatNumber value="${ fp.currentMoney / fp.targetMoney }" type="percent" var="percentage"/>
	                              <div class="d-flex justify-content-between align-items-center">
	                                    <div style="height: 2px; width: 100%; background-color: gray;"><span class="progressBar" style="display: block; background-color: #8c86c7; height: 2px; width: 26%;"></span></div>
	                                    <input type="hidden" class="progressBarPercent" value="${ percentage }">
	                                </div>
	                                <span>${ percentage } </span>
	                                <span class="fundingProceedMoney">${ fp.currentMoney }</span>
	                                <jsp:useBean id="now" class="java.util.Date"/>
	                                <fmt:parseNumber value="${ now.time / (1000*60*60*24) }" integerOnly="true" var="nowFmtTime" scope="request"/>
	                                <fmt:parseNumber value="${ fp.fundingEnd.time / (1000*60*60*24) }" integerOnly="true" var="feFmtTime" scope="request"/>
	                                
	                                <span class="remainDate">${feFmtTime - nowFmtTime + 1 }일 남음</span>
	                          </div>
	                        </div>
	                      </div>
                	</c:forEach>
                  </div>
                  <div class="row">
                        <span class="fundingMore" id="fundingMore">더보기</span>
                  </div>
               </div>
                
                <!-- 옆에 원팅 -->
                <div class="col-md-4" style="padding: 30px;">
                  <c:forEach begin="0" end="3" var="i">
                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative wantingList">
                      <div class="col-4 d-none d-lg-block">
						<svg class="" xmlns="http://www.w3.org/2000/svg" style="height: 0; width: 0;">
							<c:forEach items="${ wantingImageList }" var="image">
								<c:if test="${ wantingList[i].wantingNum == image.imageBoardId and image.imageLevel == 0}">
									<img src="${ contextPath }/resources/wanting/${image.imageRename}"
										class="bd-placeholder-img card-img-top" alt="..." style="height: 100%; width: 100%; object-fit: cover;">
								</c:if>
							</c:forEach>	
						</svg>
                      </div>
          
                      <div class="col-8 p-2 d-flex flex-column position-static">
                          <strong class="d-inline-block mb-2 mainTitle"> </strong>
                          <p class="wanting-text">${ wantingList[i].wantingTitle }</p>
                          <span class="wanting-writer">${ wantingList[i].wantingNickname }</span>
                          <div style="height: 2px; width: 100%; background-color: gray; margin: 3px;"><span style="display: block; background-color: #e8acef; height: 2px; width: ${ wantingList[i].wantingCount }%;"></span></div>
                          <div class="d-inline wanting-other">
                              <span><strong>${ wantingList[i].wantingCount }</strong>%</span>
                              <span style="font-size: 15px;">${ wantingList[i].wantingCount }명 원팅중</span>
                              <span class="remainWantingDate">${ wantingList[i].wantingDaysCount }일 지났어요</span>

                          </div>
                      </div>
                      
			        <input type="hidden" class="wantingNum" value="${ wantingList[i].wantingNum }">
                    </div>
       		    </c:forEach>
				<c:if test="${ !empty loginUser }">
                    <button type="button" class="btn goWanting" onclick="location.href='${ contextPath }/wantingWrite.want'">원팅 하러가기 →</button>
				</c:if>
				<c:if test="${ empty loginUser }">
                    <button type="button" class="btn goWanting" data-bs-toggle="modal" data-bs-target="#login-modal">원팅 하러가기 →</button>
				</c:if>
                </div>
            </div>
        </div>


		<!-- 로그인 필요합니다 모달 -->
		<div class="modal fade" id="login-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
		              <div class="modal-wanting-right">
		                <p class="dibs-message">
		                  로그인이 필요합니다.<br>
		                </p>
		              </div>
		            </div>
		          </div>
		        </div>
		      </div>
		      <div class="modal-footer modal-dibs-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="location.href='${contextPath}/loginenroll.me'">로그인</button>
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		      </div>
		    </div>
		  </div>
		</div>


        <!-- 펀딩예정-->
        <div class="container" style="padding-top: 20px;">
            <div class="row">
                <div class="col">
                    <strong class="d-inline-block mb-2 mainTitle" style="font-size: 35px;">펀딩 예정</strong>
                </div>

            </div>
            <div class="row">

				<c:forEach items="${ fundingComingSoonList }" var="fcs" varStatus="status">
				
	                <div class="col-2 cardDecoration">
	                    <input type="hidden" value="${ fcs.creatorNum }" class="writer">
	        			<input type="hidden" value="${ fcs.fundingNum }" class="bId">
	                    <div class="card shadow-sm fundinglist">
		                    <c:forEach items="${ fundingImageList }" var="fundImage">
		                        		<c:if test="${ fcs.fundingNum == fundImage.imageBoardId }">
		                        			<img alt="" src="${ contextPath }/resources/funding/${ fundImage.imageRename }" width="100%" height="175">
		                        		</c:if>
		                     </c:forEach>
	          
	                      <div class="card-body">
	                          <div class="cateAndName">
	                              <span class="cate">${ fcs.fundingCate }</span>
	                              <span class="cate" style="border-left: 1px solid dimgrey; padding-left: 2px;">${ fcs.creatorNickname }</span>
	                              <span class="fundName">${ fcs.fundingTitle }</span>
	                          </div>
	                            <p class="card-text">${ fcs.fundingSummary }</p>
	                          
	                            <i class="bi bi-bag-heart likeIcon"> </i><span>${ dibsCountList[status.index] }</span>
	                                <fmt:parseNumber value="${ fcs.fundingStart.time / (1000*60*60*24) }" integerOnly="true" var="fcsFmtTime" scope="request"/>
	                            <span class="remainOpenDate">${ fcsFmtTime - nowFmtTime + 1}일 뒤 오픈</span>
	                      </div>
	                    </div>
	                  </div>
				</c:forEach>
                  
            </div>
        </div>
<!--       </div> -->
      
      
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  		<div class="modal-dialog modal-dialog-centered">
    		<div class="modal-content">
      			<div class="modal-header">
        			<h5 class="modal-title" id="exampleModalLabel"></h5>
      			</div>
      		<div class="modal-footer">
       		 <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modalCloseBtn">닫기</button>
      	</div>
    </div>
  </div>
</div>
    <script type="text/javascript">
    		const payScheduleSuccessMessage = '${ cancelPayScuccess }';
    		console.log(payScheduleSuccessMessage);
    		if(payScheduleSuccessMessage != '') {
    			const exampleModalLabel = document.getElementById('exampleModalLabel');
    			exampleModalLabel.innerText = "결제가 취소되었습니다 !";
    			
    			$('#exampleModal').modal('show');
    		}
    		
    		const fundingProceedMoney = document.getElementsByClassName('fundingProceedMoney');
    		for(const span of fundingProceedMoney) {
    			const before = parseInt(span.innerText);
    			span.innerText = " " + before.toLocaleString() + "원";
    		}
    		
    		const progressBar = document.getElementsByClassName('progressBar');
    		const progressBarPercent = document.getElementsByClassName('progressBarPercent');
    		for(let i=0 ; i<progressBar.length ; i++) {
				const percent = parseInt(progressBarPercent[i].value.substring(0, progressBarPercent[i].value.length-1));
				if(percent >= 100) {
	    			progressBar[i].style.width = "100%";
				} else {
    				progressBar[i].style.width = percent + "%";
				}
    		}
    		var boards = document.getElementsByClassName('cardDecoration');
    		for(var board of boards){
    			board.addEventListener('click', function(){
    				const bId = this.querySelector('.bId').value;
    				console.log(bId);	// 선택한 펀딩 게시글 번호를 가지고 오는가
    				const writerNo = this.querySelector('.writer').value;
    				console.log(writerNo);	// 선택한 펀딩 게시글 작성자 번호를 가지고 오는가
    				
    				location.href='${contextPath}/selectFundingBoard.fund?bId=' + bId + '&writerNo=' + writerNo;
    			});
    		}
    		
    		
    		
    </script>
<% request.removeAttribute("cancelPayScuccess"); %>

<script>
	window.onload = () => {
	    const divs = document.getElementsByClassName('wantingList');
   	 console.log(divs);

	    for(const div of divs){
	       div.addEventListener('click',function(){
	    	  const input = this.querySelectorAll('input');
	          const wantingNum=input[0].value;

	          location.href  = '${contextPath}/selectWanting.want?wantingNum='+ wantingNum;
	       });
	    }
	 }
	
	const fundingMore = document.getElementById('fundingMore');
	fundingMore.addEventListener('click', function() {
		location.href='${ contextPath }/fundingList.fund';
	});
</script>
</body>
</html>
