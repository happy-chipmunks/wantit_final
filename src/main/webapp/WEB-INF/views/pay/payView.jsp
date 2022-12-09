<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>

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
</style>
</head>
<style>
 

</style>
<body>
    <div class="container payMainView">
        <div class="row tSection">
            <p class="srTitle">펀딩 결제</p>
        </div>
        <div class="row">
            <div class="col-4 selectReward">
                <p class="crT">리워드 선택</p>
                <div class="rList">
                    <div>
                        <div class="">
                            <input type="checkbox" class="ch" id="ch1"><label for="ch1"></label>
                            
                            <label for="ch1" class="price">279,000원</label>
                            <label for="ch1" class="labelClickPlace">
                                <p class="rwName">무쇠고기불판 + 구이바다 세트</p>
                                <span class="rwLimit">제한수량 300개</span>
                                <span class="rwRemain">215개 남음</span>
                                <p class="rwContent">무쇠고기 불판 단품 + 기름받이</p>
                                <p class="rwOther">배송비 3,000원 | 2023년 01월 초 (1~10일) 리워드 제공 예정</p>
                                <div class="cp">
                                    <button type="button" class="countBtn">-</button>
                                    <input type="text" value="1" class="rwCount">
                                    <button type="button" class="countBtn">+</button>
                                    
                                    <span class="totalPrice">98,000원</span>

                                </div>

                            </label>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <div class="">
                            <input type="checkbox" class="ch" id="ch2"><label for="ch2"></label>
                            
                            <label for="ch2" class="price">279,000원</label>
                            <label for="ch2" class="labelClickPlace">
                                <p class="rwName">무쇠고기불판 + 구이바다 세트</p>
                                <span class="rwLimit">제한수량 300개</span>
                                <span class="rwRemain">215개 남음</span>
                                <p class="rwContent">무쇠고기 불판 단품 + 기름받이</p>
                                <p class="rwOther">배송비 3,000원 | 2023년 01월 초 (1~10일) 리워드 제공 예정</p>
                                

                                <div class="cp">
                                    <button type="button" class="countBtn">-</button>
                                    <input type="text" value="1" class="rwCount">
                                    <button type="button" class="countBtn">+</button>
                                    
                                    <span class="totalPrice">98,000원</span>

                                </div>
                            </label>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <div class="">
                            <input type="checkbox" class="ch" id="ch3"><label for="ch3"></label>
                            
                            <label for="ch3" class="price">279,000원</label>
                            <label for="ch3" class="labelClickPlace">
                                <p class="rwName">무쇠고기불판 + 구이바다 세트</p>
                                <span class="rwLimit">제한수량 300개</span>
                                <span class="rwRemain">215개 남음</span>
                                <p class="rwContent">무쇠고기 불판 단품 + 기름받이</p>
                                <p class="rwOther">배송비 3,000원 | 2023년 01월 초 (1~10일) 리워드 제공 예정</p>
                                <div class="cp">
                                    <button type="button" class="countBtn">-</button>
                                    <input type="text" value="1" class="rwCount">
                                    <button type="button" class="countBtn">+</button>
                                    
                                    <span class="totalPrice">98,000원</span>

                                </div>
                            </label>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-8 payAndPost">
                <p class="crT">결제예약/배송지</p>
                <div class="row">
                    <div class="col-6 payArea">
                        <p class="rwName">무쇠 고기 불판 단품 + 전용 가방세트</p>
                        <p class="rwContent">무쇠고기 불판 단품 + 기름받이</p>
                        <br>
                        <span class="totalPrice" style="padding-left: 30px;">98,000원</span>
                        <span class="totalPrice">수량 : 1개</span>
                        <br>
                        <hr>
                        <span class="onlyFont">배송비</span>
                        <span class="onlyFont" style="float: right;">3,000원</span>
                        <hr style="border-style: dashed;">
                        <span class="onlyFont">총액</span>
                        <span class="onlyFont" style="float: right;">101,000원</span>
                        <br>
                        <hr style="border: 2px solid;">

                        <p class="payInfo">결제 정보</p>

                    </div>
                    <div class="col-6 infoArea">
                        <p class="payInfo">구매자 정보</p>
                        <span class="onlyFont">이름</span>
                        <span class="onlyFont" style="float: right;">홍길동</span>
                        <br><br>
                        <span class="onlyFont">휴대폰 번호</span>
                        <span class="onlyFont" style="float: right;">01012349876</span>
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
                            <button type="button" class="btn selectAddress">우편번호 검색</button>
                            <br><br>
                            <input type="text" readonly class="address1">
                            <input type="text" class="address2" placeholder="상세주소">
                        </span>
                        <hr>
                        <p class="onlyFont">배송 시 요청사항(선택)</p>
                        <input type="text" class="deliveryRequire" placeholder="ex)부재 시 경비실에 보관해주세요.">


                    </div>
                </div>
            </div>
            
        </div>

    </div>
      
</body>
</html>