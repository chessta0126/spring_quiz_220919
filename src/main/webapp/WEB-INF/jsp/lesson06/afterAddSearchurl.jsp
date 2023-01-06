<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>즐겨 찾기 목록</title>

	<!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 

    <!-- bootstrap CDN link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 목록</h1>
		<table class="table text-center">
			<thead>
				<th>No.</th>
				<th>이름</th>
				<th>주소</th>
			</thead>
			<tbody>
				<c:forEach begin="0" end="${fn:length(searchUrlList)}" step="1" var="searchUrl"
					items="${searchUrlList}" varStatus="status">
					<tr>
						<td>${status.count}</td>
						<%-- <td>${searchUrl.id}</td> --%>
						<td>${searchUrl.name}</td>
						<td><a href="${searchUrl.url}" target="_blank">${searchUrl.url}</a></td>
						<c:set var="certainUrl" value="${searchUrl.url}"/>
						<td><button type="button" value="${certainUrl}" class="btn btn-danger deleteUrlBtn">삭제</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		$(document).ready(function(){
			$('.deleteUrlBtn').on('click',function(){
				let deleteUrl = "";
				
				for(let searchUrl : ${searchUrlList}){
					if($('.deleteUrlBtn').val().equals(searchUrl.url)){
						deleteUrl = $('.deleteUrlBtn').val();
					}
				}
				
				// AJAX
				$.ajax({
					// Request
					type:"GET"
					,url:"/lesson06/quiz02/delete_Url"
					,data:{"deleteUrl":deleteUrl}
					
					// Response
					, success:function(data){ // String json -> object로 자동 파싱해줌
					}
					, error:function(e){
						alert("에러");
					}
				});
			});
		});
	</script>
</body>
</html>