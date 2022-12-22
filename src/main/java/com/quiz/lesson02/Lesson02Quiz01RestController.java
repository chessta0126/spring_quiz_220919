package com.quiz.lesson02;

import java.util.List;

import org.apache.catalina.Store;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Lesson02Quiz01RestController {

	@RequestMapping("/lesson02/quiz01")
	public List<Store> quiz01(){
		List<Store> storeList;
		return storeList;
	}
}
