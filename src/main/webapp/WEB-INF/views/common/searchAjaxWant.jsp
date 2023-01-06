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
				<c:if test="${ cantSearchCate == 1 }">
					<div class="alertMessage">카테고리로는 원팅 검색할 수 없습니다. 키워드로 검색해주세요 !</div>
				</c:if>
	        	<input type="hidden" value="${ wantingList.size() }"  id="listSize">
	       		<input type="hidden" value="${ wantAjax }" id="wantAjax">
	        	<c:forEach items="${ wantingList }" var="want">
	        		<div class="col">
	        		<div class="card shadow-sm fundinglist">
						<svg class="" xmlns="http://www.w3.org/2000/svg" style="height: 0; width: 0;">
							<c:forEach items="${ imageList }" var="i">
								<c:if test="${ want.wantingNum == i.imageBoardId and i.imageLevel == 0}">
									<img src="${ contextPath }/resources/wanting/${i.imageRename}"
										class="bd-placeholder-img card-img-top" alt="..." style="height: 280px; width: 100%; object-fit: cover;">
								</c:if>
							</c:forEach>	
						</svg>
          
                      <div class="card-body">
                          <div style="padding-bottom: 10px;">
              
                          </div>
                          <p class="card-text">${ want.wantingTitle }</p>
                          <div class="d-flex justify-content-between align-items-center">
                            <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #8c86c7 height: 2px; width: ${ want.wantingCount }%;"></span></div>
                          </div>
                          
                          <span class="remainCount">${ want.wantingCount }명 / 100명</span>
                          <span class="remainDate">${ want.wantingDaysCount }일 지났어요</span>
                          <br>
                          <p class="wantingWriter">${ want.wantingWriter }</p>
			              <input type="hidden" class="wantingNum" value="${ want.wantingNum }">
                      </div>
                    </div>
                 </div>
	        	
		            
	        	</c:forEach>
	           
	            
	    </div>
</body>
</html>