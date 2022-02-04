package edu.kh.mind.member.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import edu.kh.mind.member.model.service.SignUpService;


@Controller
@RequestMapping("/signUp/*")
public class SignUpController {
	
	private Logger logger = LoggerFactory.getLogger(SignUpController.class);

    @Autowired
    private SignUpService service;
    
    @Autowired
    private JavaMailSender mailSender;
    
    
    /* 이메일 인증 */
    @RequestMapping(value="mailCheck", method=RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception{
        
        /* 뷰(View)로부터 넘어온 데이터 확인 */
    	  logger.info("이메일 데이터 전송 확인");
          logger.info("인증번호 : " + email);
                  
          /* 인증번호(난수) 생성 */
          Random random = new Random();
          int checkNum = random.nextInt(888888) + 111111;      
          logger.info("인증번호 " + checkNum);
          
          /* 이메일 보내기 */
          String setFrom = "마음연구소 리마인드 <remindlab46@gmail.com>";
          String to = email;
          String title = "회원가입 인증 이메일 입니다.";
          String content = 
                  "마음연구소 Re:mind를 방문해주셔서 감사합니다." +
                  "<br><br>" + 
                  "인증 번호는 " + checkNum + "입니다." + 
                  "<br>" + 
                  "해당 인증번호를 인증번호 확인란에 기입하여 주세요.";
          
          /*try {
              
              MimeMessage message = mailSender.createMimeMessage();
              MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
              helper.setFrom(setFrom);
              helper.setTo(to);
              helper.setSubject(title);
              helper.setText(content,true);
              mailSender.send(message);
              
          }catch(Exception e) {
              e.printStackTrace();
          }*/
          
          String num = Integer.toString(checkNum);
          
          return num;
    }
 

    // 아이디 중복 검사
	@RequestMapping(value="idDupCheck", method=RequestMethod.GET)
	@ResponseBody
	public int idDupCheck( String inputId) {
		
		int result = service.idDupCheck(inputId);
		
		return result;
	}
    
    
	 // 닉네임 중복 검사
	@RequestMapping("check")
	@ResponseBody
	public int nickNmDupCheck( String inputNickNm) {
			
		return service.nickNmDupCheck(inputNickNm);
	}
    
    
}