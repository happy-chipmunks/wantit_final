<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/searchView.css">
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <span class="bigSizeFont">검색결과 <span class="searchListCount">${ fundingList.size() }개</span></span>
        </div>
        <div class="row">
            <ul class="list-group list-group-horizontal">
                <li class="li-item" id="searchAll">전체(펀딩, 펀딩예정)</li>
                <li class="li-item" id="searchFundP">펀딩</li>
                <li class="li-item" id="searchFundC">펀딩예정</li>
                <li class="li-item" id="searchWant">원팅</li>
              </ul>

        </div>
        
        <hr>
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
        <c:set var="today" value="<%=new java.util.Date() %>"></c:set>
        <fmt:formatDate value="${ today }" pattern="yyyy-MM-dd" var="fmtToday"/>
        	<c:forEach items="${ fundingList }" var="fund">
        		<c:if test="${ fmtToday >= fund.fundingStart }">
        			<!--  펀딩중인 것만 -->
        		</c:if>
        		<c:if test="${ fmtToday < fund.fundingStart }">
        			<!--  펀딩예정인 것만 -->
        		</c:if>
        		
        	</c:forEach>
            <div class="col cardDecoration">
                <div class="card shadow-sm fundinglist">
                  <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
      
                  <div class="card-body">
                      <div style="padding-bottom: 10px;">
                          <span class="cate">홈/리빙</span>
                          <span class="fundName">괄호프로젝트</span>
                      </div>
                      <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                      <div class="d-flex justify-content-between align-items-center">
                            <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                        </div>
                        <span class="fontOnly">26%</span>
                        <span>1,000원</span>
                        <span class="remainDate">15일 남음</span>
                  </div>
                </div>
              </div>
            <div class="col cardDecoration">
                <div class="card shadow-sm fundinglist">
                  <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
      
                  <div class="card-body">
                      <div style="padding-bottom: 10px;">
                          <span class="cate">홈/리빙</span>
                          <span class="fundName">괄호프로젝트</span>
                      </div>
                      <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                      <div class="d-flex justify-content-between align-items-center">
                            <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                        </div>
                        <span>26%</span>
                        <span>1,000,000원</span>
                        <span class="remainDate">15일 남음</span>
                  </div>
                </div>
              </div>
              <div class="col cardDecoration">
                <div class="card shadow-sm fundinglist">
                  <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
      
                  <div class="card-body">
                      <div style="padding-bottom: 10px;">
                          <span class="cate">홈/리빙</span>
                          <span class="fundName">괄호프로젝트</span>
                      </div>
                      <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                      <div class="d-flex justify-content-between align-items-center">
                            <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                        </div>
                        <span>26%</span>
                        <span>1,000,000원</span>
                        <span class="remainDate">15일 남음</span>
                  </div>
                </div>
              </div>
              <div class="col cardDecoration">
                <div class="card shadow-sm fundinglist">
                  <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
      
                  <div class="card-body">
                      <div style="padding-bottom: 10px;">
                          <span class="cate">홈/리빙</span>
                          <span class="fundName">괄호프로젝트</span>
                      </div>
                      <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                      <div class="d-flex justify-content-between align-items-center">
                            <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                        </div>
                        <span>26%</span>
                        <span>1,000,000원</span>
                        <span class="remainDate">15일 남음</span>
                  </div>
                </div>
              </div>
              <div class="col cardDecoration">
                <div class="card shadow-sm fundinglist">
                  <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
      
                  <div class="card-body">
                      <div style="padding-bottom: 10px;">
                          <span class="cate">홈/리빙</span>
                          <span class="fundName">괄호프로젝트</span>
                      </div>
                      <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                      <div class="d-flex justify-content-between align-items-center">
                            <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                        </div>
                        <span>26%</span>
                        <span>1,000,000원</span>
                        <span class="remainDate">15일 남음</span>
                  </div>
                </div>
              </div>
              <!--여기서부터 펀딩예정-->
              <div class="col cardDecoration">
                <div class="card shadow-sm fundinglist">
                  <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
      
                  <div class="card-body">
                      <div style="padding-bottom: 10px;">
                          <span class="cate">홈/리빙</span>
                          <span class="fundName">괄호프로젝트</span>
                      </div>
                      <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                      <button type="button" class="btn alarmApl"><i class="bi bi-bell"></i>12/12(월) 오픈 알람신청</button>
                  </div>
                </div>
            </div>
            <div class="col cardDecoration">
                <div class="card shadow-sm fundinglist">
                  <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
      
                  <div class="card-body">
                      <div style="padding-bottom: 10px;">
                          <span class="cate">홈/리빙</span>
                          <span class="fundName">괄호프로젝트</span>
                      </div>
                      <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                      <button type="button" class="btn alarmApl"><i class="bi bi-bell"></i>12/12(월) 오픈 알람신청</button>
                  </div>
                </div>
            </div>
            
            
          </div>
    </div>
    <script type="text/javascript">
//     	const searchAll = document.getElementById('searchAll');
//     	const searchFundP = document.getElementById('searchFundP');
//     	const searchFundC = document.getElementById('searchFundC');
//     	const searchWant = document.getElementById('searchWant');
    	
//     	searchAll.addEventListener('click', function() {
//     		location.href= '${ contextPath }/search.do';
//     	});
    	
//     	searchFundP.addEventListener('click', function() {
//     		$.ajax({
//     			url : '${ contextPath }/search'
//     		})
//     	});
    	
//     	searchFundC.addEventListener('click', function() {
    		
//     	});
    	
//     	searchWant.addEventListener('click', function() {
    		
//     	});

			const liItem = document.getElementsByClassName('li-item');
			const searchText = '${ searchText }';
			for(const li of liItem) {
				li.addEventListener('click', function() {
					switch(this.innerText) {
						case '전체(펀딩, 펀딩예정)':
							location.href = '${ contextPath }/serach.bo?searchText=' + searchText;
							break;
							
						case '펀딩':
							$.ajax({
								url : '${ contextPath }/searchFP.do',
								data : {'searchText' : searchText},
								success : (data)=> {
									console.log(data);
								},
								error : (data)=> {
									
								}
							});
							break;
						case '펀딩예정':
							$.ajax({
								url : '${ contextPath }/searchFCS.do',
								type : 'POST',
								data : {'searchText' : searchText},
								success : (data)=> {
									console.log(data);
								},
								error : (data)=> {
									
								}
							});
							break;
						case '원팅':
							$.ajax({
								url : '${ contextPath }/searchWant.do',
								type : 'POST',
								data : {'searchText' : searchText},
								success : (data)=> {
									
								},
								error : (data)=> {
									
								}
							});
							break;
						default:
							break;
					}
				});
			}
    </script>
</body>
</html>