<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>예약 하기</title>

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
		
		<div class="pt-3 pb-3">
			<h3 class="text-center font-weight-bold">예약 하기</h3>
		</div>
		<div class="d-flex justify-content-center">
			<div>
				<div class="pb-3">
					<label for="name">이름</label>
					<input type="text" id="name" name="name" class="form-control">
				</div>
				<div class="pb-3">
					<label for="date">예약날짜</label>
					<input type="text" id="date" name="date" class="form-control">
				</div>
				<div class="pb-3">
					<label for="day">숙박일수</label>
					<input type="text" id="day" name="day" class="form-control">
				</div>
				<div class="pb-3">
					<label for="headcount">숙박인원</label>
					<input type="text" id="headcount" name="headcount" class="form-control">
				</div>
				<div class="pb-3">
					<label for="phoneNumber">전화번호</label>
					<input type="text" id="phoneNumber" name="phoneNumber" class="form-control">
				</div>
				<button type="button" id="bookingBtn" class="btn btn-warning mt-3 w-100">예약하기</button>
			</div>
		</div>
		
		<jsp:include page="footer.jsp"/>
	</div>
	
	<script>
		$(document).ready(function() {
			$('#bookingBtn').on('click', function(){
				let name = $('#name').val().trim();
				let date = $('#date').val().trim();
				let day = $('#day').val().trim();
				let headcount = $('#headcount').val().trim();
				let phoneNumber = $('#phoneNumber').val().trim();
				
				// validation check
				if(name.length < 1){
					alert("이름을 입력하세요");
					return;
				}
				if(date == ''){
					alert("예약날짜를 선택하세요");
					return;
				}
				if(day.length < 1){
					alert("숙박일수를 입력하세요");
					return;
				}
				if(headcount.length < 1){
					alert("숙박인원을 입력하세요");
					return;
				}
				if(phoneNumber.length < 1){
					alert("전화번호를 입력하세요");
					return;
				}
					
				// AJAX
				$.ajax({
					// Request
					type : "post",
					url : "/lesson06/insert_Booking",
					data : {"name" : name, "date" : date, "day" : day, "headcount" : headcount, "phoneNumber" : phoneNumber}

					// Response
					,success : function(data) {
						alert(data.code);
					},error : function(e) {
						alert("에러" + e);
					}
				});
			});
		});
	</script>
</body>
</html>