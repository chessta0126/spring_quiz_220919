package com.quiz.lesson02;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.lesson02.bo.StoreBO;
import com.quiz.lesson02.model.Store;

@RestController
public class Lesson02Quiz01RestController {
	@Autowired
	private StoreBO storeBO; // spring bean을 주입받음(Dependency Injection)
	
	@RequestMapping("/lesson02/quiz01")
	public List<Store> quiz01(){
		List<Store> storeList = storeBO.getStoreList();
		return storeList;
	}
}