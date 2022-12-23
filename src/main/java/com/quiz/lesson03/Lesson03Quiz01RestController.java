package com.quiz.lesson03;

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
	
	// http://localhost/lesson03/quiz01/1?id=20
	@RequestMapping("/lesson03/quiz01/1")
	public Estate quiz01(@RequestParam(value="id", defaultValue="1") int id) {
		return estateBO.getEstate(id);
	}
}
