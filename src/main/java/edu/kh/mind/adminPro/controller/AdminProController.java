package edu.kh.mind.adminPro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//등록화면 연결
	@Autowired
	private AdminProService service;

	@RequestMapping(value = "proRegister", method = RequestMethod.GET )
	public String proRegister() {
		
		return "adminPro/proRegister";
	}
	
	
	//등록 기능구현
	@RequestMapping(value = "proRegister", method = RequestMethod.POST )
	public String proRegister(Profession profession, Model model) {
		
		int result = service.proRegister(profession);
		 if (result>0) {
			 System.out.println("등록성공, 상세 정보를 등록해 주세요");
	        } else {
	        	System.out.println("등록 실패");
	        }
		
		return "adminPro/proRegisterDetail";
	}
	
	
	
	
}
