<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
</head>
<body>
    <h2 class="ttable" style="color: black; font-weight: bold;">로그인</h2>
    <div class="tttable">
        <div class="input-group mb-3">
            <div class="form-floating">
              <input type="text" class="form-control" id="floatingInputGroup1" placeholder="Username">
              <label for="floatingInputGroup1">아이디 입력</label>
            </div>
        </div>
        <br>
        <div class="input-group mb-3">
            <div class="form-floating">
              <input type="text" class="form-control" id="floatingInputGroup1" placeholder="Username">
              <label for="floatingInputGroup1">비밀번호 입력</label>
            </div>
        </div>
        <br>
        <button type="button" class="btn btn-primary">
            <span>
                <span class="">로그인</span>
            </span>
        </button>
        <br>
        <div>
            &nbsp;&nbsp;&nbsp;  아직 회원이 아니신가요?
        <button type="button" class="btn btn-link" onclick="location.href='${contextPath}/myPage_enroll'">회원가입하기</button>
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
    
</body>
</html>