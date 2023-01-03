package com.quiz.lesson05;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.quiz.lesson05.bo.WeatherBO;
import com.quiz.lesson05.model.Weather;

@Controller
public class Lesson05Quiz05Controller {
	@Autowired
	private WeatherBO weatherBO;
	
	// http://localhost:8080/lesson05/quiz05
	@GetMapping("/lesson05/quiz05")
	public String quiz05(Model model) {
		List<Weather> weatherHistoryList = weatherBO.getWeatherList();
		
		model.addAttribute("weatherHistory",weatherHistoryList);
		
		return "lesson05/quiz05";
	}
	
	// http://localhost:8080/lesson05/quiz05_insert
	@GetMapping("/lesson05/quiz05_insert")
	public String quiz05_insert(Model model) {
		return "lesson05/insert";
	}
}
