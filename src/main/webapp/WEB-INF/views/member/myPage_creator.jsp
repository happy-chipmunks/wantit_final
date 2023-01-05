<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
 	<jsp:include page="../common/navbar.jsp"/>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>마이페이지 크리에이터</title>
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
		
		 .col-8{font-family: 'NanumSquareNeo-Variable';}
		
		
		
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
		
		#insertCreator{
			background-color: #D1B2FF;
		}
		.circle-img {

	    object-fit: cover;
	
	    object-position: top; 
	
	    border-radius: 50%;
	
	    width: 100px; 
	
	    height: 100px;
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
          <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/myPageSupporter.me'">서포터</button>
          <button type="button" class="btn btn-secondary" onclick="location.href='${contextPath}/myPageCreator.me'">크리에이터</button>
        </div>
       
    </div>

	<div class="row">
		<div class="col-3" style="align-self;">
			<ul>

				<li  style="width: 200px; margin: auto;">
				<c:if test="${icmage == null }">
				<img  id= "target_img" src="${ contextPath }/resources/myPageImage/뉴프로필.png" style="width: 150px; height: 150px;">
				</c:if>
				<c:if test="${icmage != null }">
    			<img  id="target_img" src="${contextPath}/resources/member/${ icmage }" style="width: 150px; height: 150px;" class="circle-img">
    			</c:if>
				<br><br>
				<form action="${contextPath}/deletecreMemberImg.me">
				<input type="hidden" value="${ icmage }" name="cfiledelete">
				<button class="btn button">프로필 삭제</button>
				</form>
				<br><br>
					<form name="signform" method="POST" ENCTYPE="multipart/form-data" action="${contextPath}/insertcreatorMemberImg.me">
				    <input type="file" id="file" name="file" style="display:none;" onchange="changeValue(this)">
				    <input type="hidden" name = "target_url">
				    <input type="hidden" value=${ loginUser.memberId } name="memberId" >
					</form>
					
	   				<h4><b>${ loginUser.memberNickname }</b>님</h4>
	   				<p id="info">팔로워 0명<br>
	   				크리에이터<br>
	   				<button class="btn btn-sm" style="background-color: lightgray;" onclick="location.href='${ contextPath }/logout.me'">로그아웃</button>
	   				</p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageCreatorFunding.me'"><b>진행중인펀딩</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageCreatorFunding.me'"><b>오픈예정펀딩</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageCreatorAds.me'"><b>펀딩오픈신청</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageCreatorInquiry.me'"><b>관리자문의</b></button></p>
   				</li>
   				<li>
   					<p><button class="btn button" onclick="location.href='${contextPath}/myPageCreatorAds.me'"><b>광고 의뢰</b></button></p>
   				</li>
			</ul>
			<br><br>
			<br><br>
   		</div>
   		<div class="col-8">
   			<c:if test="${ !check }">
	   			<form action="${ contextPath }/creatorInsert.me" id="creatorInsertForm" enctype="multipart/form-data" method="POST">
		   			<div class="mt-5 pt-5" style="text-align: center;">
		   				<div id="insertBtn" class="mt-5 pt-5">
				   			<c:if test="${ creatorRegistration == null }">
				   				아직 크리에이터 등록을 하지 않으셨군요?<br><br>
				   				<button id="insertCreator" class="btn" type="button">크리에이터 등록하기</button><br>
				   			</c:if>
				   			<c:if test="${ creatorRegistration != null }">
				   				크리에이터 승인 대기 중입니다.
				   			</c:if>
		   				</div>
			   			<div id="hideDiv" style="display: none;">
			   				<div class="p-2 row">
			   					<label for="" class="col-sm-2 col-form-label">사업자 등록번호</label>
								<div class="col-sm-10">
									<input class="form-control" name="businessNumber" type="text" placeholder="ex) 000-00-00000" aria-label="default input example" required>
								</div>
							</div>
							<div class="p-2 row">
								<label for="" class="col-sm-2 col-form-label">사업자 등록증</label>
								<div class="col-sm-10">
									<input class="form-control" id="businessLicense" name="file" type="file" accept="image/*" placeholder="Default input" aria-label="default input example">
								</div>
							</div>
							<div class="p-2 row">
								<label for="" class="col-sm-2 col-form-label">사업자 구분</label>
								<div class="col-sm-10">
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="checkbox" value="N" checked onclick='checkOnlyOne(this)' name="check">
									  <label class="form-check-label" for="inlineCheckbox1">개인</label>
									</div>
									<div class="form-check form-check-inline">
									  <input class="form-check-input" type="checkbox" value="Y" onclick='checkOnlyOne(this)' name="check">
									  <label class="form-check-label" for="inlineCheckbox2">사업자</label>
									</div>
									<input type="hidden" id="type" value="" name="businessType">
								</div>
							</div>
							<hr>
							<div class="p-2 row">
								<label for="" class="col-sm-2 col-form-label">대표자 명</label>
								<div class="col-sm-10">
									<input class="form-control" name="managerName" type="text" aria-label="default input example">
								</div>
							</div>
							<div class="p-2 row">
								<label for="" class="col-sm-2 col-form-label">대표자 전화번호</label>
								<div class="col-sm-10">
									<input class="form-control" name="managerPhone" type="text" aria-label="default input example">
								</div>
							</div>
							<div class="p-2 row">
								<label for="" class="col-sm-2 col-form-label">대표자 이메일</label>
								<div class="col-sm-10">
									<input type="email" name="managerEmail" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
								</div>
							</div>
							<hr>
							<div class="p-2 row">
								<label for="" class="col-sm-2 col-form-label">크리에이터 명</label>
								<div class="col-sm-10">
									<input class="form-control" name="creatorName" type="text" aria-label="default input example">
								</div>
							</div><br>
							<button id="approvalRequest" class="btn btn-primary" onclick='submitBtn(event)'>승인 요청</button>
						</div>
		   			</div>
	   			</form>
   			</c:if>
   			<c:if test="${ check }">
				<table align="center" style="text-align: center; height: 100%;" class="table">
					<tr>
						<th>아이디</th>
						<td colspan="2">아이디</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td colspan="2"><button class="btn btn-outline-secondary btn-sm">변경하기</button></td>
					</tr>
					<tr>
						<th>이름</th>
						<td colspan="2">이름</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td colspan="2">닉네임</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td colspan="2">생년월일</td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td colspan="2">전화번호</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td colspan="2">이메일</td>
					</tr>
					<tr>
						<th>주소</th>
						<td colspan="2">주소</td>
					</tr>
					<tr>
						<td colspan="2">
						<td>
							<button class="btn btn-secondary btn-sm">수정하기</button>
							<button class="btn btn-secondary btn-sm">탈퇴하기</button>
						</td>
					</tr>
				</table>
			</c:if>
	    </div>
	    <hr>
    </div>
    
    
    
    <script>
    $('#target_img').click(function (e) {
	    document.signform.target_url.value = document.getElementById( 'target_img' ).src;
	    e.preventDefault();
	    $('#file').click();
	    
	});        
	function changeValue(obj){
	    document.signform.submit();
	}
	
	    function openPopup(){
			window.open("myPage_sup_message.jsp", "message", "width=500 height=300");
		}
	    
	    const fileInput = document.getElementById("businessLicense");
	    fileInput.onchange = () =>{
	    	const selectedFile = fileInput.files[0];
	    	console.log(selectedFile);
	    };
	    
	    $('#insertCreator').on('click', function(){
			const insertBtn = document.getElementById('insertBtn');
			const hideDiv = document.getElementById('hideDiv');
			
			insertBtn.style.display = "none";
			hideDiv.style.display = "";
	    });
	    
	    //submit
	    const form = document.getElementById('creator');
	    document.getElementById('approvalRequest').addEventListener('click', ()=>{
	    	// 체크박스 선택된 목록 가져오기
	    	const query = 'input[name="check"]:checked';
	    	const selectedEls = document.querySelectorAll(query);
	    	
	    	//선택된 목록에서 value 찾기
	    	let result = '';
	    	selectedEls.forEach((el) =>{
	    		result += el.value;
	    	});
	    	
	    	document.getElementById('type').setAttribute('value', result);
	    	
	    	const file = document.getElementById('businessLicense');
	    	if(file.value != ''){
	    		form.submit();
	    	}else{
	    		alert('사업자 등록증 이미지가 첨부되지 않았습니다.');
	    	}
	    });
	    
	    // 사업자 등록증 저장
		 const formSubmit = document.getElementByid('creatorInsertForm');
		 document.getElementById('approvalRequest').addEventListener('click', ()=>{
			 const files = document.getElementsByName('file');
			 let isEmpty = true;
			 for(const f of files){
				 if(f.value != ' '){
					 isEmpty = false;
				 }
			 }
			 
			 if(!isEmpty){
				 formSubmit.submit();
			 }
			
		 });
		 
		 // 개인/사업자 체크박스 하나만 선택되게 하기
		 function checkOnlyOne(element){
			 const checkboxes = document.getElementsByName("check");
			 
			 checkboxes.forEach((cb) => {
				 cb.checked = false;
			 })
			 
			 element.checked = true;
		 }
		 
		 
	  
    </script>
	
</body>
</html>