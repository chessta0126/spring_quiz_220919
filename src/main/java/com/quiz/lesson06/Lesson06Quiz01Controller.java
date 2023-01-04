package com.quiz.lesson06;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Lesson06Quiz01Controller {
	// 즐겨찾기 추가
	// http://localhost:8080/lesson06/add_searchurl_view
	@GetMapping("/lesson06/add_searchurl_view")
	public String addSearchUrlView() {
		return "lesson06/addSearchurl";
	}

	@PostMapping("/lesson06/add_searchurl")
	public String addSearchUrl(
			@RequestParam("name") String name
			,@RequestParam("url") String url
			) {
		return "/lesson06/afterAddSearchurl";
	}
}
