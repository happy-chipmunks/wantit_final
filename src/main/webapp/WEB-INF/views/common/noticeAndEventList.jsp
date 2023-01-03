<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/noticeAndEvent.css">
</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-5"></div>
            <div class="col-2">
                <h2 class="noticeAndEvent">공지사항</h2>
                <div class="row">
                    <div class="col lists all">전체</div>
                    <div class="col lists">공지</div>
                    <div class="col lists">이벤트</div>
                    
                </div>
            </div>

        </div>
        <div class="row" style="padding-top: 10px; padding-left: 20px;">
            <div class="col-3"></div>
            <div class="col-6">
                <div class="row noticeAndEventList">
                    
                    <div class="col-9">
                        <span class="nORe">이벤트</span> ᐧ 
                        <span class="condition">진행중</span> 
                        <br>
                        <div class="nOReContent">[스토어]새해맞이 화장대점검 ! GET READY WITH WANTIT | 최대 30% 할인 + 랜덤쿠폰</div>
                      
                        <div class="writerAndDate">
                            <span>WANTIT</span> 
                            <span>2023.01.02</span>
                        </div>
                    </div>
                    <div class="col-3 imageArea"></div>
                </div>
                <div class="row noticeAndEventList">
                    
                    <div class="col-9">
                        <span class="nORe">이벤트</span> ᐧ 
                        <span class="condition">진행중</span> 
                        <br>
                        <div class="nOReContent">[스토어]새해맞이 화장대점검 ! GET READY WITH WANTIT | 최대 30% 할인 + 랜덤쿠폰</div>
                      
                        <div class="writerAndDate">
                            <span>WANTIT</span> 
                            <span>2023.01.02</span>
                        </div>
                    </div>
                    <div class="col-3 imageArea"></div>
                </div>
                <div class="row noticeAndEventList">
                    
                    <div class="col-9">
                        <span class="nORe">이벤트</span> ᐧ 
                        <span class="condition">진행중</span> 
                        <br>
                        <div class="nOReContent">[스토어]새해맞이 화장대점검 ! GET READY WITH WANTIT | 최대 30% 할인 + 랜덤쿠폰</div>
                      
                        <div class="writerAndDate">
                            <span>WANTIT</span> 
                            <span>2023.01.02</span>
                        </div>
                    </div>
                    <div class="col-3 imageArea"></div>
                </div>
            </div>
        </div>
        <nav aria-label="Page navigation example" style="padding-top: 20px; padding-bottom: 15px;">
            <ul class="pagination justify-content-center">
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Previous">
                  <span aria-hidden="true" class="previous">&#60;</span>
                </a>
              </li>
              <li class="page-item"><a class="page-link" href="#">1</a></li>
              <li class="page-item"><a class="page-link" href="#">2</a></li>
              <li class="page-item"><a class="page-link" href="#">3</a></li>
              <li class="page-item">
                <a class="page-link" href="#" aria-label="Next">
                  <span aria-hidden="true" class="next">&#62;</span>
                </a>
              </li>
            </ul>
        </nav>
        <div class="row  justify-content-center">
            <div class="dropdown">
                <button class="btn btn-secondary dropdown-toggle drop" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false" data-bs-auto-close="true">
                  선택
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">

                  <li><a class="dropdown-item" href="#">제목+내용</a></li>
                  <li><a class="dropdown-item" href="#">제목</a></li>
                  <li><a class="dropdown-item" href="#">내용</a></li>
                </ul>
              </div>
            <input type="text" class="searchInput">
            <button class="searchNoticeAndEventBtn">검색</button>
        </div>



    </div>
</body>
</html>