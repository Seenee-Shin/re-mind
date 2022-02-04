package edu.kh.mind.pro.model.server;

import edu.kh.mind.pro.model.vo.ReservationPayMent;

public interface ProService {
	
	// 총 가격 insert
	int priceInsert(int price, ReservationPayMent rv);

}
