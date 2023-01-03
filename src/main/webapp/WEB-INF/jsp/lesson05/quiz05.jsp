<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
	<div class="col-4 bg-primary">
	
	</div>
	
	<div class="col-8">
		<h3>과거 날씨</h3>
		<table class="table text-center">
			<thead>
				<th>날짜</th>
				<th>날씨</th>
				<th>기온</th>
				<th>강수량</th>
				<th>미세먼지</th>
				<th>풍속</th>
			</thead>
			<tbody>
				<c:forEach begin="0" end="14" step="1"
				var="weather" items="${weatherHistory}">
					<tr>
						<td>${weather.date}</td>
						<%-- <td>${weather.weather}</td> --%>
						<td>${weather.temperatures}</td>
						<td>${weather.precipitation}</td>
						<td>${weather.microDust}</td>
						<td>${weather.windSpeed}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>	
	</div>
</body>
</html>