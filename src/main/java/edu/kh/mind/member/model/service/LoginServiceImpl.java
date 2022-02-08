package edu.kh.mind.member.model.service;

import edu.kh.mind.member.model.dao.LoginDAO;
import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.social.naver.vo.Naver;
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

    @Override
    public Member socialCheck(String mobile) {
        return dao.socialCheck(mobile);
    }

    @Override
    public int socialSignUp(Member member) {
        return dao.socialSignUp(member);
    }

    @Override
    public int insertToken(Naver naver) {
        return dao.insertToken(naver);
    }

    @Override
    public int selectToken(Naver naver) {
        return dao.selectToken(naver);
    }
}
