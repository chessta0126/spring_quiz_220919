package com.quiz.lesson04.bo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.quiz.lesson04.dao.RealtorDAO;
import com.quiz.lesson04.model.Realtor;

@Service
public class RealtorBO {
	@Autowired
	private RealtorDAO realtorDAO;
	
	public void addRealtor(Realtor realtor) {
		realtorDAO.insertRealtor(realtor);
	}
	public Realtor getRealtor(int id) {
		return realtorDAO.selectRealtor(id);
	}
}
