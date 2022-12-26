package com.quiz.lesson03.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson03.model.Estate;

@Repository
public interface EstateDAO {
	public Estate selectEstateId(int id); 
	public List<Estate> selectEstateRentPrice(Integer rent_price); 
	public List<Estate> selectEstateAreaPrice(int area, int price); 
}
