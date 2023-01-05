package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.quiz.lesson06.BO.SearchUrlBO;
import com.quiz.lesson06.model.SearchUrl;

@Controller
public class Lesson06Quiz01Controller {
	@Autowired
	private SearchUrlBO searchUrlBO;
	
	// 즐겨찾기 추가
	// http://localhost:8080/lesson06/add_searchurl_view
	@GetMapping("/lesson06/add_searchurl_view")
	public String addSearchUrlView() {
		return "lesson06/addSearchurl";
	}

	@ResponseBody
	@PostMapping("/lesson06/add_searchurl")
	public String addSearchUrl(
			@RequestParam("name") String name
			,@RequestParam("url") String url
			,Model model
			) {
		
		// DB insert
		searchUrlBO.addSearchUrl(name,url);
		
		// DB select
		List<SearchUrl> searchUrlList = searchUrlBO.getSearchUrlList();
		
		model.addAttribute("searchUrlList",searchUrlList);
		
		return "성공";
	}
	
	@GetMapping("/lesson06/after_add_searchurl_view")
	public String afterAddUserView() {
		return "/lesson06/afterAddSearchurl";
	}
}
