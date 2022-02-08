package edu.kh.mind.member.model.dao;

import edu.kh.mind.member.model.vo.Member;
import edu.kh.mind.member.social.naver.vo.Naver;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository
public class LoginDAO {

    @Autowired
    private SqlSessionTemplate sqlSession;

    public int kakaoLogin(Map map) {
        return sqlSession.insert("memberMapper.kakaoLogin", map);
    }

    public Member emailLogin(String memberId) {
        return sqlSession.selectOne("memberMapper.emailLogin", memberId);
    }

    public Member socialCheck(String mobile) {
        return sqlSession.selectOne("memberMapper.socialCheck", mobile);
    }

    public int socialSignUp(Member member) {
        return sqlSession.insert("memberMapper.socialSignUp", member);
    }

    public int insertToken(Naver naver) {
        return sqlSession.insert("memberMapper.insertToken", naver);
    }

    public int selectToken(Naver naver) {
        return sqlSession.selectOne("memberMapper.selectToken", naver);
    }
}
