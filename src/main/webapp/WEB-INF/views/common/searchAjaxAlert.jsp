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

	        	<div id="bigArea">
	        		<input type="hidden" value="${ 0 }" id="listSize">
					<c:if test="${ cantSearchCate == 1 }">
						<div class="alertMessage">카테고리로는 원팅 검색할 수 없습니다. 키워드로 검색해주세요 !</div>
					</c:if>
	        	</div>
	        	
</body>
</html>