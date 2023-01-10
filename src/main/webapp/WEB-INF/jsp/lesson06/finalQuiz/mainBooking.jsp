<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    
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
		
		<section>
			<!-- 메인 이미지 -->
    	    <div>
    	        <img src="/img/lesson06/test06_banner1.jpg" alt="main_img" id="img1" class="w-100" height="450">
    	        <img src="/img/lesson06/test06_banner2.jpg" alt="main_img" id="img2" class="w-100 d-none" height="450">
   	 	        <img src="/img/lesson06/test06_banner3.jpg" alt="main_img" id="img3" class="w-100 d-none" height="450">
    	        <img src="/img/lesson06/test06_banner4.jpg" alt="main_img"  id="img4"class="w-100 d-none" height="450">
        	</div>
        
        	<div class="book d-flex">
                <!-- 실시간 예약하기 -->
                <article class="article1 h-100 col-3 d-flex justify-content-center align-items-center">
                    <div class="article1-text">
                        <span>실시간</span><br>
                        <span>예약 하기</span>
                    </div>
                </article>

                <!-- 예약 확인 -->
                <article class="article2 h-100 col-6 article2-text d-flex justify-content-center align-items-center">
                    <div class="mt-4 w-75">
                        <!-- 첫 줄 -->
                        <div class="pb-3 d-flex align-items-center">
                            <h4 class="pr-3">예약 확인</h4>
                        </div>

                        <div>
                            <p class="d-flex justify-content-center align-items-center">
                                <span class="col-4">이름 :</span>
                                <input type="text" id="name" name="name" class="form-control">
                            </p>
                            <p class="d-flex align-items-center">
                                <span class="col-4">전화번호 :</span>
                                <input type="text" id="phoneNumber" name="phoneNumber" class="form-control">
                            </p>
                        </div>
                        <div class="d-flex justify-content-end">
                            <button type="button" id="confirmBtn" class="btn btn-success">조회 하기</button>
                        </div>
                    </div>
                </article>
                
                <!-- 예약 문의 전화번호 -->
                <article class="article3 h-100 col-3 d-flex justify-content-center align-items-center">
                    <div class="article3-text">
                        <div class="font-weight-light">예약문의:</div>
                        <span>010-</span><br>
                        <span>0000-1111</span>
                    </div>
                </article>
            </div>
    	</section>
    	
    	<jsp:include page="footer.jsp"/>
    </div>
    
    <script>
        $(document).ready(function(){
            // 메인이미지 3초마다 순환 : setInterval
            let img = [$('#img1'),$('#img2'),$('#img3'),$('#img4')];
            setInterval(function(){
                for(let i = 0; i < img.length; i++){
                    if(img[i].is(":visible")){
                        img[i].addClass("d-none");
                        if(i == img.length-1){
                            img[0].removeClass("d-none");
                        } else{
                            img[i+1].removeClass("d-none");
                            // 안 끊어주면 로직이 계속 실행됨. (다음 사진이 visible로 바뀌고 처음으로 돌아가기 때문에 계속 true가 되고, 사진이 쭉 넘어가서 맨 끝 사진만 보여주고 끝난다.)
                            // -> 여기서는 다시 처음으로 돌아오게 해놨기 때문에 맨 끝 사진으로 끝나는 것이 아니라 무한루프를 실행한다.
                            // 변하지 않는 것처럼 보이지만 무한히 실행되고 있는 중
                            // -> break;로 function 완료 후 3000이 적용되고, setInterval에 의해 다시 for이 시작되는 것이다.
                            break;
                        }
                    }
                }
            }, 3000);
                    
            $("#confirmBtn").on("click",function(){
                let name = $('#name').val().trim();
                let phoneNumber = $('#phoneNumber').val().trim(); 

				if(name.length < 1){
					alert("이름을 입력하세요");
					return;
				}
				if(phoneNumber.length < 1){
					alert("전화번호를 입력하세요");
					return;
				}
                
				// 전화번호 010으로 시작하도록 제한
				if($('#phoneNumber').val().substring(0,3) !="010"){
					alert("010 으로 시작하는 번호만 입력 가능합니다.");
					return;
				}

				// AJAX
				$.ajax({
					// Request
					type : "POST",
					url : "/lesson06/finalQuiz_getBooking",
					data : {"name" : name, "phoneNumber" : phoneNumber}

					// Response
					,success : function(data) {
						if(data.code == 1){ // 조회된 내역이 있을 때
							let message = "이름 : " + data.confirmBooking.name
							+ "\n 날짜 : " + data.confirmBooking.date.slice(0,10)
							+ "\n 일수 : " + data.confirmBooking.day
							+ "\n 인원 : " + data.confirmBooking.headcount
							+ "\n 상태 : " + data.confirmBooking.state;
							alert(message);
						} else{ // 조회된 내역이 없을 때 + error
							alert("예약 내역이 없습니다.");
						}
					},error : function(e) {
						alert("조회에 실패했습니다.");
					}
				});
            });
        });
    </script>
</body>
</html>