package com.quiz.lesson05.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson05.model.Weather;

@Repository
public interface WeatherDAO {
	public List<Weather> selectWeatherList();
}
