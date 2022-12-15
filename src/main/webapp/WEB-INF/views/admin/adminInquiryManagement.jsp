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

        .textForm {
          border-bottom: 2px solid #adadad;
          margin: 30px;
          padding: 10px 10px;
        }
        .form-popup {
          border-radius: 20px 20px 20px 20px / 20px 20px 20px 20px;
          background-color: #FAE4FF;
          display: grid;
          margin: auto;
          margin-top: 50px;
          padding: 40px;
          align-items: center;
          justify-content: center;
          width: 100%;
        }
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
        .joinInfo {
          background-color: white;
          width: 100%;
          height: 100px;
          border:none;
          outline:none;
          color: #636e72;
          font-size:16px;
        }
        #boxWrap {
        width: auto;
        height: auto;
        }

        #boxWrap : after {
          content: "";
          display: block;
          clear: both;
        }

        #boxWrap p+p{margin-left:5px;}

        #boxWrap .original {
          float: left;
          padding: 20px;
          width: 100px;
          height: 100px;
          background-color: #cbcbcb;
          text-align: center;
          line-height: 100px;
        }

        .btnWrap{width:100%;}

        .right{
          float: right;
          margin-right: 30px;
          margin-left: 10px;
          
        }
          .table{
    vertical-align: middle;
    text-align: center;
  }
  .find-btn{
	text-align: center;
  }
  .find-btn1{
    display :inline-block;
  }

  .wiwidth{
    width: 400px;
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

  <div class="container-fluid" >
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
        
      <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
        <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
          <h1 class="h2">문의관리</h1>
          
        </div>
        <table class="table">
          <thead>
            <tr>
              <th scope="col">번호</th>
              <th scope="col">카테고리</th>
              <th scope="col">제목</th>
              <th scope="col">작성자</th>
              <th scope="col">답변하기</th>
            </tr>
          </thead>
          <tbody class="table-group-divider">
            <tr>
              <th scope="row">&nbsp;1</th>
              <td>음식</td>
              <td>벽돌해피푸드 마라샹궈</td>
              <td>권마유시</td>
              <td><button class="btn btn-primary" type="button">답변하기</button></td>
            </tr>
            <tr>
              <th scope="row">&nbsp;2</th>
              <td>옷</td>
              <td>paf</td>
              <td>권마유시</td>
              <td><button class="btn btn-primary" type="button">답변하기</button></td>
            </tr>
            <tr>
              <th scope="row">&nbsp;3</th>
              <td>술이나 마시던가</td>
              <td>뭐시여</td>
              <td>권마유시</td>
              <td><button class="btn btn-primary" type="button">답변하기</button></td>
            </tr>
            <tr>
              <th scope="row">&nbsp;4</th>
              <td>술이나 마시던가</td>
              <td>뭐시여</td>
              <td>권마유시</td>
              <td><button class="btn btn-primary" type="button">답변하기</button></td>
            </tr>
            <tr>
              <th scope="row">&nbsp;5</th>
              <td>술이나 마시던가</td>
              <td>뭐시여</td>
              <td>권마유시</td>
              <td><button class="btn btn-primary" type="button">답변하기</button></td>
            </tr>
          </tbody>
        </table>
        <div class="shadow p-3 mb-5 bg-body rounded" id="myForm">
          <form action="result.html" method="post">
          <fieldset>
              <h1><br>&nbsp;&nbsp;&nbsp;&nbsp;문의 답변</h1>
              <div class="textForm">
                <textarea name="joinInfo" class="joinInfo" placeholder="문의 내용"></textarea>
              </div>
              <br>
              <div class="textForm">
                <textarea name="joinInfo" class="joinInfo" placeholder="답변 내용"></textarea>
              </div>
              <br>
              
              <button type="button" class="btn cancel btn-primary btn-lg right">Close</button>
              
              <button type="submit" class="btn btn-primary btn-lg right">제출</button>
              
            </fieldset>
            </form>
          </div>
        </main>
      </div>
      </div>

      

    <script>
      $(document).ready(function(){
          $('#myForm').hide();
      });
    
      $('.btn').click(function(){
          $('#myForm').show();
      });
    
      $('label').css('display','inline-block');

      $('button').click(function(){
      $('#myForm').css('display', 'block');
        });

      $('.cancel').click(function(){
        $('#myForm').hide();
        });
  </script>

    
    <script src="../assets/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js" integrity="sha384-uO3SXW5IuS1ZpFPKugNNWqTZRRglnUJK6UAZ/gxOX80nxEkN9NcGZTftn6RzhGWE" crossorigin="anonymous"></script><script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js" integrity="sha384-zNy6FEbO50N+Cg5wap8IKA4M/ZnLJgzc6w2NqACZaK0u0FXfOWRRJOnQtpZun8ha" crossorigin="anonymous"></script><script src="dashboard.js"></script>
    </body>
  </html>
