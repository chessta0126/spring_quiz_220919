package com.quiz.lesson05.bo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson05.dao.WeatherDAO;
import com.quiz.lesson05.model.Weather;

@Service
public class WeatherBO {
	@Autowired
	private WeatherDAO weatherDAO;
	
	public List<Weather> getWeather() {
		return weatherDAO.selectWeather();
	}
}
