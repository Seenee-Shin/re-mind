package edu.kh.mind.member.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SignUpDAO {
	
	@Autowired 
	private SqlSessionTemplate sqlSession;

	public int idDupCheck(String inputId) {
		return sqlSession.selectOne("memberMapper.idDupCheck", inputId);
	}

	public int nickNmDupCheck(String inputNickNm) {
		return sqlSession.selectOne("memberMapper.nickNmDupCheck", inputNickNm);
	}
	

}
