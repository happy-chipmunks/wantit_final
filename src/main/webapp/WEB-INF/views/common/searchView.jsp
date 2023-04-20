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
	           <span class="bigSizeFont">검색결과 <span class="searchListCount" id="searchListCount">${ fundingList.size() }개</span></span>
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
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="targetArea">
        <c:set var="today" value="<%=new java.util.Date() %>"></c:set>
        <fmt:formatDate value="${ today }" pattern="yyyy-MM-dd" var="fmtToday"/>
        	<c:forEach items="${ fundingList }" var="fund">
        		<c:if test="${ fmtToday >= fund.fundingStart }">
        			<!--  펀딩중인 것만 -->
        			 <div class="col cardDecoration">
        			 	<input type="hidden" name="bId" class="bId" value="${ fund.fundingNum }">
        			 	<input type="hidden" name="writer" class="writer" value="${ fund.creatorNum }">
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
                      <div class="d-flex justify-content-between align-items-center">
                            <div style="height: 2px; width: 100%; background-color: gray;"><span class="progressBar" style="display: block; background-color: #8c86c7; height: 2px; width: 26%;"></span></div>
                        </div>
                        <fmt:formatNumber value="${ fund.currentMoney / fund.targetMoney }" type="percent" var="percentage"/>
                        <input type="hidden" value="${ percentage }" class="progressBarPercent">
                        <jsp:useBean id="now" class="java.util.Date"/>
                        <fmt:parseNumber value="${ now.time / (1000*60*60*24) }" integerOnly="true" var="nowFmtTime" scope="request"/>
                        <fmt:parseNumber value="${ fund.fundingEnd.time / (1000*60*60*24) }" integerOnly="true" var="feFmtTime" scope="request"/>
                        <span class="fontOnly">${ percentage }</span>
                        <span class="fundingProceedMoney">${ fund.currentMoney }</span>
                        <span class="remainDate">${feFmtTime - nowFmtTime + 1 }일 남음</span>
                  </div>
                </div>
              </div>
        		</c:if>
        		<c:if test="${ fmtToday < fund.fundingStart }">
        			<!--  펀딩예정인 것만 -->
        			<div class="col cardDecoration">
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
          <c:if test="${ fundingList.size() == 0 && wantingList.size() == 0}">
          	<div class="row">
          		<div class="col alermWantExist" >
	          			<span>검색결과와 일치한 펀딩, 펀딩예정인 목록이 없습니다.</span><br><br>
          		</div>
          	</div>
          </c:if>
          
          
          
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
    		changeMoney();
    		changeProgressBar();

    		//전체, 펀딩, 펀딩예정, 원팅 조회 각각에 대해 eventListener 작성
			const liItem = document.getElementsByClassName('li-item');
			const searchText = '${ searchText }';
			const cate = '${ cate }';
			for(const li of liItem) {
				li.addEventListener('click', function() {
					//li 클릭시 요소의 텍스트로 판단
					switch(this.innerText) {
						case '전체(펀딩, 펀딩예정)':
							if(searchText != '') {
								location.href = '${ contextPath }/search.do?searchText=' + searchText;
							} else if(cate != '') {
								location.href = '${ contextPath }/search.do?searchCate=' + cate;
							}
							break;
							
						case '펀딩':
							$.ajax({
								url : '${ contextPath }/searchFP.do',
								data : {'searchText' : searchText, 'searchCate' : cate},
								success : (data)=> {
									//검색에 맞는 결과만 가져올 수 있도록 뷰를 수정하고
									//진행상태와 펀딩액수를 변경
									changeHtmlView(data);
									changeMoney();
						    		changeProgressBar();
									
								},
								error : (data)=> {
									
								}
							});
							break;
						case '펀딩예정':
							$.ajax({
								url : '${ contextPath }/searchFCS.do',
								data : {'searchText' : searchText, 'searchCate' : cate},
								success : (data)=> {
									changeHtmlView(data);
									changeMoney();
						    		changeProgressBar();
								},
								error : (data)=> {
									
								}
							});
							break;
						case '원팅':
							$.ajax({
								url : '${ contextPath }/searchWant.do',
								data : {'searchText' : searchText},
								success : (data)=> {
									changeHtmlView(data);
									changeMoney();
						    		changeProgressBar();
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
			//일반 숫자를 원화 형식으로 바꾸는 함수
			function changeMoney() {
				const fundingProceedMoney = document.getElementsByClassName('fundingProceedMoney');
	    		for(const span of fundingProceedMoney) {
	    			//액수를 저장해 innerText 초기화 후 원화로 바꿈
	    			const before = parseInt(span.innerText);
	    			span.innerText = " " + before.toLocaleString() + "원";
	    		}
			}
			
			//펀딩 달성된 퍼센테이지를 이용해 진행상황 바를 바꾸는 함수
    		function changeProgressBar() {
	    		const progressBar = document.getElementsByClassName('progressBar');
	    		const progressBarPercent = document.getElementsByClassName('progressBarPercent');
	    		for(let i=0 ; i<progressBar.length ; i++) {
	    			//달성률 가지고있는 문자열 가져와 퍼센트 문자만 제거해 숫자형식으로 변환
					const percent = parseInt(progressBarPercent[i].value.substring(0, progressBarPercent[i].value.length-1));
	    			//style 이용해 퍼센트만큼 css 변경, 기존 progressBar를 넘기면 안되기때문에 로직처리
					if(percent >= 100) {
		    			progressBar[i].style.width = "100%";
					} else {
	    				progressBar[i].style.width = percent + "%";
					}
	    		}
    		}
			
			//ajax 통신으로 서버호출시 다른 view를 리턴, view에서 원하는 데이터만 가져오는 함수
			function changeHtmlView(data) {
				//view에서 처음 div요소 안에 해당하는 요소중 id가 BigArea인 요소만 가져옴
				var html = $('<div>').html(data);
				var contents = html.find("div#BigArea").html();
				
				//searchView에서 id가 targetArea인 요소 안에 가져온 내용들을 삽입
				$("#targetArea").html(contents);
				
				//가져온 개수들로 view 초기화
				const listSize = document.getElementById('listSize');
				var searchListCount = document.getElementById('searchListCount');
				
				searchListCount.innerText = listSize.value + '개';
			}
			
    </script>
</body>
</html>