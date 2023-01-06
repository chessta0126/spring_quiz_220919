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

	public Boolean existUserByUrl(String url){
		return searchUrlDAO.existUserByUrl(url);
	}
	
	public void deleteSearchUrl(String deleteUrl) {
		searchUrlDAO.deleteSearchUrl(deleteUrl);
	}
}
