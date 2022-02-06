package edu.kh.mind.pro.model.service;

import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.pro.model.dao.ProDAO;
import edu.kh.mind.pro.model.vo.Payment;
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
    public int priceInsert(Payment pm, ReservationPayMent rv) {

        // 상담예약결제 insert
    	dao.reservationPaymentInsert(rv);
    	
		// 상담 예약 결제 번호 결제 vo에 넣기
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
    
    
}
