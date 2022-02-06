package edu.kh.mind.pro.model.service;

import edu.kh.mind.member.model.vo.Profession;
import edu.kh.mind.pro.model.vo.Payment;
import edu.kh.mind.pro.model.vo.ReservationPayMent;

import java.util.List;

public interface ProService {

    List<Profession> selectProfession(List<String> worryCtCd);

    List<Profession> selectAllProfession();

    // 총 가격 insert
    int priceInsert(Payment pm, ReservationPayMent rv);
    
    // 총가격 select
	int priceSelect(int payNo);
}
