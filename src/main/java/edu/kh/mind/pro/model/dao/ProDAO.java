package edu.kh.mind.pro.model.dao;


import edu.kh.mind.member.model.vo.Profession;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mind.pro.model.vo.ReservationPayMent;

@Repository 
public class ProDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int reservationPaymentInsert(ReservationPayMent rv) {
		
		return sqlSession.insert("reservationMapper.reservationPaymentInsert",rv);
	}

    public List<Profession> selectProfession(List<String> worryCtCd) {
        return sqlSession.selectList("professionMapper.selectProfession", worryCtCd);
    }

    public List<Profession> selectAllProfession() {
        return sqlSession.selectList("professionMapper.selectAllProfession");
    }

}
