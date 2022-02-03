package edu.kh.mind.adminPro.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mind.member.model.vo.Profession;


@Repository
public class AdminProDAO {

	@Autowired
	SqlSessionTemplate sqlSession;
	public int proRegister(Profession profession) {
		return sqlSession.insert("professionMapper/proRegister", profession);
	}

}
