package com.quiz.lesson01;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/lesson01/quiz01") // 공통 주소
@Controller // Spring bean
public class Lesson01Quiz01Controller {

	// http://localhost:8080/lesson01/quiz01/1
	@ResponseBody // return값을 Response body에 넣어 보낸다.
	@RequestMapping("/1")
	public String printString() {
		String text = "<h3>테스트 프로젝트 완성</h3>"
				+ "<h4>해당 프로젝트를 통해서 문제 풀이를 진행 합니다.</h4>";
		return text;
	}
	
	// http://localhost:8080/lesson01/quiz01/2
	@ResponseBody
	@RequestMapping("/2")
	
	public Map<String, Object> printMap() {
		Map<String, Object> map = new HashMap<>();
		map.put("국어", 80);
		map.put("수학", 90);
		map.put("영어", 85);
		
		return map;
		// Map은 jackson 라이브러리로 인해 json 형식으로 자동 변환되어 출력
	}
}
