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
        background-color: lightgray;
		    display: grid;
        margin: auto;
		    margin-top: 50px;
		    padding: 40px;
        align-items: center;
        justify-content: center;
		    width: 100%;
    	}
      .form-floating{
        margin-left: 30px;
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
        width: 100px;
        height: 100px;
        background-color: #cbcbcb;
        text-align: center;
        line-height: 100px;
      }

      .btnWrap{width:100%;}

      .right{
        float: right;
        margin-right: 400px;
        margin-left: 100px;
        line-height: 50px;
        text-align: center;
        border-radius: 20px;  
        width: 150px;
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
  .image-box {
    width:400px;
    height:250px;
    overflow:hidden;
    margin:0 auto;
    float: left;
    margin-left: 25px;
}

.image-thumbnail {
    width:100%;
    height:100%;
    object-fit:cover;
}
.content{
	float: right;
	width: 700px;
	height: 250px;
	margin-right: 200px;
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
        <h1 class="h2">프로젝트 관리</h1>
        
      </div>
      <table class="table" style="height: auto;">
        <thead>
          <tr>
            <th scope="col">번호</th>
            <th scope="col">아이디</th>
            <th scope="col">프로젝트 명</th>
            <th scope="col">구분</th>
            <th scope="col">상태</th>
            <th scope="col">결과</th>
          </tr>
        </thead>
        <tbody class="table-group-divider">
          <tr>
            <th scope="row">&nbsp;1</th>
            <td>user01</td>
            <td>벽돌해피푸드 마라샹궈</td>
            <td>원팅</td>
            <td>승인대기</td>
            <td><button class="btn btn-primary" type="button">미처리</button></td>
            
          </tr>
          <tr>
            <th scope="row">&nbsp;2</th>
            <td>user01</td>
            <td>벽돌해피푸드 마라샹궈</td>
            <td>프로젝트</td>
            <td>완료</td>
            <td>처리완료</td>
            
          </tr>
          <tr>
            <th scope="row">&nbsp;3</th>
            <td>user01</td>
            <td>벽돌해피푸드 마라샹궈</td>
            <td>원팅</td>
            <td>승인대기</td>
            <td>처리완료</td>
            
          </tr>
          <tr>
            <th scope="row">&nbsp;4</th>
            <td>user01</td>
            <td>벽돌해피푸드 마라샹궈</td>
            <td>원팅</td>
            <td>승인대기</td>
            <td><button class="btn btn-primary" type="button">미처리</button></td>
            
          </tr>
          <tr>
            <th scope="row">&nbsp;5</th>
            <td>user01</td>
            <td>벽돌해피푸드 마라샹궈</td>
            <td>원팅</td>
            <td>승인대기</td>
            <td>처리완료</td>
            
          </tr>
        </tbody>
       </table>
       <div class="shadow p-3 mb-5 bg-body rounded" id="myForm">
        <form action="result.html" method="post">
         <fieldset>
            <h1><br>&nbsp;&nbsp;&nbsp;&nbsp;프로젝트 명</h1>
            <br>
            <div class="image-box">
				<img class="image-thumbnail">
		    </div>
		    <br>
		    <div class="content">
		    	내용 들어갈 제목<br>
		    블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라블라</div>
            
            <br>
         	
            <div class="input-group mb-3">
            
                <div class="form-floating">
                  <textarea type="text" class="form-control" id="nameInput" style="height: 100px;"></textarea>
                  <label>프로젝트 미승인 사유.. </label>
                </div>
            </div>
            <br>
            <button type="button" class="btn btn-primary btn-lg right modbtn">미승인</button>
            <button type="button" class="btn btn-primary btn-lg right modbtn">승인</button>
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
