package edu.kh.mind.pro.model.service;

import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.member.model.vo.ProfessionPrice;
import edu.kh.mind.pro.model.dao.ProDAO;
import edu.kh.mind.pro.model.vo.Payment;
import edu.kh.mind.pro.model.vo.Reservation;
import edu.kh.mind.pro.model.vo.ReservationPayMent;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class ProServiceImpl implements ProService{

    @Autowired
    private ProDAO dao;

    @Override
    public List<Profession> selectProfession(List<String> worryCtCd) {
        return dao.selectProfession(worryCtCd);
    }

    @Override
    public List<Profession> selectAllProfession() {
        return dao.selectAllProfession();
    }

    // 총 금액 insert
    @Transactional
    @Override
    public int priceInsert(ProfessionPrice pfp, ReservationPayMent rv) {

        // 상담예약결제 insert
    	dao.reservationPaymentInsert(rv);
    	
    	// 전문가 번호, 테라피 번호로 select 가격
    	int price = dao.professionPriceSelect(pfp);
    	
    	// 총금액 횟수 * 금액
    	int payAmount = rv.getTotalCnt() * price;
    	
		//상담 예약 결제 번호 결제 vo에 넣기
    	Payment pm = new Payment();
    	
    	pm.setPayAmount(payAmount);
        pm.setReservationNo(rv.getReservationPayNo());
        
        // 결제 insert
        dao.paymentInsert(pm);
        
        return pm.getPayNo();
    }

	@Override
	public int priceSelect(int payNo) {
		
		int price = dao.priceSelect(payNo);
		
		return price;
	}
	
	@Override
	public int reservationUpdate(Payment payment, Reservation reservation) {
		
		// payment update
		dao.paymentUpdate(payment);
		
		reservation.setPayNo(payment.getPayNo());
		
		int result = dao.reservationInsert(reservation);
		
		return result;
	}
	
	
	// 취소버튼 눌렀을 경우
	@Transactional
	@Override
	public int paymentDelete(int payNo) {
		
		// payNo로 상담 예약 결제 번호 가지고 오기
		int reservationNo = dao.reservationNoSelect(payNo);
		
		// 상담예약 결제 삭제
		int result = dao.reservationPaymentDelete(reservationNo);
		
		int result2 = 0;
		
		if(result > 0) {
			// 결제 테이블 삭제
			result2 = dao.paymentDelete(payNo);
		}

		return result2;
	}
    
    
}
