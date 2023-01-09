package com.quiz.lesson06;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@ResponseBody
	@DeleteMapping("/finalQuiz_deleteBooking")
	public Map<String,Object> deleteBooking(
			@RequestParam("id") int id) {
		
		Map<String,Object> result = new HashMap<>();
		
		//DB delete
		int row = bookingBO.deleteBookingById(id);
		if(row > 0) {
			result.put("code", 1);
			result.put("result", "성공");
		} else {
			result.put("code", 500);
			result.put("result", "실패");
			result.put("error_message", "삭제에 실패했습니다.");
		}
		
		return result;
	}
	
	// 예약하기 화면
	// http://localhost:8080/lesson06/finalQuiz_addBooking
	@GetMapping("/finalQuiz_addBooking")
	public String addBooking() {
		return "lesson06/finalQuiz/addBooking";
	}
	
	// AJAX 통신, insert
	@ResponseBody
	@PostMapping("/add_Booking")
	public Map<String,Object> addBooking(
			@RequestParam("name") String name
			,@RequestParam("date") String date
			,@RequestParam("day") int day
			,@RequestParam("headcount") int headcount
			,@RequestParam("phoneNumber") String phoneNumber
			) {
		
		//DB insert
		bookingBO.addBooking(name, date, day, headcount, phoneNumber);

		// 응답값 내리기
		Map<String,Object> result = new HashMap<>();
		result.put("result", "예약이 완료되었습니다.");
		
		return result;
	}
	
	// http://localhost:8080/lesson06/finalQuiz_mainBooking
	@GetMapping("/finalQuiz_mainBooking")
	public String mainBooking() {
		return "lesson06/finalQuiz/mainBooking";
	}
	
	// AJAX 통신, select
	// http://localhost:8080/lesson06/finalQuiz_getBooking
	@ResponseBody
	@PostMapping("/finalQuiz_getBooking")
	public Map<String,Object> getBooking(
			@RequestParam("name") String name
			,@RequestParam("phoneNumber") String phoneNumber
			) {
		
		Map<String,Object> result = new HashMap<>();
		
		//DB select (최신 예약 내역 1건)
		Booking confirmBooking = bookingBO.getLatestBookingByNamePhoneNumber(name,phoneNumber);
		if(confirmBooking != null) {
			result.put("code", 1); // 성공
			result.put("confirmBooking", confirmBooking);
		} else {
			result.put("code", 500); // 실패
		}
		
		return result;
	}
}
