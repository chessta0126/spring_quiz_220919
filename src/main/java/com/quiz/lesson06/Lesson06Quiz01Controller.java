package com.quiz.lesson06;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	// 즐겨찾기 추가 화면
	// http://localhost:8080/lesson06/add_searchurl_view
	@GetMapping("/lesson06/add_searchurl_view")
	public String addSearchUrlView() {
		return "lesson06/addSearchurl";
	}

	// 즐겨찾기 추가 - AJAX 통신 요청
	@ResponseBody
	@PostMapping("/lesson06/add_searchurl")
	public Map<String,String> addSearchUrl(
			@RequestParam("name") String name
			,@RequestParam("url") String url
			) {
		
		// DB insert
		searchUrlBO.addSearchUrl(name,url);
		
		// 성공 응답값
		Map<String,String> result = new HashMap<>();
		result.put("result", "성공");
		return result; // jackson => JSON String
	}
	
	@GetMapping("/lesson06/after_add_searchurl_view")
	public String afterAddUserView(Model model) {

		// DB select
		List<SearchUrl> searchUrlList = searchUrlBO.getSearchUrlList();
		
		model.addAttribute("searchUrlList",searchUrlList);
		
		return "/lesson06/afterAddSearchurl";
	}
	
	// 이름 중복 확인
	@ResponseBody
	@GetMapping("/lesson06/quiz02/is_duplication")
	public Map<String, Boolean> isDuplication(
			@RequestParam("url") String url
			) {
		
		Map<String, Boolean> result = new HashMap<>();
		result.put("is_duplication", searchUrlBO.existUserByUrl(url));
			
		return result;
	}
	
	@GetMapping("/lesson06/quiz02/delete_Url")
	public String deleteSearchUrl(String deleteUrl) {
		searchUrlBO.deleteSearchUrl(deleteUrl);
		return "/lesson06/afterAddSearchurl";
	}
}
