<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/noticeAndEventList.css">
</head>
<body>
	<div class="container">
        <div class="row">
            <div class="col-5"></div>
            <div class="col-2">
                <h2 class="noticeAndEvent">공지사항/이벤트</h2>
            </div>

        </div>
        <div class="row" style="padding-top: 10px; padding-left: 20px;">
            <div class="col-3"></div>
            <div class="col-6">
            	<!--  foreach 뿌리기 -->
            	<c:forEach begin="0" end="${ noticeList.size() - 1 }" var="i">
            		
	                <div class="row noticeAndEventList">
	                    <input type="hidden" value="${ noticeList[i].noticeNum }" id="noticeNum${ i }">
	                    <div class="col-9">
	                        <span class="nORe">
	                        	<c:if test="${ noticeList[i].noticeDivision == 'E' }">이벤트</c:if>
	                        	<c:if test="${ noticeList[i].noticeDivision == 'N' }">공지</c:if>
	                        </span> ᐧ 
	                        <span class="condition">
	                        	<c:if test="${ noticeList[i].noticeStatus == 'Y' && noticeList[i].noticeDivision == 'E' }">진행중</c:if>
	                        	<c:if test="${ noticeList[i].noticeStatus == 'N' && noticeList[i].noticeDivision == 'E' }">마감</c:if>
	                        </span> 
	                        <br>
	                        <div class="nOReContent">${ noticeList[i].noticeTitle }</div>
	                      
	                        <div class="writerAndDate">
	                            <span>${ noticeList[i].admin }</span> 
	                            <span>${ noticeList[i].noticeModifyDate }</span>
	                        </div>
	                    </div>
	                    <div class="col-3 imageArea">
	                    	<c:forEach items="${ noticeImageList }" var="image">
	                    		<c:if test="${ noticeList[i].noticeNum == Integer.parseInt(image.imageBoardId) }">
			                    	<img alt="" src="${ contextPath }/resources/notice/${ image.imageRename }" width="140" height="120">
	                    		</c:if>
	                    	</c:forEach>
	                    </div>
	                </div>
            	</c:forEach>
            </div>
        </div>
        <nav aria-label="Standard pagination example" class="nav justify-content-center">
        	<ul class="pagination">
	            <li class="page-item">
	            	<c:url var="goBack" value="${ loc }">
	            		<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
	            	</c:url>
	            	<a class="page-link" href="${ goBack }" aria-label="Previous">
	            		<span aria-hidden="true">&laquo;</span>
	              	</a>
	            </li>
	            <c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
	            	<c:url var="goNum" value="${ loc }">
	            		<c:param name="page" value="${ p }"></c:param>
	            	</c:url>
	            	<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
	            </c:forEach>
	            <li class="page-item">
	            	<c:url var="goNext" value="${ loc }">
	            		<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
	            	</c:url>
	            	<a class="page-link" href="${ goNext }" aria-label="Next">
	            		<span aria-hidden="true">&raquo;</span>
	            	</a>
	            </li>
	    	</ul>
        </nav>



    </div>
    <script type="text/javascript">
    	const noticeAndEventList = document.getElementsByClassName('noticeAndEventList');
    	for(let i=0 ; i<noticeAndEventList.length ; i++) {
    		noticeAndEventList[i].addEventListener('click', function() {
    			const noticeNum = document.getElementById('noticeNum' + i);
    			
    		
    			location.href = '${ contextPath }/selectNotice.do?noticeNum=' + noticeNum.value;
    		});
    	}
    </script>
</body>
</html>