package com.quiz.lesson03.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.EstateDAO;
import com.quiz.lesson03.model.Estate;

@Service
public class EstateBO {
	@Autowired
	private EstateDAO estateDAO;
	
	public Estate getEstate(int id) {
		return estateDAO.selectEstateId(id);
	}

	public List<Estate> getEstate(Integer rent_price) {
		return estateDAO.selectEstateRentPrice(rent_price);
	}

	public List<Estate> getEstate(int area, int price) {
		return estateDAO.selectEstateAreaPrice(area,price);
	}
}
