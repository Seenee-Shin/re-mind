package edu.kh.mind.pro.controller;

import com.google.gson.Gson;

import edu.kh.mind.common.util.Util;
import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.member.model.vo.ProfessionPrice;
import edu.kh.mind.member.model.vo.Review;
import edu.kh.mind.pro.model.service.ProService;
import edu.kh.mind.pro.model.vo.Payment;
import edu.kh.mind.pro.model.vo.Reservation;
import edu.kh.mind.pro.model.vo.ReservationPayMent;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

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
		
		// 상담사 정보 담기
		model.addAttribute("profession", pro);
		
		// 후기 리스트 가지고오기
		List<Review> reviewList = service.reviewListSelect(professionNo);
		
		System.out.println(reviewList);
		
		// 후기 리스트 담기
		model.addAttribute("reviewList", reviewList);
		
		
		return "pro/proView";
	}
	
	@RequestMapping("proReservation/{professionNo}")
	public String proReservation(Model model, @PathVariable("professionNo") int professionNo,
			RedirectAttributes ra, HttpSession session) {
		
		model.addAttribute("css", "pro/proReservation");
    	model.addAttribute("header", "main");

		model.addAttribute("professionNo", professionNo);
		
		String path;
		int memberNo = 0;
		String memberId = null;
		String memberNm = null;
		String memberPhone = null;
		
		// session에 loginMember가 있을 경우
		if(session.getAttribute("loginMember") != null ) {
			memberNo = ((Member)session.getAttribute("loginMember")).getMemberNo();
			memberId = ((Member)session.getAttribute("loginMember")).getMemberId();
			memberNm = ((Member)session.getAttribute("loginMember")).getMemberName();
			memberPhone = ((Member)session.getAttribute("loginMember")).getMemberPhone();
		}

		if(memberNo == 0) {
			Util.swalSetMessage("로그인를 해주세요",null,"info", ra);
			path="redirect:/";
		}else {
			model.addAttribute("memberNo", memberNo);
			model.addAttribute("memberId", memberId);
			model.addAttribute("memberPhone", memberPhone);
			model.addAttribute("memberNm", memberNm);
			path="pro/proReservation";
		}
	
		return path;
	}
	
	
	@GetMapping("proMemberSelect")
	@ResponseBody
	public String proMemberSelect(@RequestParam(value = "professionNo", required = false) int professionNo){
		List<Profession> pList = service.selectMemberProfession(professionNo);
		return new Gson().toJson(pList);
	}
	
	
	// 총 금액이 맞으면 update
	@ResponseBody
	@RequestMapping(value="priceInsert", method=RequestMethod.POST)
	public int priceInsert(@RequestParam("therapySelect") int counselCategoryCode,@RequestParam("therapyCount") int totalCnt,
			@RequestParam("professionNo") int professionNo, @RequestParam("loginMemberNo") int loginMemberNo) {
		
		
		// 상담 횟수 rp 객체에 담기
		ReservationPayMent rv = new ReservationPayMent();
		rv.setTotalCnt(totalCnt);
		rv.setMemberNo(loginMemberNo);
		rv.setProfessionNo(professionNo);
		
		// 상담사 번호(추후 삽입 예정), 테라피 번호
		ProfessionPrice pfp = new ProfessionPrice();
		pfp.setCounselCategoryCode(counselCategoryCode);
		
		
		// 결과 결제 tb에서 결제 번호 가지고 오기
		int payNo = service.priceInsert(pfp,rv);
		
		return payNo;
	}
	
	// 아이포트 가격과 db에 있는 총 금액과 맞는지 확인용
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
	
	// 후기
	@ResponseBody
	@RequestMapping(value="reviewInsert", method=RequestMethod.POST)
	public int reviewInsert(@RequestParam("payNo") int payNo) {
	
		int result = service.paymentDelete(payNo);
		
		return result;
	}
	
}
