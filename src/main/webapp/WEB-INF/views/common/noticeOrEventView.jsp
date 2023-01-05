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
                <span class="profileImageArea"><img src="" alt="" class="profileIamge"></span>
                <span class="userInfo">WANTIT</span><br>
                <span class="writeDate">2023.01.03</span>
                <div class="content">내용</div>

                <div class="goToList">목록으로 돌아가기</div>
            </div>
            
            

        </div>
    
    </div>
    <span class="goToTop"><i class="bi bi-chevron-double-up goTopIcon"></i></span>
</body>
</html>