package com.quiz.lesson06.DAO;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Booking;

@Repository
public interface BookingDAO {
	public List<Booking> selectBookingList();
}
