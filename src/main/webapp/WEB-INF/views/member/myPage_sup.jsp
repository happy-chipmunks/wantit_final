<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
	<jsp:include page="../common/navbar.jsp"/>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 서포터</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Bootstrap v5.1.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

	
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
		#color{
			background-color :9966FF;
			
		}
    </style>
</head>
<body>
     <br><br><br>
    <div class="container">
    	<div>
    		<h1 style="display: inline;"><b>마이페이지</b></h1>&nbsp;&nbsp;&nbsp;
    		<button class="btn" onclick="openPopup()">
    			<img src="${ contextPath }/resources/myPageImage/메시지.png" style="width: 40px; height: 40px;">
    		</button>
    		
    	</div>
    	<hr>
    	<div class="text-end">
          <button type="button" class="btn"   style="background-color: #AD699B;" onclick="location.href='${contextPath}/myPageSupporter.me'">서포터</button>
          <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/myPageCreator.me'">크리에이터</button>
        </div>
       
    </div>
	
	<div class="row" >
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
				<form action="${contextPath}/deletesupMemberImg.me">
				<input type="hidden" value="${ image }" name="filedelete">
				<button class="btn button">프로필 삭제</button>
				</form>
				<br>
				<form name="signform" method="POST" ENCTYPE="multipart/form-data" action="${contextPath}/insertMemberImg.me">
				    <input type="file" id="file" name="file" style="display:none;" onchange="changeValue(this)">
				    <input type="hidden" name = "target_url">
				    <input type="hidden" value=${ loginUser.memberId } name="memberId" >
				</form>
	   				<h4><b>${ loginUser.memberName }</b>님</h4>
	   				<p id="info">팔로워 0명<br>
	   				서포터<br>
	   				<button class="btn btn-sm" style="background-color: lightgray;" onclick="location.href='${ contextPath }/logout.me'">로그아웃</button>
	   				</p>
   				</li>
   				<li>
   					<p><button class="btn button" style="background-color: #AD699B; " onclick="location.href='${contextPath}/myPageSupporter.me'"><b>내 정보</b></button></p>
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
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterFollow.me'"><b>팔로우</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageSupporterPayList.me'"><b>구매이력</b></button></p>
   				</li>
			</ul>
   		</div>
   		
   		
   		<div class="col-8">
   			<form action="#">
			<table  style="text-align: center; align= center; height: 700px;"  class="table">
				<tr>
					<th>아이디</th>
					<td colspan="2">${ loginUser.memberId }</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="2">비공개</td>
				</tr>
				<tr>
					<th>이름</th>
					<td colspan="2">${ loginUser.memberName }</td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td colspan="2">${ loginUser.memberNickname }</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="2">${ loginUser.memberPhone }</td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="2">${ loginUser.memberEmail }</td>
				</tr>
				<tr>
					<th>주소</th>
					<c:set value="${ fn:split(loginUser.memberAddress, ' // ') }" var="addrArray"/>
					<td colspan="2">${ addrArray[0]} ${ addrArray[1]} ${ addrArray[2]} ${ addrArray[3]} 
						 ${ addrArray[4]} ${ addrArray[5]}  ${ addrArray[6]}</td>
					
				</tr>
				
				<tr>
					<th>개인정보
						<!-- <select class="form-select" style="width: 70%;">
							<option value="home">집</option>
							<option value="company">회사</option>
						</select> -->
					</th>
					<td>수령인 이름<br><br>
					${ loginUser.memberName }</td>
					<td style="width: 300px;">수령인 전화번호<br><br>
					${ loginUser.memberPhone }</td>
				</tr>
				<tr>
					<th>배송받을 주소</th>
					<c:set value="${ fn:split(loginUser.memberAddress, ' // ') }" var="addrArray"/>
					<td colspan="3">${ addrArray[0]} ${ addrArray[1]} ${ addrArray[2]} ${ addrArray[3]} 
						 ${ addrArray[4]} ${ addrArray[5]}  ${ addrArray[6]}</td>
				</tr>
				<tr>
					<td colspan="2">
					<td>
						<button class="btn btn-secondary btn-sm"  type="button" onclick="location.href='${contextPath}/updatemyinfo.me'">+수정하기</button>
						&emsp;
						<button class="btn btn-secondary btn-sm"  type="submit" id="deleteMember"  onclick="chcekUserId();">-탈퇴하기</button>
						
					</td>
				</tr>  <!-- onclick="location.href='${contextPath}/deleteMember.me'" -->
				
			</table>
			</form>
	    </div>
	    
    	<hr>
    </div>
    <br>
	
	
	 <script>
		function openPopup(){
			window.open("myPage_sup_message.me", "message", "width=700 height=600");
		}
		
		
		$('#target_img').click(function (e) {
		    document.signform.target_url.value = document.getElementById( 'target_img' ).src;
		    e.preventDefault();
		    $('#file').click();
		    
		});        
		function changeValue(obj){
		    document.signform.submit();
		}
		
		var dm = document.getElementById("deleteMember");
		function chcekUserId(){
			var checkdelete = confirm("정말 탈퇴하시겠습니까?(탈퇴하시면 복구가 불가합니다.)");
			if(checkdelete == true){
				$.ajax({
					type:"POST",
					url:"/wantit/deleteMember.me?",
					data: false,
					cache:false,
					success:function(data){
						location.href="http://localhost:8080/wantit/home.do"
					}
				});
						
			}else{
				return false;
			}
			
			
			
		}
		
		
		
		
	</script> 
	
	
	
</body>
</html>