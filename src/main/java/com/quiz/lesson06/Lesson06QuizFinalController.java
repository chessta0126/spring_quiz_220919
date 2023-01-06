package com.quiz.lesson06;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.quiz.lesson06.BO.BookingBO;
import com.quiz.lesson06.model.Booking;

@RequestMapping("/lesson06")
@Controller
public class Lesson06QuizFinalController {
	@Autowired
	private BookingBO bookingBO;
	
	// http://localhost:8080/lesson06/finalQuiz_viewBooking
	@GetMapping("/finalQuiz_viewBooking")
	public String getBooking(Model model) {
		List<Booking> bookingList = bookingBO.getBookingList();
		model.addAttribute("bookingList",bookingList);
		
		return "lesson06/finalQuiz/viewBooking";
	}
}
