<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!Doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>Dashboard Template · Bootstrap v5.2</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script src="resources/css/summernote-bs4.min.js"></script>
<script src="resources/css/summernote-ko-KR.js"></script>

<style>
@font-face {
	font-family: 'NanumSquareNeo-Variable';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2')
		format('woff2');
	font-weight: normal;
	font-style: normal;
}

#body {
	font-family: 'NanumSquareNeo-Variable';
}

.titleArea {
	background-color: white;
	width: 100%;
	height: 15px;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
}

.textForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
}

.form-popup {
	background-color: lightgray;
	display: grid;
	margin: auto;
	margin-top: 50px;
	padding: 40px;
	align-items: center;
	justify-content: center;
	width: 100%;
}

.form-floating {
	margin-left: 30px;
}

.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.b-example-divider {
	height: 3rem;
	background-color: rgba(0, 0, 0, .1);
	border: solid rgba(0, 0, 0, .15);
	border-width: 1px 0;
	box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em
		rgba(0, 0, 0, .15);
}

.b-example-vr {
	flex-shrink: 0;
	width: 1.5rem;
	height: 100vh;
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

.joinInfo {
	background-color: white;
	width: 100%;
	height: 100px;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
}

#boxWrap {
	width: auto;
	height: auto;
}

#boxWrap : after {
	content: "";
	display: block;
	clear: both;
}

#boxWrap p+p {
	margin-left: 5px;
}

#boxWrap .original {
	float: left;
	width: 100px;
	height: 100px;
	background-color: #cbcbcb;
	text-align: center;
	line-height: 100px;
}

.btnWrap {
	width: 100%;
}

.right {
	margin-right: 400px;
	margin-left: 200px;
	line-height: 50px;
	text-align: center;
	border-radius: 20px;
	width: 150px;
}

.table {
	vertical-align: middle;
	text-align: center;
}

.find-btn {
	text-align: center;
}

.find-btn1 {
	display: inline-block;
}

.wiwidth {
	width: 400px;
}

.make {
	float: right;
	margin-right: 20px;
}

input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label {
	color: #f2f2f2;
}

input[type="checkbox"]+label span {
	display: inline-block;
	width: 19px;
	height: 19px;
	margin: -2px 10px 0 0;
	vertical-align: middle;
	background:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png)
		left top no-repeat;
	cursor: pointer;
}

input[type="checkbox"]:checked+label span {
	background:
		url(https://s3-us-west-2.amazonaws.com/s.cdpn.io/210284/check_radio_sheet.png)
		-19px top no-repeat;
}

.checkcheck {
	
}
</style>

<!-- CSS Files -->
<link rel="stylesheet" href="resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="resources/css/wantingMain.css" />
<link rel="stylesheet" href="resources/css/wantingWrite.css" />



</head>

<body id="body">

	<header>
		<jsp:include page="../common/navbar.jsp"></jsp:include>
	</header>

	<div class="container-fluid">
		<div class="row">
			<nav id="sidebarMenu"
				class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
				<div class="position" style="height: 1000px;">
					<ul class="nav flex-column">
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/admin.ad"> <span data-feather="home"
								class="align-text-bottom"></span> <br> <br> 사이트 관리
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/projectManage.ad"> <span
								data-feather="file" class="align-text-bottom"></span> <br>
								<br> 프로젝트 승인 / 거절
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/reviewManage.ad"> <span
								data-feather="shopping-cart" class="align-text-bottom"></span> <br>
								<br> 리뷰 신고 관리
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/noticeManage.ad"> <span
								data-feather="users" class="align-text-bottom"></span> <br>
								<br> 공지사항 관리
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/inquiryManage.ad"> <span
								data-feather="bar-chart-2" class="align-text-bottom"></span> <br>
								<br> 문의 관리
						</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/adManage.ad"> <span
								data-feather="layers" class="align-text-bottom"></span> <br>
								<br> 광고의뢰 관리
						</a>
						<li class="nav-item"><a class="nav-link"
							href="${ contextPath }/memberManage.ad"> <span
								data-feather="layers" class="align-text-bottom"></span> <br>
								<br> 회원 관리
						</a></li>
					</ul>
				</div>
			</nav>

			<main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
				<div class="shadow p-3 mb-5 bg-body rounded myMakeForm">
					<form action="${contextPath }/insertNotice.ad" method="post"
						class="answerForm" enctype="multipart/form-data" id="answerForm">
						<fieldset>
							<h1>
								<br>&nbsp;&nbsp;&nbsp;&nbsp;공지 / 이벤트 생성
							</h1>

							<div class="checkcheck">
								<br>
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="checkbox" id="c1" name="checkcheckcheck"
									onclick='checkOnlyOne(this)' value="E" /> <label for="c1"
									style="color: black;"><span></span>이벤트</label>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input type="checkbox" id="c2" name="checkcheckcheck"
									onclick='checkOnlyOne(this)' value="N" /> <label for="c2"
									style="color: black;"><span></span>공지사항</label> <br>
							</div>
							<br>
							
							<div class="textForm">
								<textarea name="titleArea" class="titleArea" placeholder="제목을 입력하세요."style="height: 28px;"></textarea>
							</div>
		

						
							<br>
							<br>
							<h4>&nbsp;&nbsp;&nbsp;&nbsp;썸네일 첨부</h4>
							<br> <input
								accept="image/JPG,image/JPEG,image/GIF,image/PNG"
								name="notice-file" type="file" id="notice-file"
								style="display: none"> <label for="notice-file"
								class="file-btn">등록하기</label> <span id="file-name">선택된
								파일없음</span> <br>

							<textarea id="summernote" name="noticeContent"></textarea>

							<br>

							<button type="button"
								class="btn makeNope btn-primary btn-lg right"
								style="float: right;" onclick="history.back()">취소</button>
							<button type="button"
								class="btn makeNotice btn-primary btn-lg right"
								style="display: inline-block; float: left;" id="btn-submit">생성</button>

							<input type="hidden" name="title" class="hiddenTitle" value="">
							<input type="hidden" name="check" class="hiddencheck" value="">


						</fieldset>
					</form>
				</div>
			</main>
		</div>
	</div>


	<script>
		function checkOnlyOne(element){
	        const checkboxes = document.getElementsByName("checkcheckcheck");
	        
	        checkboxes.forEach((cb) => {
	           cb.checked = false;
	        })
	        
	        element.checked = true;
	     }
		
		$('.makeNotice').click(function(){
			$(this).siblings('.hiddenTitle').val($(this).siblings()[3].querySelector('textarea').value);
			
	          const query = 'input[name="checkcheckcheck"]:checked';
	          const selectedEls = document.querySelector(query);


		        $(this).siblings('.hiddencheck').val(selectedEls.value);
		          console.log(selectedEls.value);
 				$(this).parent().parent('.answerForm').submit();

		});
	</script>


	<script>
		document.getElementById('notice-file').addEventListener('change', function(){
			var filename = document.getElementById('file-name');
			if(this.files[0] == undefined){
				filename.innerText = '선택된 파일없음';
				return;
			}
			filename.innerText = this.files[0].name;
		});
		
		
		// 써머노트
		$('#summernote').summernote({
			lang: "ko-KR",		// default: 'en-US'
			placeholder: '공지사항 내용 작성',
	        tabsize: 2,
	        height: 500,		// 에디터 높이
	        minHeight: null,	// 최소 높이	
	        maxHeight: null,	// 최대 높이
	        toolbar: [
	            // [groupName, [list of button]]
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

	        // 파일 업로드용 콜백 함수
			callbacks: {
				// 써머노트에서 지원하는 callback 함수 중 onImageUpload
				onImageUpload : function(files, editor, welEditable) {
					// 파일 업로드(다중 업로드를 위해 반복문 사용)
					for(var i = 0; i < files.length; i++) {
						sendFile(files[i], this);
						// this : summernote 들어간 textarea [object HTMLTextAreaElement]
					}
				}
			}
	     });
		
		function sendFile(file, el) {
			var form_data = new FormData();
	      	form_data.append('file', file);
	      	$.ajax({
	        	data: form_data,
	        	type: "POST",
	        	url: '${ contextPath }/summernoteImage.ad', // 호출 url
	        	cache: false,
	        	contentType: false,
	        	enctype: 'multipart/form-data',
	        	processData: false,
	        	success: function(img_name) {
	        		$(".spinner-border").css("display","none");
	        		
	        		console.log(img_name);
	        		
	        		
	          		$(el).summernote('editor.insertImage', "/notice-summernote/" + img_name);

	        		/*
	        		summernote content는 innerHTML로 불러오지 못한다
	        		const img = $('#summernote').sumemrnote('code', ${board.content});
	        		이렇게 summernote 내장함수로 불러와야 한다.
	        		*/
	        	}
	      	});
	    }
		
	</script>

</body>
</html>

