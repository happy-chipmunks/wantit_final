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
  <link rel="stylesheet" href="resources/css/fundingMain.css" />
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
<div class="container wanting-write">
	<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
		<ol class="breadcrumb">
		  <li class="breadcrumb-item"><a href="#">마이페이지</a></li>
		  <li class="breadcrumb-item active" aria-current="page">원팅등록</li>
		</ol>
	</nav>

	<h4 class="">원팅 등록하기</h4>
	<div class="wanting-title-detail">회원님의 원팅 프로젝트를 소개해주세요.</div>
	
	<h5 class="wanting-guide-title">원팅 제목</h5>
	<div class="wanting-guide-detail">회원님의 원팅 프로젝트를 소개해주세요.</div>
	<i class="icon-help" aria-hidden="true"></i>
	<input class="wanting-write-input" placeholder="제목을 입력해 주세요" maxlength="40" name="title" type="text" value="">

	<h5 class="wanting-guide-title">대표이미지</h5>
	<input accept="image/JPG,image/JPEG,image/GIF,image/PNG" name="uploadFile" placeholder="" type="file" id="wanting-file" style="display:none">
	<div class="wanting-guide-detail">
		원팅 맨 위에서 가장 먼저 보여 주고 싶은 영상이나 사진을 등록해주세요.
		<br>2MB 이하의 JPG, JPEG, GIF, PNG 파일이 등록됩니다. 여러 장 등록돼요.
	</div>
	<label for="wanting-file" class="file-btn">등록하기</label>
	<span id="file-name">선택된 파일없음</span>

	<h5 class="wanting-guide-title">가게 소개</h5>
	<div class="wanting-guide-detail">원팅 대상이 되는 가게 정보를 입력해주세요</div>
	<div class="wanting-shop">
		가게 이름<input class="wanting-write-input shop-input" placeholder="가게 이름을 입력해 주세요" maxlength="40" name="title" type="text" value="" id="wanting-input" height="10"><br>
		가게 주소<input class="wanting-write-input shop-input" placeholder="가게 주소를 입력해 주세요" maxlength="40" name="title" type="text" value="" id="wanting-input">
	</div>

	<h5 class="wanting-guide-title">원팅 스토리 작성</h5>
	<div class="wanting-guide-detail">회원님의 원팅 프로젝트를 소개해주세요.</div>
    <div id="summernote"></div>

	<button class="btn-wanting" data-bs-toggle="modal" data-bs-target="#wanting-modal">원팅 제출</button>

</div>

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
	document.getElementById('wanting-file').addEventListener('change', function(){
		var filename = document.getElementById('file-name');
		if(this.files[0] == undefined){
			filename.innerText = '선택된 파일없음';
			return;
		}
		filename.innerText = this.files[0].name;
	});
	
	$('#summernote').summernote({
		lang: "ko-KR", // default: 'en-US'
		placeholder: '<br><h5>안녕하세요. 스토리 작성을 시작한 회원님을 환영해요!</h5><br>여기에는 안내문구를 적을 예정이에요. 누가? 내가 나중에',
        tabsize: 2,
        height: 300,
        toolbar: [
          ['style', ['style']],
          ['font', ['bold', 'underline', 'clear']],
          ['color', ['color']],
          ['para', ['ul', 'ol', 'paragraph']],
          ['table', ['table']],
          ['insert', ['link', 'picture', 'video']],
          ['view', ['fullscreen', 'codeview', 'help']]
        ]
     });
	
	window.onload = function() {
		
	}
	
</script>
	
</body>
</html>