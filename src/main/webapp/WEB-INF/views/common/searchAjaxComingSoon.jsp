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
	        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="BigArea">
	        	<input type="hidden" value="${ fundingList.size() }"  id="listSize">
	        	<c:forEach items="${ fundingList }" var="fund">
	        	
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
                      			<fmt:formatDate value="${ fund.fundingStart }"  pattern="MM-dd(E)" var="openDate"/>
                      		<button type="button" class="btn alarmApl"><i class="bi bi-bell"></i>${ openDate } 오픈 알람신청</button>
                 	 </div>
                </div>
            </div>
		              
	        	</c:forEach>
	           
	            
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