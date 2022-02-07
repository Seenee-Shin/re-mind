package edu.kh.mind.pro.controller;

import com.google.gson.Gson;

import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.member.model.vo.ProfessionPrice;
import edu.kh.mind.pro.model.service.ProService;
import edu.kh.mind.pro.model.vo.Payment;
import edu.kh.mind.pro.model.vo.Reservation;
import edu.kh.mind.pro.model.vo.ReservationPayMent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

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

	@GetMapping("proCategory")
	@ResponseBody
	public String proCategory(@RequestParam(value = "worryCtCd[]", required = false) List<String> worryCtCd){

		List<Profession> pList;

		if(worryCtCd != null)	pList = service.selectProfession(worryCtCd);
		else					pList = service.selectAllProfession();

		return new Gson().toJson(pList);
	}
	
	@RequestMapping("proView/{professionNo}")
	public String proView(Model model, @PathVariable("professionNo") int professionNo) {
		
		model.addAttribute("css", "pro/proView");
    	model.addAttribute("header", "main");

		Profession pro = service.selectPro(professionNo);

		System.out.println(pro.getProfessionName());

		model.addAttribute("profession", pro);

		return "pro/proView";
	}
	
	@RequestMapping("proReservation")
	public String proReservation(Model model) {
		
		model.addAttribute("css", "pro/proReservation");
    	model.addAttribute("header", "main");
		
		return "pro/proReservation";
	}
	
	@ResponseBody
	@RequestMapping(value="priceInsert", method=RequestMethod.POST)
	public int priceInsert(@RequestParam("therapySelect") int counselCategoryCode, 
			@RequestParam("therapyCount") int totalCnt) {
		
		
		// 상담 횟수 rp 객체에 담기
		ReservationPayMent rv = new ReservationPayMent();
		rv.setTotalCnt(totalCnt);

		
		// 상담사 번호(추후 삽입 예정), 테라피 번호
		ProfessionPrice pfp = new ProfessionPrice();
		pfp.setCounselCategoryCode(counselCategoryCode);
		
		
		// 결과 결제 tb에서 결제 번호 가지고 오기
		int payNo = service.priceInsert(pfp,rv);
		
		return payNo;
	}
	
	@ResponseBody
	@RequestMapping(value="priceSelect", method=RequestMethod.POST)
	public int priceSelect(@RequestParam("payNo") int payNo) {
		
		int price = service.priceSelect(payNo);
		
		return price;
	}
	
	
	// 금액이 맞으면 update
	@ResponseBody
	@RequestMapping(value="reservationUpdate", method=RequestMethod.POST)
	public int reservationUpdate(Payment payment, Reservation reservation) {
		
		System.out.println(payment.getPayNo());
		System.out.println(reservation.getReservationEnrollDate());
		System.out.println(reservation.getReservationEnrollTime());
		System.out.println(reservation.getCounselCategoryNm());
		
		int result = service.reservationUpdate(payment,reservation);
		
		return result;
	}
	
	// 결제 취소 버튼을 눌렀을 경우
	@ResponseBody
	@RequestMapping(value="paymentDelete", method=RequestMethod.POST)
	public int paymentDelete(int payNo) {
	
		int result = service.paymentDelete(payNo);
		
		return result;
	}
	
}
