package edu.kh.mind.adminPro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import edu.kh.mind.adminPro.model.service.AdminProService;
import edu.kh.mind.member.model.vo.Profession;

@Controller
@RequestMapping("adminPro/*")
@SessionAttributes({"loginPro"})
public class AdminProController {
	
	@Autowired
	private AdminProService service;

	@RequestMapping(value = "proRegister", method = RequestMethod.GET )
	public String proRegister() {
		
		return "adminPro/proRegister";
	}
	
	@RequestMapping(value = "proRegister", method = RequestMethod.POST )
	public String proRegister(Profession profession) {
		
		int result = service.proRegister(profession);
		
		
		
		return null;
	}
	
	
	
	
}
