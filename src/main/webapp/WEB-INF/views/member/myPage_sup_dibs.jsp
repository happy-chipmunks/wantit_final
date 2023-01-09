<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
	<jsp:include page="../common/navbar.jsp"/>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 서포터(찜)</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Bootstrap v5.1.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

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
	<style>
		@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		} 
		
		 .table{font-family: 'NanumSquareNeo-Variable';}
		
		
		
		 .container{
			border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
		} 
		
		  div>ul>li{
			margin: auto;
			margin-left: 10px;
		    margin-right: 10px;
		    font-family: 'Do Hyeon', sans-serif;
		} 
		
		  h1{display: inline;}
		
		input, textarea{
			width: 550px;
		}
		
		textarea{
			height: 150px;
		}
		
		p{
			font-size: 15px;
		}
		
		.button{
			background-color: lightgray; width: 100px; height: 35px;
		}
		
		.button:hover{
			background-color: #666666;
			color: white;
			transition: background 0.7s ease-in-out;
		}
		
		ul{text-align: center; list-style: none;}
		.circle-img {

	    object-fit: cover;
	
	    object-position: top; 
	
	    border-radius: 50%;
	
	    width: 100px; 
	
	    height: 100px;

		}
		
		.li-item{
    border: 0;
    background-color: #343332;
    border-radius: 5px;
    border-bottom-left-radius: 5px;
    border-top-right-radius: 5px;
    margin: 10px;
    font-size: 14px;
    font-family: 'Noto Sans KR', sans-serif;
    padding: 10px;
    list-style: none;
    cursor: pointer;
}

.bigSizeFont{
    font-family: 'Do Hyeon', sans-serif;
    font-size: 40px;
}

.searchListCount{
    font-family: 'Noto Sans KR', sans-serif;
    font-size: 15px;
}

.cardDecoration{
    padding: 30px;
}

.cate, .fundName {
	font-family: 'Noto Sans KR', sans-serif;
    color: dimgrey;
  }

  .cate {
    border-right: 1px solid dimgrey;
    padding-right: 5px;
  }

  .card-text{
    font-family: 'Noto Sans KR', sans-serif;
  }

  .remainDate{
    text-align: end;
    padding-left: 25px;
    color: dimgrey;
    font-family: 'Noto Sans KR', sans-serif;
    float: right;
  }

  .alarmApl{
    font-family: 'Noto Sans KR', sans-serif;
    border: 1px solid #8c86c7;
    color: #8c86c7;
    width: 100%;
    font-size: 13px;
    padding-top: 3px;
    padding-bottom: 3px;
  }

  .remainOpenDate{
    text-align: end;
    padding-left: 20px;
    color: dimgrey;
  }

  .alarmApl:hover{
    border: 1px solid #8c86c7;
    color: white;
    background-color: #8c86c7;
  }

  .fontOnly{
    font-family: 'Noto Sans KR', sans-serif;
  }
  
   i{
    color: #8c86c7;
  }
  
  .alermWantExist{
  	width: 100%;
  	height: 200px;
  	text-align: center;
  	font-family: 'Do Hyeon', sans-serif;
  	font-size : 30px;
  	padding: 50px;
  }
  
  .alertMessage{
  	font-family: 'Do Hyeon', sans-serif;
    font-size: 40px;
    text-align: center;
    width: 600px;
    padding-left: 400px;
  }
  
  .page-link{
    font-family: 'Do Hyeon', sans-serif;
    font-size: 15px;
    color: dimgrey;
    border: 0;
    padding-left: 15px;
    padding-right: 15px;
}


.previous, .next{
    padding-left: 20px;
    padding-right: 20px;
}
    </style>

</head>
<body>
	
    <br><br><br>
    <div class="container">
    	<div>
    		<h1 style="display: inline;"><b>마이페이지</b></h1>&nbsp;&nbsp;&nbsp;
    		<button class="btn" onclick="openPopup()"><img src="${ contextPath }/resources/myPageImage/메시지.png" style="width: 40px; height: 40px;"></button>
    	</div>
    	<hr>
    	<div class="text-end">
          <button type="button" class="btn btn-secondary" style="background-color: #AD699B;" onclick="location.href='${contextPath}/myPageSupporter.me'">서포터</button>
          <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/myPageCreator.me'">크리에이터</button>
        </div>
       <br>
    </div>

	<div class="row">
		<div class="col-3" style="align-self;">
			<ul>
				<li style="width: 200px; margin: auto;">
				<c:if test="${image == null }">
				<img  id= "target_img" src="${ contextPath }/resources/myPageImage/뉴프로필.png" style="width: 150px; height: 150px;">
				</c:if>
				<c:if test="${image != null }">
    			<img  id="target_img" src="${contextPath}/resources/member/${ image }" style="width: 150px; height: 150px;" class="circle-img">
    			</c:if>
    			<br><br>
	   				<h4><b>${ loginUser.memberName }</b>님</h4>
	   				서포터<br>
	   				<button class="btn btn-sm" style="background-color: lightgray;">로그아웃</button>
	   				</p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporter.me'"><b>내 정보</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterWanting.me'"><b>원팅</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" style="background-color: #AD699B;" onclick="location.href='${contextPath}/myPageSupporterDibs.me'"><b>찜</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterAlarm.me'"><b>알림</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterPayList.me'"><b>구매이력</b></button></p>
   				</li>
			</ul>
   		</div>
   		<div class="col-8">
				   <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3" id="targetArea">
        <c:set var="today" value="<%=new java.util.Date() %>"></c:set>
        <fmt:formatDate value="${ today }" pattern="yyyy-MM-dd" var="fmtToday"/>
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
                        <span class="remainDate">${feFmtTime - nowFmtTime + 1 }일 남음</span>
                  </div>
                </div>
              </div>
        		</c:if>
        		<c:if test="${ fmtToday < fund.fundingStart }">
        			<!--  펀딩예정인 것만 -->
        			<div class="col cardDecoration">
                		<div class="card shadow-sm fundinglist">
                 			 <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"></svg>
      
                  			<div class="card-body">
                      			<p class="card-text">${ fund.fundingTitle }</p>
                      			<div style="padding-bottom: 10px;">
                          			<span class="cate">${ fund.fundingCate }</span>
                          			<span class="fundName">${ fund.creatorNickname }</span>
                      			</div>
                      			<fmt:formatDate value="${ fund.fundingStart }"  pattern="MM-dd(E)" var="openDate"/>
                      		<button type="button" class="btn alarmApl"><i class="bi bi-bell"></i>${ openDate } 오픈 알람신청</button>
                 	 </div>
                </div>
            </div>
        		</c:if>
        		
        	</c:forEach>
            
            
            
          </div>
				  
				  <br>
				  <nav aria-label="Standard pagination example" class="nav justify-content-center">
			        	<ul class="pagination">
				            <li class="page-item">
				            	<c:url var="goBack" value="${ loc }">
				            		<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
				            	</c:url>
				            	<a class="page-link" href="${ goBack }" aria-label="Previous">
				            		<span aria-hidden="true">&laquo;</span>
				              	</a>
				            </li>
				            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
				            	<c:url var="goNum" value="${ loc }">
				            		<c:param name="page" value="${ p }"></c:param>
				            	</c:url>
				            	<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
				            </c:forEach>
				            <li class="page-item">
				            	<c:url var="goNext" value="${ loc }">
				            		<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
				            	</c:url>
				            	<a class="page-link" href="${ goNext }" aria-label="Next">
				            		<span aria-hidden="true">&raquo;</span>
				            	</a>
				            </li>
				    	</ul>
			        </nav>
			</div>
    	<hr>
    </div>
    
    <br>
	
	

	<script>
	function openPopup(){
		window.open("myPage_sup_message.me", "message", "width=700 height=600");
	}
	
	var boards = document.getElementsByClassName('cardDecoration');
	for(var board of boards){
		board.addEventListener('click', function(){
			const bId = this.querySelector('.bId').value;
			console.log(bId);	// 선택한 펀딩 게시글 번호를 가지고 오는가
			const writerNo = this.querySelector('.writer').value;
			console.log(writerNo);	// 선택한 펀딩 게시글 작성자 번호를 가지고 오는가
			
			location.href='${contextPath}/selectFundingBoard.fund?bId=' + bId + '&writerNo=' + writerNo;
		});
	}
    		changeMoney();
    		changeProgressBar();
    		
    		function changeMoney() {
				const fundingProceedMoney = document.getElementsByClassName('fundingProceedMoney');
	    		for(const span of fundingProceedMoney) {
	    			const before = parseInt(span.innerText);
	    			span.innerText = " " + before.toLocaleString() + "원";
	    		}
			}
			
    		function changeProgressBar() {
	    		const progressBar = document.getElementsByClassName('progressBar');
	    		const progressBarPercent = document.getElementsByClassName('progressBarPercent');
	    		for(let i=0 ; i<progressBar.length ; i++) {
					const percent = parseInt(progressBarPercent[i].value.substring(0, progressBarPercent[i].value.length-1));
					if(percent >= 100) {
		    			progressBar[i].style.width = "100%";
					} else {
	    				progressBar[i].style.width = percent + "%";
					}
	    		}
    		}
	</script>

</body>
</html>