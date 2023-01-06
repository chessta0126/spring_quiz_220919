package com.quiz.lesson06.DAO;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.quiz.lesson06.model.SearchUrl;

@Repository
public interface SearchUrlDAO {

	public void insertSearchUrl(
			@Param("name") String name
			, @Param("url")String url);
	
	public List<SearchUrl> selectSearchUrlList();
	
	public Boolean existUserByUrl(String url);
	
	public void deleteSearchUrl(String deleteUrl);
}
