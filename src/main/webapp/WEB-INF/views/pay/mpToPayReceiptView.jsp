<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/payReceiptView.css">
</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-3"></div>
            <div class="col-6 receiptMain">
                <div class="receiptTop">결제 정보</div>
                <div class="receiptContent">
                    <h5 class="dohyeonFont">구매 목록</h5>
                    <div>${ fundingTitle }</div>
                    <c:set value="${ fn:split(paySchedule.rewardBuyList, '/') }" var="buyList"/>
                    <c:forEach items="${ buyList }" var="item">
                    	<p>${ item }</p>
                    </c:forEach>
                        
 
                    <br>
                    <span class="totalPrice" style="padding-left: 30px;" id="tp"></span>
                    <br>
                    <hr class="line">
                    
                    
                    <br><br><br>

                    <h5 class="dohyeonFont">구매자 정보</h5>
                    <p class="fontOnly" style="font-size: 17px;">구매자 이름</p>
                    <p class="fontOnly" style="font-size: 12px;">${ paySchedule.buyerName }</p>
                    
                  

                    <p class="fontOnly" style="font-size: 17px;">휴대폰 번호</p>
                    <p class="fontOnly" style="font-size: 12px;">${ paySchedule.buyerTel }</p>

                    <p class="fontOnly" style="font-size: 17px;">배송지 주소</p>
                    <p class="fontOnly" style="font-size: 12px;">${ fn:substringBefore(paySchedule.buyerAddr, '//') } ${ fn:substringAfter(paySchedule.buyerAddr, '//') }</p>

                    <hr class="line">

                    <h5 class="dohyeonFont">카드 정보</h5>
                    <span class="cardName">${ paySchedule.cardName }</span>
                    <span class="fontOnly" style="float: right;">카드사 : </span>

                    <br>
                    <span class="cardNumber">${ paySchedule.cardNumber }</span>
                    <span class="fontOnly" style="float: right;">카드번호 : </span>
                    <br><br>
                    
                    <c:if test="${ paySchedule.paymentStatus == 'null' }">
	                    <form action="${ contextPath }/cancelPaySchedule.pay" method="post">
	                        <input type="hidden" name="customerUId" id="" value="${ paySchedule.customerUId }">
	                        <input type="hidden" name="merchantUId" id="" value="${ paySchedule.merchantUId }">
	                        <input type="hidden" name="buyerName" value="${ paySchedule.buyerName }">
	                        <button  class="btn btn-outline btnPayCancel">결제 예약 취소하기</button>
	                    </form>
                    </c:if>
                    
                    <c:if test="${ paySchedule.paymentStatus == 'failed' }">
	                    <form action="${ contextPath }/payAgain.pay" method="post">
	                        <input type="hidden" name="customerUId" id="" value="${ paySchedule.customerUId }">
	                        <input type="hidden" name="merchantUId" id="" value="${ paySchedule.merchantUId }">
	                        <input type="hidden" name="buyerName" value="${ paySchedule.buyerName }">
	                        <input type="hidden" name="merchantName">
	                        <input type="hidden" name="amount" value="${ paySchedule.amount }">
	                        <button  class="btn btn-outline btnPayCancel">재결제</button>
	                    </form>
                    </c:if>
                    
                    <c:if test="${ paySchedule.paymentStatus == 'paid' }">
                    	<button  class="btn btn-outline btnPayCancel" onclick="javascript:history.back();">뒤로가기</button>
                    </c:if>
                </div>
            </div>
        </div>

    </div>
    <script type="text/javascript">
    	window.onload=()=> {
    		const tp = document.getElementById('tp');
    		tp.innerText = (${ paySchedule.amount }).toLocaleString() + "원";
    	}
    </script>
</body>
</html>