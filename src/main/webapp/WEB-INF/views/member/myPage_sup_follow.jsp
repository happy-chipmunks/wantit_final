<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<jsp:include page="../common/navbar.jsp"/>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 서포터(팔로우)</title>
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
		
		
		.container{
			border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
		}
		
		div>ul>li{
			margin: auto;
		}
		
		h1{display: inline;}
		
		input, textarea{
			width: 550px;
		}
		
		.info{
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
		
		.button2:hover{
			background-color: #E0FFFF;
			transition: background 0.7s ease-in-out;
		}
		
		.switch {
		  position: relative;
		  display: inline-block;
		  width: 60px;
		  height: 34px;
		  vertical-align:middle;
		}
		
		.switch input {display:none;}
		
		.slider {
		  position: absolute;
		  cursor: pointer;
		  top: 0;
		  left: 0;
		  right: 0;
		  bottom: 0;
		  background-color: #ccc;
		  -webkit-transition: .4s;
		  transition: .4s;
		}
		
		.slider:before {
		  position: absolute;
		  content: "";
		  height: 26px;
		  width: 26px;
		  left: 4px;
		  bottom: 4px;
		  background-color: white;
		  -webkit-transition: .4s;
		  transition: .4s;
		}
		
		input:checked + .slider {
		  background-color: #2196F3;
		}
		
		input:focus + .slider {
		  box-shadow: 0 0 1px #2196F3;
		}
		
		input:checked + .slider:before {
		  -webkit-transform: translateX(26px);
		  -ms-transform: translateX(26px);
		  transform: translateX(26px);
		}
		
		.slider.round {
		  border-radius: 34px;
		}
		
		.slider.round:before {
		  border-radius: 50%;
		} 
		
		.follow, .follow2, .follow3, .follow4, .follow5, .follow6{
			margin:0px;
			display:inline-block;
			font-size:15px;
			font-weight:bold;
		} 
		
		ul{text-align: center; list-style: none;}
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
		
		.imageArea{
			width: 70px;
			height: 70px;
			border-radius: 35px;
			margin-top: 40px;
			background-color: blue;
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
	   				<p id="info">팔로워 0명<br>
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
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterDibs.me'"><b>찜</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterInquiry.me'"><b>문의</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterAlarm.me'"><b>알림</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" style="background-color: #AD699B;" onclick="location.href='${contextPath}/myPageSupporterFollow.me'"><b>팔로우</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterPayList.me'"><b>구매이력</b></button></p>
   				</li>
			</ul>
   		</div>
   	
   		<div class="col-8">
   				<c:forEach begin="0" end="${ followList.size() - 1 }" var="i">
    					<div style="height: 110px;">
					      <div class="row g-0 mb-3 h-75">
					        <div class="col-auto d-none d-lg-block">
					        	<div class="imageArea">
					        		<img alt="" src="${ contextPath }/resources/member/${ followerImageList[i].imageRename }">
					        	</div>
					        </div>
					        <div class="col p-4 d-flex flex-column position-static" style="text-align: left;">
					          <span style="margin-top: 35px;">${ followerNameList[i] }</span>
					          <div align="right" style="display: inline;">
					          	<label class="switch">
								  <input type="checkbox" id="check${ i }"  class="checkbox">
								  <input type="hidden" id="cn${ i }" value="${ followList[i].creatorNum }">
								  <span class="slider round"></span>
								</label>
								<p class="follow${ i }">팔로잉</p><p style="display:none;" class="follow${ i }">팔로우</p>
					          </div>
					        </div>
					      </div>
					     </div>
   				</c:forEach>
						</div>
    	<hr>
    </div>
    
    <br>
	
	

	<script>
		const checkbox = document.getElementsByClassName('checkbox');
		for(let i=0 ; i<checkbox.length ; i++) {
			checkbox[i].addEventListener('click', function() {
				const checkFollow = document.getElementsByClassName('follow' + i);
				const cn = document.getElementById('cn' + i).value;
				if(checkFollow[0].style.display == 'none') {
					$.ajax({
						url : '${ contextPath }/toggleFollow.me',
						data : {'creatorNum' : cn, 'action' : 'follow'},
						success : (data)=> {
							if(data.result == 'success') {
								$('.follow' + i).toggle();
							}
						},
						error : (data)=> {
							console.log(data);
						}
					});
				} else {
					$.ajax({
						url : '${ contextPath }/toggleFollow.me',
						data : {'creatorNum' : cn, 'action' : 'unFollow'},
						success : (data)=> {
							if(data.result == 'success') {
								$('.follow' + i).toggle();
							}
						},
						error : (data)=> {
							console.log(data);
						}
					});
				}
			});
		}
	
	
		var check = $("input:checkbox[id='check1']");
		check.click(function(){
			$(".follow").toggle();
		});
		
		var check = $("input:checkbox[id='check2']");
		check.click(function(){
			$(".follow2").toggle();
		});
		
		var check = $("input:checkbox[id='check3']");
		check.click(function(){
			$(".follow3").toggle();
		});
		
		var check = $("input:checkbox[id='check4']");
		check.click(function(){
			$(".follow4").toggle();
		});
		
		var check = $("input:checkbox[id='check5']");
		check.click(function(){
			$(".follow5").toggle();
		});
		
		var check = $("input:checkbox[id='check6']");
		check.click(function(){
			$(".follow6").toggle();
		});
		
		function openPopup(){
			window.open("myPage_sup_message.me", "message", "width=700 height=600");
		}
	</script>

</body>
</html>