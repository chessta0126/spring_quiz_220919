<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>기상청</title>

	<!-- jQuery가 datepicker 라이브러리 위에 있어야 한다. (데이터피커가 jquery를 사용하기 때문) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script> 
        
    <!-- datepicker 라이브러리 -->
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <!-- bootstrap CDN link -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="/css/lesson05/style.css">
</head>
<body>
	<div class="d-flex">
		<%-- 좌측 메뉴 --%>
		<div id="menu" class="col-2">
			<jsp:include page="menu.jsp" />
		</div>

		<%-- main content --%>
		<div class="container m-4">
			<h3 class="font-weight-bold">날씨 입력</h3>

			<form method="post" action="/lesson05/quiz05_insert">
				<div class="mt-5 ml-5 mb-4">
					<%-- 첫 줄 --%>
					<div class="d-flex justify-content-between pb-5">
						<div class="d-flex align-items-center">
							<label for="date">날짜</label>
							<input type="text" class="form-control ml-2 col-7" id="date" name="date">
						</div>

						<div class="d-flex align-items-center">
							<label for="weather">날씨</label>
							<select class="form-control ml-2 col-7" id="weather" name="weather">
								<option>맑음</option>
								<option>구름조금</option>
								<option>흐림</option>
								<option>비</option>
							</select>
						</div>

						<div class="d-flex align-items-center">
							<label for="microDust" class="mr-3">미세먼지</label>
							<select	class="form-control col-6" id="microDust" name="microDust">
								<option>좋음</option>
								<option>보통</option>
								<option>나쁨</option>
								<option>최악</option>
							</select>
						</div>
					</div>

					<%-- 둘째 줄 --%>
					<div class="d-flex justify-content-between">
						<div class="d-flex align-items-center">
							<label for="temperatures">기온</label>
							<div class="search input-group ml-2 col-9">
								<input id="temperatures" name="temperatures" type="text"
									class="form-control">
								<button class="btn btn-secondary" type="button">℃</button>
							</div>
						</div>

						<div class="d-flex align-items-center">
							<label for="precipitation" class="col-5">강수량</label>
							<div class="search input-group">
								<input id="precipitation" name="precipitation" type="text" class="form-control">
								<button class="btn btn-secondary" type="button">mm</button>
							</div>
						</div>

						<div class="d-flex align-items-center">
							<label for="windSpeed" class="col-4">풍속</label>
							<div class="search input-group">
								<input id="windSpeed" name="windSpeed" type="text" class="form-control">
								<button class="btn btn-secondary" type="button">km/h</button>
							</div>
						</div>
					</div>
				</div>

				<div class="d-flex justify-content-end">
					<button type="submit" class="btn btn-success">저장</button>
				</div>
			</form>
		</div>
	</div>

	<footer>
		<jsp:include page="footer.jsp"/>
	</footer>
	
	<script>
        $(document).ready(function(){
            // datepicker 형식
            $.datepicker.setDefaults({                    
                // 요일 표시 : 한글
                dayNamesMin:['일','월','화','수','목','금','토']
            });

            $('#date').datepicker({
                onSelect:function(dateText){
                    $('#date').datepicker('option',dateText);
                }
            });
        });
    </script>
</body>
</html>