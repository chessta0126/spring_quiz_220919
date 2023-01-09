package com.quiz.lesson06.DAO;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.quiz.lesson06.model.Booking;

@Repository
public interface BookingDAO {
	public List<Booking> selectBookingList();
	public int deleteBookingById(int id);
	public boolean insertBooking(
			@Param("name") String name,
			@Param("date") Date date,
			@Param("day") int day,
			@Param("headcount") int headcount,
			@Param("phoneNumber") String phoneNumber);
	public List<Booking> selectBooking(
			@Param("name") String name,
			@Param("phoneNumber") String phoneNumber);
}
