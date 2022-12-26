package com.quiz.lesson03.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.quiz.lesson03.model.RealEstate;

@Repository
public interface RealEstateDAO {
	// Quiz01(select)
	public RealEstate selectRealEstateById(int id); 
	public List<RealEstate> selectRealEstateByRentPrice(Integer rent_price);
	// @Param 어노테이션에 의해서 하나의 맵이 된 것
	public List<RealEstate> selectRealEstateByAreaPrice(@Param("area") int area, @Param("price") int price); 

	
	// Quiz02(insert)
	public int insertRealEstate(RealEstate realEstate);
	public int insertRealEstateAsField(
			@Param("realtorId") int realtorId
			,@Param("address") String address
			,@Param("area") int area
			,@Param("type") String type
			,@Param("price") int price
			,@Param("rentPrice") Integer rentPrice
			);
	
}
