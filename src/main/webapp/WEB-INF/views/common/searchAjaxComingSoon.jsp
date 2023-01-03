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
                      			<p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                      			<div style="padding-bottom: 10px;">
                          			<span class="cate">홈/리빙</span>
                          			<span class="fundName">괄호프로젝트</span>
                      			</div>
                      		<button type="button" class="btn alarmApl"><i class="bi bi-bell"></i>12/12(월) 오픈 알람신청</button>
                 	 </div>
                </div>
            </div>
		              
	        	</c:forEach>
	           
	            
	    </div>
</body>
</html>