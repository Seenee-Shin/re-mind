package edu.kh.mind.adminPro.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mind.member.model.vo.Profession;


@Repository
public class AdminProDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	/** 이메일 중복 확인
	 * @param inputId
	 * @return
	 */
	public int idCheck(String inputId) {
		return sqlSession.selectOne("professionMapper.idCheck", inputId);
	}

	
	/** 아이디(이메일) 등록 및 인증 
	 * @param profession
	 * @return
	 */
	public int proRegister(Profession profession) {
		return sqlSession.insert("professionMapper.proRegister", profession);
	}
	
	//이메일 인증 확인
	public int chkAuth(Profession profession) {
		// TODO Auto-generated method stub
		return sqlSession.update("professionMapper.chkAuth", profession);
	}


	public Profession selectProfession(Profession profession) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("professionMapper.selectPro", profession);
	}




}
