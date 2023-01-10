<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/bootstrap-custom.css" />
<style>
	.funding-header {
	    overflow: hidden;
	}
	
	.title {
	    position: relative;
	    /* z-index: 3; */
	    padding-right: 30px;
	    padding-left: 30px;
	    text-align: center;
	    line-height: 42px;
	    font-size: 30px;
	    font-weight: 500;
	}
	
	@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		} 
		
	body{font-family: 'NanumSquareNeo-Variable';}
	
	ul{list-style:none;}
	
	a{text-decoration: none; color: #787878;}
	a:hover{text-decoration: none; color: #8C86C7;}
</style>
</head>
<body>
	<div class="funding-header text-center mt-5">
	    <div class="background"></div>
	    <h2 class="title"><a href="#">${ f.fundingTitle }</a></h2>
	</div>
	<hr style="background-color: #8C86C7; border: 0; height: 1px;">
	 <div class="container" style="width: 40%;">
	 		<span style="background-color: #8c86c7;">
	 			<h2 style="display: inline;">리워드 선택</h2>&nbsp;&nbsp;<span>펀딩해주시는 금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</span>
	 		</span>
	 		<br><br>
	 		<form action="payView.pay" method="POST">
	 			<input type="hidden" value="${ bId }" name="fundingNum">
<%-- 	 			<input type="hidden" value="${ id }" name="memberId"> --%>
<!-- 	 			<ul> -->
<%-- 	 				<c:forEach items="${ rList }" var="r"> --%>
<!-- 	 					<li class="m-2"> -->
<!-- 		 					<div class="fs-5"> -->
<%-- 		 						<input type="checkbox" class="form-check-input" name="rewardNum" value="${ r.rewardNum }">&nbsp;${ r.price }원 펀딩 --%>
<!-- 		 					</div> -->
<!-- 		 					<div class="mt-1"> -->
<%-- 		 						<span class="fs-5"><b>${ r.rewardTitle }</b></span><br> --%>
<%-- 		 						<span style="color: #bdbdbd;">제한수량 ${ r.rewardLimit }개</span>&nbsp;&nbsp;<span style="color: #8c86c7;">${ r.rewardLimit - r.rewardSellCount }개 남음</span> --%>
<!-- 		 					</div> -->
<!-- 		 					<div class="mt-1"> -->
<%-- 		 						<p>${ r.rewardContent }</p> --%>
<!-- 		 					</div> -->
<!-- 		 					<div class="mt-1"> -->
<%-- 		 						<img src="${ contextPath }/resources/funding/택배비이미지.png" width="30" height="30"> --%>
<%-- 		 						<c:if test="${ r.shipping == 0 }"> --%>
<!-- 		 							무료배송 -->
<%-- 		 						</c:if> --%>
<%-- 		 						<c:if test="${ r.shipping != 0 }"> --%>
<%-- 		 							${ r.shipping }원 --%>
<%-- 		 						</c:if> --%>
<%-- 		 						<span style="color: #8c86c7;">|</span> ${ r.rewardExpectDate } 리워드 발송 예정 --%>
<!-- 		 					</div> -->
<!-- 		 				</li> -->
<!-- 		 				<hr style="background-color: #8C86C7; border: 0; height: 1px;"> -->
<%-- 	 				</c:forEach> --%>
<!-- 	 			</ul> -->
	 			
<!-- 	 			<div style="text-align: center;"><button class="btn" style="background-color: #8c86c7;">다음으로</button></div> -->
	 		</form>
	 		<br><br>
	 </div>
	 
</body>
</html>