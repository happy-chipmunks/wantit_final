<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>creatorApproval</title>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<!-- Bootstrap v5.1.3 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
	<table class="table">
		<tr>
			<th></th>
			<th>크리에이터 아이디</th>
			<th>사업자 등록증</th>
			<th>사업자 등록번호</th>
			<th>대표자 명</th>
			<th>대표자 전화번호</th>
			<th>대표자 이메일</th>
			<th>크리에이터 명</th>
			<th>승인 여부</th>
		</tr>
		<%-- <c:forEach items="${ cList }" var="c">
			<tr>
				<td>${ c.creatorNum }</td>
				<td>${ c.creator }</td>
				<td><button class="btn btn-primary" onclick="openPic(${c.businessFileName}, ${ contextPath })">확인</button></td>
				<td>${ c.businessNumber }</td>
				<td>${ c.managerName }</td>
				<td>${ c.managerPhone }</td>
				<td>${ c.managerEmail }</td>
				<td>${ c.creatorName }</td>
				<td></td>
			</tr>
		</c:forEach> --%>
		<c:forEach items="${ cList }" var="c">
			<tr>
				<td>${ c.creatorNum }</td>
				<td>${ c.creator }</td>
				<td><button class="btn btn-primary check" value="${ c.businessFileName }" onclick="$('#businessLicense').modal('show');">확인</button></td>
				<td>${ c.businessNumber }</td>
				<td>${ c.managerName }</td>
				<td>${ c.managerPhone }</td>
				<td>${ c.managerEmail }</td>
				<td>${ c.creatorName }</td>
				<td></td>
			</tr>
		</c:forEach>
	</table>
	
	<!-- Modal -->
		<div class="modal fade" id="businessLicense" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body" style="text-align: center;">
				<img id="img" alt="이미지가 없습니다."> 
		      </div>
		    </div>
		  </div>
		</div>
	
	<script>
		/* function openPic(fileName, contextPath){
			var name = contextPath + "/resources/funding/" + fileName;
			console.log(name);
			$('#img').attr('src', name);
			$('#businessLicense').modal('show');
		} */
		
		function getContextPath(){
			var hostIndex = location.href.indexOf(location.host) + location.host.length;
			return location.href.substring(hostIndex, location.href.indexOf('/', hostIndex + 1));
		}
		
		$('.check').on('click', function(){
			const name = $('.check').val();
			var contextPath = getContextPath();
			var src = contextPath + "/resources/member/" + name;
			
			console.log(src);
			console.log(contextPath);
			/* console.log(getContextPath()); */
			
			$('#img').attr('src', src);
			console.log($('#img').val());
		});
		
	</script>
</body>
</html>