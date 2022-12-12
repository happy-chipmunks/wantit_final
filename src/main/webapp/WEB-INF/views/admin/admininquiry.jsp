<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<style>
	
		@font-face {
	    font-family: 'MICEGothic Bold';
	    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2') format('woff2');
	    font-weight: 700;
	    font-style: normal;
		}
	#writeDiv{
		 margin: auto; padding: 50px; min-height: 800px;
		/* position: absolute; left:0; right:0; top:0; bottom:0; margin:auto;  */
		border: 1px solid black;
	}
	table{
		border: 4px solid lightgray;
	}
	th{
		width: 15%;
		text-align: center; 
		vertical-align: middle;
	}
	hr{
		width: 50%; margin-left: auto; margin-right: auto;
		vertical-align: middle;
	}
	#writeImgDiv, #writeMapDiv{
		border: 1px solid black; margin-top: 100px;
		min-height: 400px; width: 600px;
	}
	td{text-align:left;}
	.text1{ align:left; width:300px; height:30px;}
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
	
	
	
</style>
</head>
<body>

	<div class="container text-center" id="writeDiv" style="background-color: #E6E6FA;" >
		<h2>문의 등록</h2>
		<hr>
		<form action="${contextPath}/" id="form" enctype="multipart/form-data" method="post" >
			
        <div align="left">
        	<label for="select-id">문의접수 하실 내용을 선택해주세요</label><br>
			<select name="inquirycontent" id="select-id" style="width:1000px;height:50px;">
			  <option value="A">A</option>
			  <option value="B">B</option>
			  <option value="C">C</option>
			  <option value="D">D</option>
			</select>
			<br><br>
			<div align="left">
			<label for="email">이메일 주소</label><br>
			<input type="text" id="email" name="email" style="width:1000px;height:50px;">
			</div>
			<br>
			<div align="left">
				<label for="inquirer">문의자 유형</label><br>
				<select name="inquirer1" id="inquirer"  style="width:1000px;height:50px;" >
				 <option>A</option>
				 <option>B</option>
				 <option>C</option>
				</select>
				<br>
				<br>
			<div>
				<label for="content">내용</label><br>
				<textarea rows="20px;" cols="132px;" id="content" name="content" style="resize: none;"></textarea>	
			</div>
			</div>
        </div>   
           
			<br><br>
			
			<br><br>
			
			<button class="w-btn-gra1" id="submitButton">제출</button>
		</form>
	</div>	

	
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		
 	</script>
</body>
</html>