<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>원팅 작성하기</title>

  <!-- CSS Files -->
  <link rel="stylesheet" href="resources/css/bootstrap.min.css" />
  <link rel="stylesheet" href="resources/css/wantingMain.css" />
  <link rel="stylesheet" href="resources/css/wantingWrite.css" />

  <!-- summer note -->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<!--   <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>  -->
  
  <link rel="stylesheet" href="resources/css/summernote-lite.min.css">
  <script src="resources/css/summernote-lite.min.js"></script>
  <script src="resources/css/summernote-ko-KR.js"></script>
  
</head>

<body>
<form class="" action="${ contextPath }/insertWanting.want" method="POST" enctype="multipart/form-data" id="wantingForm"> <!-- enctype : 이미지나 파일을 건낼 수 있음 -->
<div class="container wanting-write">
	<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
		<ol class="breadcrumb">
		  <li class="breadcrumb-item"><a href="#" onclick="location.href='${ contextPath }/myPageSupporter.me'">마이페이지</a></li>
		  <li class="breadcrumb-item active" aria-current="page">원팅등록</li>
		</ol>
	</nav>
		
		<input placeholder="" type="file"  name="wanting-file">
		<input placeholder="" type="file"  name="wanting-file">
		<br>그냥 파일 여러개 되는지 보려고 <br><br><br>
		
	
	
	<h4 class="">원팅 등록하기</h4>
	<div class="wanting-title-detail">회원님의 원팅 프로젝트를 소개해주세요.</div>
	
	<h5 class="wanting-guide-title">원팅 제목</h5>
	<div class="wanting-guide-detail">회원님의 원팅 프로젝트를 소개해주세요.</div>
	<i class="icon-help" aria-hidden="true"></i>
	<input class="wanting-write-input" placeholder="제목을 입력해 주세요" maxlength="40" name="wantingTitle" type="text" value="" name="wantingTitle">

	<h5 class="wanting-guide-title">대표이미지</h5>
	<input accept="image/JPG,image/JPEG,image/GIF,image/PNG" name="wanting-file" placeholder="" type="file" id="wanting-file" style="display:none">
	<div class="wanting-guide-detail">
		원팅 맨 위에서 가장 먼저 보여 주고 싶은 영상이나 사진을 등록해주세요.
		<br>2MB 이하의 JPG, JPEG, GIF, PNG 파일이 등록됩니다. 여러 장 등록돼요.
	</div>
	<label for="wanting-file" class="file-btn">등록하기</label>
	<span id="file-name">선택된 파일없음</span>

	<h5 class="wanting-guide-title">가게 소개</h5>
	<div class="wanting-guide-detail">원팅 대상이 되는 가게 정보를 입력해주세요</div>
	<div class="wanting-shop">
		가게 이름<input class="wanting-write-input shop-input" placeholder="가게 이름을 입력해 주세요" maxlength="40" name="wantingShopName" type="text" value="" id="wanting-input" height="10"><br>
		가게 주소<input class="wanting-write-input shop-input" placeholder="가게 주소를 입력해 주세요" maxlength="40" name="wantingShopLocation" type="text" value="" id="wanting-input">
	</div>

	<h5 class="wanting-guide-title">원팅 스토리 작성</h5>
	<div class="wanting-guide-detail">회원님의 원팅 프로젝트를 소개해주세요.</div>
<!--     <textarea id="summernote" name="wantingContent"></textarea> -->
	<textarea name="wantingContent" id="ckeditor"></textarea>

	<button class="btn-wanting" data-bs-toggle="modal" data-bs-target="#wanting-modal" id="btn-submit">원팅 제출</button>

</div>
</form>

	<!-- 펀딩하기 완료 -->
	<div class="modal fade" id="wanting-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content">
			<div class="modal-header">
			<h1 class="modal-title fs-5" id="exampleModalLabel"> </h1>
			<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
			<div class="container-fluid g-0">
				<div class="row g-0">
				<div class="col-md-5">
					<img class="thumbnail" src="https://images.immediate.co.uk/production/volatile/sites/30/2020/08/chorizo-mozarella-gnocchi-bake-cropped-9ab73a3.jpg?quality=90&resize=768,574"/>
				</div>
				<div class="col-md-7">
					<div class="modal-funding-right">
					<h5>원팅이 완료되었습니다 !</h5>
					<p class="modal-funding-title">[서울시 용답동] 나정순 할매 쭈꾸미 택배 전국 배송</p>
					<p class="modal-funding-store">업체이름(가게이름)</p>
					<div class="modal-funding-status">
						현재 <span class="modal-funding-goal">100</span>명 중 <span class="modal-funding-amount">45</span>명이 모였어요.
						원팅 달성 시 알림이 갑니다.
					</div>
					</div>
				</div>
				</div>
			</div>
			</div>
			<div class="modal-footer modal-funding-footer">
			<div class="container">
				<div class="row g-2">
				<div class="col-sm-4">
					<button type="button" class="modal-funding-btn">다른 원팅 둘러보기</button>
				</div>
				<div class="col-sm-4">
					<button type="button" class="modal-funding-btn">내 원팅 목록보기</button>
				</div>
				<div class="col-sm-4">
					<button type="button" class="modal-funding-btn" data-bs-dismiss="modal">닫기</button>
				</div>
				</div>
			</div>
			</div>
		</div>
		</div>
	</div>
	
	
<script>
	// 	파일 선택시 문구 변경
	document.getElementById('wanting-file').addEventListener('change', function(){
		var filename = document.getElementById('file-name');
		if(this.files[0] == undefined){
			filename.innerText = '선택된 파일없음';
			return;
		}
		filename.innerText = this.files[0].name;
	});
	
	// 	파일 선택시 사진 들어가기 - 안 씀
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
	        reader.onload = function (e) {
	                $('#cover').attr('src', e.target.result);   //cover src로 붙여지고
	                $('#fileName').val(input.files[0].name);    //파일선택 form으로 파일명이 들어온다
	            }
	          reader.readAsDataURL(input.files[0]);
	        }
	    }
	
		$("#myFileUp").change(function(){
	        readURL(this);
	});

</script>
		
<!-- 	ckeditor -->
	<script src="resources/ckeditor/ckeditor.js"></script>
		<script>CKEDITOR.replace("ckeditor", ckeditor_config)</script>
	
  <script> 
      var ckeditor_config = {
      resize_enaleb : false,
      enterMode : CKEDITOR.ENTER_BR,
      shiftEnterMode : CKEDITOR.ENTER_P,
      filebrowserUploadUrl : "이미지 업로드 처리를 하는 controller명"
      };
 </script>
	
	<script>
	// 	써머 노트
// 	$('#summernote').summernote('insertImage', url, filename);
	
// 	$('#summernote').summernote({
// 		lang: "ko-KR",		// default: 'en-US'
// 		placeholder: '<br><h5>안녕하세요. 스토리 작성을 시작한 회원님을 환영해요!</h5><br>여기에는 안내문구를 적을 예정이에요. 누가? 내가 나중에',
//         tabsize: 2,
//         height: 300,		// 에디터 높이
//         minHeight: null,	// 최소 높이	
//         maxHeight: null,	// 최대 높이
//         toolbar: [
//           ['style', ['style']],
//           ['font', ['bold', 'underline', 'clear']],
//           ['color', ['color']],
//           ['para', ['ul', 'ol', 'paragraph']],
//           ['table', ['table']],
//           ['insert', ['link', 'picture', 'video']],
//           ['view', ['fullscreen', 'codeview', 'help']]
//         ],
		
        // 파일 업로드용 콜백 함수
        // 콜백 함수 : 다른 함수에 매개변수로 넘겨준 함수. 매개변수로 넘겨받은 함수는 일단 받고 나중에 호출(콜백)한다
// 		callbacks: {
// 			// 써머노트에서 지원하는 callback 함수 중 onImageUpload
// 			onImageUpload : function(files, editor, welEditable) {
// 				// 파일 업로드(다중 업로드를 위해 반복문 사용)
// 				for(var i = 0; i < files.length; i++) {
// 					uploadSummernoteImageFile(files[i], this);
// 				}
// 			}
// 		}
//         callbacks: {	//여기 부분이 이미지를 첨부하는 부분
// 			onImageUpload : function(files) {
// 				uploadSummernoteImageFile(files[0],this);
// 			}
// 		}
        
        
//      });
	
	
	
// 	 // 장미 summetnote
//         function uploadSummernoteImageFile(file, editor){
//            data = new FormData();
//            data.append("file", file);
//            $.ajax({
//               data: data,
//               type: "POST",
//               url: "/uploadSummernoteImageFile",
//               contentType: false,
//               enctype: 'multipart/form-data',
//               processData: false,
//               success: function(data){
//                  // 항상 업로드된 파일의 url이 있어야 한다.
//                  $(editor).summernote('insertImage', data.url);
//               }
//            });
//         } 	

	function uploadSummernoteImageFile(file, editor) {
		var data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
			success : function(data) {
            	            //항상 업로드된 파일의 url이 있어야 한다.
            	            $(editor).summernote('insertImage', data.url);
            	                alert("Success");
			 }
			,error:function(request,status,error, data){
            	            alert("Error");
         	        }
		});
	}
	$(function() { 
		$("#commentForm").validate();
		$.extend( $.validator.messages, { 
			required: "필수 항목입니다."
		} ); 
	});


		
		
	
	
	// 	파일 전송 - 이거 왜 있는거지?
// 	const form = document.getElementById('wantingForm');
// 	document.getElementById('btn-submit').addEventListener('click', () => {
// 		form.submit();
// 		const files = document.getElementsByName('wanting-file');
// 		let isEmpty = true;
// 		for(const f of files) {
// 			if(f.value != '') {
// 				isEmpty = false;
// 			}
// 		}
// 		if(isEmpty) {
// 			$('#modalChoice').modal('show');
// 		} else {
// 			form.submit();
// 		}
// 	});

	
</script>


<!-- 빵빠레 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/js-confetti@0.8.0/dist/js-confetti.browser.js"></script>
<script>
	const jsConfetti = new JSConfetti()
	window.onload = function() {
		jsConfetti.addConfetti({
			confettiRadius: 8,
			confettiNumber: 600,
//  		confettiRadius: 3,
// 			confettiNumber: 60,
// 			emojis: ['김진환님', '멍청이', '바보', '바보'],
		});
	}
	function wowConfetti() {
		jsConfetti.addConfetti({
			confettiNumber: 600,
		});
	}
	document.querySelector('.btn-wanting').addEventListener('click', wowConfetti)
</script>


</body>
</html>