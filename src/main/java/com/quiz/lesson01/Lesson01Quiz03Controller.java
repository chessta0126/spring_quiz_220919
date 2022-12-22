package com.quiz.lesson01;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Lesson01Quiz03Controller {
	// http://localhost:8080/lesson01/quiz03/1
	@RequestMapping("/lesson01/quiz03/1")
	public String quiz03(){
	// View Resolver : @ResponseBody가 없을때는 뷰의 경로로 인식됨
		return "lesson01/quiz03";
	}
}
