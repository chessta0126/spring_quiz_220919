<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약 목록 보기</title>

	<!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 

    <!-- bootstrap CDN link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="/css/lesson06/style.css">
</head>
<body>
	<div class="container">
		<jsp:include page="header.jsp"/>
		<jsp:include page="menu.jsp"/>
		
		<div class="text-center">
			<h3 class="mt-3 pb-3 font-weight-bold">예약 목록 보기</h3>
			<table class="table">
				<thead>
					<th>이름</th>
					<th>예약날짜</th>
					<th>숙박일수</th>
					<th>숙박인원</th>
					<th>전화번호</th>
					<th>예약상태</th>
				</thead>
				<tbody>
					<c:forEach  begin="0" end="${fn:length(bookingList)}" step="1"
					var="books" items="${bookingList}">
					<tr>
						<td>${books.name}</td>
						<td><fmt:formatDate value="${books.date}" pattern="yyyy년 M월 d일"/></td>
						<td>${books.day}</td>
						<td>${books.headcount}</td>
						<td>${books.phoneNumber}</td>
						<td>${books.state}</td>
						<td>
							<button type="button" class="btn btn-danger">삭제</button>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<jsp:include page="footer.jsp"/>
	</div>
</body>
</html>