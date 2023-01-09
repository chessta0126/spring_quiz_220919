package com.quiz.lesson06.BO;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.lesson06.DAO.BookingDAO;
import com.quiz.lesson06.model.Booking;
import com.quiz.lesson06.model.SearchUrl;

@Service
public class BookingBO {

	@Autowired
	private BookingDAO bookingDAO;
	
	public List<Booking> getBookingList(){
		return bookingDAO.selectBookingList();
	}
	public int deleteBookingById(int id){
		return bookingDAO.deleteBookingById(id);
	}
	public boolean addBooking(String name, String date, int day, int headcount,String phoneNumber){
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	public Booking getLatestBookingByNamePhoneNumber(String name,String phoneNumber){
		return bookingDAO.selectLatestBookingByNamePhoneNumber(name, phoneNumber);
	}
}
