<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
	<jsp:include page="common/navbar.jsp"></jsp:include>
<head>
	<title>Home</title>
	<link rel="stylesheet" href="resources/css/main.css">
	
</head>
<body>
    <!--배너광고, 이벤트-->
    <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
          <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
    
            <div class="container">
              <div class="carousel-caption text-start">
                <h1>Example headline.</h1>
                <p>Some representative placeholder content for the first slide of the carousel.</p>
                <p><a class="btn btn-lg btn-primary" href="#">Sign up today</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item" >
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
    
            <div class="container">
              <div class="carousel-caption">
                <h1>Another example headline.</h1>
                <p>Some representative placeholder content for the second slide of the carousel.</p>
                <p><a class="btn btn-lg btn-primary" href="#">Learn more</a></p>
              </div>
            </div>
          </div>
          <div class="carousel-item">
            <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%" fill="#777"/></svg>
    
            <div class="container">
              <div class="carousel-caption text-end">
                <h1>One more for good measure.</h1>
                <p>Some representative placeholder content for the third slide of this carousel.</p>
                <p><a class="btn btn-lg btn-primary" href="#">Browse gallery</a></p>
              </div>
            </div>
          </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>


      <!--펀딩, 원팅-->
      <div class="container" style="margin-top: 20px; border-bottom: 1px solid white; padding-bottom: 20px;">
        <div class="row">
            <div class="col-md-8">
                <strong class="d-inline-block mb-2 mainTitle" style="font-size: 35px; color: #e8acef; padding-left: 20px;">인기있는 펀딩</strong>
                
            </div>
            <div class="col-md-4">
                <strong class="d-inline-block mb-2 mainTitle" style="font-size: 35px; padding-left: 20px;">원팅</strong>
            </div>

        </div>
        <!--펀딩-->
        <div class="row">
            <div class="col-md-8" style="padding: 30px;">
                <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
                    <div class="col">
                        <div class="card shadow-sm fundinglist">
                          <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
              
                          <div class="card-body">
                              <div style="padding-bottom: 10px;">
                                  <span class="cate">홈/리빙</span>
                                  <span class="fundName">괄호프로젝트</span>
                              </div>
                              <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                              <div class="d-flex justify-content-between align-items-center">
                                    <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                                </div>
                                <span>26%</span>
                                <span>1,000,000원</span>
                                <span class="remainDate">15일 남음</span>
                          </div>
                        </div>
                      </div>
                    <div class="col">
                        <div class="card shadow-sm fundinglist">
                          <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
              
                          <div class="card-body">
                              <div style="padding-bottom: 10px;">
                                  <span class="cate">홈/리빙</span>
                                  <span class="fundName">괄호프로젝트</span>
                              </div>
                              <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                              <div class="d-flex justify-content-between align-items-center">
                                    <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                                </div>
                                <span>26%</span>
                                <span>1,000,000원</span>
                                <span class="remainDate">15일 남음</span>
                          </div>
                        </div>
                      </div>
                      <div class="col">
                        <div class="card shadow-sm fundinglist">
                          <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
              
                          <div class="card-body">
                              <div style="padding-bottom: 10px;">
                                  <span class="cate">홈/리빙</span>
                                  <span class="fundName">괄호프로젝트</span>
                              </div>
                              <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                              <div class="d-flex justify-content-between align-items-center">
                                    <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                                </div>
                                <span>26%</span>
                                <span>1,000,000원</span>
                                <span class="remainDate">15일 남음</span>
                          </div>
                        </div>
                      </div>
                      <div class="col">
                        <div class="card shadow-sm fundinglist">
                          <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
              
                          <div class="card-body">
                              <div style="padding-bottom: 10px;">
                                  <span class="cate">홈/리빙</span>
                                  <span class="fundName">괄호프로젝트</span>
                              </div>
                              <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                              <div class="d-flex justify-content-between align-items-center">
                                    <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                                </div>
                                <span>26%</span>
                                <span>1,000,000원</span>
                                <span class="remainDate">15일 남음</span>
                          </div>
                        </div>
                      </div>
                      <div class="col">
                        <div class="card shadow-sm fundinglist">
                          <svg class="bd-placeholder-img card-img-top" width="100%" height="225" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
              
                          <div class="card-body">
                              <div style="padding-bottom: 10px;">
                                  <span class="cate">홈/리빙</span>
                                  <span class="fundName">괄호프로젝트</span>
                              </div>
                              <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                              <div class="d-flex justify-content-between align-items-center">
                                    <div style="height: 2px; width: 100%; background-color: gray;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                                </div>
                                <span>26%</span>
                                <span>1,000,000원</span>
                                <span class="remainDate">15일 남음</span>
                          </div>
                        </div>
                      </div>
                    
                    
                    
                  </div>
                  <div class="row">
                        <span class="fundingMore">더보기</span>
                  </div>
                </div>
                <div class="col-md-4" style="padding: 30px;">
                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative wantingList">
                        <div class="col-4 d-none d-lg-block">
                          <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                
                        </div>
                        <div class="col-8 p-2 d-flex flex-column position-static">
                          <strong class="d-inline-block mb-2 mainTitle">제목</strong>
                          <p class="wanting-text">을지로역 정원순두부 맛있어요 밀키트 원팅</p>
                          <span class="wanting-writer">작성자</span>
                          <div style="height: 2px; width: 100%; background-color: gray; margin: 3px;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                          <div class="d-inline wanting-other">
                              <span><strong>26</strong>%</span>
                              <span style="font-size: 15px;">99명 원팅중</span>
                              <span class="remainWantingDate">15일 남음</span>

                          </div>
                        </div>
                    </div>
                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative wantingList">
                        <div class="col-4 d-none d-lg-block">
                          <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                
                        </div>
                        <div class="col-8 p-2 d-flex flex-column position-static">
                          <strong class="d-inline-block mb-2 mainTitle">제목</strong>
                          <p class="wanting-text">을지로역 정원순두부 맛있어요 밀키트 원팅</p>
                          <span class="wanting-writer">작성자</span>
                          <div style="height: 2px; width: 100%; background-color: gray; margin: 3px;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                          <div class="d-inline wanting-other">
                              <span><strong>26</strong>%</span>
                              <span style="font-size: 15px;">99명 원팅중</span>
                              <span class="remainWantingDate">15일 남음</span>

                          </div>
                        </div>
                    </div>
                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative wantingList">
                        <div class="col-4 d-none d-lg-block">
                          <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                
                        </div>
                        <div class="col-8 p-2 d-flex flex-column position-static">
                          <strong class="d-inline-block mb-2 mainTitle">제목</strong>
                          <p class="wanting-text">을지로역 정원순두부 맛있어요 밀키트 원팅</p>
                          <span class="wanting-writer">작성자</span>
                          <div style="height: 2px; width: 100%; background-color: gray; margin: 3px;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                          <div class="d-inline wanting-other">
                              <span><strong>26</strong>%</span>
                              <span style="font-size: 15px;">99명 원팅중</span>
                              <span class="remainWantingDate">15일 남음</span>

                          </div>
                        </div>
                    </div>
                    <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative wantingList">
                        <div class="col-4 d-none d-lg-block">
                          <svg class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
                
                        </div>
                        <div class="col-8 p-2 d-flex flex-column position-static">
                          <strong class="d-inline-block mb-2 mainTitle">제목</strong>
                          <p class="wanting-text">을지로역 정원순두부 맛있어요 밀키트 원팅</p>
                          <span class="wanting-writer">작성자</span>
                          <div style="height: 2px; width: 100%; background-color: gray; margin: 3px;"><span style="display: block; background-color: #e8acef; height: 2px; width: 26%;"></span></div>
                          <div class="d-inline wanting-other">
                              <span><strong>26</strong>%</span>
                              <span style="font-size: 15px;">99명 원팅중</span>
                              <span class="remainWantingDate">15일 남음</span>

                          </div>
                        </div>
                    </div>
                    
                    <button type="button" class="btn goWanting">원팅 하러가기 →</button>
                </div>
            </div>
        </div>

        <!-- 펀딩예정-->
        <div class="container" style="padding-top: 20px;">
            <div class="row">
                <div class="col">
                    <strong class="d-inline-block mb-2 mainTitle" style="font-size: 35px;">펀딩 예정</strong>
                </div>

            </div>
            <div class="row">

                <div class="col">
                    
                    <div class="card shadow-sm fundinglist">
                      <svg class="bd-placeholder-img card-img-top" width="100%" height="175" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
          
                      <div class="card-body">
                          <div class="cateAndName">
                              <span class="cate">홈/리빙</span>
                              <span class="fundName">괄호프로젝트</span>
                          </div>
                            <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                          
                            <i class="bi bi-bag-heart likeIcon"> </i><span> 365</span>
                            <span class="remainOpenDate">15일 뒤 오픈</span>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="card shadow-sm fundinglist">
                      <svg class="bd-placeholder-img card-img-top" width="100%" height="175" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
          
                      <div class="card-body">
                          <div class="cateAndName">
                              <span class="cate">홈/리빙</span>
                              <span class="fundName">괄호프로젝트</span>
                          </div>
                          <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                          <i class="bi bi-bag-heart likeIcon"> </i><span> 365</span>
                        <span class="remainOpenDate">15일 뒤 오픈</span>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="card shadow-sm fundinglist">
                      <svg class="bd-placeholder-img card-img-top" width="100%" height="175" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
          
                      <div class="card-body">
                          <div class="cateAndName">
                              <span class="cate">홈/리빙</span>
                              <span class="fundName">괄호프로젝트</span>
                          </div>
                          <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                          <i class="bi bi-bag-heart likeIcon"> </i><span> 365</span>
                            <span class="remainOpenDate">15일 뒤 오픈</span>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="card shadow-sm fundinglist">
                      <svg class="bd-placeholder-img card-img-top" width="100%" height="175" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
          
                      <div class="card-body">
                          <div class="cateAndName">
                              <span class="cate">홈/리빙</span>
                              <span class="fundName">괄호프로젝트</span>
                          </div>
                          <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                          <i class="bi bi-bag-heart likeIcon"> </i><span> 365</span>
                            <span class="remainOpenDate">15일 뒤 오픈</span>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="card shadow-sm fundinglist">
                      <svg class="bd-placeholder-img card-img-top" width="100%" height="175" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
          
                      <div class="card-body">
                          <div class="cateAndName">
                              <span class="cate">홈/리빙</span>
                              <span class="fundName">괄호프로젝트</span>
                          </div>
                          <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                          <i class="bi bi-bag-heart likeIcon"> </i><span> 365</span>
                            <span class="remainOpenDate">15일 뒤 오픈</span>
                      </div>
                    </div>
                  </div>
                  <div class="col">
                    <div class="card shadow-sm fundinglist">
                      <svg class="bd-placeholder-img card-img-top" width="100%" height="175" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
          
                      <div class="card-body">
                          <div class="cateAndName">
                              <span class="cate">홈/리빙</span>
                              <span class="fundName">괄호프로젝트</span>
                          </div>
                          <p class="card-text">황금빛 매력덩어리! 네팔의 향과 만난 고려청자/달항아리 황동 인센스 홀더</p>
                          <i class="bi bi-bag-heart likeIcon"> </i><span> 365</span>
                            <span class="remainOpenDate">15일 뒤 오픈</span>
                      </div>
                    </div>
                  </div>
            </div>
        </div>
      </div>
      
      <footer class="py-3 my-4">
        <ul class="nav justify-content-center border-bottom pb-3 mb-3">
          <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Home</a></li>
          <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Features</a></li>
          <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">Pricing</a></li>
          <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">FAQs</a></li>
          <li class="nav-item"><a href="#" class="nav-link px-2 text-muted">About</a></li>
        </ul>
        <p class="text-center text-muted">&copy; 2022 Company, Inc</p>
      </footer>
      
    

</body>
</html>
