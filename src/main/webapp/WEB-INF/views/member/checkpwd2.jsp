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

input[type=text] 
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
    
    <h3 style="text-align: center;">본인 확인</h3><br>
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    <strong>비밀번호 찾기</strong>
    &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
    &emsp;&emsp;&emsp;&emsp;&nbsp;
    <strong>01. 아이디 입력>02. 본인 확인>03. 비밀번호 재설정</strong>
    <hr>
    <form action="${contextPath}/checkpwdfinal.me" method="POST" id="findfrom" name="findfrom">
    <div class="tttable" style="border:2px solid #D3D3D3;">
    	<div style="border:1px solid black width: 500px;">
    	<strong>이메일로 비밀번호를 찾아주세요!!</strong>
    	<hr>
         <div>
            <div style=" width: 580px; height: 350px;">
            <div>
              <input type="radio"  id="checkemail" name="checkemail" onclick="setDisplay()">
              <label for="checkemail" id="label">본인확인 이메일로 인증</label>
              <label for="label" id="label2">(${findPwdone.memberEmail})</label><br>
              <strong>본인확인 이메일 주소와 입력한 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.</strong>
              </div>
              <hr>
              <br>
               <div id="emailcheck" class="form-floating" style="border:1px solid #D3D3D3; height:260px;">
               <br>
               &emsp;이름&emsp;&emsp;&emsp;&ensp;<input type="text" id="name" name="name"><br>
              <br>
              &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;   
              <input type="hidden" value="${ findPwdone.memberId}" name="memberId">
              <span class="successPhoneChk">이메일 입력후 인증번호 받기를 해주십시오</span><br>
              <div class="mail_check_wrap">
              &emsp;이메일 주소 <input type="text" id="email" name="email">
              <button type="button" class="btn btn-primary">
                <span>
                    <span id="phoneChk"  class="doubleChk">인증번호 전송</span>
                </span>
              </button>
              </div>
              <br>
              <div>
              <div>
              	&emsp;&emsp;&emsp;&emsp;&ensp;&ensp;&ensp;&ensp;&ensp;<input type="text" id="emailcheckdoble" name="emailcheckdoble" placeholder="인증번호를 입력해주세요">
			  
			<button type="button" class="btn btn-primary" id="checkemail4">
				<span>
					<span id="checkemail" class="doubleChk2"> 인증번호 확인</span>
				</span>
			</button>
			</div>
			  </div> 
              </div> 
            </div>
        </div>
        </div> 
         <br>
        <button type="button" class="btn btn-primary" id="submit1" onclick="checkpwdfind()" disabled="disabled">   
            <span>
                <span class="">다음</span>
            </span>
        </button> 
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
   function setDisplay(){
	   var checkoff = document.getElementById("emailcheck").style.display = 'block';
	   document.getElementById("label2").style.color="#32CD32";
	}
   
      function checkpwdfind(){
	   
	   var name_rule = /^[가-힣]{2,4}$/;
	   var email_rule =/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
	   let findfrom = document.findfrom;
   	let name = document.getElementById('name').value;
   	let email = document.getElementById('email').value;
	let emailcheck = document.getElementById('emailcheckdoble').value;
   	
   	
   	if(name == "" ||name == null){
   		alert("이름을 입력해주세요.");
   	} else if (!name_rule.test($("input[id='name']").val())){
   		alert("이름 형식에 맞게 작성해주세요.");
   	} else if( email == "" || email == null){
   		alert("이메일을 입력해주세요.");
   	} else if(!email_rule.test($("input[id='email']").val())){
   		alert("이메일 형식에 맞게 작성해주세요.");
   	}else if(emailcheck == "" || emailcheck == null){
   		alert("인증번호를 입력해주세요.");
   	}else if(name != null || email != null || emailcheck != null){
   		findfrom.submit(); 
   	}   
	   
   }
   
    var code2 = "";//인증번호발송  
	 $("#phoneChk").click(function(){
	 	var email = $("#email").val();
	 	var name = $("#name").val();
	 	$.ajax({
	         type:"GET",
	         url:"/wantit/findtwocheckPwd.me?",
	         data:{email:email, name:name},		 
	         cache : false,
	         success:function(data){
	         	if(data == "error"){
	         		alert("이름과 이메일이 올바르지 않습니다.")
	 				$(".successPhoneChk").text("이메일과 이름을 확인해주세요.");
	 				$(".successPhoneChk").css("color","red");
	 				$("#email").attr("autofocus",true);
	         	}else{
	         		alert("인증번호 발송이 완료되었습니다.\n이메일에서 인증번호 확인을 해주십시오.");
	         		$("#email").attr("disabled",false);
	         		$("#doubleChk2").css("display","inline-block");
	         		$(".successPhoneChk").text("인증번호를 입력한 뒤 인증번호확인을 눌러주십시오.");
	         		$(".successPhoneChk").css("color","green");
	         		$("#email").attr("readonly",true);
	         		code2 = data; 
   					
	         		 console.log("인증번호:"+code2);
	         		
	         		 
	         		 $("#checkemail4").click(function(){
	         			 
	         			 if($("#emailcheckdoble").val() == data){
	         				$(".successPhoneChk").text("인증번호가 일치합니다.");
	         		 		$(".successPhoneChk").css("color","green");
	         		 		$("#phoneDoubleChk").val("true");
	         		 		 $("#submit1").attr("disabled",false);
	         		 		$("#email").attr("disabled",true);
	         		 		
	         			 }else{
	         				$(".successPhoneChk").text("인증번호가 일치하지 않습니다. 확인해주시기 바랍니다.");
	         		 		$(".successPhoneChk").css("color","red");
	         		 		$("#phoneDoubleChk").val("false");
	         		 		$(this).attr("autofocus",true); 
	         			 }
	         		 });
	         	}
	         }
	     });
	 }); 
   </script> 
   
  
</body>
</html>
