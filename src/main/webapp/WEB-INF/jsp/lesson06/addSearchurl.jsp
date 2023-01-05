<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>즐겨 찾기 추가</title>
	
	<!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 

    <!-- bootstrap CDN link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	
</head>
<body>
	<div class="container">
		<h1>즐겨 찾기 추가하기</h1>
		<div class="pb-3">
			<label for="name">제목</label>
			<input type="text" class="form-control mb-2" id="name" name="name">
		</div>
		<div class="pb-3">
			<label for="url">주소</label>
			<input type="text" class="form-control mb-2" id="url" name="url">
		</div>
		
		<!-- AJAX 버튼(submit 쓰면 안 됨) -->
		<input type="button" id="join" class="btn btn-success w-100" value="추가">
	</div>
	
	<script>
		$(document).ready(function(){
			$('#join').on('click',function(){
				
				// validation
				let name = $('#name').val().trim();
				if(name.length == ''){
					alert("제목을 입력하세요");
					return;
				}

				let url = $('#url').val().trim();
				if(url.length < 1){
					alert("주소를 입력하세요");
					return;
				}
				if(!(url.startsWith("http://") || url.startsWith("https://"))){
					alert("http 또는 https 프로토콜을 입력하세요");
					return;
				}
				
				// AJAX
				$.ajax({
					// Request
					type:"POST"
					, url:"/lesson06/add_searchurl"
					,data:{"name":name, "url":url}
					
					// Response
					, success:function(data){
						alert(data);
						
						// 화면 이동
						location.href="/lesson06/after_add_searchurl_view";
					}
					/* , complete:function(data){
						alert("완료");
					} */
					, error:function(e){
						alert("에러");
					}
				});
			});
		});
	</script>
</body>
</html>