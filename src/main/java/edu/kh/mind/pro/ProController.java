package edu.kh.mind.pro;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/pro/*")
@SessionAttributes({"loginMember"})
public class ProController {
	
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
	
	@RequestMapping("proReservation")
	public String proReservation(Model model) {
		
		model.addAttribute("css", "pro/proReservation");
    	model.addAttribute("header", "main");
		
		return "pro/proReservation";
	}
	

	
}
