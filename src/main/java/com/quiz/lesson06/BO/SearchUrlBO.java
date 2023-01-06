package com.quiz.lesson06.BO;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.DAO.SearchUrlDAO;
import com.quiz.lesson06.model.SearchUrl;

@Service
public class SearchUrlBO {

	@Autowired
	private SearchUrlDAO searchUrlDAO;
	
	public void addSearchUrl(String name, String url){
		searchUrlDAO.insertSearchUrl(name, url);
	}

	public List<SearchUrl> getSearchUrlList(){
		return searchUrlDAO.selectSearchUrlList();
	}

//	public Boolean existSearchUrlByUrl(String url){
//		return searchUrlDAO.existSearchUrlByUrl(url);
//	} // Boolean은 실용성이 없으므로 그냥 객체로 return하는게 좋다.
	
	// Controller가 필요로하는 정보만 가공해서 준다.
	public SearchUrl getSearchUrlByUrl(String url){
		List<SearchUrl> searchUrlList = searchUrlDAO.selectSearchUrlByUrl(url);
		// 비어있지(List는 비었어도 null은 아니고 []-> .isEmpty( )) 않으면
		if(searchUrlList.isEmpty() == false) {
			return searchUrlList.get(0);
		}
		return null;
	}
	
	public int deleteSearchUrlById(int id) {
		return searchUrlDAO.deleteSearchUrlById(id);
	}
}
