package edu.kh.mind.adminPro.model.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import edu.kh.mind.adminPro.model.dao.AdminProDAO;
import edu.kh.mind.common.util.MailHandler;
import edu.kh.mind.common.util.TempKey;
import edu.kh.mind.member.model.vo.Profession;

@Service
public class AdminProServiceImpl implements AdminProService{
	
	@Autowired
	AdminProDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder encoder;
	
    @Inject
    private JavaMailSender mailSender;
    
	//아이디 중복확인 (이메일 중복확인)
	@Override
	public int idChk(Profession profession) {
		return dao.idCheck(profession);
	}

    @Override
    public void proRegister(Profession profession) throws Exception {
        
    	//비밀번호 암호화
        String encPassword = encoder.encode(profession.getProfessionPw());
        profession.setProfessionPw(encPassword);

        //dao 호출
        dao.proRegister(profession);
        String key = new TempKey().getKey(50,false);  // 인증키 생성

        //인증키 db 저장
        dao.createAuthKey(profession.getProfessionId(),key); 
        
        
        //메일 전송
        MailHandler sendMail = new MailHandler(mailSender);
        sendMail.setSubject("re:mind 상담사 회원가입을 완료해주세요]");
        sendMail.setText(
                new StringBuffer().append("<h1>re:mind 상담사 메일 인증</h1>").append("<a href='http://localhost:8080/user/emailConfirm?professionEmail=").
                append(profession.getProfessionId()).
                append("&memberAuthKey=").append(key).
                append("' target='_blank'>이메일 인증 확인</a>").toString());
        sendMail.setFrom("remindlab46@gmail.com", "마음연구소re:mind");


        sendMail.setTo(profession.getProfessionId());
        sendMail.send();
    }

	@Override
	public Profession chkAuth(Profession profession) {
		return dao.chkAuth(profession);
	}




    //이메일 인증 키 검증 


}
