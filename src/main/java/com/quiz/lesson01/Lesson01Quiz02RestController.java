package com.quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class Lesson01Quiz02RestController {

	// http://localhost:8080/lesson01/quiz02/1
	@RequestMapping("/1")
	
	public List<Map<String, Object>> movieList(){
		List<Map<String, Object>> movieList = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		map.put("rate", 15);
		map.put("director", "봉준호");
		map.put("time", 131);
		map.put("title", "기생충");
		movieList.add(map);
		
		map = new HashMap<>(); // heap 메모리에 새로운 객체생성 후 넣는다(오버라이드)
		map.put("rate", 0);
		map.put("director", "로베르토 베니니");
		map.put("time", 116);
		map.put("title", "인생은 아름다워");
		movieList.add(map);
		
		map = new HashMap<>();
		map.put("rate", 12);
		map.put("director", "크리스토퍼 놀란");
		map.put("time", 147);
		map.put("title", "인셉션");
		movieList.add(map);
		
		map = new HashMap<>();
		map.put("rate", 19);
		map.put("director", "윤종빈");
		map.put("time", 133);
		map.put("title", "범죄와의 전쟁 : 나쁜놈들 전성시대");
		movieList.add(map);

		map = new HashMap<>();
		map.put("rate", 15);
		map.put("director", "프란시스 로렌스");
		map.put("time", 137);
		map.put("title", "헝거게임");
		movieList.add(map);
		
		return movieList;
	}

	// http://localhost:8080/lesson01/quiz02/2
	@RequestMapping("/2")
	
	public List<Community> quiz02_2(){
		List<Community> contents = new ArrayList<>();
		Community community = new Community();
		community.setTitle("안녕하세요 가입인사 드립니다.");
		community.setUser("hagulu");
		community.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		contents.add(community);
		
		community = new Community();
		community.setTitle("헐 대박");
		community.setUser("bada");
		community.setContent("오늘 목요일이었어... 금요일인줄");
		contents.add(community);
		
		community = new Community();
		community.setTitle("오늘 데이트 한 이야기 해드릴게요.");
		community.setUser("dulumary");
		community.setContent("....");
		contents.add(community);
		
		return contents;
	}

	// http://localhost:8080/lesson01/quiz02/3
	@RequestMapping("/3")
	
	public ResponseEntity<Community> quiz02_3(){
		Community community = new Community();
		community.setTitle("안녕하세요 가입인사 드립니다.");
		community.setUser("hagulu");
		community.setContent("안녕하세요. 가입했어요. 앞으로 잘 부탁 드립니다. 활동 열심히 하겠습니다.");
		
		return new ResponseEntity<Community>(community, HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
