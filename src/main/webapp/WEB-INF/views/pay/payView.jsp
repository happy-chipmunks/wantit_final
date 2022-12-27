<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
     <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <link rel="stylesheet" href="resources/css/payView.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap" rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR&display=swap" rel="stylesheet">
<style type="text/css">
	.searchForm{
	margin-bottom: 20px;
}

	.brandName{
	font-size: 25px;
}

	#exampleModalLabel{
		font-family: 'Noto Sans KR', sans-serif;
		font-size: 20px;
	}
	
	.modal-header{
		border-bottom: 0;
	}
	
	.modal-footer{
		border-top: 0;
	}
	
	#modalCloseBtn{
		background-color: #e8acef;
		border: 1px solid #e8acef;
		font-family: 'Noto Sans KR', sans-serif;
	}
</style>
</head>
<style>
 

</style>
<body>
    <div class="container payMainView">
        <div class="row tSection">
            <p class="srTitle">펀딩 결제</p>
        </div>
        <form action="${ contextPath }/paySchedule.pay" method="post" id="scheduleForm">
	        <div class="row">
	            <div class="col-4 selectReward">
	                <p class="crT">리워드 선택</p>
	                <div class="rList">
	                    <div>
	                    <c:forEach begin="0" end="${ rewardList.size()-1 }" var="i" varStatus="status">
	                    
	                    <fmt:formatNumber value="${ rewardList[i].price }" type="number"  var="rewardPrice"/>
	                    <fmt:formatNumber value="${ rewardList[i].shipping }" type="number" var="rewardShipping"/>
	                    <fmt:formatNumber value="${ rewardList[i].rewardLimit }" type="number" var="rewardLimit"/>
	                    <fmt:formatNumber value="${ rewardList[i].rewardLimit - rewardList[i].rewardSellCount }" type="number" var="rewardRemain"/>
	                    
	                    
	                        <div class="rewardContent rcIndex${ status.index }">
	                            <input type="checkbox" class="ch" id="ch${ status.index }"><label for="ch${ status.index }" id="cbLabel${ status.index }"></label>
	                            <label for="ch${ status.index }" class="price" id="rp${ status.index }">${ rewardPrice }</label>원
	                            <label for="ch${ status.index }" class="labelClickPlace">
	                                <p class="rwName">${ rewardList[i].rewardTitle }</p>
	                                <input type="hidden" value="${ rewardList[i].rewardTitle }" name="rewardTitle">
	                                <span class="rwLimit">제한수량 ${ rewardLimit }개</span>
	                                <span class="rwRemain">${ rewardRemain }개 남음</span>
	                                <input type="hidden" id="getRemain${ status.index }" value="${ rewardRemain }">
	                                <p class="rwContent" id="rwContent${ status.index }">${ rewardList[i].rewardContent }</p>
	                                <c:if test="${ rewardShipping == '0' }">
		                                <p class="rwOther">무료배송 | ${ rewardList[i].rewardExpectDate }일 리워드 제공 예정</p>
	                                </c:if>
	                                <c:if test="${ rewardShipping != '0' }">
	                                	<p class="rwOther">배송비 ${ rewardShipping }원 | ${ rewardList[i].rewardExpectDate }일 리워드 제공 예정</p>
	                                	<input type="hidden" value="${ rewardList[i].rewardExpectDate }" name="rewardExpectDate">
	                                </c:if>
	                                
	                                <input type="hidden" id="sp${ status.index }" class="sp"  value="${ rewardShipping }">
	
	                            </label>
	                                <div class="cp"  id="cpIndex${ status.index }" style="display: none;">
	                                    <button type="button" class="countBtn" id="minusBtn${ status.index }" style="display: inline;">-</button>
	                                    <input type="text" value="0" class="rwCount" id="rewardCount${ status.index }" name="rewardCount" style="display: inline;" readonly="readonly">
	                                    <button type="button" class="countBtn" id="plusBtn${ status.index }">+</button>
	                                    <span class="totalPrice" id="totalPrice${ status.index }">0원</span>
	                                    <input type="hidden" value="${ rewardList[i].rewardNum }" name="rewardNum">
	                                </div>
	                            </div>
	                            <hr>
	                    </c:forEach>
	                            
	                        </div>
	                    </div>
	            </div>
	            <div class="col-8 payAndPost">
	                <p class="crT">결제예약/배송지</p>
	                <div class="row">
	                    <div class="col-6 payArea">
	                        <p class="rwName" id="rwName" >${ fundingTitle }</p>
	                        <input type="hidden" name="fundingTitle" value="${ fundingTitle }">
	                        <br>
	                        <span class="totalPrice" style="padding-left: 30px;" id="tap">0원</span>
	                        <span class="totalPrice" id="ta">수량 : 0개</span>
	                        <br>
	                        <hr>
	                        <span class="onlyFont">배송비</span>
	                        <span class="onlyFont" style="float: right;" id="shippingPrice">0원</span>
	                        <hr style="border-style: dashed;">
	                        <span class="onlyFont">총액</span>
	                        <span class="onlyFont" style="float: right;" id="finalPrice">0원</span>
	                        <input type="hidden" value="" name="totalAmount" id="totalAmount">
	                        <br>
	                        <hr style="border: 2px solid;">
	
	                        <p class="payInfo">결제 정보</p>
	                        
	                        <div class="container" style="margin-left: 20px;" id="cardForm">
	                            <br><br>
	                            <div class="row">
	                                <p class="cnText">카드 번호</p>
	                            </div>
	                            <div class="row">
	                                <input type="text" class="cardNumberInput" id="cn1" maxlength="4" dir="rtl" name="cardNum"> -
	                                <input type="text" class="cardNumberInput" id="cn2" maxlength="4" dir="rtl" name="cardNum"> -
	                                <input type="text" class="cardNumberInput" id="cn3" maxlength="4" dir="rtl" name="cardNum"> -
	                                <input type="text" class="cardNumberInput" id="cn4" maxlength="4" dir="rtl" name="cardNum">
	                            </div>
	
	                            <br><br>
	                            <div class="row">
	                            </div>
	                            <div class="row">
	                                <div class="col-6">
	                                    <p class="cnText">유효기간</p>
	                                    <input type="text" class="cardDateInput" id="cdMonth" maxlength="2" placeholder="월" dir="rtl" name="cardExpiry">
	                                    <input type="text" class="cardDateInput" id="cdYear" maxlength="2" placeholder="년" dir="rtl" name="cardExpiry">
	                                </div>
	                                <div class="col-6">
	                                    <p class="cnText">비밀번호 앞 2자리</p>
	                                    <input type="text" class="cardPwdInput" id="cPwd" maxlength="2" name="cardPwd">
	                                    <br><br>
	                                </div>
	                            </div>
	                            <div class="row">
	                                <p class="cnText">생년월일</p>
	                                <input type="text" class="cardBirthDateInput" id="cBD" maxlength="6" name="cardBirth">
	                            </div>
	                        </div>
	
	                    </div>
	                    <div class="col-6 infoArea">
	                        <p class="payInfo">구매자 정보</p>
	                        <span class="onlyFont">이름</span>
	                        <span class="onlyFont" style="float: right;">${ loginUser.memberName }</span>
	                        <input type="hidden" value="${ loginUser.memberName }" name="buyerName">
	                        <br><br>
	                        <span class="onlyFont">휴대폰 번호</span>
	                        <span class="onlyFont" style="float: right;">${ loginUser.memberPhone }</span>
	                        <input type="hidden" value="${ loginUser.memberPhone }" name="buyerTel">
	                        <hr>
	                        <br>
	                        <span class="onlyFont">배송지 선택</span>
	                        <span>
	                            <div class="form-check form-check-inline delDes">
	                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
	                                <label class="form-check-label" for="inlineRadio1">기존 주소</label>
	                            </div>
	                            <div class="form-check form-check-inline delDes">
	                                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
	                                <label class="form-check-label" for="inlineRadio2">새 주소</label>
	                            </div>
	                            <br><br>
	                            <button type="button" class="btn selectAddress" id="searchPostCode">우편번호 검색</button>
	                            <br><br>
	                            <input type="text" readonly class="address1" id="firstAddress" name="buyerAddr">
	                            <input type="hidden" id="buyerPostCode" name="buyerPostCode">
	                            <input type="text" class="address2" placeholder="상세주소" id="secondAddress" name="buyerAddr">
	                        </span>
	                        <hr>
	                        <p class="onlyFont">배송 시 요청사항(선택)</p>
	                        <input type="text" class="deliveryRequire" placeholder="ex)부재 시 경비실에 보관해주세요." name="postReq">
	                        <input type="hidden" name="fundingNum" value="${ fundingNum }">
	                        
        </form>
	                        <button type="button" id="payReservation">결제 예약하기</button>
							
	
	                    </div>
	                </div>
	            </div>
	            
	        </div>

    </div>
    
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"></h5>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="modalCloseBtn">닫기</button>
      </div>
    </div>
  </div>
</div>
    
     <script>
        window.onload=()=> {
            
            
            //기존주소 로직 나중에
// 			const existAdRadio = document.getElementById('inlineRadio1');
// 			existAdRadio.addEventListener('change', function() {
// 				if(this.checked) {
					
// 				}
// 			});
			
			const addrRadio1 = document.getElementById('inlineRadio1');
			const addrRadio2 = document.getElementById('inlineRadio2');
			
			addrRadio1.addEventListener('click', function() {
				const postBtn = document.getElementById('searchPostCode');
				const firstAddress = document.getElementById('firstAddress');
				const secondAddress = document.getElementById('secondAddress');
				
				const fullAddr = '${ loginUser.memberAddress }';
				const addrArray = fullAddr.split(" // ");
				
				postBtn.style.display = "none";
				firstAddress.value = addrArray[0];
				secondAddress.value = addrArray[1];
				secondAddress.readOnly = "readOnly";
				
			});
			
			addrRadio2.addEventListener('click', function() {
				const postBtn = document.getElementById('searchPostCode');
				const firstAddress = document.getElementById('firstAddress');
				const secondAddress = document.getElementById('secondAddress');
				
				postBtn.style.display = "";
				firstAddress.value = "";
				secondAddress.value = "";
			});
			
            
            
            //메인 주소
            document.getElementById('searchPostCode').addEventListener('click', function() {
            	new daum.Postcode({
            		oncomplete : function(data) {
            			console.log(data);
            			
            			const firstAddress = document.getElementById('firstAddress');
            			const buyerPostCode = document.getElementById('buyerPostCode');
            			firstAddress.value = data.address;
            			buyerPostCode.value = data.zonecode;
            		}
            	}).open();
            });
            
            //리워드 선택시 수량div show
            const rewardCb = document.getElementsByClassName('ch');
            for(const i of rewardCb) {
				i.addEventListener('change', function() {
					const idName = this.getAttribute('id');
					const index = idName.substr(idName.length-1, 1);
					console.log(index);
					
					const cp = document.getElementById('cpIndex' + index);
            		if(cp.style.display == "none") {
            			cp.style.display = "";
            		} else {
            			const rewardCount = document.getElementById('rewardCount' + index);
            			const ta = document.getElementById('ta');
            			
            			const totalPrice = document.getElementById('totalPrice' + index);
            			const tap = document.getElementById('tap');
            			
            			const realP = parseInt(((totalPrice.innerText).substring(0, totalPrice.innerText.length-1)).replaceAll(',',''));
            			const realTotalP = parseInt(((tap.innerText).substring(0, tap.innerText.length-1)).replaceAll(',',''));
            			
            			//총 수량부터
            			const substringTa = ta.innerText.substr(0, ta.innerText.length - 1);
            			const substringTa2 = substringTa.substr(5, substringTa.length);
            			const realC = parseInt(substringTa2);
            			
            			const calCount = realC - parseInt(rewardCount.value);
            			
            			const sp = document.getElementById('sp' + index);
            			const shippingPrice = document.getElementById('shippingPrice');
            			if(sp.value != "0") {
            				shippingPrice.innerText = "0원";
            			}
            			
            			
            			const finalPrice = document.getElementById('finalPrice');
            			const finalPriceVal = parseInt(((finalPrice.innerText).substring(0, finalPrice.innerText.length-1)).replaceAll(',',''));
            			
            			const rp = document.getElementById('rp' + index);
            			const rpVal = parseInt(rp.innerText.replaceAll(',',''));
            			const cancelPrice = rpVal * parseInt(rewardCount.value);
            			tap.innerText = (realTotalP - cancelPrice).toLocaleString() + "원";
            			
            			const renewSP = document.getElementById('shippingPrice');
            			const spVal = parseInt(((renewSP.innerText).substring(0, renewSP.innerText.length-1)).replaceAll(',',''));
            			
            			const renewTAP = document.getElementById('tap');
            			const tapVal = parseInt(((renewTAP.innerText).substring(0, renewTAP.innerText.length-1)).replaceAll(',',''));
            			
            			finalPrice.innerText = (spVal + tapVal).toLocaleString() + "원";
            			
            			ta.innerText = "수량 : " + calCount + "개";
            			rewardCount.value = 0;
            			totalPrice.innerText = "0원";
            			
            			cp.style.display = "none";
            		}
				});
            }
   
            
            //-, +버튼 수량
            
            const countBtns = document.getElementsByClassName('countBtn');
            
            for(const i of countBtns) {
            	i.addEventListener('click', function() {
            		const idName = this.getAttribute('id');
            		const index = idName.substr(idName.length - 1, 1);
            		const rewardCount = document.getElementById('rewardCount' + index);
           			const count = parseInt(rewardCount.value);
           			const rRemain = document.getElementById('getRemain' + index);
            		
            		if(this.id == "minusBtn" + index) {
            			if(count == 0) {
            				return false;
            			} else {
            				rewardCount.value = count - 1;
            			}
            		} else {
            			if(count == rRemain.value) {
            				return false;
            			} else {
            				rewardCount.value  = count + 1;
            			}
            		}
            		
            		const totalPrice = document.getElementById('totalPrice' + index);
        			const strPrice = document.getElementById('rp' + index).innerText;
        			
        			const price2 = parseInt(strPrice.replaceAll(',', ""));
        			
        			const calTotal = price2 * rewardCount.value;
        			
        			totalPrice.innerText = calTotal.toLocaleString() + "원";
        			
        			const tap = document.getElementById('tap');
        			const ta = document.getElementById('ta');
        			
        			let realP = 0;
        			let realC = 0;
        			let isShip = false;
        			shipToInt1 = 0;
        			
        			const totalPrices = document.getElementsByClassName('totalPrice');
        			const rwCounts = document.getElementsByClassName('rwCount');
        			const shipPrices = document.getElementsByClassName('sp');
        			const tship = document.getElementById('shippingPrice');
        			
        			for(let i=0 ; i<rwCounts.length ; i++) {
        				const sub = parseInt(((totalPrices[i].innerText).substring(0, totalPrices[i].innerText.length-1)).replaceAll(',',''));
        				realP += sub;
        				realC += parseInt(rwCounts[i].value);
        				
        				const shipToInt2 = parseInt((shipPrices[i].value).replaceAll(',',''));

        				if(rwCounts[i].value != 0 && shipToInt2 != 0 && isShip == false) {
        					isShip = true;
	        				shipToInt1 = shipToInt2;
        				} 
        			}
        			
        			if(isShip) {
	        			tship.innerText = "";
	        			tship.innerText = shipToInt1.toLocaleString() + "원";
        			} else {
	        			tship.innerText = "";
	        			tship.innerText =  "0원";
	        			isShip = false;
        			}
        			tap.innerText = realP.toLocaleString('ko-KR', { timeZone: 'UTC' }) + "원";
        			ta.innerText = "수량 : " + realC + "개";
        			
        			const finalPrice = document.getElementById('finalPrice');
        			finalPrice.innerText = (realP + shipToInt1).toLocaleString() + "원";
        			const totalAmount = document.getElementById('totalAmount');
        			totalAmount.value = realP + shipToInt1;
            	});
            }
            
            const payReservationBtn = document.getElementById('payReservation');
            const scheduleForm = document.getElementById('scheduleForm');
            
            payReservationBtn.addEventListener('click', function() {
            	
            	let inputsCheck = true;
            	
            	const exampleModalLabel = document.getElementById('exampleModalLabel');
            	
            	const totalAmount = document.getElementById('totalAmount');
            	if(totalAmount.value == 0) {
            		inputsCheck = false;
            		
            		exampleModalLabel.innerText = "최소 한개 이상의 리워드를 선택해주세요.";
            		$('#exampleModal').modal('show');
            		
            		return false;
            	}
            	
            	console.log("아웃1");
            	
            	const cardNumberInput = document.getElementsByClassName('cardNumberInput');
            	const regCard = /\d{4}/;
            	
            	for(const i of cardNumberInput) {
            		if(!regCard.test(i.value)) {
            			inputsCheck = false;
            			
            			exampleModalLabel.innerText = "카드번호 16자리를 정확히 입력해주세요.";
                		$('#exampleModal').modal('show');
                		
                		return false;
            		}
            	}
            	
            	console.log("아웃2");
            	
            	const cardDateInput = document.getElementsByClassName('cardDateInput');
            	const regCardDate = /\d{2}/;
            	
            	for(const i of cardDateInput) {
            		console.log(i.value)
            		if(!regCardDate.test(i.value)) {
            			inputsCheck = false;
            			
            			exampleModalLabel.innerText = "카드 유효기간을 정확히 입력해주세요.";
                		$('#exampleModal').modal('show');
                		
                		return false;
            			
            		}
            	}
            	
            	const cPwd = document.getElementById('cPwd');
            	const regCardPwd = /\d{2}/;
            	
            	if(!regCardPwd.test(cPwd.value)) {
            		inputsCheck = false;
        			
        			exampleModalLabel.innerText = "카드 비밀번호를 정확히 입력해주세요.";
            		$('#exampleModal').modal('show');
            		
            		return false;
            	}
            	
            	const cBD = document.getElementById('cBD');
            	const regBirth = /([0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1,2][0-9]|3[0,1]))/;
            	
            	if(!regBirth.test(cBD.value)) {
            			inputsCheck = false;
            			exampleModalLabel.innerText = "올바른 생년월일을 입력해주세요.";
                		$('#exampleModal').modal('show');
                		
                		return false;
            		
            	}
            	
            	const fAddr = document.getElementById('firstAddress');
            	const sAddr = document.getElementById('secondAddress');
            	
            	if(fAddr.value == "") {
            		inputsCheck = false;
            			exampleModalLabel.innerText = "주소를 선택해주세요.";
                		$('#exampleModal').modal('show');
                		
                		return false;
            	}else if(sAddr.value == "") {
            		inputsCheck = false;
            			exampleModalLabel.innerText = "상세주소를 기입해주세요.";
                		$('#exampleModal').modal('show');
                		
                		return false;
            		
            	}
            	
            	if(inputsCheck) {
            		scheduleForm.submit();
            	}
            });
           	
           	
           	
        }
        

    </script>
</body>
</html>