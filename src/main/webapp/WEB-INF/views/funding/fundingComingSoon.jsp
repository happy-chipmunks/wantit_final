<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/fundingComingSoon.css">
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
		            <img alt="" src="${ contextPath }/resources/bannerImage/${ bi.imageRename }">		  
		    
		          </div>
        		</c:if>
        		<c:if test="${ status.index != 0 }">
		          <div class="carousel-item">
						<img alt="" src="${ contextPath }/resources/bannerImage/${ bi.imageRename }">		    
		          </div>
        		</c:if>
        	</c:forEach>
          
          
        </div>
        <button class="carousel-control-prev-cs" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next-cs" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>

    <div class="container">
        <!-- 카테고리 -->
        <div id="carouselExampleControlsNoTouching" class="carousel slide" data-bs-touch="false">
            <div class="carousel-inner">
              <div class="carousel-item active cateArea">
                <div class="row">
                    <div class="col-1 cateItemArea"></div>
                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/free-icon-home-appliance-3659944.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>테크<br>가전</p>
                        </div>
                        
                    </div>
                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/free-icon-fashion-7417634.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>패션<br>잡화</p>
                        </div>
                    </div>
                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/free-icon-cosmetics-3501241.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>뷰티</p>
                        </div>
                    </div>
                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/free-icon-ozoni-3736059.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>음식</p>
                        </div>
                    </div>
                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/living-room.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>홈<br>리빙</p>
                        </div>
                    </div>
                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/free-icon-tourism-8171604.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>여행<br>레저</p>
                        </div>
                    </div>
                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/free-icon-sports-4163736.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>스포츠</p>
                        </div>
                    </div>
                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/free-icon-character-1577156.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>캐릭터<br>굿즈</p>
                        </div>
                    </div>
                </div>
              </div>
              <div class="carousel-item cateArea">
                <div class="row">
                    <div class="col-1 cateItemArea"></div>

                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/free-icon-baby-2234018.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>베이비<br>키즈</p>
                        </div>
                    </div>
                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/free-icon-dog-2272310.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>반려동물</p>
                        </div>
                    </div>
                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/free-icon-game-controller-2331852.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>게임</p>
                        </div>
                    </div>
                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/painting.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>컬쳐<br>아티스트</p>
                        </div>
                    </div>
                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/free-icon-books-2702069.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>출판</p>
                        </div>
                    </div>
                    <div class="col-1 cateItemArea">
                        <div class="cateItem">
                            <img src="${ contextPath }/resources/cateImage/free-icon-elearning-2704382.png" class="cateImage" alt="">
                        </div>
                        <div class="cateItemName">
                            <p>클래스<br>컨설팅</p>
                        </div>
                    </div>
                </div>
              </div>
            </div>
            <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="prev">
              <span class="carousel-control-prev-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Previous</span>
            </button>
            <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControlsNoTouching" data-bs-slide="next">
              <span class="carousel-control-next-icon" aria-hidden="true"></span>
              <span class="visually-hidden">Next</span>
            </button>
        </div>
        <br><br>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <span class="cateTitleOrAll">전체</span>
                <ul class="sortList">
                    <li class="sortType">최신순</li>
                    <li class="sortType">알람신청순</li>
                    <li class="sortType">찜하기순</li>
                    <li class="sortType">오픈임박순</li>
                </ul>
                <br>
                <hr style="border: 2px solid dimgray;">

            </div>
        </div>
		<c:set value="<%= new java.util.Date() %>" var="today"></c:set>
		<fmt:formatDate value="${ today }" pattern="yyyy-MM-dd" var="fmtToday"/>
        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10" style="padding: 30px;">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                	<c:forEach items="${ fundingList }" var="fund">
	                    <c:if test="${ fmtToday < fund.fundingStart }">
	        			<!--  펀딩예정인 것만 -->
	        			<div class="col cardDecoration">
	        				<input type="hidden" value="${ fund.creatorNum }" class="writer">
	        				<input type="hidden" value="${ fund.fundingNum }" class="bId">
	                		<div class="card shadow-sm fundinglist">
	                  				<c:forEach items="${ imageList }" var="image">
	                  					<c:if test="${ image.imageBoardId == fund.fundingNum }">
	                  					
		                  					<img alt="" src="${ contextPath }/resources/funding/${ image.imageRename }" width="100%" height="225">
	                  					</c:if>
	                  				</c:forEach>
	      
	                  			<div class="card-body">
	                      			<p class="card-text">${ fund.fundingTitle }</p>
	                      			<div style="padding-bottom: 10px;">
	                          			<span class="cate">${ fund.fundingCate }</span>
	                          			<span class="fundName">${ fund.creatorNickname }</span>
	                      			</div>
	                      			<fmt:formatDate value="${ fund.fundingStart }"  pattern="MM-dd(E)" var="openDate"/>
	                      		<button type="button" class="btn alarmApl"><i class="bi bi-bell"></i>${ openDate } 오픈 알람신청</button>
	                 	 </div>
	                </div>
	            </div>
	        		</c:if>
                	</c:forEach>
                    
                </div>
            </div>
        </div> 
    </div>
    <script type="text/javascript">
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
</body>
</html>