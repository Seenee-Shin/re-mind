package edu.kh.mind.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;


import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mind.pro.model.server.ProService;
import edu.kh.mind.pro.model.vo.ReservationPayMent;

@Controller
@RequestMapping("/pro/*")
@SessionAttributes({"loginMember"})
public class ProController {
	
	@Autowired
	private ProService service;
	
	@RequestMapping("proList")
	public String proList(Model model) {
		
		model.addAttribute("css", "pro/proList");
    	model.addAttribute("header", "main");
    	
		return "pro/proList";
	}
	
	@RequestMapping("proView")
	public String proView(Model model) {
		
		model.addAttribute("css", "pro/proView");
    	model.addAttribute("header", "main");
		
		return "pro/proView";
	}
	
	
	// 상담사 예약 페이지
	@RequestMapping("proReservation")
	public String proReservation(Model model) {
		
		model.addAttribute("css", "pro/proReservation");
    	model.addAttribute("header", "main");
		
		return "pro/proReservation";
	}
	
	
	// 상담사 결제 - 1.RESERVATION_PAYMENT 번호 INSERT, 2. PAYMENT DB에 총 금액, 번호 INSERT 후 결제 번호 반환
	
	@ResponseBody
	@RequestMapping(value="priceInsert", method = RequestMethod.POST)
	public int priceInsert(@RequestParam("price") int price, @RequestParam("therapyCount") int totalCnt) {
		
		// 추후에 전문가, loginMemberNo 같이 insert 해야함.
		ReservationPayMent rv = new ReservationPayMent();
		
		
		
		rv.setTotalCnt(totalCnt);
		
		int payNo = service.priceInsert(price, rv);
		
		return 0;
	}
	

	
}
