package edu.kh.mind.member.model.service;

import edu.kh.mind.member.model.vo.Member;

import java.util.Map;

public interface LoginService {

    int kakaoLogin(Map map);

    Member emailLogin(Member member);
}
