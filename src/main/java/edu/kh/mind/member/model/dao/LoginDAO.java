package edu.kh.mind.member.model.dao;

import edu.kh.mind.member.model.vo.Member;
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
}
