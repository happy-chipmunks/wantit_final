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

#emailcheck{display: none;}

input[type=password] 
{
    border : 2px solid skyblue;
    border-radius : 5px;
}

</style>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/i18n/defaults-ko_KR.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.13.18/dist/css/bootstrap-select.min.css">
	
	<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</head>
<body>
    <h2 class="ttable" style="color: black; font-weight: bold;">WANTIT</h2>
    
    <h3 style="text-align: center;">비밀번호 재설정</h3><br>
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    <strong>비밀번호 찾기</strong>
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    &emsp;&emsp;&emsp;&emsp;&nbsp;
    <strong>01. 아이디 입력>02. 본인 확인>03. 비밀번호 재설정</strong>
    <hr>
    <form action="${contextPath}/checkpwdfinal1.me" method="POST" id="findfrom" name="findfrom">
    <div class="tttable" style="border:2px solid #D3D3D3;">
    	<div style="border:1px solid black width: 500px;">
    	<strong>비밀번호를 변경해주세요!!</strong>
    	<hr>
         <div>
            <div style=" width: 580px; height: 300px;">
              <br>
               <div class="form-floating" style="border:1px solid #D3D3D3; height:260px;">
               <br>
             <br>
              &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
              <span class="successPhoneChk" style="text-align: center;"> 새 비밀번호 입력후 확인버튼을 눌러주세요.</span><br>   
              <br>
              <div class="mail_check_wrap">
              &emsp;&emsp;&emsp;&emsp;&emsp;&ensp;&emsp;
               새 비밀번호 : <input type="password" id="changepwd1" name="changepwd1" placeholder="새 비밀번호를 입력해주세요.">
              </div>
              <div>
              <div>
   				<br>
              	&emsp;&emsp;&emsp;&ensp;&ensp;  새 비밀번호 확인 : <input type="password" id="changepwd2" name="memberPwd" class="pw">
			<button type="button" class="btn btn-primary" id="checkrepwd">
				<span>
					<span id="checkrepwd" class="doubleChk2" >확인</span>
				</span>
			</button>
			&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
              	<font id = "checkPw" size = "3"></font>
			</div>
			  </div>
              </div> 
            </div>
        </div>
        </div> 
         <br>
        <button type="submit" class="btn btn-primary" id="submit1" disabled="disabled">   
            <span>
                <span class="">비밀번호 변경</span>
            </span>
        </button>
        <input type="hidden" value="${memberId}" name="memberId"> 
        </div>
        
        </form>
        <br>
        <br>
        <div style="text-align: center;">
            &nbsp;&nbsp;&nbsp;  아이디가 기억나지 않는다면?
         <button type="button" class="btn btn-link" onclick="location.href='${contextPath}/checkId.me'"
         style=" text-align: center">아이디 찾기</button>   
        </div>									   	
    
    <br><br><br>
   
    
    <div class="h4 pb-2 mb-4 text-danger border-bottom" style="color: lightgray;"></div>

    
    
   <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
   <script>

	 //비밀번호 확인
	  $('#checkrepwd').click(function(){
	    	let pass1 = $("#changepwd1").val();
	        let pass2 = $("#changepwd2").val();
	        
	        if (pass1 != "" || pass2 != ""){
	        	if (pass1 == pass2){
	            	$("#checkPw").html('비밀번호가 일치합니다.');
	            	$("#checkPw").attr('color','green');
	            	$("#submit1").attr("disabled",false);
	            } else {
	            	$("#checkPw").html('비밀번호가 일치하지않습니다.');
	                $("#checkPw").attr('color','red');
	            }
	        }
	    
	    })
	 
	
   		
   
  </script> 
</body>
</html>
