<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>기상청</title>
	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

	<link rel="stylesheet" type="text/css" href="/css/lesson05/style.css">
</head>
<body>
	<div class="d-flex">
		<%-- 좌측 메뉴 --%>
		<div id="menu" class="col-2">
			<jsp:include page="menu.jsp"/>
		</div>

		<div class="col-8 m-3">
			<h3 class="font-weight-bold">날씨 입력</h3>
			
			<form method="post" action="">
			<div class="d-flex justify-content-between m-5">
				<div class="d-flex align-items-center">
					<label for="date" class="col-3">날짜</label> <input type="text"
						class="form-control col-10" name="date">
				</div>

				<div class="d-flex align-items-center">
					<label for="weather" class="col-5">날씨</label> <select
						class="form-control" name="weather">
						<option>맑음</option>
						<option>구름조금</option>
						<option>흐림</option>
						<option>비</option>
					</select>
				</div>

				<div class="d-flex align-items-center">
					<label for="microDust" class="col-7">미세먼지</label> <select
						class="form-control col-7" name="microDust">
						<option>좋음</option>
						<option>보통</option>
						<option>나쁨</option>
						<option>최악</option>
					</select>
				</div>
			</div>
			
			<div class="d-flex justify-content-between ml-5">
				<div class="d-flex align-items-center">
					<label for="temperatures" class="col-3">기온</label>
					<div class="search input-group">
                    	<input id="temperatures" name="temperatures" type="text" class="form-control">
                    	<button class="btn btn-secondary" type="button">℃</button>
                	</div>
				</div>

				<div class="d-flex align-items-center">
					<label for="temperatures" class="col-3">강수량</label>
					<div class="search input-group">
                    	<input id="temperatures" name="temperatures" type="text" class="form-control">
                    	<button class="btn btn-secondary" type="button">mm</button>
                	</div>
				</div>

				<div class="d-flex align-items-center">
					<label for="temperatures" class="col-3">풍속</label>
					<div class="search input-group">
                    	<input id="temperatures" name="temperatures" type="text" class="form-control">
                    	<button class="btn btn-secondary" type="button">km/h</button>
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
</body>
</html>