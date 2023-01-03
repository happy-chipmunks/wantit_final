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
                		<div class="card shadow-sm fundinglist">
                  			<svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
      
                  		<div class="card-body">
                      		<p class="card-text">${ fund.fundingTitle }</p>
                      			<div style="padding-bottom: 10px;">
                         		 <span class="cate">${ fund.fundingCate }</span>
                          		<span class="fundName">${ fund.creatorNickname }</span>
                      </div>
                      <div class="d-flex justify-content-between align-items-center">
                            <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #8c86c7; height: 2px; width: 26%;"></span></div>
                        </div>
                        <span class="fontOnly">26%</span>
                        <span>1,000원</span>
                        <span class="remainDate">15일 남음</span>
                  </div>
                </div>
              </div>
	        	</c:forEach>
	           
	            
	    </div>
</body>
</html>