package com.quiz.lesson04;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson04.bo.RealtorBO;
import com.quiz.lesson04.model.Realtor;

@RequestMapping("/lesson04/quiz02")
@Controller
public class Lesson04Quiz02Controller {
	@Autowired
	private RealtorBO realtorBO;

	// 공인중개사 추가 화면
	// http://localhost:8080/lesson04/quiz02/add_realtor_view
	@GetMapping("/add_realtor_view")
	public String addRealtorView() {
		return "lesson04/add_realtor";
	}
	
	// http://localhost:8080/lesson04/quiz02/add_realtor
	@PostMapping("/add_realtor")
	public String addRealtor(@ModelAttribute Realtor realtor) {
		realtorBO.addRealtor(realtor);
		realtor = realtorBO.selectRealtor(realtor.getId());
		return "lesson04/after_add_realtor"; // prefix, suffix 제외한 jsp경로
	}
}
