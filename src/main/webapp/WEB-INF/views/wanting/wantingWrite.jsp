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
  <link rel="stylesheet" href="resources/css/bootstrap-custom.css" />
  <link rel="stylesheet" href="resources/css/wantingMain.css" />
  <link rel="stylesheet" href="resources/css/wantingWrite.css" />

  <!-- summernote -->
  <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

  <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
  <script src="resources/css/summernote-bs4.min.js"></script>
  <script src="resources/css/summernote-ko-KR.js"></script>
  
  <!-- kakao map API -->
  <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=9d6a7c5e2b95f01e1fdfee7c815cc918&libraries=services"></script>
  
</head>
<!-- <style>
.map_wrap span{
height: 10px;
}
</style> -->

<body>
<div class="container wanting-write">
	<nav style="--bs-breadcrumb-divider: '>';" aria-label="breadcrumb">
		<ol class="breadcrumb">
		  <li class="breadcrumb-item"><a href="#" onclick="location.href='${ contextPath }/myPageSupporter.me'">마이페이지</a></li>
		  <li class="breadcrumb-item active" aria-current="page">원팅등록</li>
		</ol>
	</nav>
<!-- 	<input placeholder="" type="file"  name="wanting-file"> -->
	
	
<form class="" action="${ contextPath }/insertWanting.want" method="POST" enctype="multipart/form-data" id="wantingForm"> <!-- enctype : 이미지나 파일을 건낼 수 있음 -->
	<h4 class="">원팅 등록하기</h4>
	<div class="wanting-title-detail">회원님의 원팅 프로젝트를 소개해주세요.</div>

	<h5 class="wanting-guide-title">원팅 제목</h5>
	<div class="wanting-guide-detail">회원님의 원팅 프로젝트를 소개해주세요.</div>
	<i class="icon-help" aria-hidden="true"></i>
	<input class="wanting-write-input" placeholder="제목을 입력해 주세요" maxlength="40" name="wantingTitle" type="text" value="" name="wantingTitle">

	<h5 class="wanting-guide-title">원팅 요약</h5>
	<div class="wanting-guide-detail">대표 이미지와 함께 보이는 글이에요. 원팅은 쉽고 간결하게 소개해 주세요.</div>
	<i class="icon-help" aria-hidden="true"></i>
	<input class="wanting-write-input" placeholder="내용을 입력해 주세요" maxlength="80" name="wantingSummary" type="text" value="" name="wantingSummary">

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
		가게 주소<input class="wanting-write-input shop-input" placeholder="가게 주소를 입력해 주세요" maxlength="40" name="wantingShopAddress" type="text" value="" id="wanting-input">
	</div>

	<!-- 카카오 지도 -->
    <div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
        
    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
 				<!-- 키워드 : <input type="text" value="이태원 맛집" id="keyword" size="15"> -->
                <input type="text" value="정원순두부 을지로점" id="keyword" size="25"> 
                <button class="" id="map-search-btn" type="submit" onclick="searchPlaces(); return false;"
                style="background-color: #e7e7e7; border-radius: 2px; border: 2px;">검색하기</button> 
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
	</div>

	<h5 class="wanting-guide-title">원팅 스토리 작성</h5>
	<div class="wanting-guide-detail">회원님의 원팅 프로젝트를 소개해주세요.</div>
    <textarea id="summernote" name="wantingContent"></textarea>

	<button class="btn-wanting" data-bs-toggle="modal" data-bs-target="#wanting-modal2" id="btn-submit">원팅 제출</button>

</form>
</div>

	<!-- 원팅 작성 완료 -->
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
	            <div class="col-md-7">
	              <div class="modal-wanting-right" style="text-align: center;">
	                <p class="dibs-message">
	                  원팅이 완료되었습니다.<br>
	                </p>
	              </div>
	            </div>
	          </div>
	        </div>
	      </div>
	      <div class="modal-footer modal-dibs-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="location.href='${ contextPath }/wantingList.want'">닫기</button>
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
	
	
	// 	파일 선택시 사진 들어가기 (안 씀)
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



	/* ==================== 써머 노트 ==================== */
	$('#summernote').summernote({
		lang: "ko-KR",		// default: 'en-US'
		placeholder: '<br><h5>안녕하세요. 스토리 작성을 시작한 회원님을 환영해요!</h5><br>여기에는 안내문구를 적을 예정이에요. 누가? 내가 나중에',
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
        	url: '${ contextPath }/summernoteImage.want', // 호출 url
        	cache: false,
        	contentType: false,
        	enctype: 'multipart/form-data',
        	processData: false,
        	success: function(img_name) {
        		$(".spinner-border").css("display","none");
        		
        		console.log(img_name);
        		
        		// 외부 경로 저장소 tomcat server.xml 에서 수정 후 /wanting-summernote/로 경로 붙이기
          		$(el).summernote('editor.insertImage', "/wanting-summernote/" + img_name);

        		/*
        		summernote content는 innerHTML로 불러오지 못한다
        		const img = $('#summernote').sumemrnote('code', ${board.content});
        		이렇게 summernote 내장함수로 불러와야 한다.
        		*/
        	}
      	});
    }
	
	
	/* ==================== 카카오 지도 ==================== */
	// 변수 지정
	let shop_name = null; // place_name
	let shop_address = null; // road_address_name
	// 삽입할 input 태그
	let shop_name_input = document.getElementsByClassName('shop-input')[0];
	let shop_address_input = document.getElementsByClassName('shop-input')[1];
	// 클릭 여부 변수
	let clickYN = false;
	// latitude longitude 위도 37 경도 127 카카오순서(위도, 경도)
	
	
	// 마커를 담을 배열입니다
	var markers = [];
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();  
	
	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	
	// 키워드로 장소를 검색합니다
	searchPlaces();
	
	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {
	
	    var keyword = document.getElementById('keyword').value;
	
	    if (!keyword.replace(/^\s+|\s+$/g, '')) {
	        alert('키워드를 입력해주세요!');
	        return false;
	    }
	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	    ps.keywordSearch( keyword, placesSearchCB); 
	}
	
	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
	    if (status === kakao.maps.services.Status.OK) {
	
	        // 정상적으로 검색이 완료됐으면
	        // 검색 목록과 마커를 표출합니다
	        displayPlaces(data);

	        // 페이지 번호를 표출합니다
	        displayPagination(pagination);
	
	    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
	
	        alert('검색 결과가 존재하지 않습니다.');
	        return;
	
	    } else if (status === kakao.maps.services.Status.ERROR) {
	
	        alert('검색 결과 중 오류가 발생했습니다.');
	        return;
	
	    }
	}
	
	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {
	
	    var listEl = document.getElementById('placesList'), 
	    menuEl = document.getElementById('menu_wrap'),
	    fragment = document.createDocumentFragment(), 
	    bounds = new kakao.maps.LatLngBounds(), 
	    listStr = '';
	    
	    // 검색 결과 목록에 추가된 항목들을 제거합니다
	    removeAllChildNods(listEl);
	
	    // 지도에 표시되고 있는 마커를 제거합니다
	    removeMarker();
	    
	    for ( var i=0; i<places.length; i++ ) {
	    	const place = places[i]; // 안에서 읽기 위해서 변수 설정 (수정)
			console.log(place);
	    	
	        // 마커를 생성하고 지도에 표시합니다
	        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
	            marker = addMarker(placePosition, i), 
	            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	            
	        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
	        // LatLngBounds 객체에 좌표를 추가합니다
	        bounds.extend(placePosition);
	
	        // 마커와 검색결과 항목에 mouseover 했을때
	        // 해당 장소에 인포윈도우에 장소명을 표시합니다
	        // mouseout 했을 때는 인포윈도우를 닫습니다
	        (function(marker, title) {
	            kakao.maps.event.addListener(marker, 'mouseover', function() {
	                displayInfowindow(marker, title);
	                
	                if(!clickYN) {
		             	// 마커에 마우스 들어오면 가게 이름 저장 ( 수정)
		                shop_name = place.place_name;
		                shop_address = place.road_address_name;
		                console.log("마커 : " + shop_address);
		                // input 태그에 삽입
		            	shop_name_input.value = shop_name;
		            	shop_address_input.value = shop_address;
	                }
	            });
	            
	            // 클릭하면 값이 고정되고 mouseover 작동 안 함
	            kakao.maps.event.addListener(marker, 'click', function() {
	                displayInfowindow(marker, title);
	                
	                clickYN = true;
	             	// 마커 클릭하면 가게 이름 고정 ( 수정)
	                shop_name = place.place_name;
	                shop_address = place.road_address_name;
	                console.log("마커 : " + shop_address);
	                // input 태그에 삽입
	            	shop_name_input.value = shop_name;
	            	shop_address_input.value = shop_address;
	            });
	
	            kakao.maps.event.addListener(marker, 'mouseout', function() {
	                infowindow.close();
	            });

	            itemEl.onmouseover =  function () {
	                displayInfowindow(marker, title);
	                
	                if(!clickYN) {
		             	// 리스트에 마우스 들어오면 가게 이름 저장 (수정)
		                shop_name = place.place_name;
		                shop_address = place.road_address_name;
		                console.log("리스트 : " + shop_address);
		                // input 태그에 삽입
		            	shop_name_input.value = shop_name;
		            	shop_address_input.value = shop_address;
	                }
	            };

	            // 클릭하면 값이 고정되고 mouseover 작동 안 함
	            itemEl.onclick =  function () {
	                displayInfowindow(marker, title);
	                
	                clickYN = true;
	             	// 리스트에 마우스 들어오면 가게 이름 저장 (수정)
	                shop_name = place.place_name;
	                shop_address = place.road_address_name;
	                console.log("리스트 : " + shop_address);
	                // input 태그에 삽입
	            	shop_name_input.value = shop_name;
	            	shop_address_input.value = shop_address;
	            };
	
	            itemEl.onmouseout =  function () {
	                infowindow.close();
	            };
	        })(marker, places[i].place_name);
	
	        fragment.appendChild(itemEl);
	    }
	
	    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
	    listEl.appendChild(fragment);
	    menuEl.scrollTop = 0;
	
	    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
	    map.setBounds(bounds);
	}
	
	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {
	
	    var el = document.createElement('li'),
	    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
	                '<div class="info">' +
	                '   <h5>' + places.place_name + '</h5>';
	
	    if (places.road_address_name) {
	        itemStr += '    <span>' + places.road_address_name + '</span>' +
	                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
	    } else {
	        itemStr += '    <span>' +  places.address_name  + '</span>'; 
	    }
	                 
	      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
	                '</div>';           
	
	    el.innerHTML = itemStr;
	    el.className = 'item';
	
	    return el;
	}
	
	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
	    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
	        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
	        imgOptions =  {
	            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
	            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
	            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
	        },
	        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
	            marker = new kakao.maps.Marker({
	            position: position, // 마커의 위치
	            image: markerImage 
	        });
	
	    marker.setMap(map); // 지도 위에 마커를 표출합니다
	    markers.push(marker);  // 배열에 생성된 마커를 추가합니다
	
	    return marker;
	}
	
	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
	    for ( var i = 0; i < markers.length; i++ ) {
	        markers[i].setMap(null);
	    }   
	    markers = [];
	}
	
	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
	    var paginationEl = document.getElementById('pagination'),
	        fragment = document.createDocumentFragment(),
	        i; 
	
	    // 기존에 추가된 페이지번호를 삭제합니다
	    while (paginationEl.hasChildNodes()) {
	        paginationEl.removeChild (paginationEl.lastChild);
	    }
	
	    for (i=1; i<=pagination.last; i++) {
	        var el = document.createElement('a');
	        el.href = "#";
	        el.innerHTML = i;
	
	        if (i===pagination.current) {
	            el.className = 'on';
	        } else {
	            el.onclick = (function(i) {
	                return function() {
	                    pagination.gotoPage(i);
	                }
	            })(i);
	        }
	
	        fragment.appendChild(el);
	    }
	    paginationEl.appendChild(fragment);
	}
	
	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
	    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';
	
	    infowindow.setContent(content);
	    infowindow.open(map, marker);
	}
	
	 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {   
	    while (el.hasChildNodes()) {
	        el.removeChild (el.lastChild);
	    }
	}
	
	
</script>






<!-- 빵빠레 스크립트 -->
<script src="https://cdn.jsdelivr.net/npm/js-confetti@0.8.0/dist/js-confetti.browser.js"></script>
<script>
	/* const jsConfetti = new JSConfetti()
	window.onload = function() {
		jsConfetti.addConfetti({
			confettiRadius: 8,
			confettiNumber: 600,
 			//confettiRadius: 3,
			//confettiNumber: 60,
			//emojis: ['김진환님', '멍청이', '바보', '바보'],
		});
	}
	function wowConfetti() {
		jsConfetti.addConfetti({
			confettiNumber: 600,
		});
	} */
</script>


</body>
</html>