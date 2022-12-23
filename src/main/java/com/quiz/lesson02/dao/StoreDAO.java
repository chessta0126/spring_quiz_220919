package com.quiz.lesson02.dao;

import java.util.List;
import org.springframework.stereotype.Repository;
import com.quiz.lesson02.model.Store;

@Repository
public interface StoreDAO {
	// interface라 객체생성 못하므로, MyBatis가 객체를 만들어서 넣어준다.

	// input : service(BO)가 아무것도 안 줌
	// output : List<Store>
	public List<Store> selectStoreList( );
}