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
        
        margin-top: 40px;
        width: 1300px;
        height: 900px;
        background-color: lightgrey;
    }  
        
    .noti{
        font-size: 30px;
        font-weight: bold;
        text-align:center;
    }
    .textForm {
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
      
      
    </style>

    
    <!-- Custom styles for this template -->
  <link href="../../resources/css/dashboard.css" rel="stylesheet">
  <script src="http://code.jquery.com/jquery-3.6.1.min.js"></script>
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

<div class="container mb-5 mt-5 ml-5" >
 
    
    	
    
    <h1>공지사항</h1>
     <small>원잇의 다양한 소식을 확인해보세요*^^*</small> 
      

     <div class="noti">
        <a>공지사항</a>
        &nbsp;&nbsp;|&nbsp;&nbsp;
        <a>이벤트</a>
    </div>


     <div class="mainDiv">
        <table class="table" style="height: auto; width: 1200px; margin-left: 50px;">
          <tbody class="table-group-divider" >
            <br><br>
            <tr class="textForm" >
              <th scope="row">&nbsp;1</th>
              <td>음식</td>
              <td>벽돌해피푸드 마라샹궈</td>
              <td>2022. 12. 08</td>
            </tr>
            <tr class="textForm">
              <th scope="row">&nbsp;1</th>
              <td>음식</td>
              <td>벽돌해피푸드 마라샹궈</td>
              <td>2022. 12. 08</td>
            </tr>
            <tr class="textForm">
              <th scope="row">&nbsp;1</th>
              <td>음식</td>
              <td>벽돌해피푸드 마라샹궈</td>
              <td>2022. 12. 08</td>
            </tr>
            <tr class="textForm">
              <th scope="row">&nbsp;1</th>
              <td>음식</td>
              <td>벽돌해피푸드 마라샹궈</td>
              <td>2022. 12. 08</td>
            </tr>
            <tr class="textForm">
              <th scope="row">&nbsp;1</th>
              <td>음식</td>
              <td>벽돌해피푸드 마라샹궈</td>
              <td>2022. 12. 08</td>
            </tr>
            <tr class="textForm">
              <th scope="row">&nbsp;1</th>
              <td>음식</td>
              <td>벽돌해피푸드 마라샹궈</td>
              <td>2022. 12. 08</td>
            </tr>
            <tr class="textForm">
              <th scope="row">&nbsp;1</th>
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
     </div>
</div>

  
  <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
  </body>
</html>
