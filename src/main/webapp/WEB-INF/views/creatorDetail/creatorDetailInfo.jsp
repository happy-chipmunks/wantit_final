<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="resources/css/creatorDetailMain.css">
	<link rel="stylesheet" href="resources/css/creatorDetailInfo.css">
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
                    <div class="col creator-other" id="creatorProject">
                        프로젝트ᐧ후기
                    </div>
                    <div class="col creator-other">
                        크리에이터소식
                    </div>
                    <div class="col creator-other">
                        <span style="border-bottom: 3px solid dimgray; padding-bottom: 39px;">메이커정보</span>
                    </div>
                </div>

                <div class="cInfo">

                    <table class="infos">
                        <tr>
                            <th>상호/크리에이터명</th>
                            <td>${ creator.creatorName }</td>
                        </tr>
                        <tr>
                            <th>기업형태</th>
                            <c:if test="${ creator.businessType eq N }"><td>개인기업</td></c:if>
                            <c:if test="${ creator.businessType eq Y }"><td>단체기업</td></c:if>
                        </tr>
                        <tr>
                            <th>대표자이름</th>
                            <td>${ creator.managerName }</td>
                        </tr>
                        <tr>
                            <th>이메일</th>
                            <td>${ creator.managerEmail }</td>
                        </tr>
                        <tr>
                            <th>대표전화</th>
                            <td>${ creator.managerPhone }</td>
                        </tr>
                        <tr>
                            <th>사업자등록번호</th>
                            <td>${ creator.businessNumber }</td>
                        </tr>
                      
                    </table>
                </div>
            </div>
        </div>
    </div>
	<script type="text/javascript">
		const creatorProject = document.getElementById('creatorProject');
		creatorProject.addEventListener('click', function() {
			location.href = '${ contextPath }/goToCreator.fund?creatorNum=' + ${ creator.creatorNum } + '&page=project';
		});
	</script>
</body>
</html>