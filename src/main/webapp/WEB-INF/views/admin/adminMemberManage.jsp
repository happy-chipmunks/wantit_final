<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>

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
          /* 섹션 크기 */
          .bg-light{
            
            padding-bottom:75px;
        }
        .flex-fill.mx-xl-5.mb-2{
            margin: 0 auto;
            width : 700px; 	
            padding-right: 7rem;
            padding-left: 7rem;
        }
        /* 입력창 */
        .container.py-4{
            margin: 0 auto;
            width : 503px;
        }
        /* 가입하기 */
        .d-grid.gap-2{
            padding-top: 30px;
        }
        
        #homehref {
        	text-decoration: none;
        	display: inline;
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
      <div class="position" style="height:700px;">
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
    <h1 class="h2">회원관리</h1>
    
  </div>
  <table class="table">
    <thead>
      <tr>
        <th scope="col">회원번호</th>
        <th scope="col">회원명</th>
        <th scope="col">아이디</th>
        <th scope="col">닉네임</th>
        <th scope="col">주소</th>
        <th scope="col">핸드폰번호</th>
        <th scope="col">회원상태</th>

      </tr>
    </thead>
    <tbody class="table-group-divider">
      <tr>
        <th scope="row">&nbsp;1</th>
        <td>권진환존잘</td>
        <td>user01</td>
        
        <td>존잘권진환</td>
        <td>경기도 과천시 향교말길8 123동 902호</td>
        <td>010-9009-2936</td>
       
        <td><button class="btn btn-primary" type="button">관리</button></td>
      </tr>
      <tr>
        <th scope="row">&nbsp;1</th>
        <td>권진환존잘</td>
        <td>user01</td>
        
        <td>존잘권진환</td>
        <td>경기도 과천시 향교말길8 123동 902호</td>
        <td>010-9009-2936</td>
               
        <td><button class="btn btn-primary" type="button">관리</button></td>
      </tr>
      <tr>
        <th scope="row">&nbsp;1</th>
        <td>권진환존잘</td>
        <td>user01</td>
        
        <td>존잘권진환</td>
        <td>경기도 과천시 향교말길8 123동 902호</td>
        <td>010-9009-2936</td>
        
        <td><button class="btn btn-primary" type="button">관리</button></td>
      </tr>
      <tr>
        <th scope="row">&nbsp;1</th>
        <td>권진환존잘</td>
        <td>user01</td>
        
        <td>존잘권진환</td>
        <td>경기도 과천시 향교말길8 123동 902호</td>
        <td>010-9009-2936</td>
        
        <td><button class="btn btn-primary" type="button">관리</button></td>
      </tr>
      <tr>
        <th scope="row">&nbsp;1</th>
        <td>권진환존잘</td>
        <td>user01</td>
        
        <td>존잘권진환</td>
        <td>경기도 과천시 향교말길8 123동 902호</td>
        <td>010-9009-2936</td>
        
        <td><button class="btn btn-primary" type="button">관리</button></td>
      </tr>
    </tbody>
  </table>
  
    <div class="container py-4" id="myForm">
        <div class="row align-items-center justify-content-between">
            <a class="navbar-brand h1 text-center" href="home.do">
                <span class = "text-dark h4"> 회원 정보 관리</span>                 
            </a>
        </div>
        <form action = "${ contextPath }/update.me" method = "POST">
            <div class="form-group">
                   <label for="id" class="form-label mt-4">아이디</label>
                <input type="text" class="form-control" id="id" name = "id" value = "${ loginUser.id }" readonly>
                <font id = "idMsg" size = "2"></font>
            </div>
            <div class="form-group">
                   <label for="exampleInputEmail1" class="form-label mt-4">이름</label>
                   <input type="text" class="form-control" id="name" aria-describedby="emailHelp" name = "name" value = "${ loginUser.name }">
            </div>
            <div class="form-group">
                <label for="exampleInputEmail1" class="form-label mt-4">닉네임</label>
                <input type="text" class="form-control" id="nickName" aria-describedby="emailHelp" name = "nickName" value = "${ loginUser.nickName }">
            </div>
            <div class="form-group">
                   <label for="exampleInputEmail1" class="form-label mt-4">핸드폰 번호</label>
                    <input type="text" class="form-control" id="phone" aria-describedby="emailHelp" name = "phone" value = "${ loginUser.phone }">
            </div>
            
            <div class="form-group">
	           <label for="addressInput1" class="form-label mt-4">주소</label>
	           <input type="text" class="form-control" id="addressInput1">
	              
	        </div>
	        
	        <div class="form-group">
               <label for="addressInput2" class="form-label mt-4">상세주소</label>
	           <input type="text" class="form-control" id="addressInput2" >
	             
	        </div>
        	
            <div class="form-group">
                <label for="exampleInputEmail1" class="form-label mt-4">본인 확인 이메일</label>
                <input type="email" class="form-control" id="email" aria-describedby="emailHelp" placeholder="선택입력" name = "email" value = "${ loginUser.email }">
            </div>
           
            <div class="form-group">
              <label for="exampleSelect1" class="form-label mt-4">성별</label>
              <select class="form-select" id="gender" name = "gender">
                <option value = "M" <c:if test = "${ loginUser.gender == 'M' }">selected</c:if>>남자</option>
                <option value = "F" <c:if test = "${ loginUser.gender == 'F' }">selected</c:if>>여자</option>
              </select>
            </div>                
            
            <div class="d-grid gap-2">
                <button class="btn btn-primary btn-lg" type="submit">수정하기</button>
                <button type="button" class="btn cancel btn-primary btn-lg">Close</button>
            </div>

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
