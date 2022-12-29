package com.quiz.lesson04.dao;

import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.quiz.lesson04.model.Realtor;

@Repository
public interface RealtorDAO {
	public void insertRealtor(@ModelAttribute Realtor realtor);
	public Realtor selectRealtor(int id);
}
