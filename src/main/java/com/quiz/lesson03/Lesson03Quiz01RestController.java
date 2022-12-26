package com.quiz.lesson03;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson03.bo.EstateBO;
import com.quiz.lesson03.model.Estate;

@RestController
public class Lesson03Quiz01RestController {
	@Autowired
	private EstateBO estateBO;
	
	// http://localhost:8080/lesson03/quiz01/1?id=20
	@RequestMapping("/lesson03/quiz01/1")
	public Estate quiz01_1(@RequestParam(value="id", defaultValue="1") int id) {
		return estateBO.getEstate(id);
	}

	// http://localhost:8080/lesson03/quiz01/2?rent_price=90
	@RequestMapping("/lesson03/quiz01/2")
	public List<Estate> quiz01_2(@RequestParam(value="rent_price", required=false) Integer rent_price) {
		return estateBO.getEstate(rent_price);
	}
	
	// http://localhost:8080/lesson03/quiz01/3?area=90&price=130000
	@RequestMapping("/lesson03/quiz01/3")
	public List<Estate> quiz01_3(
			@RequestParam(value="area") int area
			, @RequestParam(value="price") int price
			) {
		return estateBO.getEstate(area,price);
	}	
}
