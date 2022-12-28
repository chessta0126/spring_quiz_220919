package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.quiz.lesson04.bo.SellerBO;
import com.quiz.lesson04.model.Seller;

@RequestMapping("/lesson04/quiz01")
@Controller
public class Lesson04Quiz01Controller {

	@Autowired
	private SellerBO sellerBO;
	
	// 입력창 주소
	// http://localhost:8080/lesson04/quiz01/add_seller_view
	@GetMapping("/add_seller_view") // 권장
	// @RequestMapping(path="/add_seller_view", method=RequestMethod.GET)
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
			,@RequestParam(value="temperature", required=false) Double temperature // 래퍼클래스: null 가능
			) {
		
		// DB insert
		sellerBO.addSeller(nickname, profileImageUrl, temperature);
		return "lesson04/after_add_seller"; // 결과 jsp
	}
	
	// http://localhost:8080/lesson04/quiz01/seller_info?id=1
	@GetMapping("/seller_info")
	public String getLastUserView(
			@RequestParam(value="id", required=false) Integer id
			,Model model) {
		// DB select - 가장 마지막에 추가된 사람 1명 가져오기
		Seller seller = null;
		if(id==null) {
			seller = sellerBO.getLastSeller();
		} else {
			seller = sellerBO.getSellerById(id);
		}
		
		// model에 데이터를 담아놓으면, jsp에서 꺼내서 쓸 수 있다.
		model.addAttribute("seller",seller);
		model.addAttribute("title","판매자 정보");
		
		return "lesson04/getLastSeller";
	}
}
