<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous"></script>
<link rel="stylesheet" href="resources/css/navbar.css">

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&display=swap"
	rel="stylesheet">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<!-- <link rel="stylesheet" href="resources/css/writeReview.css"> -->
<style type="text/css">
	.reviewMain{
    height: 100%;
    background-color: #343332;
    padding: 0;
    border-radius: 20px;
    
}

.reviewTextArea{
    border: 0;
    resize: none;
}

.reviewTextArea:focus{
    outline: none;
}

.reviewTop{
    background-color: #1a1e1f;
    height: 70px;
    font-family: 'Do Hyeon', sans-serif;
    font-size: 25px;
    text-align: center;
    padding-top: 20px;
    height: 100px;
}

.reviewContent{
    margin: 20px;
    
}

.imageArea{
    background-color: #1a1e1f;
    border-radius: 20px;
    margin-right: 20px;
}

.writeBtn{
    float: right;
    padding-left: 10px;
    padding-right: 10px;
    padding-top: 5px;
    padding-bottom: 5px;
    margin: 20px;
    border-radius: 10px;
    background-color: #8c86c7;
    font-family: 'Do Hyeon', sans-serif;
}

.buyList{
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 15px;
}

.imagePlusBtn{
    display: inline-block;
    float: right;
    background-color: #8c86c7;
    border-radius: 40px;
    padding: 10px;
    cursor: pointer;
}

.starpoint_wrap{display:inline-block;}
.starpoint_box{position:relative;background:url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 0 no-repeat;font-size:0;}
.starpoint_box .starpoint_bg{color:#8c86c7; display:block;position:absolute;top:0;left:0;height:18px;background:url(https://ido-archive.github.io/svc/etc/element/img/sp_star.png) 0 -20px no-repeat;pointer-events:none;}
.starpoint_box .label_star{display:inline-block;width:10px;height:18px;box-sizing:border-box;}
.starpoint_box .star_radio{opacity:0;width:0;height:0;position:absolute;}
.starpoint_box .star_radio:nth-of-type(1):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(1):checked ~ .starpoint_bg{width:10%;}
.starpoint_box .star_radio:nth-of-type(2):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(2):checked ~ .starpoint_bg{width:20%;}
.starpoint_box .star_radio:nth-of-type(3):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(3):checked ~ .starpoint_bg{width:30%;}
.starpoint_box .star_radio:nth-of-type(4):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(4):checked ~ .starpoint_bg{width:40%;}
.starpoint_box .star_radio:nth-of-type(5):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(5):checked ~ .starpoint_bg{width:50%;}
.starpoint_box .star_radio:nth-of-type(6):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(6):checked ~ .starpoint_bg{width:60%;}
.starpoint_box .star_radio:nth-of-type(7):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(7):checked ~ .starpoint_bg{width:70%;}
.starpoint_box .star_radio:nth-of-type(8):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(8):checked ~ .starpoint_bg{width:80%;}
.starpoint_box .star_radio:nth-of-type(9):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(9):checked ~ .starpoint_bg{width:90%;}
.starpoint_box .star_radio:nth-of-type(10):hover ~ .starpoint_bg,
.starpoint_box .star_radio:nth-of-type(10):checked ~ .starpoint_bg{width:100%;}

.blind{position:absolute;clip:rect(0 0 0 0);margin:-1px;width:1px;height: 1px;overflow:hidden;}
</style>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
</head>
<body>
	<form action="${ contextPath }/insertReview.me" id="insertReviewForm">
		<input type="hidden" value="${ creatorNum }" name="creatorNum">
		<div class="container">
	        <div class="row">
	            <div class="col-1"></div>
	            <div class="col-11 reviewMain">
	                <div class="reviewTop">${ fundingTitle }</div>
	                <div class="reviewContent">
	                	<c:set value="${ fn:split(buyList, '/') }" var="buyListArray"/>
	                    <h5 class="buyList">
	                    	<c:forEach items="${ buyListArray }" var="item">
	                    		${ item }<br>
	                    	</c:forEach>
	                    </h5>
	                          <textarea name="reviewContent" id="" class="reviewTextArea" cols="60" rows="10"></textarea>
	                          <br>
	                     <div class="starpoint_wrap">
  							<div class="starpoint_box">
							    <label for="starpoint_1" class="label_star" title="0.5"><span class="blind">0.5</span></label>
							    <label for="starpoint_2" class="label_star" title="1"><span class="blind">1</span></label>
							    <label for="starpoint_3" class="label_star" title="1.5"><span class="blind">1.5</span></label>
							    <label for="starpoint_4" class="label_star" title="2"><span class="blind">2</span></label>
							    <label for="starpoint_5" class="label_star" title="2.5"><span class="blind">2.5</span></label>
							    <label for="starpoint_6" class="label_star" title="3"><span class="blind">3</span></label>
							    <label for="starpoint_7" class="label_star" title="3.5"><span class="blind">3.5</span></label>
							    <label for="starpoint_8" class="label_star" title="4"><span class="blind">4</span></label>
							    <label for="starpoint_9" class="label_star" title="4.5"><span class="blind">4.5</span></label>
							    <label for="starpoint_10" class="label_star" title="5"><span class="blind">5</span></label>
							    <input type="radio" name="starpoint" id="starpoint_1" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_2" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_3" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_4" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_5" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_6" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_7" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_8" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_9" class="star_radio">
							    <input type="radio" name="starpoint" id="starpoint_10" class="star_radio">
							    <span class="starpoint_bg"></span>
  							</div>
						</div>
	                  
	                    <span class="writeBtn" id="writeBtn">작성</span>
	                    <input type="hidden" id="ratingResult" value="" name="reviewRating">
	                    <input type="hidden" value="${ fundingNum }" name="fundingNum">
	                </div>
	            </div>
	        </div>
	
	    </div>
	</form>
	<script type="text/javascript">
		
		
		const writeBtn = document.getElementById('writeBtn');
		const ratingResult = document.getElementById('ratingResult');
		const insertReviewForm = document.getElementById('insertReviewForm');
		writeBtn.addEventListener('click', function() {
			
			const star_radio = document.getElementsByClassName('star_radio');
			let rating = 5;
			let count = 1;
			for(const i of star_radio) {
				if(i.checked != true) {
					count++;
				} else {
					rating = (rating * count)/10;
					console.log(rating);
					ratingResult.value = rating;
					insertReviewForm.submit();
					break;
					
				}
			}
		});
	</script>
</body>
</html>