package edu.kh.mind.member.model.service;

import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.social.naver.vo.Naver;

import java.util.Map;

public interface LoginService {

    int kakaoLogin(Map map);

    Member emailLogin(Member member);

    Member socialCheck(String mobile);

    int socialSignUp(Member member);

    int insertToken(Naver naver);
}
