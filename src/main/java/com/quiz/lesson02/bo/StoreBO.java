package com.quiz.lesson02.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson02.dao.StoreDAO;
import com.quiz.lesson02.model.Store;

@Service
public class StoreBO {

	@Autowired // spring bean을 주입받음(Dependency Injection)
	private StoreDAO storeDAO;   // DAO 형태의 필드 만든다.
	
	// input : Controller가 아무것도 안 줌
	// output : List<Store>
	public List<Store> getStoreList(){
		return storeDAO.selectStoreList(); // DAO에서 리스트 뽑아옴
	}
}
