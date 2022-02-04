package edu.kh.mind.adminPro.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mind.adminPro.model.service.AdminProService;
import edu.kh.mind.common.util.Util;
import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.member.model.vo.ProfessionHospital;
import edu.kh.mind.member.model.vo.ProfessionInformation;

@Controller
@RequestMapping("adminPro/*")
@SessionAttributes({"loginPro"})
public class AdminProController {
	
	@Autowired
	private AdminProService service;

	//등록화면 연결
	@RequestMapping(value = "proLogin", method = RequestMethod.GET )
	public String proLogin() {
		
		return "adminPro/proLogin";
	}
	
	//등록화면 연결
	@RequestMapping(value = "proRegister", method = RequestMethod.GET )
	public String proRegister() {
		
		return "adminPro/proRegister";
	}
	
	@RequestMapping(value = "emailDupCheck", method=RequestMethod.GET)
	@ResponseBody
	public int emailDupCheck(String inputEmail) {
		
		//아이디 중복검사 Service 호출
		int result = service.idChk(inputEmail);
		
		return result;
	}
	
	
	//등록 & 이메일 인증
	@RequestMapping(value = "proRegister", method = RequestMethod.POST )
	public String proRegister(Profession profession) throws Exception{
		
		service.proRegister(profession);
		
			
       return "redirect:proLogin";
		
	}
	
    //이메일 인증 코드 검증
    @RequestMapping(value = "emailConfirm", method = RequestMethod.GET)
    public String emailConfirm(Profession profession, Model model, RedirectAttributes ra) { 
        
        
        int result = service.chkAuth(profession);
        
        if(result == 0) {
            Util.swalSetMessage("다시 인증해주세요","","error", ra);;
            return "redirect:/";
        }else {
        	
        	Profession loginPro = service.selectProfession(profession);
        	model.addAttribute("loginPro", loginPro);
        	
        	return "adminPro/emailConfirm";
        }
    }
    
    //상담사 페이지 연결
    @RequestMapping("proRegisterDetail/{proNo}")
    public String insertproDetail(){
    	
    	return "adminPro/proRegisterDetail";
    }
    
    
    //상담사 정보등록 
    @RequestMapping(value = "proRegisterDetail/{proNo}", method = RequestMethod.POST )
    public String insertproDetail(@ModelAttribute("loginPro") Profession loginPro,
    							 ProfessionHospital proHospital, ProfessionInformation proInfo, MultipartFile image,
    							Model md, RedirectAttributes ra, HttpSession session) {
    	
    	//loginPro의 ProfessionNo set
    	proHospital.setProfessionNo(loginPro.getProfessionNo());
    	proInfo.setProfessionNo(loginPro.getProfessionNo());
    	
    	//학력증명서 
    	//웹 접근경로(web path), 서버 저장경로(serverPath)
		String webPath = "/resources/images/pro/certification";
		
		String serverPath= session.getServletContext().getRealPath(webPath);
    	
    	//병원정보 등록
    	int hResult = service.insertProHospital(proHospital);
    	
		String path = null; 
		
    	if(hResult < 0) {
			Util.swalSetMessage("게시글 등록 실패", null, "error", ra);
			path = "proRegisterDetail";
    	}else {
    		//학력정보 입력
    		int iResult = service.insertProInfo(proInfo,image, webPath, serverPath);
    		
    		if(iResult > 0) { // insert 성공 
    			Util.swalSetMessage("상담사 등록 신청 완료","상담사 승인이 완료되면 이메일로 알려드립니다.", "success", ra);
    			path = "proLogin";
    		}else {
    			Util.swalSetMessage("게시글 등록 실패", null, "error", ra);
    			path = "proRegisterDetail";
    			
    		}
    	}
    	
    	return "redirect:"+path;
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
