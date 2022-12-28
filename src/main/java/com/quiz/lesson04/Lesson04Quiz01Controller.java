package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {

	@Autowired
	private SellerBO sellerBO;
	
	// 입력창 주소
	// http://localhost:8080/lesson04/quiz01/1
	@RequestMapping(path="/1", method=RequestMethod.GET)
	public String addSellerView() {
		// application.properties에서 설정한 앞뒤 경로 제외하고 쓰기
		// 앞 : prefix=/WEB-INF/jsp/
		// 뒤 : suffix=.jsp
		return "lesson04/add_seller";
	}
	
	// http://localhost:8080/lesson04/quiz01/add_seller
	@PostMapping("/add_seller")
	public String addSeller(
			@RequestParam("nickname") String nickname
			,@RequestParam(value="profileImageUrl", required=false) String profileImageUrl
			,@RequestParam(value="temperature", required=false) double temperature
			) {
		
		// DB insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		return "lesson04/after_add_seller"; // 결과 jsp
	}
}
