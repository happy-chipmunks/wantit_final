<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/fundingProceed.css">
</head>
<body>
    <!--배너광고, 이벤트-->
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
    
            <div class="container">
              <div class="carousel-caption text-start">
                <h1>Example headline.</h1>
                <p>Some representative placeholder content for the first slide of the carousel.</p>
                <p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item" >
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
    
            <div class="container">
              <div class="carousel-caption">
                <h1>Another example headline.</h1>
                <p>Some representative placeholder content for the second slide of the carousel.</p>
                <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
    
            <div class="container">
              <div class="carousel-caption text-end">
                <h1>One more for good measure.</h1>
                <p>Some representative placeholder content for the third slide of this carousel.</p>
                <p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
              </div>
            </div>
          </div>
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
                <span class="cateTitleOrAll">전체</span> <button onclick="location.href='${contextPath}/insertFundingBoard.fund'">펀딩작성</button>
                <ul class="sortList">
                    <li class="sortType">최신순</li>
                    <li class="sortType">
                        <select class="cateDropDown" aria-label="Default select example">
                            <option selected>전체</option>
                            <option value="1">진행중</option>
                            <option value="2">종료된</option>
                          </select>
                    </li>
                    <li class="sortType">
                        <select class="cateDropDown" aria-label="Default select example">
                            <option selected>추천순</option>
                            <option value="1">One</option>
                            <option value="2">Two</option>
                            <option value="3">Three</option>
                          </select>
                    </li>
                </ul>
                <br>
                <hr style="border: 2px solid dimgray;">

            </div>
        </div>

        <div class="row">
            <div class="col-md-1"></div>
            <div class="col-md-10" style="padding: 30px;">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                	<c:forEach items="${ fundingList }" var="fl">
		          		<c:set var="isNotInserted" value="true"/>
                		<div class="col fundingList">
	                        <div class="card shadow-sm fundinglist">
	                          		<c:forEach items="${ imageList }" var="i">
		                          		<c:if test="${ fl.fundingNum eq i.imageBoardId and isNotInserted}">
		                          			<c:if test="${ i.imageRename != '' }">
		                          				<img src="${ contextPath }/resources/funding/${i.imageRename}" height="225" alt="...">
		                          				<c:set var ="isNotInserted" value="false"/>
		                          			</c:if>
		                          		</c:if>
		                          	</c:forEach>
		                         	<c:if test="${isNotInserted }">
		                         		<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">NO IMAGE</text></svg>    
		                          	</c:if>
	              					
	                          <div class="card-body">
	                              <div style="padding-bottom: 10px;">
	                              	<input class="bId" type="hidden" value="${ fl.fundingNum }">
	                              	<input class="writer" type="hidden" value="${ fl.creatorNum }">
	                                  <span class="cate">${ fl.fundingCate }</span>
	                                  <c:set var="title" value="${ fn:substring(fl.fundingTitle, 0, 15) }..."/>
	                                  <span class="fundName">${ title }</span>
	                              </div>
<%-- 	                              <c:set var="content" value="${ fn:substring(fl.fundingContent, 0, 18) }..."/> --%>
<%-- 	                              <p class="card-text">${ content }</p> --%>
	                              <div class="d-flex justify-content-between align-items-center">
	                                    <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
	                                </div>
	                                <span>26%</span>
	                                <span>${ fl.currentMoney }</span>
	                                <span class="remainDate">15일 남음</span>
	                          </div>
	                        </div>
	                     </div>
                	</c:forEach>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    	window.onload = () =>{
    		var boards = document.getElementsByClassName('fundingList');
    		for(var board of boards){
    			board.addEventListener('click', function(){
    				const bId = this.querySelector('.bId').value;
    				console.log(bId);	// 선택한 펀딩 게시글 번호를 가지고 오는가
    				const writerNo = this.querySelector('.writer').value;
    				console.log(writerNo);	// 선택한 펀딩 게시글 작성자 번호를 가지고 오는가
    				
    				location.href='${contextPath}/selectFundingBoard.fund?bId=' + bId + '&writerNo=' + writerNo;
    			});
    		}
    	}
    </script>
    
</body>
</html>