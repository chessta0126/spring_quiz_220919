package com.quiz.lesson03.bo;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson03.dao.RealEstateDAO;
import com.quiz.lesson03.model.RealEstate;

@Service
public class RealEstateBO {
	@Autowired
	private RealEstateDAO realEstateDAO;
	
	// Quiz01(select)
	public RealEstate getRealEstate(int id) {
		return realEstateDAO.selectRealEstateById(id);
	}

	public List<RealEstate> getRealEstate(Integer rent_price) {
		return realEstateDAO.selectRealEstateByRentPrice(rent_price);
	}

	public List<RealEstate> getRealEstate(int area, int price) {
//		원래 파라미터는 하나 밖에 못 넘긴다. 여러 파라미터를 넘길 때는 map 형식으로 담아서 줘야 하는데
//		Map<String, Object> params = new HashMap<>();
//		params.put("area", area);
//		params.put("price", price);
// 그냥 DAO에서 파라미터 앞에 @Param("파라미터명") 붙이는 게 더 낫다
		return realEstateDAO.selectRealEstateByAreaPrice(area,price);
	}
	
	
	// Quiz02(insert)
	// input : RealEstate
	// output : int(insert가 성공된 행 수)
	public int addRealEstate(RealEstate realEstate) {
		return realEstateDAO.insertRealEstate(realEstate);
	}
	
	public int addRealEstateAsField(
			int realtorId
			,String address
			,int area
			,String type
			,int price
			,Integer rentPrice
			) {
		return realEstateDAO.insertRealEstateAsField(realtorId,address,area,type,price,rentPrice);
	}
	
	
	// Quiz 03 - UPDATE
	public int updateRealEstateById(int id, String type, int price) {
		return realEstateDAO.updateRealEstateById(id, type, price);
	}

	
	// Quiz 04 - DELETE
	public int deleteRealEstateById(int id) {
		return realEstateDAO.deleteRealEstateById(id);
	}
}
