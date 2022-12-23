package com.quiz.lesson03.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.EstateDAO;
import com.quiz.lesson03.model.Estate;

@Service
public class EstateBO {
	@Autowired
	private EstateDAO estateDAO;
	
	public Estate getEstate(int id) {
		return estateDAO.setEstate(id);
	}
}
