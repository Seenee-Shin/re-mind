package edu.kh.mind.pro.model.dao;


import edu.kh.mind.member.model.vo.Profession;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.kh.mind.pro.model.vo.Payment;
import edu.kh.mind.pro.model.vo.Reservation;
import edu.kh.mind.pro.model.vo.ReservationPayMent;

@Repository 
public class ProDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	// 결제 예약 결제
	public int reservationPaymentInsert(ReservationPayMent rv) {
		return sqlSession.insert("reservationMapper.reservationPaymentInsert",rv);
	}
	
	// 결제 총 금액 insert
	public int paymentInsert(Payment pm) {
		return sqlSession.insert("reservationMapper.paymentInsert",pm);
	}
	
	
	public int priceSelect(int payNo) {
		return sqlSession.selectOne("reservationMapper.priceSelect",payNo);
	}

	
	
	
    public List<Profession> selectProfession(List<String> worryCtCd) {
        return sqlSession.selectList("professionMapper.selectProfession", worryCtCd);
    }

    public List<Profession> selectAllProfession() {
        return sqlSession.selectList("professionMapper.selectAllProfession");
    }
    
    
    // payment update
	public int paymentUpdate(Payment payment) {
		
		return sqlSession.update("reservationMapper.paymentUpdate",payment);
	}
	
	// reservation insert
	public int reservationInsert(Reservation reservation) {
		return sqlSession.insert("reservationMapper.reservationInsert",reservation);
	}
	
	
	// reservationNo select
	public int reservationNoSelect(int payNo) {
		return sqlSession.selectOne("reservationMapper.reservationNoSelect",payNo);
	}
	
	
	// 상담예약결제 삭제
	public int reservationPaymentDelete(int reservationNo) {
		return sqlSession.delete("reservationMapper.reservationPaymentDelete",reservationNo);
	}
	
	
	// 결제 테이블 삭제
	public int paymentDelete(int payNo) {
		return sqlSession.delete("reservationMapper.paymentDelete",payNo);
	}
    
	
	

}
