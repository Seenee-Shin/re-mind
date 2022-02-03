package edu.kh.mind.adminPro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	public String proRegister(Profession profession, Model model) throws Exception{
		
		int result = service.idChk(profession);
		
		// 이메일 중복여부 확인 (사용가능하면 0)
		if(result == 1) {
			service.proRegister(profession);
			
	       model.addAttribute("result", "ok");
	       model.addAttribute("refreshUrl", "2;url=../auth/login");
		}
		
		 return "adminPro/proRegisterDetail";
	}
	
    //이메일 인증 코드 검증
    @RequestMapping(value = "emailConfirm", method = RequestMethod.GET)
    public String emailConfirm(Profession profession,Model model,RedirectAttributes ra) { 
        
        Profession loginpro = new Profession();
        
        loginpro = service.chkAuth(profession);
        
        if(loginpro == null) {
            ra.addFlashAttribute("msg" , "다시 인증해 주세요");
            return "redirect:/";
        }else {
        	model.addAttribute("loginPro", loginpro);
        	return "/adminPro/";
        }
    }
	
	
    //예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		
		//Model : 데이터 전달용 객체(Map형식, request범위)
		
		model.addAttribute("errorMessage", "회원 관련 서비스 이용 중 문제가 발생했습니다.");
		model.addAttribute("e", e);
		
		return "/common/error";
	}
	
}
