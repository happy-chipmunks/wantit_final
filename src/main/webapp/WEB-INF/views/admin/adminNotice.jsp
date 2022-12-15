<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!Doctype html>
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
      @font-face {
          font-family: 'NanumSquareNeo-Variable';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
          font-weight: normal;
          font-style: normal;
      }
    *{font-family: 'NanumSquareNeo-Variable';}
    .mainDiv{
        margin-left: 130px;
        margin-top: 40px;
        width: 1300px;
        height: 900px;
        background-color: lightgrey;
    }  
        
    .noti{
    	margin-left: 130px;
    	width: 1300px;
        font-size: 30px;
        font-weight: bold;
        text-align:center;
    }
    .textForm {
      margin-left: 130px;
      font-size: 20px;
      height: 100px;
      border-bottom: 2px solid #adadad;
      margin: 30px;
      padding: 10px 10px;
      text-align: center;
      margin-right: 10px;
      margin-left: 10px;
      vertical-align: middle;
      margin-top: 50px;
    }
    
    .make{
    	float: right;
    	margin-bottom: 200px;
    	margin-right: 20px; 
    	
    }
      
    </style>

    
    <!-- Custom styles for this template -->
  <link href="../../resources/css/dashboard.css" rel="stylesheet">
  <script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
  </head>
  <body>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script> 
<header>
	<jsp:include page="../common/navbar.jsp"></jsp:include>
</header>

<div class=" container-fluid" >
 <div class="row">
  <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
      <div class="position" style="height:1000px;">
                <ul class="nav flex-column" >
          <li class="nav-item">
          	<a class="nav-link" href="${ contextPath }/admin.ad">
              <span data-feather="home" class="align-text-bottom"></span>
              <br><br>
              사이트 관리
              </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${ contextPath }/projectManage.ad">
              <span data-feather="file" class="align-text-bottom"></span>
              <br><br>
              프로젝트
              승인 / 거절
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${ contextPath }/reviewManage.ad">
              <span data-feather="shopping-cart" class="align-text-bottom"></span>
              <br><br>
              리뷰 신고 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${ contextPath }/noticeManage.ad">
              <span data-feather="users" class="align-text-bottom"></span>
              <br><br>
              공지사항 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${ contextPath }/inquiryManage.ad">
              <span data-feather="bar-chart-2" class="align-text-bottom"></span>
              <br><br>
              문의 관리
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="${ contextPath }/adManage.ad">
              <span data-feather="layers" class="align-text-bottom"></span>
              <br><br>
              광고의뢰 관리
            </a>
            <li class="nav-item">
            <a class="nav-link" href="${ contextPath }/memberManage.ad">
              <span data-feather="layers" class="align-text-bottom"></span>
              <br><br>
              회원 관리
            </a>
          </li>
        </ul>
      </div>
    </nav>
    
 <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4 mb-5 mt-5 ml-5">
  <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;공지사항</h1>
     <small>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;원잇의 다양한 소식을 확인해보세요*^^*</small> 
     
     
    <div class="noti" >
        <span class="select" id="info1" style="text-decoration: none; color: black;">공지사항</span>
        &nbsp;&nbsp;|&nbsp;&nbsp;
        <span class="select" id="info2" style="text-decoration: none; color: black;">이벤트</span>
    </div>
    
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">   	
        <div class="mainDiv">
        <table class="table" id="table1" style="height: auto; width: 1200px; margin-left: 50px;">
          <tbody class="table-group-divider " >
            <br><br>
            <tr class="textForm" >
              <th scope="row">1</th>
              <td>음식</td>
              <td>벽돌해피푸드 마라샹궈</td>
              <td>2022. 12. 08</td>
            </tr>
            <tr class="textForm">
              <th scope="row">1</th>
              <td>음식</td>
              <td>벽돌해피푸드 마라샹궈</td>
              <td>2022. 12. 08</td>
            </tr>
            
          </tbody>
        </table>
        
        <table class="table" id="table2" style="height: auto; width: 1200px; margin-left: 50px; display:none;">
          <tbody class="table-group-divider " >
 
            <tr class="textForm" >
              <th scope="row">2</th>
              <td>음식</td>
              <td>벽돌해피푸드 마라샹궈</td>
              <td>2022. 12. 08</td>
            </tr>
            <tr class="textForm">
              <th scope="row">2</th>
              <td>음식</td>
              <td>벽돌해피푸드 마라샹궈</td>
              <td>2022. 12. 08</td>
            </tr>
            <tr class="textForm">
              <th scope="row">2</th>
              <td>음식</td>
              <td>벽돌해피푸드 마라샹궈</td>
              <td>2022. 12. 08</td>
            </tr>
          </tbody>
        </table>
        <br>
        <div>
          <form class="form-inline;">
          <select class="form-select" aria-label="Default select example" style=" width: 200px; vertical-align: middle; margin-left: 300px; display: inline;">
            <option selected >카테고리</option>
            <option value="1">제목</option>
            <option value="2">작성자</option>
            <option value="3">내용</option>
          </select>
          <div class="input-group" style="display: inline;">
              <input type="text" style="height:35px; border-radius: 0.3em; border: none; width: 400px;">
          </div>
          <button type="button" class="btn btn-primary">
            <span>
                <span class="">검색</span>
            </span>
       	 </button>
          </form>
        </div>
        <br>
        
         <button type="button" class="btn btn-primary btn-lg make" onclick="location.href='${contextPath}/noticeMake.ad'">
            
                <span class="">이벤트 / 공지사항 생성</span>
            
       	 </button>
    	 </div>
     	</div>
     </main>
     </div>
	</div>
	
	
	<script>
		window.onload=()=>{
			
			document.getElementById("info1").addEventListener("click", function(){
				this.style.textDecoration = 'underline';
				document.getElementById("info2").style.removeProperty("text-decoration");
				
				document.getElementById("table2").style.display = 'none';
				document.getElementById("table1").style.removeProperty("display");
			});
			
			document.getElementById("info2").addEventListener("click", function(){
				this.style.textDecoration = 'underline';
				document.getElementById("info1").style.removeProperty("text-decoration");
				
				document.getElementById("table1").style.display = 'none';
				document.getElementById("table2").style.removeProperty("display");
			});
			
// 			const titles = document.getElementsByClassName('select');
			
// 			for(let i = 0; i < titles.length; i++){
// 				const title = titles[i];
				
// 				title.addEventListener('click', function(){
// 					let other = null;
// 					if(i == 0){
// 						other = titles[1];
// 					} else{
// 						other = titles[0];
// 					}
// 					if(this.style.textDecoration == 'underline'){
// 						console.log(this.style.textDecoration);
// 						this.style.textDecoration = 'none';
						
// 						document.getElementById("table2").style.display = 'none';
// 						document.getElementById("table1").style.display = 'block';
						
// 					} else {
// 						console.log(this.style.textDecoration);
// 						this.style.textDecoration = 'underline';
// 						if(other.style.textDecoration == 'underline'){
// 							other.style.textDecoration = 'none';
// 						document.getElementById("table2").style.display = 'block';
// 						document.getElementById("table1").style.display = 'none';
					
// 						}
// 					}
					
					
// 				});
// 			}
			
			
// 			const select1 = document.getElementById('info1');
// 			const select2 = document.getElementById('info2');
			
// 			select1.addEventListener('click', function(){
// 				this.style.textDecoration = 'underline';
				
// 				if(this.style.backgroundColor == "black"){
// 					select1.addEventListener('click', function(){
// 						this.style.backgroundColor= "white";
// 					});
// 				}
// 			});
			
// 			select2.addEventListener('click', function(){
// 				this.style.backgroundColor= "black";
				
// 				if(this.style.backgroundColor == "black"){
// 					select2.addEventListener('click', function(){
// 						this.style.backgroundColor= "white";
// 					});
// 				}
// 			});
		}
	</script>
  	
  	<script>
  		
  	</script>
  	
  <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
  </body>
</html>
