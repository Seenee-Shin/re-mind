package edu.kh.mind.pro.controller;

import com.google.gson.Gson;
import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.pro.model.service.ProService;
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
}
