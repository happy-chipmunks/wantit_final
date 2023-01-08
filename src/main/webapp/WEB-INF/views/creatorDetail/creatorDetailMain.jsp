<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/creatorDetailMain.css">
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
                    ${ creator.creatorName }
                    
                    <i class="bi bi-share shareIcon"></i>
                    
                </strong>
                <br>
                <hr style="color:dimgray;">
                <div class="row">
                    <div class="col creator-statistics">
                        <i class="bi bi-star-fill" style="color: #e8acef;"></i>
                        평점 ${ reviewAverage } (${ reviewList.size() }개)
                    </div>
                    <div class="col creator-statistics">
                        <i class="bi bi-piggy-bank-fill" style="color: #e8acef;"></i>
                        누적액수 ${ totalAmount }
                    </div>
                    <div class="col creator-statistics">
                        <i class="bi bi-people-fill" style="color: #e8acef;"></i>
                        서포터수 ${ totalSupCount }명
                    </div>
                </div>
                <div class="row" style="padding-top: 15px;">
                    <button type="button" class="btn following">+팔로우하기</button>
                </div>
                <div class="row creator-others">
                    <div class="col creator-other">
                        <span style="border-bottom: 3px solid dimgray; padding-bottom: 39px;">프로젝트ᐧ후기</span>
                    </div>
                    <div class="col creator-other">
                        크리에이터소식
                    </div>
                    <div class="col creator-other">
                        메이커 정보
                    </div>
                </div>

                <div class="goFunding">
                    <h4 class="gf2">진행/진행예정 펀딩 🔥</h4>
                    <span class="fundListCount">${ fundingList.size() }건</span>
                </div>
                <div style="padding-bottom: 20px;">
                    <div class="gfImage">
                        <!--이미지 태그-->
                    </div>
                    <p class="gfTitle">[2.3억  폭주/1위]하루 1시간 블로그로 대기업 퇴사! 23년은 월급독립</p>
                    <span class="gfPercent">7374%</span>
                    <span class="gfMoney"> ᐧ 36,871,400 원</span>
                    <span class="gfRemainDate">30일 남음</span>
                </div>

            </div>
            
        </div>

        <div class="row justify-content-md-center">
            <div class="col-lg-6 fInfo">
                <div class="ff">구매자 후기</div>
                <span class="ffCount">(${ reviewList.size() }개)</span>
                <div style="right: 0; position: absolute; padding-right: 60px;">
                    <span class="totalStar">
                        전체 평점 ${ reviewAverage }
                        <i class="bi bi-star-fill starAvg"></i>
                        <i class="bi bi-star-fill starAvg"></i>
                        <i class="bi bi-star-fill starAvg"></i>
                        <i class="bi bi-star-fill starAvg"></i>
                        <i class="bi bi-star-half starAvg"></i>
                    </span>
                </div>
                <div class="container fList">
                    <div class="row fv">

                        <div class="col-8">
                            <p class="fvTitle">[2.3억  폭주/1위]하루 1시간 블로그로 대기업 퇴사! 23년은 월급독립</p>
                            <p class="fvContent">튼튼하네요. 작은데 기능이 다들어가있어서 여행가서 쓸생각에 기대중!</p>
                            <div class="starAndWriter">
                                <span>
                                    <i class="bi bi-star-fill star"></i>
                                    <i class="bi bi-star-fill star"></i>
                                    <i class="bi bi-star-fill star"></i>
                                    <i class="bi bi-star-fill star"></i>
                                    <i class="bi bi-star-fill star"></i>
                                </span>
                            </div>
                        </div>
                        <div class="col-4 fvImage">
                            <!--이미지태그-->
                        </div>
                    </div>

                    <div class="row fv">

                        <div class="col-8">
                            <p class="fvTitle">[2.3억  폭주/1위]하루 1시간 블로그로 대기업 퇴사! 23년은 월급독립</p>
                            <p class="fvContent">튼튼하네요. 작은데 기능이 다들어가있어서 여행가서 쓸생각에 기대중!</p>
                            <div class="starAndWriter">
                                <span>
                                    <i class="bi bi-star-fill star"></i>
                                    <i class="bi bi-star-fill star"></i>
                                    <i class="bi bi-star-fill star"></i>
                                    <i class="bi bi-star-fill star"></i>
                                    <i class="bi bi-star-fill star"></i>
                                </span>
                            </div>
                        </div>
                        <div class="col-4 fvImage">
                            <!--이미지태그-->
                        </div>
                    </div>
                    <p class="gotoAllfv">후기 전체보기 →</p>
                </div>
            </div>
        </div>

    </div>
	
</body>
</html>