<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="h-100">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">

</head>
<body class="d-flex h-100 text-center text-bg-dark">
	<div class="cover-container d-flex w-100 h-100 p-3 mx-auto flex-column">
		<header class="mb-auto"></header>
<!--${ requestScope['jave.servlet.error.message'] }  -->
		<main class="px-3">
			<h1>정상 동작하지 못했습니다.</h1>
			<!-- <p class="lead">${ msg }</p>  -->
    		<p class="lead">${ requestScope['javax.servlet.error.message'] }</p>
    		<br>
		    <p class="lead">
		    	<a href="${ contextPath}/home.do"  class="btn btn-lg  fw-bold border-white bg-white">GO TO HOME</a>
		    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    	<a href="javascript:history.back();" class="btn btn-lg  fw-bold border-white bg-white">GO TO BACK</a>
		    </p>
		</main>

		<footer class="mt-auto text-white-50"></footer>
	</div>
</body>
</html>
