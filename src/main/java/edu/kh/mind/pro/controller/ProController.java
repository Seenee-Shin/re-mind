package edu.kh.mind.pro.controller;

import com.google.gson.Gson;
import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.pro.model.service.ProService;
import edu.kh.mind.pro.model.vo.Payment;
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
	
	@RequestMapping("proView")
	public String proView(Model model) {
		
		model.addAttribute("css", "pro/proView");
    	model.addAttribute("header", "main");
		
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
	public int priceInsert(@RequestParam("price") int price, 
			@RequestParam("therapyCount") int totalCnt) {
		
		
		// 상담 횟수 rp 객체에 담기
		ReservationPayMent rp = new ReservationPayMent();
		rp.setTotalCnt(totalCnt);
		
		// 총 금액 pm 객체에 담기
		Payment pm = new Payment();
		pm.setPayAmount(price);
		
		// 결과 결제 tb에서 결제 번호 가지고 오기
		int payNo = service.priceInsert(pm,rp);
		
		return payNo;
	}
	
	@ResponseBody
	@RequestMapping(value="priceSelect", method=RequestMethod.POST)
	public int priceSelect(@RequestParam("payNo") int payNo) {
		
		int price = service.priceSelect(payNo);
		
		return price;
	}
	
	
}
