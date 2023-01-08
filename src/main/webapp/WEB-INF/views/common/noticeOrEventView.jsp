<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/noticeOrEventView.css">
</head>
<body>
	<div class="container">
        <div class="row" style="padding-top: 20px;">
            <div class="col-2"></div>
            <div class="col-8">
                <div class="title">${ notice.noticeTitle }</div>
                <br>
                <div class="writeDate">${ notice.noticeModifyDate }</div>
                <br><br>
                <div class="content">
                	${ notice.noticeContent }
                </div>

                <div class="goToList" id="goToList">목록으로 돌아가기</div>
            </div>
            
            

        </div>
    
    </div>
    <script type="text/javascript">
    	const goToList = document.getElementById('goToList');
    	goToList.addEventListener('click', function() {
    		window.history.back();
    	});
    </script>
</body>
</html>