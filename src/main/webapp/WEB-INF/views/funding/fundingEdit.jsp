<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>펀딩 수정하기</title>
<!-- <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>-->
<!-- Bootstrap v5.1.3 -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 -->
   	<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
	<script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
  <script src="resources/css/summernote-bs4.min.js"></script>
  <script src="resources/css/summernote-ko-KR.js"></script>
  

	<style>
		@font-face {
		    font-family: 'NanumSquareNeo-Variable';
		    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
		    font-weight: normal;
		    font-style: normal;
		}
		
		#body{font-family: 'NanumSquareNeo-Variable';} 
		
		.div-style{
			text-align: center;
		}
		
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
		
		.fileRegiBtn{ display: inline; }
		
		.fundingH5{ display: inline; }
		
		.essential{ color: red; }
		
		.funding-style{ 
			border-radius: 7px 7px 7px 7px / 7px 7px 7px 7px;
			border: 1px solid #EAEAEA;
		 }
		
		#i-style{ font-size : 14px; }
		
		.h4{
			 background-color: #ffccff;
		}
		
    </style>

</head>
<body id="body">
	<header>
	    <jsp:include page="../common/navbar.jsp"></jsp:include>
	</header>
    <br><br>
    <div class="container div-style">
			<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
				<ol class="breadcrumb">
				  <li class="breadcrumb-item"><a href="${ contextPath }/myPage_creator.me" style="text-decoration: none; color: gray;">마이페이지</a></li>
				  <li class="breadcrumb-item active" aria-current="page">펀딩등록</li>
				</ol>
			</nav>
	</div>
	
    <div class="container">
    	<h1 id="planning"><b>프로젝트 기획</b></h1>
    	<div class="text-end">
          <button type="button" onclick="location.href='${contextPath}/fundingMain.fund'" class="btn btn-secondary">··· 미리보기</button>
        </div>
    </div>
	
	<div>
	<form action="${ contextPath }/fundingEditSend.fund" method="POST" enctype="multipart/form-data"  id="formImage">
		<input type="hidden" name="fundingNum"  value="${ f.fundingNum }">
			<div class="row">
				<div class="container col-6" style="text-align: center;"><br>
					<h4 class="pb-1 h4">펀딩 기본 정보</h4><br>
					
					<h5 class="fundingH5" style="display: inline;">펀딩 카테고리</h5>&nbsp;<span class="essential">*</span><br>
					<select name="category" style="width: 200px;" class="funding-style">
	   					<option>${ f.fundingCate }</option>
	   				</select>
					<br><br>
					
					<h5 class="fundingH5">펀딩 제목</h5>&nbsp;<span class="essential">*</span><br>
					<input readonly class="funding-style" value="${ f.fundingTitle }" maxlength="40"  name="fundingTitle" id="fundingTitle" type="text" style="width: 300px;">
					<br><br>
					
					<h5 class="fundingH5">펀딩 요약</h5>&nbsp;<span class="essential">*</span><br>
					<input readonly class="funding-style" value="${ f.fundingSummary }" maxlength="40" name="fundingSummary" type="text" style="width: 300px;">
					<br><br>
					
					<h5 class="fundingH5">펀딩 대표이미지</h5>
					<div class="selectCover" style="padding-left: 0;">
					 	<img id="cover" style="width: 200px; height: 200px;" src="${ contextPath }/resources/funding/${ i.imageRename }"/>
					</div>
					
					<br>
					<h4 class="pb-1 h4">펀딩 스토리</h4><br>
					<h5 class="fundingH5">펀딩 소개</h5>&nbsp;<span class="essential">*</span><br>
					<div>회원님의 펀딩 프로젝트를 소개해주세요.</div>
				    <div>
				    	<textarea id="summernote" name="fundingContent">${ f.fundingContent }</textarea>
				    </div><br>
				    
				    <h5 class="fundingH5">펀딩 목표금액</h5>&nbsp;<span class="essential">*</span><br>
					<input readonly class="funding-style" value="${ f.targetMoney }" maxlength="40" name="targetMoney" type="number" style="width: 300px;">
					<br><br>
					
					<h5 class="fundingH5">펀딩 종료일</h5>&nbsp;<span class="essential">*</span><br>
					<input readonly class="funding-style" maxlength="40" value="${ f.fundingEnd }" id="endDate" name="fundingEnd" type="date" style="width: 300px;">
					<br>
					
					<br>
					</div>
				</div>
			<div style="text-align: center;"><button class="btn btn-primary" id="editBtn">펀딩 수정</button></div><br><br>
	    </form>
			</div>
    	
	
	<script>
// 			$('#editBtn').on('click', function(){
// 				var fundingTitle $('#fundingTitle').val();
// 				var fundingContent = $('#summernote').val();
// 				var fundingNum = $('#fundingNum').val();
// 				console.log(fundingNum);
// 	 			console.log(fundingContent);
// 	 			console.log(fundingTitle);
// 	 			$('input[name=fundingTitle]').val(fundingTitle);
// 	 			$('input[name=fundingContent]').val(fundingContent);
// 	 			$('input[name=fundingNum]').val(fundingNum);
// 			})	;

// 		$('#editBtn').on('click', function(){
// 			var fundingTitle = $('#fundingTitle').val();
// 			var fundingContent = $('#summernote').val();
// 			var fundingNum = $('#fundingNum').val();
// 			console.log(fundingNum);
// 			console.log(fundingContent);
// 			console.log(fundingTitle);
// 			$.ajax({
// 				url: 'projectManage.ad',
// 				type: 'post',
// 				data: {fundingNum:fundingNum, fundingContent:fundingContent, fundingTitle:fundingTitle},
// 				success: function(data){
// 					console.log("데이터 전송 성공");
// 				},
// 				error: function(data){
// 					console.log("데이터 전송 실패");
// 				}
// 			});
// 		});
	
		 // summernote
		      $('#summernote').summernote({
		    	  lang: "ko-KR",
		    	  placeholder: '펀딩 프로젝트 내용을 작성해주세요.',
		        tabsize: 2,
		        height: 550,
		        toolbar: [
		        	['fontname', ['fontname']],
		            ['fontsize', ['fontsize']],
		            ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
		            ['color', ['forecolor','color']],
		            ['table', ['table']],
		            ['para', ['ul', 'ol', 'paragraph']],
		            ['height', ['height']],
		            ['insert',['picture']],
		            ['view', ['fullscreen', 'codeview' ,'help']]
		        ],
		        fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
		        fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		        callbacks: {
		        	onImageUpload : function(files, editor, welEditable){		// 이미지 첨부하는 부분
		        		for(var i = 0; i < files.length; i++){
		        			sendFile(files[i], this);
		        		}
		        	}
		        }
	     	 });
		 
	        function sendFile(file, el){
	        	var form_data = new FormData();
	        	form_data.append('file', file);
	        	$.ajax({
	        		data: form_data,
	        		type: "POST",
	        		url: '${contextPath}/uploadSummernoteImageFile.fund',
	        		cache: false,
	        		contentType: false,
	        		enctype: 'multipart/form-data',
	        		processData: false,
	        		success: function(img_name){
	        			$(".spinner-border").css("display","none");
	            		
	            		console.log(img_name);
	        			// 항상 업로드된 파일의 url이 있어야 한다.
	        			$(el).summernote('editor.insertImage', "/funding-summernote/" + img_name);
	        		}
	        	});
	        } 
	      
	</script>

</body>
</html>