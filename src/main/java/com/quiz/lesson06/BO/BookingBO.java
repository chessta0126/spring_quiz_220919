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
	public boolean addBooking(String name, Date date, int day, int headcount,String phoneNumber){
		return bookingDAO.insertBooking(name, date, day, headcount, phoneNumber);
	}
	public Booking getBooking(String name,String phoneNumber){
		List<Booking> confirmBookingList = bookingDAO.selectBooking(name, phoneNumber);
		// 비어있지(List는 비었어도 null은 아니고 []-> .isEmpty( )) 않으면
		if(confirmBookingList.isEmpty() == false) {
			return confirmBookingList.get(0); // 가장 처음 예약한 정보만 보내준다.
		}
		return null;
	}
}
