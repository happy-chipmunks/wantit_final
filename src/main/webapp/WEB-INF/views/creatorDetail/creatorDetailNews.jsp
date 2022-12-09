<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/creatorDetailMain.css">
	<link rel="stylesheet" href="resources/css/creatorDetailNews.css">
</head>
<body>
    <div class="container">
        <div class="row justify-content-md-center">
          <div class="col-lg-6 creatorImage">
            <!--이미지태그-->
          </div>
        </div>

        <div class="row justify-content-md-center">
            <div class="col-lg-6 creatorInfo">
                <strong class="creatorName">
                    온유어브랜딩
                    
                    <i class="bi bi-share shareIcon"></i>
                    
                </strong>
                <br>
                <span class="creatorCate">기타</span>
                <span class="creatorCate">출판</span>
                <br>
                <div class="creatorContent">
                    모든 문의는 카카오톡 채널 @온유어브랜딩 으로 부탁드립니다.<br>
                    💻 블로그 하나로, 대기업 퇴사 후 하고 싶은 일과 좋아하는 일만 하며 살아가는 해피엘린입니다.<br>
                    📍 온유어브랜딩 운영 | 블로그 마케팅 <br>
                    📍  9년차 블로거 | 전자책 출간 | 마케팅 강의
                </div>
                <hr style="color:dimgray;">
                <div class="row">
                    <div class="col creator-statistics">
                        <i class="bi bi-star-fill" style="color: #e8acef;"></i>
                        평점 4.5 (1300개)
                    </div>
                    <div class="col creator-statistics">
                        <i class="bi bi-piggy-bank-fill" style="color: #e8acef;"></i>
                        누적액수 2억원+
                    </div>
                    <div class="col creator-statistics">
                        <i class="bi bi-people-fill" style="color: #e8acef;"></i>
                        서포터수 2048명
                    </div>
                </div>
                <div class="row" style="padding-top: 15px;">
                    <button type="button" class="btn following">+팔로우하기</button>
                </div>
                <div class="row creator-others">
                    <div class="col creator-other">
                        프로젝트ᐧ후기
                    </div>
                    <div class="col creator-other">
                        <span style="border-bottom: 3px solid dimgray; padding-bottom: 39px;">크리에이터소식</span>
                    </div>
                    <div class="col creator-other">
                        메이커 정보
                    </div>
                </div>

                <div class="cNews">
                    <h3 class="newsTitle">[주말할인] 저스트모바일 셔터그립2로 할로윈 인생샷을!🤳</h3>
                    <div style="padding-bottom: 20px;">
                        <span class="newsCate">이벤트</span>
                        <span class="newsDate">한 달 전</span>
                    </div>
                    <br>

                    <h6 class="newsContent">
                        안녕하세요, 주식회사 시티파이브입니다.<br>

                        🔔와디즈 고객을 위한 시티파이브 주말할인 EVENT!🔔<br>
                        
                        📍할인기간 : 10월21일(금) ~ 10월23일(일)<br>
                        📍할인제품 : 저스트모바일 셔터그립2<br>
                        📍할인가 : 셔터그립단품 58,800원 -> 🎁55,900원(무료배송)<br>
                                          셔터그립세트 84,200원 -> 🎁69,900원(무료배송)<br>
                        
                        📍바로가기 : https://www.wadiz.kr/web/store/detail/35<br>
                        
                        셔터그립과 함께 할로윈 인생샷을 남겨보세요🔥<br>
                    </h6>
                    
                    <div class="newsImage">
                        <!--이미지-->
                    </div>
                    <div class="likeArea" style="padding-top: 20px; padding-bottom: 20px;">
                        <span class="likeAreaItem">❤️</span>
                        <span class="likeAreaItem">👍</span>
                        <span class="newsReply">
                            <i class="bi bi-chat-left-dots" style="padding-right: 5px;"></i>
                            댓글 1개</span>
                    </div>
                    
                    <br>
                    <div class="row">
                        <div class="col-1 pfImage">
                            <!--이미지태그-->
                        </div>
                        <div class="col-3 pfWriter">작성자</div>
                        <div class="col-6 pfContent">내용</div>
                        <div class="col-auto">
                            <span class="pfEdit">수정</span>
                            <span class="pfDelete">삭제</span>
                        </div>
                    </div>
                     
                </div>

                

            </div>
            
        </div>

        

    </div>
	
</body>
</html>