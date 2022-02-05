package edu.kh.mind.adminPro.controller;

import javax.servlet.http.HttpSession;

import edu.kh.mind.member.model.vo.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import edu.kh.mind.adminPro.model.service.AdminProService;
import edu.kh.mind.common.util.Util;

import java.util.List;


@Controller
@RequestMapping("adminPro/*")
@SessionAttributes({"loginPro", "chattingNo"})
public class AdminProController {
	
	@Autowired
	private AdminProService service;


	@RequestMapping(value = "/")
	public String proMain(HttpSession session) {

		String path = "adminPro/proLogin";
		if (session.getAttribute("loginPro") != null) {
			path = "redirect:/adminPro/proReservation";
		}

		return path;
	}

	// 로그인 페이지
	@RequestMapping(value = "proLogin", method = RequestMethod.GET )
	public String proLoginForm(HttpSession session) {

		String path = "adminPro/proLogin";
		if (session.getAttribute("loginPro") != null) {
			path = "redirect:/adminPro/proReservation";
		}
		
		return path;
	}

	// 로그인
	@RequestMapping(value="proLogin", method = RequestMethod.POST)
	public String proLogin(Profession profession, Model model, RedirectAttributes ra) {
		System.out.println(profession.toString());
		Profession loginPro = service.proLogin(profession);
		System.out.println(loginPro);

		String path = "redirect:/adminPro/proLogin";

		if (loginPro != null) {
			if (loginPro.getStatusCode() == 4) {
				model.addAttribute("loginPro", loginPro);
				path = "redirect:/adminPro/proReservation";
			} else {
				Util.swalSetMessage("관리자 승인 후 로그인 가능합니다.", null, "info", ra);
			}
		} else {
			Util.swalSetMessage("아이디 또는 비밀번호를 확인해 주세요.", null, "error", ra);
		}

		return path;

	}

	// 상담사 예약 목록
	@RequestMapping("proReservation")
	public String proReservation() {

		return "adminPro/proReservation";
	}

	
	// 상담사 등록 신청
	@RequestMapping(value = "proRegister", method = RequestMethod.GET )
	public String proRegister() {
		
		return "adminPro/proRegister";
	}

	// 아이디 중복 검사
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
    							 ProfessionHospital proHospital, ProfessionInformation proInfo, MultipartFile certification,
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
    	
    	System.out.println(certification);
    	
		String path = null; 
		
    	if(hResult < 0) {
			Util.swalSetMessage("게시글 등록 실패", null, "error", ra);
			path = "/proRegisterDetail";
    	}else {
    		//학력정보 입력
    		int iResult = service.insertProInfo(proInfo,certification, webPath, serverPath);
    		
    		if(iResult > 0) { // insert 성공 
    			Util.swalSetMessage("상담사 등록 신청 완료","상담사 승인이 완료되면 이메일로 알려드립니다.", "success", ra);
    			path = "/proLogin";
    		}else {
    			Util.swalSetMessage("게시글 등록 실패", null, "error", ra);
    			path = "/proRegisterDetail";
    			
    		}
    	}
    	
    	return "redirect:"+path;
    }
    
    //상담사 프로필 작성 연결
    @RequestMapping(value = "AdminProProfile/{proNo}")
    public String AdminProProfile() {
    	 return "adminPro/AdminProProfile";
    }
    
    //상담사 프로필 작성 연결
    @RequestMapping(value = "AdminProProfile/{proNo}", method = RequestMethod.POST)
    public String AdminProProfile(@ModelAttribute("loginPro") Profession loginPro,ProfessionInformation proInfo ) {
    	
    	return "adminPro/AdminProProfile";
    }
    

	
    //예외처리
	@ExceptionHandler(Exception.class)
	public String exceptionHandler(Exception e, Model model) {
		
		//Model : 데이터 전달용 객체(Map형식, request범위)
		
		model.addAttribute("errorMessage", "회원 관련 서비스 이용 중 문제가 발생했습니다.");
		model.addAttribute("e", e);
		
		return "/common/error";
	}


	@RequestMapping("chat/room/{reservationNo}")
	public String chatJoin(@PathVariable("reservationNo") int reservationNo, ChatJoin chat, RedirectAttributes ra, Model model, HttpSession session) {

		String path = "redirect:/adminPro/proReservation";
		if (session.getAttribute("loginPro") != null) {

			int professionNo = ((Profession) session.getAttribute("loginPro")).getProfessionNo();
			System.out.println(professionNo);
			System.out.println(chat);

			chat.setProfessionNo(professionNo);
			List<ChatMessage> list = service.joinChat(chat);
			System.out.println(list);

			if (list != null) {
				model.addAttribute("chattingNo", chat.getChattingNo());

//				model.addAttribute("css", "my");
				model.addAttribute("chat", chat);
				model.addAttribute("list", list);

				path = "adminPro/proChat";
			} else {
				Util.swalSetMessage("해당 채팅방이 존재하지 않습니다.", null, "info", ra);
			}
		} else {
			Util.swalSetMessage("로그인이 필요 합니다.", null, "error", ra);
		}

		return path;

	}
	
}
