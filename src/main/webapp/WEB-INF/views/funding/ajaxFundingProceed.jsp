<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/fundingProceed.css">
</head>
<body>
	<c:set value="<%= new java.util.Date() %>" var="today"></c:set>
		<fmt:formatDate value="${ today }" pattern="yyyy-MM-dd" var="fmtToday"/>
	<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="BigArea">
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
                        <span class="remainDate" style="float: right;">${feFmtTime - nowFmtTime + 1 }일 남음</span>
                  </div>
                </div>
              </div>
              </c:if>
        	</c:forEach>
                	
                </div>
</body>
</html>