package com.quiz.lesson03.dao;

import org.springframework.stereotype.Repository;
import com.quiz.lesson03.model.Estate;

@Repository
public interface EstateDAO {
	public Estate setEstate(int id); 
}
