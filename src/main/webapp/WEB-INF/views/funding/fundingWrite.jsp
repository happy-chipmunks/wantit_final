<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>펀딩 등록하기</title>
<!-- <script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>-->
<!-- Bootstrap v5.1.3 -->
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 -->
   	<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
	<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <link rel="stylesheet" href="resources/css/summernote-lite.min.css">
  <script src="resources/css/summernote-lite.min.js"></script>
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
		
		.funding-style{ border-radius: 7px 7px 7px 7px / 7px 7px 7px 7px; }
		
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
          <button type="button" class="btn btn-secondary">··· 미리보기</button>
          <button type="button" class="btn btn-secondary">기획 중 - 0%</button>
        </div>
    </div>
	
	<form action="${ contextPath }/insertFunding.fund" method="POST" enctype="multipart/form-data">
		<div class="row">
			<div class="container col-6" style="text-align: center;">
				<h4 class="pb-1 h4">펀딩 기본 정보</h4><br>
				
				<h5 class="fundingH5" style="display: inline;">펀딩 카테고리</h5>&nbsp;<span class="essential">*</span><br>
				<select name="category" style="border: none; width: 200px;" class="funding-style shadow-sm">
   					<option>테크·가전</option>
   					<option>패션·잡화</option>
   					<option>뷰티</option>
   					<option>음식</option>
   					<option>홈·리빙</option>
   					<option>여행·레저</option>
   					<option>스포츠</option>
   					<option>캐릭터·굿즈</option>
   				</select>
				<br><br>
				
				<h5 class="fundingH5">펀딩 제목</h5>&nbsp;<span class="essential">*</span><br>
				<input class="funding-style shadow-sm" placeholder="제목을 입력해 주세요" maxlength="40" name="title" type="text" style="border: none; width: 300px;">
				<br><br>
				
				<h5 class="fundingH5">펀딩 요약</h5>&nbsp;<span class="essential">*</span><br>
				<input class="funding-style shadow-sm" placeholder="펀딩을 간단히 요약해 주세요" maxlength="40" name="summary" type="text" style="border: none; width: 300px;">
				<br><br>
				
				<h5 class="fundingH5">펀딩 대표이미지</h5>
				<div class="selectCover" style="padding-left: 0;">
				 	<img id="cover" style="width: 200px; height: 200px;" src="${ contextPath }/resources/myPageImage/대체이미지.png"/>
				</div>
	  				
	  				<div class="form-group" style="margin: 8px 0 8px;">
					<input id="fileName" class="form-control" value="파일선택" disabled="disabled" style="width:40%; display: inline;">
							<div class="fileRegiBtn">
								<label for="myFileUp">파일등록하기</label>
								<input type="file" id="myFileUp" name="representative-image">
							</div>
				</div>
				
				<br>
				<h4 class="pb-1 h4">펀딩 스토리</h4><br>
				<h5 class="fundingH5">펀딩 소개</h5>&nbsp;<span class="essential">*</span><br>
				<div>회원님의 펀딩 프로젝트를 소개해주세요.</div>
			    <div>
			    	<textarea id="summernote" name="fundingContent"></textarea>
			    </div><br>
			    
			    <h5 class="fundingH5">펀딩 목표금액</h5>&nbsp;<span class="essential">*</span><br>
				<input class="funding-style shadow-sm" maxlength="40" name="targetAmount" type="number" style="border: none; width: 300px;">
				<br><br>
				
				<h5 class="fundingH5">펀딩 최소 후원 금액</h5>&nbsp;<br>
				<i style="color: gray;" id="i-style">기본 최소 후원 금액은 1,000원 입니다.</i><br>
				<input class="funding-style shadow-sm" maxlength="40" min="1000" step="10" name="minimumAmount" list="amountList" type="number" style="border: none; width: 300px;">
				<br><br>
				
				<datalist id="amountList">
					<option>1000</option>
					<option>5000</option>
					<option>10000</option>
					<option>50000</option>
					<option>100000</option>
				</datalist>
				
				<h5 class="fundingH5">펀딩 종료일</h5>&nbsp;<span class="essential">*</span><br>
				<input class="funding-style shadow-sm" maxlength="40" id="endDate" name="endDate" type="date" style="border: none; width: 300px;">
				<br>
				
				<br>
				<h4 class="pb-1 h4">펀딩 리워드 구성</h4><br>
				<button id="addReward" class="btn btn-outline-primary" onclick="$('#rewardAdd').modal('show')">리워드 추가</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<button id="delReward" class="btn btn-outline-secondary" onclick="delRow()">선택한 리워드 삭제</button>
				<!-- <input type='button' id='delBtn' value='삭제' onclick='deleteRow(this)' style='width:70px;'> -->
				<br>
				
				<table id="rewardTable" class="table" style="display: none;">
					<tr>
						<th style="width: 70px;"></th>
						<th>리워드 아이템</th>
						<th>리워드 설명</th>
						<th>수량 제한</th>
						<th>발송 시작일</th>
						<th>금액</th>
						<th>배송비</th>
					</tr>
				</table>
				
				<!-- 리워드 추가 모달 -->
				<div class="modal fade" id="rewardAdd" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
				  <div class="modal-dialog modal-dialog-centered">
					<div class="modal-content">
					  	<div class="modal-header">
					        <h1 class="modal-title fs-5" id="exampleModalToggleLabel2">REWARD ADD</h1>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					    </div>
					 	<div class="modal-body" style="text-align: left">
						    	리워드 아이템<input type="text" class="form-control input" id="reward-name" name="rewardName">
						    	리워드 설명<input class="form-control input" style="height: 100px" id="reward-content" name="rewardContent">
						      	수량 제한<input type="number" class="form-control input" id="reward-quantity" name="rewardQuantity">
						      	발송 시작일<input type="date" class="form-control input" id="reward-shipmentDate" name="rewardShipmentDate">
						      	금액<input type="number" class="form-control input" id="reward-donationPrice" name="rewardDonationPrice">
						      	배송비<input type="number" class="form-control input" id="reward-deliveryCharge" name="rewardDeliveryCharge">
						 </div>
						 <div class="modal-footer">
							<button type="button" class="btn btn-primary" id="sendBtn">보내기</button>
					      	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
						 </div>
			    	</div> 
				  </div>
				</div>
				
				<br><br>
				
				<button class="btn btn-primary" type="submit" id="insertBtn">펀딩 제출</button>
			
			</div>
		</div>
    <br>
    </form>
	
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
		
		
		// 리워드 추가
		$(document).ready(function(){
			$('#sendBtn').click(function(){
				$('#rewardTable').show();
				var title = $('#rewardAdd').find('input[name="rewardName"]').val();
				var content = $('#rewardAdd').find('input[name="rewardContent"]').val();
				var quantity = $('#rewardAdd').find('input[name="rewardQuantity"]').val();
				var postingDate = $('#rewardAdd').find('input[name="rewardPostingDate"]').val();
				var donationPrice = $('#rewardAdd').find('input[name="rewardDonationPrice"]').val();
				var deliveryCharge = $('#rewardDeliveryCharge').find('input[name="rewardDeliveryCharge"]').val();
				$('#rewardTable').append("<tr><td><input type='checkbox' name='checkBox'></td><td>" + title + "</td><td>" + content + "</td><td>" + quantity + "</td><td>" + postingDate + "</td><td>" + donationPrice + "</td><td>" + deliveryCharge + "</td>");
				$('#rewardAdd').modal('hide');
			});
		});
		
		 // 리워드 삭제
		 function delRow(){
			var checkRows = $("[name='checkBox']:checked");
			for(var i = checkRows.length-1; i > -1; i--){
				checkRows.eq(i).closest('tr').remove();
			}
		}
	 	
		 // summernote
	      $('#summernote').summernote({
	        tabsize: 2,
	        height: 500,
	        toolbar: [
	          ['style', ['style']],
	          ['font', ['bold', 'underline', 'clear']],
	          ['color', ['color']],
	          ['para', ['ul', 'ol', 'paragraph']],
	          ['table', ['table']],
	          ['insert', ['link', 'picture', 'video']],
	          ['view', ['fullscreen', 'codeview', 'help']]
	        ],
	        callbacks: {
	        	onImageUpload : function(files, editor, welEditable){
	        		// 파일 업로드(다중 업로드를 위해 반복문 사용)
	        		for(var i = files.length - 1; i >= 0; i--){
	        			uploadSummernoteImageFile(files[i], this);
	        		}
	        	}
	        };
	        
	        function uploadSummernoteImageFile(file, el){
	        	data = new FormData();
	        	data.append("file", file);
	        	$.ajax({
	        		data: data,
	        		type: "POST",
	        		url: "uploadSummernoteImageFile",
	        		contentType: false,
	        		enctype: 'multipart/form-data',
	        		processData: false,
	        		success: function(data){
	        			$(el).summernote('editor.insertImage', data.url);
	        		}
	        	});
	        }
	      
	      // 오늘 날짜 가져오기 (펀딩 종료일 설정)
    	  var now_utc = Date.now();
	      var timeOff = new Date().getTimezoneOffset()*60000;
	      var today = new Date(now_utc-timeOff).toISOString().split("T")[0];
	      
	      document.getElementById('endDate').setAttribute("min", today);
	      console.log(today);
	      
	      // 발송 시작일 (펀딩 종료일보다 뒷 날로 고를 수 있어야 함)
	      $('#endDate').change(function(){
	    	  var end = $('#endDate').val();
	    	  
	    	  $('#reward-shipmentDate').attr("min", end);
	      });
	      
	      // table tr값 넘기기
	      $(function(){
	    	  $('#insertBtn').click(function(){
	    		  var dataArrayToSend = [];
	    		  var dataArrayToSend1 = [];
	    		  
	    		  $('#rewardTable tr').each(function(){
	    			  var length = $(this).find('td').length;
	    			  
	    			  for(var i = 0; i < length; i++){
	    				  dataArrayToSend.push($(this).find('td').eq(i).text());
	    			  }
	    			  dataArrayToSend1.push(dataArrayToSend);
	    		  });
	    		  
	    		  $.ajax({
	    			  url: 'insertFunding.fund',
	    			  data: JSON.stringify(dataArrayToSend1),
	    			  success: (data)=>{
	    				  console.log(data);
	    			  },
	    			  error: (data)=>{
	    				console.log(data);
	    			  }
	    		  });
	    	  });
	      });
	      
	</script>

</body>
</html>