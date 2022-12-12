<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.104.2">
    <title>Dashboard Template · Bootstrap v5.2</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.2/examples/dashboard/">
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    

    

<link href="../assets/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }

      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem;
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      .find-btn{
		text-align: center;
		}
		.find-btn1{
			display :inline-block;
		}
		.w-btn-gra1 {
   		 background: linear-gradient(-45deg, #33ccff 0%, #ff99cc 100%);
    	color: white;
		}
		.w-btn-gra1 {
	    position: relative;
	    border: none;
	    display: inline-block;
	    padding: 10px 30px;
	    border-radius: 15px;
	    font-family: "paybooc-Light", sans-serif;
	    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.2);
	    text-decoration: none;
	    font-weight: 600;
	    transition: 0.25s;
    	.table-middle{
        text-align: center;
      }
       .align-middle{
        text-align: center;
      }
      .mytable { border-collapse:collapse; }  
	  .mytable th { border:1px solid black; } 
	   .mytable td { border:1px solid black; } 
	  
	  #yotable th{border: 1px solid black;}  
		  
    </style>

    
    <!-- Custom styles for this template -->
    <link href="../../resources/css/dashboard.css" rel="stylesheet">
  </head>
  <body>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script> 
<header class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
  <a class="navbar-brand col-md-3 col-lg-2 me-0 px-3 fs-6" href="#">WANTIT</a>
 
  <div class="navbar-nav">
    <div class="nav-item text-nowrap">
      <a class="nav-link px-3" href="#">Sign out</a>
    </div>
  </div>
</header>

<div class="container-fluid" >
  <div class="row">
    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position" style="height:700px;">
        <ul class="nav flex-column" >
          <li class="nav-item">
              <span data-feather="home" class="align-text-bottom"></span>
              <br><br>
              사이트 관리
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="file" class="align-text-bottom"></span>
              <br><br>
              프로젝트
              승인 / 거절
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="shopping-cart" class="align-text-bottom"></span>
              <br><br>
              리뷰 신고 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="users" class="align-text-bottom"></span>
              <br><br>
              공지사항 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="bar-chart-2" class="align-text-bottom"></span>
              <br><br>
              문의 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="layers" class="align-text-bottom"></span>
              <br><br>
              광고의뢰 관리
            </a>
            <li class="nav-item">
            <a class="nav-link" href="#">
              <span data-feather="layers" class="align-text-bottom"></span>
              <br><br>
              회원 관리
            </a>
          </li>
        </ul>
      </div>
    </nav>
    	
    	 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
       <h2>공지사항 작성</h2>
        
      </div>
      	<div style="width:1000px; height:420px; border:1px solid black; float:left; margin-right:20px; background-color: #E6E6FA;">
      		<form>
      		<div>
      			<label for="title">공지사항 제목</label><br>
      			<input type="text" name="title" id="title"  style="width:950px;height:50px; background-color: white;">
      		</div>
      		<div>
      			<label for="title">사진</label><br>
      			<span><input type="file" name="file" id="file" style="width:950px;height:30px; background-color: white;"></span>
      		</div>
      		<div>
      			<label for="content">내용</label><br>
      			<textarea rows="7px;" cols="130px;" id="content" name="content"></textarea>
      			<br><br>
      			<div class="find-btn">
      			<button type="button" class="w-btn-gra1" onclick="location.href='/'">작성하기</button>
      			&nbsp;&nbsp;
      			<button type="button" class="w-btn-gra1" onclick="location.href='/'">취소하기</button>
      			</div>
      		</div>
      		<br><br><br>
      		<br><br><br>
      		<br><br><br>
      		</form>
      	</div>
      	
      	
      	<div style=" width:1000px; height:450px; float:left; margin-right:20px;">
      		<br>
      		 <table class="mytable" class="table table-bordered" style=" width:1000px; height:380px; background-color: #E6E6FA;" >
      		 	<colgroup>
   						<col width="33%">
   						<col width="33%">
   						<col width="33%">
   					</colgroup>
      			<tr style="text-align: center;">
      				<th>[공지사항]</th>
      				<th>제목</th>
      				<th>작성일</th>
      			</tr>
      			<tr style="text-align: center;">
      				<th>[공지사항]</th>
      				<th>제목</th>
      				<th>작성일</th>
      			</tr>
      			<tr style="text-align: center;">
      				<th>[공지사항]</th>
      				<th>제목</th>
      				<th>작성일</th>
      			</tr>
      			<tr style="text-align: center;">
      				<th>[공지사항]</th>
      				<th>제목</th>
      				<th>작성일</th>
      			</tr>
      			<tr style="text-align: center;">
      				<th>[공지사항]</th>
      				<th>제목</th>
      				<th>작성일</th>
      			</tr>
      			
      		</table><br>
      		
      		<ul class="pagination" style="justify-content: center;">
					<c:if test="${ pi.currentPage > 1 }">
					<li class="page-item"><c:url var="goBack" value="${ loc }">
							<c:param name="page" value="${ pi.currentPage-1 }"></c:param>
						</c:url> <a class="page-link" href="${ goBack }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
					</a></li>
					</c:if>
					<c:forEach begin="${ pi.startPage }" end="${ pi.endPage }" var="p">
						<c:url var="goNum" value="${ loc }">
							<c:param name="page" value="${ p }"></c:param>
						</c:url>
						<li class="page-item"><a class="page-link" href="${ goNum }">${ p }</a></li>
					</c:forEach>
					<c:if test="${ pi.currentPage < pi.maxPage }">
					<li class="page-item"><c:url var="goNext" value="${ loc }">
							<c:param name="page" value="${ pi.currentPage+1 }"></c:param>
						</c:url> <a class="page-link" href="${ goNext }" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
					</c:if>
				</ul>
      	</div>
      		
    	
    	</main>
    	
    		
		<br><br>
		
		
    	
    		
    		
    		
    		
    		
    		
    		
    </div>
    
    </div>
	<br>
	
	
	
      

     
     


    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>

      <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
  </body>
</html>
