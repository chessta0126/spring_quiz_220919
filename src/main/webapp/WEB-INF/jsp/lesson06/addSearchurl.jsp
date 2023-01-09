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
			<div class="d-flex mb-3">
				<input type="text" class="form-control mr-2" id="url" name="url">
				<button type="button" class="btn btn-info" id="urlCheckBtn">중복확인</button>
			</div>
			<small id="urlStatusArea"></small>
			<small id="duplicationText" class="text-danger d-none">중복된 url 입니다</small>
			<small id="availableText" class="text-success d-none">저장 가능한 url 입니다.</small>
		</div>
		
		<!-- AJAX 버튼(submit 쓰면 안 됨) -->
		<input type="button" id="join" class="btn btn-success w-100" value="추가">
	</div>
	
	<script>
		$(document).ready(function(){
			$('#urlCheckBtn').on('click',function(){
				// urlStatusArea의 하위 태그들 초기화
				$('#urlStatusArea').empty(); // 자식 태그들을 모두 비움
				
				// validation check
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
					type:"post"
					,url:"/lesson06/quiz02/is_duplication"
					,data:{"url":url}
					
					// Response
					, success:function(data){ // String json -> object로 자동 파싱해줌
						if(data.is_duplication == true){ // true(중복임)
							$('#urlStatusArea').append('<span class="text-danger">중복된 url 입니다</span>')
							$('#availableText').addClass("d-none");
							$('#duplicationText').removeClass("d-none");
						} else {
							$('#urlStatusArea').append('<span class="text-danger">저장 가능한 url 입니다.</span>')
							$('#duplicationText').addClass("d-none");
							$('#availableText').removeClass("d-none");
						}
					}
					, error:function(e){ // AJAX 자체가 실패
						alert("에러" + e);
					}
				});
			});
			
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
					, success:function(data){ // String json -> object로 자동 파싱해줌
						// alert(data);
						if(data.result == "성공"){
							// 화면 이동
							location.href="/lesson06/after_add_searchurl_view";
						}
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