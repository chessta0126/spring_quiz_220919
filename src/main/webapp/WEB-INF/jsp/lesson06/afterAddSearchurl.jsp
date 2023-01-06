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
						<%-- 반복문을 돌고 있기 때문에, 유일한 id를 부여할 수 없다. class나 name으로 버튼 이름 설정 --%>
						<td>
							<%-- 1) name 속성 + value 속성 삭제 --%>
							<%-- <button type="button" value="${searchUrl.id}" name="deleteUrlBtn" class="btn btn-danger">삭제</button> --%>

							<%-- 2) data를 이용해서 태그에 임시 저장(data-이름에 대문자 못 들어감) --%>
							<%-- j-Query 사용 시 권장하는 방법 --%>
							<button type="button" class="btn btn-danger deleteUrlBtn" data-searchUrl-id="${searchUrl.id}">삭제</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
	<script>
		$(document).ready(function(){
			// 1) name 속성 + value 속성 삭제
			/* $('button[name=deleteUrlBtn]').on('click',function(e){
				// let id = $(this).val(); // 방금 클릭한 거 : $(this)
				// let id = $(this).attr('value');
				let id = e.target.value;
				alert(id);
			}); */
			
			// 2) data를 이용해서 태그에 임시 저장
			// 태그 : data-searchUrl-id     data-이름지정(대문자 불가)
			// 스크립트 : $(this).data('searchUrl-id');
			$('.deleteUrlBtn').on('click',function(){
				let id = $(this).data('searchUrl-id');
			});
			
			// AJAX
			$.ajax({
				// Request
				type:"delete"
				,url:"/lesson06/quiz02/delete_Url"
				,data:{"id":id}
			
			// Response
			, success:function(data){
				if(data.code == 1){
					// 성공
					// location.href="" // 다시 새로고침 되므로 화면이 위로 올라가버림
					document.location.reload(true); // 화면이 그대로인 상태에서 새로고침
				} else if(data.code == 500){
					// 에러
					alert(data.error_message);
				}
			}
			, error:function(e){
				alert("에러" + e);
			}
		});
	</script>
</body>
</html>