<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<style>
    .ttable1 {
		
        margin: auto;
		margin-top: 50px;
        width:400px;
	}
    .ttable {
		display: grid;
        margin: auto;
		margin-top: 50px;
		padding: 40px;
        align-items: center;
        justify-content: center;
		width:800px;
	}
    .tttable {
        display: grid;
		margin: auto;
        align-items: center;
        justify-content: center;
        
		padding: 40px;
		width:700px;
	}
    @font-face {
          font-family: 'NanumSquareNeo-Variable';
          src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.0/NanumSquareNeo-Variable.woff2') format('woff2');
          font-weight: normal;
          font-style: normal;
      }
    *{font-family: 'NanumSquareNeo-Variable';}

.kane{
    border: 0;
    outline: 0;
}
.login-warn{
 margin-top: 30px;
 text-align: center;
 color : red;
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>

	 <a class="ttable" href="${ contextPath }/home.do">
		<img alt="" src="${ contextPath }/resources/cateImage/wantitLogo.png" style="width:300px;">
	</a>  
    <h2 class="ttable" style="color: black; font-weight: bold;">
    로그인</h2>
    <form action="${contextPath}/login.me" method="POST" id="frmLogin" name="loginForm">
    <div class="tttable">
        <div class="input-group mb-3">
            <div class="form-floating">
              <input type="text" class="form-control" id="floatingInputGroup1" name="memberId" placeholder="Username">
              <label for="floatingInputGroup1">아이디 입력</label>
            </div>
        </div>
        <div class="input-group mb-3">
            <div class="form-floating">
              <input type="password" class="form-control" id="floatingInputGroup2" name="memberPwd" placeholder="Username" onkeyup="enterkey();">
              <label for="floatingInputGroup1">비밀번호 입력</label>
            </div>
        </div>
        <input type="hidden" name="beforeURL">
        <br>
        <button type="button" class="btn btn-primary" id="submit1" onclick="loginCheck()">
            <span>
                <span class="">로그인</span>
            </span>
        </button>
        </form>
        <c:if test = "${msg != null}">
        <div class="login-warn" id="reset1">${msg}</div>
        </c:if>
        <br>
        <div>
        <button type="button" class="btn btn-primary" style="width: 150px; text-align: center; display: inline-block;"
        onclick="location.href='${contextPath}/checkId.me'">아이디찾기</button>
        <button type="button" class="btn btn-primary" style="width: 150px; text-align: center; display: inline-block;"
        onclick="location.href='${contextPath}/checkPwd.me'">비밀번호찾기</button>
        </div>
         
         
        <br>
        <div>
            &nbsp;&nbsp;&nbsp;  아직 회원이 아니신가요?
        <button type="button" class="btn btn-link" onclick="location.href='${contextPath}/memberenroll.me'">회원가입하기</button>
        </div>									   	
    </div>
    
    <div class="h4 pb-2 mb-4 text-danger border-bottom" style="color: lightgray;"></div>

    <div class="ttable">
        <button class="kane" type="button" style="width: 400px; height: 50px; background-color: rgb(235, 235, 39);">
            <span style="font-weight: bold;">카카오로 시작하기</span>
        </button>
        <br>
        <button class="kane"   type="button" style="width: 400px; height: 50px; background-color: rgb(20, 199, 20); color:#fff;">
            <span style="font-weight: bold;">네이버로 시작하기</span>
        </button>
        <br>
        <button class="kane"   type="button" style="width: 400px; height: 50px; background-color: rgb(133, 182, 245); color:#fff;">
            <span style="font-weight: bold;">구글로 시작하기</span>
        </button>
    </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
    <!--  model  -->
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Modal title</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>
    <script type="text/javascript">
    
		function reset2(){
			
		}
		
    
    
    
    
    
    
     function loginCheck(){
    	let loginForm = document.loginForm;
    	let mb_id = document.getElementById('floatingInputGroup1').value;
    	let mb_pwd = document.getElementById('floatingInputGroup2').value;
    	
    	
    	
    	
    	if(mb_id == "" || mb_id == null){
    		alert("아이디를 입력해주세요.");
    	} else if (mb_pwd == "" || mb_pwd == null){
    		alert("비밀번호를 입력해주세요.");
    	} else {
    		loginForm.submit();
    	}
    		
    		 
    }
    
     
     // 엔터하면 로그인
     function enterkey() { // keyup하면 function 작동
         if (window.event.keyCode == 13) {
        	 loginForm.submit(); // 엔터키가 눌렸을 때 실행할 내용
         }
 	 }
       
   
    
    
    /* document.getElementById('loginForm').addEventListener('click',function(){
    if('${msg}' == null)
        alert("사용자ID 또는 비밀번호가 존재하지않습니다.");
    )}; */
    
    </script>
   
</body>
</html>
