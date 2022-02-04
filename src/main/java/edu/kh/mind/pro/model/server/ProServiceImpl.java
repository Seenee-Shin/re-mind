package edu.kh.mind.pro.model.server;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kh.mind.pro.model.dao.ProDAO;
import edu.kh.mind.pro.model.vo.ReservationPayMent;

@Service
public class ProServiceImpl implements ProService{
	
	@Autowired
	private ProDAO dao;

	
	// 총 금액 insert
	@Override
	public int priceInsert(int price, ReservationPayMent rv) {
		
		// 상담예약결제 insert
		int reservationPayNo = dao.reservationPaymentInsert(rv);
		
		
		return 0;
	}
	
	
}
