<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<jsp:include page="../common/navbar.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/wantingListView.css">
</head>
<body>
        
 <!-- ======= Specials Section ======= -->
      <section id="specials" class="specials" style="background-color: #1E1E1E;">
         <div class="container" data-aos="fade-up">
	 		<div class="section-title">
	          <h2>원팅성공</h2>
	          <p>이제 펀딩으로 만나보세요</p>
			</div>           

           <div class="row" data-aos="fade-up" data-aos-delay="100">
             <div class="col-lg-3">
               <ul class="nav nav-tabs flex-column wantSuccessList">
                 <li class="nav-item want-nav">
                   <a class="nav-link active show wantNavLink" data-bs-toggle="tab" href="#tab-1">${ wantingList[0].wantingTitle }</a>
                 </li>
                 <li class="nav-item want-nav">
                   <a class="nav-link wantNavLink" data-bs-toggle="tab" href="#tab-2">${ wantingList[1].wantingTitle }</a>
                 </li>
                 <li class="nav-item want-nav">
                   <a class="nav-link wantNavLink" data-bs-toggle="tab" href="#tab-3">${ wantingList[2].wantingTitle }</a>
                 </li>
                 <li class="nav-item want-nav">
                   <a class="nav-link wantNavLink" data-bs-toggle="tab" href="#tab-4">${ wantingList[3].wantingTitle }</a>
                 </li>
                 <li class="nav-item want-nav">
                   <a class="nav-link wantNavLink" data-bs-toggle="tab" href="#tab-5">${ wantingList[4].wantingTitle }</a>
                 </li>
               </ul>
             </div>
             <div class="col-lg-9 mt-4 mt-lg-0">
               <div class="tab-content">
				<c:forEach begin="0" end="4" var="i">
                 <div class="tab-pane <c:if test="${ i == 0 }">active show</c:if>" id="tab-${ i + 1 }">
                   <div class="row">
                     <div class="col-lg-8 details order-2 order-lg-1">
                       <h3 class="tabTitle"> ${ wantingList[i].wantingTitle } </h3>
                       <p class="tabContent">${ wantingList[i].wantingSummary }</p>
                     </div>
                     <div class="col-lg-4 text-center order-1 order-lg-2">
                       <c:forEach items="${ imageList }" var="image">
							<c:if test="${ wantingList[i].wantingNum == image.imageBoardId and image.imageLevel == 0}">
								<img src="${ contextPath }/resources/wanting/${image.imageRename}"
									class="img-fluid" alt="..." >
							</c:if>
					   </c:forEach>	
                     </div>
                   </div>
                 </div>
				</c:forEach>
               </div>
             </div>
           </div>

         </div>
       </section><!-- End Specials Section -->
    <div class="container">
      <br><br>
        <div class="row">
            <div class="col-1"></div>
            <div class="col-10">
                <span class="cateTitleOrAll">진행중인 원팅</span>
                <span class="fontOnly">if you want it you can get it</span>
                <ul class="sortList">
                    <li class="sortType" onclick="location.href='${ contextPath }/wantingList.want'">최신순</li>
                    <li class="sortType" onclick="location.href='${ contextPath }/wantingListPopular.want'">인기순</li>
                </ul>
                <br>
                <hr style="border: 2px solid dimgray;">
				<button class="btn" onclick="location.href='${ contextPath }/wantingWrite.want'">원팅작성</button>
            </div>
        </div>
      <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-10" style="padding: 30px;">
            <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
            
            <c:forEach items="${ wantingList }" var="w">
                <div class="col">
                    <div class="card shadow-sm fundinglist">
						<svg class="" xmlns="http://www.w3.org/2000/svg" style="height: 0; width: 0;">
							<c:forEach items="${ imageList }" var="i">
								<c:if test="${ w.wantingNum == i.imageBoardId and i.imageLevel == 0}">
									<img src="${ contextPath }/resources/wanting/${i.imageRename}"
										class="bd-placeholder-img card-img-top" alt="..." style="height: 280px; width: 100%; object-fit: cover;">
								</c:if>
							</c:forEach>	
						</svg>
          
                      <div class="card-body">
                          <div style="padding-bottom: 10px;">
              
                          </div>
                          <p class="card-text">${ w.wantingTitle }</p>
                          <div class="d-flex justify-content-between align-items-center">
                            <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #e8acef; height: 2px; width: ${ w.wantingCount }%;"></span></div>
                          </div>
                          
                          <span class="remainCount">${ w.wantingCount }명 / 100명</span>
                          <span class="remainDate">${ w.wantingDaysCount }일 지났어요</span>
                          <br>
                          <p class="wantingWriter">${ w.wantingWriter }</p>
			              <input type="hidden" class="wantingNum" value="${ w.wantingNum }">
                      </div>
                    </div>
                 </div>
            </c:forEach>
                
            </div>
        </div>
    </div>
    </div>
    
    <script>
    window.onload = () => {
        const divs = document.getElementsByClassName('col');
        for(const div of divs){
           div.addEventListener('click',function(){
        	  const input = this.querySelectorAll('input');
              const wantingNum=input[0].value;
        
              location.href  = '${contextPath}/selectWanting.want?wantingNum='+ wantingNum;
           });
        }
     }
    
    </script>
    
    <script src="https://cdn.jsdelivr.net/npm/js-confetti@0.8.0/dist/js-confetti.browser.js"></script>
  	<script>
	const jsConfetti = new JSConfetti()
	function wowConfetti() {
		jsConfetti.addConfetti({
		});
	}
	document.querySelector('.btn').addEventListener('click', wowConfetti)
 	</script>
</body>
</html>