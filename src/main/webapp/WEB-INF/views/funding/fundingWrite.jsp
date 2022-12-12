<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>펀딩 등록하기</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Bootstrap v5.1.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<style>
		@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
		*{font-family: 'NanumSquareNeo-Variable';}
		
		header{
			background: black;
		}
		
		.container{
			border-radius: 10px 10px 10px 10px / 10px 10px 10px 10px;
		}
		
		div>ul>li{
			margin: auto;
		}
		
		h1{display: inline;}
		
		.fileRegiBtn label {
			display: inline-block; 
			padding: .5em .75em; 
			color: #ffffff; 
			font-size: inherit; 
			line-height: normal; 
			vertical-align: middle; 
			background-color: #6495ED; 
			cursor: pointer; 
			border: 1px solid #ebebeb; 
			border-bottom-color: #e2e2e2; 
			border-radius: .25em;
		}
		
		.fileRegiBtn input[type="file"]{
			position: absolute; 
			width: 1px; 
			height: 1px; 
			padding: 0; 
			margin: -1px; 
			overflow: hidden; 
			clip:rect(0,0,0,0); 
			border: 0;
		}
		
		input, textarea{
			width: 550px;
		}
		
		textarea{
			height: 150px;
		}
		
    </style>

</head>
<body>
	<header class="p-3 text-bg-dark">
	    <div class="container" style="background: black;">
	      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
	        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-white text-decoration-none">
	          <svg class="bi me-2" width="40" height="32" role="img" aria-label="Bootstrap"><use xlink:href="#bootstrap"/></svg>
	        </a>
	
	        <ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
	         <!--  <li><a href="#" class="nav-link px-2 text-secondary">Home</a></li>
	          <li><a href="#" class="nav-link px-2 text-white">Features</a></li>
	          <li><a href="#" class="nav-link px-2 text-white">Pricing</a></li>
	          <li><a href="#" class="nav-link px-2 text-white">FAQs</a></li>
	          <li><a href="#" class="nav-link px-2 text-white">About</a></li> -->
	        </ul>
	
	        <form class="col-12 col-lg-auto mb-3 mb-lg-0 me-lg-3" role="search">
	          <input type="search" class="form-control form-control-dark text-bg-dark" placeholder="Search..." aria-label="Search">
	        </form>
	
	        <div class="text-end">
	          <button type="button" class="btn btn-outline-light me-2">Login</button>
	          <button type="button" class="btn btn-secondary">Sign-up</button>
	        </div>
	      </div>
	    </div>
	</header>
	<br>
	<div class="container" style="background: black;">
    	<ul class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0 mx-auto">
          <li><a href="#" class="nav-link px-2 text-white">진행중인 펀딩</a></li>
          <li><a href="#" class="nav-link px-2 text-white">오픈예정 펀딩</a></li>
          <li><a href="#" class="nav-link px-2 text-white">원팅</a></li>
          <li><a href="#" class="nav-link px-2 text-secondary">프로젝트 오픈 신청</a></li>
          <li><a href="#" class="nav-link px-2 text-white">관리자 문의</a></li>
        </ul>
    </div>
    <br><br><br>
    <div class="container">
    	<h1><b>프로젝트 기획</b></h1>
    	<div class="text-end">
          <button type="button" class="btn btn-secondary">··· 미리보기</button>
          <button type="button" class="btn btn-secondary">기획 중 - 0%</button>
        </div>
        <hr>
    </div>

	<form>
		<div class="container shadow" style="background-color: #F5F5F5;">
			<div class="container"><br>
		    	<table align="center">
		    		<tr>
		    			<td style="width: 300px;"><h5 class="shadow-sm" style="background-color: white;">프로젝트 기본 정보</h5></td>
		    			<td style="width: 600px;"></td>
		    		</tr>
		    		<tr>
		    			<td>*프로젝트 카테고리</td>
		    			<td>카테고리<br>
		    				<select style="border: none; width: 200px;" class="shadow-sm">
		    					<option>야옹</option>
		    				</select>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>*프로젝트 제목</td>
		    			<td>제목<br>
		    				<input type="text" style="border: none;" class="shadow-sm" required>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>*프로젝트 요약</td>
		    			<td>요약 내용<br>
		    				<textarea style="border: none; resize: none;" class="shadow-sm" required>
		    					
		    				</textarea>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>*프로젝트 대표 이미지</td>
		    			<td>
		    				<div class="selectCover" style="padding-left: 0;">
							 	<img id="cover" style="width: 200px; height: 200px;" src="resources/대체이미지.png"/>
							</div>
		    				
		    				<div class="form-group" style="margin: 8px 0 8px;">
								<input id="fileName" class="form-control" value="파일선택" disabled="disabled" style="width:50%; display: inline;">
										<div class="fileRegiBtn">
											<label for="myFileUp">파일등록하기</label>
											<input type="file" id="myFileUp">
										</div>
							</div>
					    </td>
		    		</tr>
		    	</table>
		    	<hr>
		    </div>
		    
		    <div class="container">
		    	<table align="center">
		    		<tr>
		    			<td style="width: 300px;"><h5 class="shadow-sm" style="background-color: white;">프로젝트 계획</h5></td>
		    			<td style="width: 550px; text-align: right;"><button class="btn btn-outline-info">★ 작성 가이드</button></td>
		    		</tr>
		    		<tr>
		    			<td>*프로젝트 소개</td>
		    			<td>소개<br>
		    				<input type="text" style="border: none;" class="shadow-sm" placeholder="Q.무엇을 만들기 위한 프로젝트인가요?" required>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>*프로젝트 예산</td>
		    			<td>예산<br>
		    				<input type="text" style="border: none;" class="shadow-sm" placeholder="Q.목표 금액은 아래의 지출 항목으로..." required>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>*프로젝트 일정</td>
		    			<td>일정<br>
		    				<input type="text" style="border: none;" class="shadow-sm" placeholder="작업 일정을 구체적인 날짜와 함께 작성" required>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>*프로젝트 설명</td>
		    			<td>설명<br>
		    				<textarea style="border: none; resize: none;" class="shadow-sm" required>
		    					
		    				</textarea>
					    </td>
		    		</tr>
		    	</table>
		    	<hr>
		    </div>
		    
		    <div class="container">
		    	<table align="center">
		    		<tr>
		    			<td style="width: 300px;"><h5 class="shadow-sm" style="background-color: white;">선물 구성</h5></td>
		    			<td style="width: 550px; text-align: right;"><button class="btn btn-outline-info">★ 작성 가이드</button></td>
		    		</tr>
		    		<tr>
		    			<td>*선물 만들기</td>
		    			<td>
		    				<table style="background-color: #F5F5F5; width: 550px;" class="table table-borderless">
		    					<tr>
		    						<td>
		    							선물 아이템(선택)<br>
		    							<input type="text" style="border: none;" class="shadow-sm">
		    						</td>
		    					</tr>
		    					<tr>
		    						<td>
		    							선물 설명(선택)<br>
		    							<input type="text" style="border: none;" class="shadow-sm">
		    						</td>
		    					</tr>
		    					<tr>
		    						<td>
		    							*수량 제한<br>
		    							<div class="form-check form-check-inline" style="background-color: #F5F5F5; width: 100px;">
										  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
										  <label class="form-check-label" for="inlineRadio1">있음</label>
										</div>
										<div class="form-check form-check-inline" style="background-color: #F5F5F5; width: 100px;">
										  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
										  <label class="form-check-label" for="inlineRadio2">없음</label>
										</div>
		    						</td>
		    					</tr>
		    					<tr>
		    						<td>
		    							예상 전단일<br>
		    							<input type="date" style="border: none;" class="shadow-sm">
		    						</td>
		    					</tr>
		    					<tr>
		    						<td>
		    							최소 후원 금액<br>
		    							<input type="number" style="border: none;" class="shadow-sm">
		    						</td>
		    					</tr>
		    				</table>
		    			</td>
		    		</tr>
		    	</table>
		    	<hr>
		    </div>
		    
		    <div class="container">
		    	<table align="center">
		    		<tr>
		    			<td style="width: 300px;"><h5 class="shadow-sm" style="background-color: white;">창작자 정보</h5></td>
		    			<td style="width: 550px; text-align: right;"><button class="btn btn-outline-info">★ 작성 가이드</button></td>
		    		</tr>
		    		<tr>
		    			<td>*창작자 이름</td>
		    			<td>이름<br>
		    				<input type="text" style="border: none;" class="shadow-sm" required>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>*창작자 소개</td>
		    			<td>소개<br>
		    				<textarea style="border: none; resize: none;" class="shadow-sm">
		    					
		    				</textarea>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>*본인 인증</td>
		    			<td>
		    				<input type="text" style="border: none; width: 460px;" class="shadow-sm">
		    				<button type="button" class="btn btn-outline-secondary btn-sm"><img src="resources/메시지.png" style="width: 10px; height: 10px; display: inline;"> 인증하기</button>
		    			</td>
		    		</tr>
		    		<tr>
		    			<td>*입금 계좌</td>
		    			<td>
		    				<input type="text" style="border: none; width: 460px;" class="shadow-sm">
		    				<button type="button" class="btn btn-outline-secondary btn-sm"><img src="resources/자물쇠.png" style="width: 10px; height: 10px; display: inline;"> 계좌입력</button>
					    </td>
		    		</tr>
		    	</table>
		    	<hr>
		    </div>
			
			<div class="container" align="center">
				<button type="submit" class="btn btn-primary">작성하기</button>
			</div>
			<br>
		</div>
	</form>
    <br>
	
	

	<script>
		function readURL(input) {
	        if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	                $('#cover').attr('src', e.target.result);        //cover src로 붙여지고
	                $('#fileName').val(input.files[0].name);    //파일선택 form으로 파일명이 들어온다
	            }
	          reader.readAsDataURL(input.files[0]);
	        }
	    }
	
		$("#myFileUp").change(function(){
	        readURL(this);
	    });
	</script>

</body>
</html>