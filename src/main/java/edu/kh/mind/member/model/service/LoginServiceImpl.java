package edu.kh.mind.member.model.service;

import edu.kh.mind.member.model.dao.LoginDAO;
import edu.kh.mind.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
public class LoginServiceImpl implements LoginService{

    @Autowired
    private LoginDAO dao;

    @Autowired
    private BCryptPasswordEncoder encoder;

    @Override
    public int kakaoLogin(Map map) {
        return dao.kakaoLogin(map);
    }


    @Override
    public Member emailLogin(Member member) {

        Member loginMember = dao.emailLogin(member.getMemberId());

        if(loginMember != null && encoder.matches(member.getMemberPw(), loginMember.getMemberPw())) {
            loginMember.setMemberPw(null);
        } else {
            loginMember = null;
        }

        return loginMember;
    }

}
