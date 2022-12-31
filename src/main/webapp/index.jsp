<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:set value="${ pageContext.servletContext.contextPath }" var="contextPath" scope="application"></c:set>
	<button type="button" id="goHome" onclick="location.href='${ contextPath }/home.do'" style="display: none;"></button>
	<script type="text/javascript">
		window.onload=()=> {
			document.getElementById('goHome').click();
		}
	</script>
</body>
</html>